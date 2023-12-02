import UIKit
import AVFoundation     //匯入不含影音UI介面的影音框架

//通知名稱常數
extension Notification.Name
{
    static let scoresUpdated = Notification.Name("ScoresUpdated")
}


class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    //玩家一名稱
    @IBOutlet weak var playerOneLbl: UILabel!
    {
        didSet{
            if let monster1 = playerOneSelectedMonster {
                playerOneLbl.text = monster1
                }
            
        }
    }
    //玩家二名稱
    @IBOutlet weak var playerTwoLbl: UILabel!
    {
        didSet{
            if let monster2 = playerTwoSelectedMonster {
                playerTwoLbl.text = monster2
                }
            
        }
    }
    //玩家一分數
    @IBOutlet weak var leftScoreLabel: UILabel!
    //玩家二分數
    @IBOutlet weak var rightScoreLabel: UILabel!
    //玩家一頭像
    @IBOutlet weak var playerOneImg: UIImageView!
    {
        didSet{
            if let monster1 = playerOneSelectedMonster {
                    playerOneImg.image = UIImage(named: "O\(monster1)")
                }
        }
    }
    //玩家二頭像
    @IBOutlet weak var playerTwoImg: UIImageView!
    {
        didSet{
            if let monster2 = playerTwoSelectedMonster {
                    playerTwoImg.image = UIImage(named: "X\(monster2)")
                }
        }
    }
    
    //指引箭頭區
    @IBOutlet weak var leftOneArrowImg: UIImageView!
    @IBOutlet weak var leftTwoArrowImg: UIImageView!
    @IBOutlet weak var rightOneArrowImg: UIImageView!
    @IBOutlet weak var rightTwoArrowImg: UIImageView!
    
    // 指定顏色的RGB值(橘紅)
    let orCustomColor = UIColor(red: 210/255.0, green: 88/255.0, blue: 38/255.0, alpha: 1.0)
    // 指定顏色的RGB值(灰)
    let gCustomColor = UIColor(red: 145/255.0, green: 142/255.0, blue: 143/255.0, alpha: 1.0)
    
    @IBOutlet weak var rollButton: UIButton!{
        didSet{
            rollButton.setBackgroundImage(UIImage(named:"dice_off"),for :.highlighted)
            rollButton.setBackgroundImage(UIImage(named:"dice_off"),for :.disabled)
        }
    }
    @IBOutlet weak var playButton: UIButton!{
        didSet{
            playButton.setImage(UIImage(named:"play_off"),for :.highlighted)
        }
    }
    @IBOutlet weak var volumeBtn: UIButton!{
        didSet{
            volumeBtn.setImage(UIImage(named:"volume_off"),for :.selected)
        }
    }
    @IBOutlet weak var backBtn: UIButton!{
        didSet{
            backBtn.setImage(UIImage(named:"back_off"),for :.highlighted)
        }
    }
    
    //接收DoubleViewController的傳值
    var playerOneSelectedMonster: String?
    var playerTwoSelectedMonster: String?
    
    @IBOutlet var diceBtnCollection: [UIButton]!
    
    @IBAction func myDiceBtn(_ sender: UIButton) {
        let diceIndex = sender.tag
        //是一種切換（toggle）布林值的方法，用於將布林值的狀態反轉，即從 true 變為 false，或從 false 變為 true
        game.isDiceSelected[diceIndex].toggle()
        
        if game.isDiceSelected[diceIndex] {
            //如果選取，修改骰子的外觀，這裡是把骰子用框框起來
            sender.layer.borderWidth = 5.0
            //在這邊改變框框顏色
            sender.layer.borderColor = UIColor.orange.cgColor
            //改變外框圓角
            sender.layer.cornerRadius = sender.bounds.width / 5
        } else {
            //如果取消選取，還原骰子的外觀
            sender.layer.borderWidth = 0.0
            sender.layer.borderColor = nil
        }
    }
    
    //返回鍵
    
    @IBAction func backBtnTouchDown(_ sender: UIButton) {
    }
    @IBAction func backBtn(_ sender: Any) {
    }
    
    //音量鍵
    @IBAction func volumeBtnPressed(_ sender: Any) {
        self.volumeBtn.isSelected = !self.volumeBtn.isSelected
        if let audioPlayer = ViewController.audioPlayer {
            if audioPlayer.isPlaying {
                // 如果正在播放，則暫停播放
                audioPlayer.pause()
            } else {
                // 如果暫停或停止，則開始播放
                audioPlayer.play()
            }
        }
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton)
    {
        stratDiceRoll()
        
        //先檢查 rollCount 變數，確保玩家還有剩餘的擲骰子次數。
        if game.rollCount > 0
        {
            
            // 在此處執行擲骰子的程式碼，只重新擲未選取的骰子
            for (index, btn) in diceBtnCollection.enumerated()
            {
                /*
                 在if條件內，執行擲骰子的程式碼。
                 這個程式碼會檢查哪些骰子未被選取（isDiceSelected[index] 為 false），
                 然後為這些骰子重新設置隨機數字，并将随机数记录到 diceScore 数组中。
                 */
                if !game.isDiceSelected[index] {
                    let dicePoint = Int.random(in: 1...6)
                    setDiceBtnImage(btn, withPoint: dicePoint)
                    
                    // 更新 diceScore 数组，根据骰子的顺序排列
                    diceScore[index] = dicePoint
                    
                    let diceValues = diceScore.map { DiceValue(rawValue: $0) ?? .one }
                    playerOneData.calculateScore(diceValues)
                    playerTwoData.calculateScore(diceValues)
                    
                }
            }
            
            //執行完擲骰子的程式碼後，減少 rollCount 變數的值，表示已經擲了一次骰子。
            game.rollCount -= 1
            // 更新按鈕上的文字
            let buttonText = "             \(game.rollCount)/3"
            sender.setTitle(buttonText, for: .normal)
            
            //最後，如果 rollCount 等於 0，表示擲骰子次數已用完，則禁用按鈕。
            if game.rollCount == 0
            {
                sender.isEnabled = false
            }
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        // 檢查是否有按鈕被選擇
        let isAnyButtonSelected = isPlayerOne() ? playerOneData.isPlayerScoreBtnSelected.contains(.isSelected) : playerTwoData.isPlayerScoreBtnSelected.contains(.isSelected)

        if !isAnyButtonSelected {
            // 如果沒有按鈕被選擇，顯示提示
            showAlert(message: "每個回合都一定要選擇一個喜歡的分數按鈕哦！")
            return
        }
        
        //把選取的按鈕改成done
        setBtnSelected()
        // 增加回合數
        currentRound += 1
        //移動玩家指示箭頭
        changeArrow(currentRound)
        
        // 通知更新表格視圖
        NotificationCenter.default.post(name: .scoresUpdated, object: nil)
        
        // 重新設定 isDiceSelected 為全 false，解鎖所有骰子
        game.isDiceSelected = Array(repeating: false, count: diceBtnCollection.count)
        //還原骰子的外觀
        resetDiceAppearance()
        
        // 重新啟用擲骰子按鈕，並更新擲骰子按鈕的文字
        rollButton.isEnabled = true
        game.rollCount = 3
        let buttonText = "             \(game.rollCount)/3"
        rollButton.setTitle(buttonText, for: .normal)
        
        //因為bonus不能按，所以有符合加分條件就自動先加到分數陣列
        if playerOneData.bonus == 35
        {
            playerOneData.playerScore[6] = 35
        }
        else 
        {
            playerOneData.playerScore[6] = 0
        }
        if playerTwoData.bonus == 35
        {
            playerTwoData.playerScore[6] = 35
        }
        else
        {
            playerTwoData.playerScore[6] = 0
        }

        
        //分數更新
        leftScoreLabel.text = String(playerOneData.playerScore.reduce(0) { $0 + $1 })
        rightScoreLabel.text = String(playerTwoData.playerScore.reduce(0) { $0 + $1 })
        
        //呼叫換頁方法
        checkForPageTransition()
    }
    
    
    
    //將隨機的數字連結到圖片，顯示給使用者看
    private func setDiceBtnImage(_ btn: UIButton?, withPoint point: Int) {
        guard let btn = btn else { return }
        btn.setImage(UIImage(named: "white_\(point)"), for: .normal)
    }
    
    var game = Game()
    var playerOneData = PlayerScoreSheet([])
    var playerTwoData = PlayerScoreSheet([])
    //回合
    var currentRound = 0
    //記錄骰子點數的陣列
    var diceScore = [0, 0, 0, 0, 0]
    
    //記錄當前選擇的按鈕，在分數陣列的位置
    var leftTableBtnCurrentSelectIndex: Int?
    var rightTableBtnCurrentSelectIndex: Int?
    
    //宣告音樂播放器
    static var audioPlayer: AVAudioPlayer!
    // 追蹤音樂播放狀態，true 表示正在播放，false 表示暫停或停止
    var isMusicPlaying = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(scoresUpdated), name: .scoresUpdated, object: nil)
        // 禁用 UITableView 的滾動
        leftTableView.isScrollEnabled = false
        rightTableView.isScrollEnabled = false
        
        //預設箭頭
        leftTwoArrowImg.isHidden = true
        rightTwoArrowImg.isHidden = true
        
        //一開始先隱藏骰子
        resetDiceAppearance()
        
        //背景音樂相關設定
        let urlFile = Bundle.main.url(forResource: "music/cheerful_whistling", withExtension: "mp3")!
        if ViewController.audioPlayer == nil {
            do {
                ViewController.audioPlayer = try AVAudioPlayer(contentsOf: urlFile)
            } catch {
                print("音樂檔案載入錯誤：\(error)")
                return
            }
            
            // 指派音樂播放器的代理人
            ViewController.audioPlayer.delegate = self
            // 準備播放音樂
            ViewController.audioPlayer.prepareToPlay()
            // 設定循環播放
            ViewController.audioPlayer.numberOfLoops = -1
            // 開始播放音樂
            ViewController.audioPlayer.play()
        }
        
    }
    
    // AVAudioPlayerDelegate 方法，當音樂播放完成時觸發
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        if isMusicPlaying {
//            // 如果音樂正在播放，重新開始播放
//            player.play()
//        }
//    }
    
    // 在 deinit 中停止音樂播放
    deinit {
        ViewController.audioPlayer.stop()
    }
    
    // 當遊戲結束時換頁
    func checkForPageTransition() {
        if currentRound == 26 {
            performSegue(withIdentifier: "goToTheEndView", sender: self)
        }
    }

    // 在執行Segue前的準備工作
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTheEndView",
           let theEndViewController = segue.destination as? TheEndViewController {
            // 傳遞值給TheEndViewController
            theEndViewController.playerOneScore = String(playerOneData.playerScore.reduce(0) { $0 + $1 })
            theEndViewController.playerTwoScore = String(playerTwoData.playerScore.reduce(0) { $0 + $1 })
            theEndViewController.playerOneSelectedMonster = playerOneSelectedMonster
            theEndViewController.playerTwoSelectedMonster = playerTwoSelectedMonster
        }

        if segue.identifier == "startGame" {
            if let destinationVC = segue.destination as? ViewController {
                if let monsters = sender as? (String, String) {
                    destinationVC.playerOneSelectedMonster = monsters.0
                    destinationVC.playerTwoSelectedMonster = monsters.1
                }
            }
        }
    }


    func isPlayerOne()->Bool{
        //判斷當前玩家
        if currentRound % 2 == 0{
            return true
            //玩家一
        }
        else{
            return false
            //玩家二
        }
    }
    
    func resetDiceAppearance() {
        for btn in diceBtnCollection {
            btn.layer.borderWidth = 0.0
            btn.layer.borderColor = nil
            btn.isHidden = true
        }
    }
    
    func stratDiceRoll(){
        for btn in diceBtnCollection {
            btn.isHidden = false
        }
        
    }
    


    func changeArrow(_ currentRound:Int){
        if currentRound % 2 != 0
        {
            leftOneArrowImg.isHidden = true
            rightOneArrowImg.isHidden = true
            leftTwoArrowImg.isHidden = false
            rightTwoArrowImg.isHidden = false
            playerOneLbl.textColor = gCustomColor
            playerTwoLbl.textColor = orCustomColor
            leftScoreLabel.textColor = gCustomColor
            rightScoreLabel.textColor = orCustomColor
            playerOneImg.image = UIImage(named: "X\(playerOneSelectedMonster ?? "萬事通")")
            playerTwoImg.image = UIImage(named: "O\(playerTwoSelectedMonster ?? "萬事通")")
        }
        else
        {
            leftTwoArrowImg.isHidden = true
            rightTwoArrowImg.isHidden = true
            leftOneArrowImg.isHidden = false
            rightOneArrowImg.isHidden = false
            playerOneLbl.textColor = orCustomColor
            playerTwoLbl.textColor = gCustomColor
            leftScoreLabel.textColor = orCustomColor
            rightScoreLabel.textColor = gCustomColor
            playerOneImg.image = UIImage(named: "O\(playerOneSelectedMonster ?? "萬事通")")
            playerTwoImg.image = UIImage(named: "X\(playerTwoSelectedMonster ?? "萬事通")")
        }
    }
    
    
    
    private func initTableView(){
        // 因為兩邊cell的 UI都一樣，所以共用一個cell
        let nib = UINib(nibName: kTableViewCell, bundle: nil)
        //左邊第一款cell
        leftTableView.register(nib, forCellReuseIdentifier: kTableViewCell)
        //左邊第二款cell
        leftTableView.register(BounsTableViewCell.Nib(), forCellReuseIdentifier: BounsTableViewCell.identifier)
        //右邊表格的cell
        rightTableView.register(nib, forCellReuseIdentifier: kTableViewCell)
        leftTableView.delegate = self
        leftTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.dataSource = self
    }
    
    @objc func scoresUpdated()
    {
        // 在这里更新表格视图，以反映分数的更改
        leftTableView.reloadData()
        rightTableView.reloadData()
    }
    
    func checkLeftPlayerScoreBtnSelectIndex(_ index: Int){
        if isPlayerOne() {
            if playerOneData.isPlayerScoreBtnSelected[index] != .done
            {
                switch index
                {
                case 0:
                    playerOneData.playerScore[0] = Int(playerOneData.one)
                case 1:
                    playerOneData.playerScore[1] = Int(playerOneData.two)
                case 2:
                    playerOneData.playerScore[2] = Int(playerOneData.three)
                case 3:
                    playerOneData.playerScore[3] = Int(playerOneData.four)
                case 4:
                    playerOneData.playerScore[4] = Int(playerOneData.five)
                case 5:
                    playerOneData.playerScore[5] = Int(playerOneData.sixe)
                case 6:
                    playerOneData.playerScore[6] = Int(playerOneData.bonus)
                default:
                    break
                }
            }
        }
        else {
            if playerTwoData.isPlayerScoreBtnSelected[index] != .done
            {
                switch index
                {
                case 0:
                    playerTwoData.playerScore[0] = Int(playerTwoData.one)
                case 1:
                    playerTwoData.playerScore[1] = Int(playerTwoData.two)
                case 2:
                    playerTwoData.playerScore[2] = Int(playerTwoData.three)
                case 3:
                    playerTwoData.playerScore[3] = Int(playerTwoData.four)
                case 4:
                    playerTwoData.playerScore[4] = Int(playerTwoData.five)
                case 5:
                    playerTwoData.playerScore[5] = Int(playerTwoData.sixe)
                case 6:
                    playerTwoData.playerScore[6] = Int(playerTwoData.bonus)
                default:
                    break
                }
            }
        }
        
        
        
    }
    
    func checkRightPlayerScoreBtnSelectIndex(_ index: Int){
        if isPlayerOne() {
            if playerOneData.isPlayerScoreBtnSelected[index + 6] != .done
            {
                switch index
                {
                case 0:
                    playerOneData.playerScore[7] = Int(playerOneData.threeOfAKind)
                case 1:
                    playerOneData.playerScore[8] = Int(playerOneData.fourOfAKind)
                case 2:
                    playerOneData.playerScore[9] = Int(playerOneData.fullHouse)
                case 3:
                    playerOneData.playerScore[10] = Int(playerOneData.smStraight)
                case 4:
                    playerOneData.playerScore[11] = Int(playerOneData.lgStraight)
                case 5:
                    playerOneData.playerScore[12] = Int(playerOneData.fiveOfAKind)
                case 6:
                    playerOneData.playerScore[13] = Int(playerOneData.chance)
                default:
                    break
                }
            }
        }
        else {
            if playerTwoData.isPlayerScoreBtnSelected[index + 6] != .done
            {
                switch index
                {
                case 0:
                    playerTwoData.playerScore[7] = Int(playerTwoData.threeOfAKind)
                case 1:
                    playerTwoData.playerScore[8] = Int(playerTwoData.fourOfAKind)
                case 2:
                    playerTwoData.playerScore[9] = Int(playerTwoData.fullHouse)
                case 3:
                    playerTwoData.playerScore[10] = Int(playerTwoData.smStraight)
                case 4:
                    playerTwoData.playerScore[11] = Int(playerTwoData.lgStraight)
                case 5:
                    playerTwoData.playerScore[12] = Int(playerTwoData.fiveOfAKind)
                case 6:
                    playerTwoData.playerScore[13] = Int(playerTwoData.chance)
                default:
                    break
                }
            }
        }
        
        
        
    }
    
    //確保同一時間只有一個按鈕處於選定狀態，同時刷新表格以顯示變更
    func playerResetBtnAndSelected(_ index: Int){
        if isPlayerOne() {
            // 檢查指定索引的按鈕是否已經處於完成狀態
            if playerOneData.isPlayerScoreBtnSelected[index] != .done{
                // 如果沒有完成，則將按鈕的選定狀態切換為 'isSelected' 或 'none'
                playerOneData.isPlayerScoreBtnSelected[index] = playerOneData.isPlayerScoreBtnSelected[index] == .isSelected ? .none : .isSelected
            }
            // 迭代所有按鈕，將除了指定索引以外的其他按鈕的選定狀態設為 'none'
            for i in 0..<playerOneData.isPlayerScoreBtnSelected.count{
                if i != index , playerOneData.isPlayerScoreBtnSelected[i] != .done{
                    playerOneData.isPlayerScoreBtnSelected[i] = .none
                }
            }
        }
        else {
            // 檢查指定索引的按鈕是否已經處於完成狀態
            if playerTwoData.isPlayerScoreBtnSelected[index] != .done{
                // 如果沒有完成，則將按鈕的選定狀態切換為 'isSelected' 或 'none'
                playerTwoData.isPlayerScoreBtnSelected[index] = playerTwoData.isPlayerScoreBtnSelected[index] == .isSelected ? .none : .isSelected
            }
            // 迭代所有按鈕，將除了指定索引以外的其他按鈕的選定狀態設為 'none'
            for i in 0..<playerTwoData.isPlayerScoreBtnSelected.count{
                if i != index , playerTwoData.isPlayerScoreBtnSelected[i] != .done{
                    playerTwoData.isPlayerScoreBtnSelected[i] = .none
                }
            }

        }

        // 重新加載左側的表格
        leftTableView.reloadData()
        // 重新加載右側的表格
        rightTableView.reloadData()
        
    }
    
    
    func playerCheckButtonIsDone(_ index: Int) -> Bool{
        if isPlayerOne() {
            return playerOneData.isPlayerScoreBtnSelected[index] == .done ? true : false
        }
        return playerTwoData.isPlayerScoreBtnSelected[index] == .done ? true : false
    }
    
    func setBtnSelected(){
        // 檢查 leftTableView 中的 playerOneScroeButton 是否有選取
        if let currentSelectedIndex = self.leftTableBtnCurrentSelectIndex{
            // 儲存選中按鈕的分數
            self.checkLeftPlayerScoreBtnSelectIndex(currentSelectedIndex)
            
            if isPlayerOne(){
                // 把該按鈕的狀態改成 done
                playerOneData.isPlayerScoreBtnSelected[currentSelectedIndex] = .done
            }
            else
            {
                playerTwoData.isPlayerScoreBtnSelected[currentSelectedIndex] = .done
            }
            
        }
        
        // 檢查 rightTableView 中的 playerOneScroeButton 是否有選取
        if let currentSelectedIndex = self.rightTableBtnCurrentSelectIndex{
            // 儲存選中按鈕的分數
            self.checkRightPlayerScoreBtnSelectIndex(currentSelectedIndex)
            
            if isPlayerOne(){
                // 把該按鈕的狀態改成 done
                playerOneData.isPlayerScoreBtnSelected[currentSelectedIndex + 6] = .done
            }
            else
            {
                playerTwoData.isPlayerScoreBtnSelected[currentSelectedIndex + 6] = .done
            }
        }
    }
    
    // 每次點擊前要先清空值，不然交互點的話會有錯
    func resetCurrentSelectIndex(){
        leftTableBtnCurrentSelectIndex = nil
        rightTableBtnCurrentSelectIndex = nil
    }
    
    func showToast( _ player: Int){
        let alert = UIAlertController(title: "現在是玩家\(player)的回合", message: nil, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        //延遲一秒後，關閉警告框
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alert.dismiss(animated: true)
        }
    }
    
    
    // 顯示提示框的方法
    func showAlert(message: String) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCell) as! TableViewCell
        
        // 將 ViewController 中的值傳遞給 TableViewCell
        cell.configure(withValue: currentRound)
        
        //左邊表格
        if tableView == leftTableView {
            
            // 根據奇偶性設置按鈕背景
            let buttonImageName = indexPath.row % 2 == 0 ? "square_white" : "square_yellow"
            
            cell.playerOneScroeButton.setImage(UIImage(named: buttonImageName), for: .normal)
            cell.playerTwoScroeButton.setImage(UIImage(named: buttonImageName), for: .normal)
            
            //如果是表格第六行
            if indexPath.row == 6 {
                let customCell = tableView.dequeueReusableCell(withIdentifier: BounsTableViewCell.identifier) as! BounsTableViewCell
                customCell.setBonusScores(playerOneBonus: playerOneData.bonus, playerTwoBonus: playerTwoData.bonus)
                return customCell
            }

            else
            {
                cell.setupCell(row: indexPath.row,
                               .left,
                               playerOneData,
                               playerTwoData)
                cell.playerOneScroeButtonClosure = {
                    // 檢查是否已經進行了第一次擲骰子
                    guard self.game.rollCount < 3 else {
                       // 若尚未進行第一次擲骰子，彈出警告視窗提醒玩家
                        self.showAlert(message: "請先進行第一次擲骰子")
                       return
                   }
                    // 點擊cell按鈕後要做的事
                    if !self.isPlayerOne(){
                        self.showToast(2)
                        return
                    }
                    
                    // 如果按鈕已有score分數的話，則不能再選擇
                    if self.playerCheckButtonIsDone(indexPath.row){
                        return
                    }
                    self.resetCurrentSelectIndex()
                    
                    // 設定目前選擇的按鈕
                    self.leftTableBtnCurrentSelectIndex = indexPath.row
                    // 設定單選按鈕樣式
                    self.playerResetBtnAndSelected(indexPath.row)
                }
                
                cell.playerTwoScroeButtonClosure = {
                    guard self.game.rollCount < 3 else {
                       // 若尚未進行第一次擲骰子，彈出警告視窗提醒玩家
                        self.showAlert(message: "請先進行第一次擲骰子")
                       return
                   }
                    // 點擊cell按鈕後要做的事
                    if self.isPlayerOne(){
                        self.showToast(1)
                        return
                    }
                    
                    // 如果按鈕已有score分數的話，則不能再選擇
                    if self.playerCheckButtonIsDone(indexPath.row){
                        return
                    }
                    self.resetCurrentSelectIndex()
                    // 設定目前選擇的按鈕
                    self.leftTableBtnCurrentSelectIndex = indexPath.row
                    // 設定單選按鈕樣式
                    self.playerResetBtnAndSelected(indexPath.row)
                }
            }
            return cell
        }
        //表格右邊
        else if tableView == rightTableView{
            
            // 根據奇偶性設置按鈕背景
            let buttonImageName = indexPath.row % 2 == 0 ? "square_white" : "square_yellow"
            
            cell.playerOneScroeButton.setImage(UIImage(named: buttonImageName), for: .normal)
            cell.playerTwoScroeButton.setImage(UIImage(named: buttonImageName), for: .normal)
            
            cell.setupCell(row: indexPath.row,
                           .right,
                           playerOneData,
                           playerTwoData)
            cell.playerOneScroeButtonClosure = {
                guard self.game.rollCount < 3 else {
                   // 若尚未進行第一次擲骰子，彈出警告視窗提醒玩家
                    self.showAlert(message: "請先進行第一次擲骰子")
                   return
               }
                // 點擊cell按鈕後要做的事
                if !self.isPlayerOne(){
                    self.showToast(2)
                    return
                }
                
                // 如果按鈕已有score分數的話，則不能再選擇
                if self.playerCheckButtonIsDone(indexPath.row + 6){
                    return
                }
                self.resetCurrentSelectIndex()
                // 設定目前選擇的按鈕
                self.rightTableBtnCurrentSelectIndex = indexPath.row
                // 設定單選按鈕樣式
                self.playerResetBtnAndSelected(indexPath.row + 6)
                //                self.playerOneData.rightPlayerScoreBtnSelectIndex = indexPath.row
            }
            cell.playerTwoScroeButtonClosure = {
                guard self.game.rollCount < 3 else {
                   // 若尚未進行第一次擲骰子，彈出警告視窗提醒玩家
                    self.showAlert(message: "請先進行第一次擲骰子")
                   return
               }
                // 點擊cell按鈕後要做的事
                if self.isPlayerOne(){
                    self.showToast(1)
                    return
                }
                
                if self.playerCheckButtonIsDone(indexPath.row + 6){
                    return
                }
                self.resetCurrentSelectIndex()
                // 設定目前選擇的按鈕
                self.rightTableBtnCurrentSelectIndex = indexPath.row
                // 設定單選按鈕樣式
                self.playerResetBtnAndSelected(indexPath.row + 6)
            }
            return cell
        }
        
        return UITableViewCell()
    }
}
