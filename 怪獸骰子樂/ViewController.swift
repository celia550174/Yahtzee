import UIKit

//通知名稱常數
extension Notification.Name
{
    static let scoresUpdated = Notification.Name("ScoresUpdated")
}
//回合
var currentRound = 0

class ViewController: UIViewController{
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    //指引箭頭區
    @IBOutlet weak var leftOneArrowImg: UIImageView!
    @IBOutlet weak var leftTwoArrowImg: UIImageView!
    @IBOutlet weak var rightOneArrowImg: UIImageView!
    @IBOutlet weak var rightTwoArrowImg: UIImageView!
    
    
    @IBOutlet weak var rollButton: UIButton!{
        didSet{
            rollButton.setImage(UIImage(named:"dice_off"),for :.highlighted)
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
    
    @IBOutlet var diceBtnCollection: [UIButton]!
    
    @IBAction func myDiceBtn(_ sender: UIButton) {
        let diceIndex = sender.tag

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
    }
        
    @IBAction func rollButtonPressed(_ sender: UIButton)
    {
        // 如果是新回合，執行擲骰子的功能
//        if isNewRound 
//        {
            stratDiceRoll()
//            isNewRound = false // 將 isNewRound 設定為 false，表示不再是新回合
//        }
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
        
        // 增加回合數
        currentRound += 1
        print("回合數:\(currentRound)")
        changeArrow(currentRound)
        
        // 重新設定 isDiceSelected 為全 false，解鎖所有骰子
        game.isDiceSelected = Array(repeating: false, count: diceBtnCollection.count)
        //還原骰子的外觀
        resetDiceAppearance()

        // 重新啟用擲骰子按鈕，並更新擲骰子按鈕的文字
        rollButton.isEnabled = true
        game.rollCount = 3
        let buttonText = "             \(game.rollCount)/3"
        rollButton.setTitle(buttonText, for: .normal)
        
        // 設定 isNewRound 為 true，表示新回合
//        isNewRound = true
        
        
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
            leftScoreLabel.text = String(playerOneData.playerScore.reduce(0) { $0 + $1 })
        
        // 檢查 leftTableView 中的 playerOneScroeButton 是否有選取
//        if let currentSelectedIndex = self.leftTableBtnCurrentSelectIndex{
//            // 儲存選中按鈕的分數
//            self.checkLeftPlayerScoreBtnSelectIndex(currentSelectedIndex)
//            // 把該按鈕的狀態改成 done
//            playerOneData.isPlayerScoreBtnSelected[currentSelectedIndex] = .done
//        }
//        
//        // 檢查 rightTableView 中的 playerOneScroeButton 是否有選取
//        if let currentSelectedIndex = self.rightTableBtnCurrentSelectIndex{
//            // 儲存選中按鈕的分數
//            self.checkRightPlayerScoreBtnSelectIndex(currentSelectedIndex)
//            // 把該按鈕的狀態改成 done
//            playerOneData.isPlayerScoreBtnSelected[currentSelectedIndex + 6] = .done
//        }
        print("[playerOne]isPlayerScoreBtnSelected:\(playerOneData.isPlayerScoreBtnSelected),playerScore:\(playerOneData.playerScore)")
        print("[playerTwo]isPlayerScoreBtnSelected:\(playerTwoData.isPlayerScoreBtnSelected),playerScore:\(playerTwoData.playerScore)")
        
        //分數更新
//        leftScoreLabel.text = String(playerOneData.playerScore.reduce(0) { $0 + $1 })
        rightScoreLabel.text = String(playerTwoData.playerScore.reduce(0) { $0 + $1 })
    }
    
    
    
    //將隨機的數字連結到圖片，顯示給使用者看
    private func setDiceBtnImage(_ btn: UIButton?, withPoint point: Int) {
        guard let btn = btn else { return }
        btn.setImage(UIImage(named: "white_\(point)"), for: .normal)
    }
    
    var game = Game()
    var playerOneData = PlayerScoreSheet([])
    var playerTwoData = PlayerScoreSheet([])
    //記錄骰子點數的陣列
    var diceScore = [0, 0, 0, 0, 0]

//    var isNewRound = false
    
    var leftTableBtnCurrentSelectIndex: Int?
    var rightTableBtnCurrentSelectIndex: Int?
    
    var shouldHideButton: Bool = false
    
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

    }
    
    func isPlayerOne()->Bool{
        //判斷當前玩家
        if currentRound % 2 == 0{
            return true
        }
        else{
            return false
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
            print("currentRound % 2 != 0")
        }
        else
        {
            leftTwoArrowImg.isHidden = true
            rightTwoArrowImg.isHidden = true
            leftOneArrowImg.isHidden = false
            rightOneArrowImg.isHidden = false
            print("currentRound % 2 == 0")
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
    
    func checkRightPlayerScoreBtnSelectIndex(_ index: Int){
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
    
    //確保同一時間只有一個按鈕處於選定狀態，同時刷新表格以顯示變更
    func playerOneResetBtnAndSelected(_ index: Int){
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
        // 重新加載左側的表格
        leftTableView.reloadData()
        // 重新加載右側的表格
        rightTableView.reloadData()
        
    }
    
    
    func playerOneCheckButtonIsDone(_ index: Int) -> Bool{
        return playerOneData.isPlayerScoreBtnSelected[index] == .done ? true : false
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCell) as! TableViewCell

        

        
        //左邊表格
        if tableView == leftTableView {
            
            //如果是表格第六行
            if indexPath.row == 6
            {
                let customCell = tableView.dequeueReusableCell(withIdentifier: BounsTableViewCell.identifier) as! BounsTableViewCell
                customCell.configure1(String(playerOneData.bonus))
                customCell.configure2(String(playerTwoData.bonus))
                return customCell
            }
            else
            {
                cell.setupCell(row: indexPath.row,
                               .left,
                               playerOneData,
                               playerTwoData)
                cell.playerOneScroeButtonClosure = {
                    // 點擊cell按鈕後要做的事
                                        
                    // 如果按鈕已有score分數的話，則不能再選擇
                    if self.playerOneCheckButtonIsDone(indexPath.row){
                        return
                    }
                    
                    // 設定目前選擇的按鈕
                    self.leftTableBtnCurrentSelectIndex = indexPath.row
                    // 設定單選按鈕樣式
                    self.playerOneResetBtnAndSelected(indexPath.row)
                }
                
                cell.playerTwoScroeButtonClosure = {
                    // 點擊cell按鈕後要做的事
                    
                }
            }
            return cell
        }
        //表格右邊
        else if tableView == rightTableView{
            
            cell.setupCell(row: indexPath.row,
                           .right,
                           playerOneData,
                           playerTwoData)
            cell.playerOneScroeButtonClosure = {
                // 點擊cell按鈕後要做的事
                // 如果按鈕已有score分數的話，則不能再選擇
                if self.playerOneCheckButtonIsDone(indexPath.row + 6){
                    return
                }
                
                // 設定目前選擇的按鈕
                self.rightTableBtnCurrentSelectIndex = indexPath.row
                // 設定單選按鈕樣式
                self.playerOneResetBtnAndSelected(indexPath.row + 6)
//                self.playerOneData.rightPlayerScoreBtnSelectIndex = indexPath.row
            }
            cell.playerTwoScroeButtonClosure = {
                // 點擊cell按鈕後要做的事
                
            }
            return cell
        }
        
        return UITableViewCell()
    }
}
