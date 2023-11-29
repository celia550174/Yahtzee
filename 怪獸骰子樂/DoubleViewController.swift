
import UIKit

class DoubleViewController: UIViewController {
    //改一個測試上傳
    var isPlayerOnePictureSelected = true
    var isPlayerTwoPictureSelected = true
    
    //玩家一怪獸圖示區
    @IBOutlet weak var playerOneImgOne: UIImageView!
    @IBOutlet weak var playerOneImgTwo: UIImageView!
    @IBOutlet weak var playerOneImgThree: UIImageView!
    
    //玩家一怪獸名字區
    @IBOutlet weak var playerOneLblOne: UILabel!
    @IBOutlet weak var playerOneLblTwo: UILabel!
    @IBOutlet weak var playerOneLblThree: UILabel!
    
    //玩家二怪獸圖示區
    @IBOutlet weak var playerTwoImgOne: UIImageView!
    @IBOutlet weak var playerTwoImgTwo: UIImageView!
    @IBOutlet weak var playerTwoImgThree: UIImageView!
    
    //玩家一怪獸名字區
    @IBOutlet weak var playerTwoLblOne: UILabel!
    @IBOutlet weak var playerTwoLblTwo: UILabel!
    @IBOutlet weak var playerTwoLblThree: UILabel!
    
    
    //按鈕位置
    @IBOutlet weak var startGame: UIButton!{
        didSet{
            startGame.setImage(UIImage(named: "start game_off"), for: .highlighted)
        }
    }

    @IBOutlet weak var backToPreviousPage: UIButton!{
        didSet{
            backToPreviousPage.setImage(UIImage(named: "previous page_off"), for: .highlighted)
        }
    }
    
    // 指定顏色的RGB值(橘紅)
    let orCustomColor = UIColor(red: 210/255.0, green: 88/255.0, blue: 38/255.0, alpha: 1.0)
    // 指定顏色的RGB值(灰)
    let gCustomColor = UIColor(red: 145/255.0, green: 142/255.0, blue: 143/255.0, alpha: 1.0)
    
    //用來記錄玩家選擇的怪獸
    var playerOneSelectedMonster: String?
    
    //玩家一圖片觸控區
    @IBAction func playerOneImgOneTapGestureRecognizer(_ sender: UITapGestureRecognizer) {

//        isPlayerOnePictureSelected = true
        playerOneImgOne.image = UIImage(named: "O萬事通")
        playerOneLblOne.textColor = orCustomColor
        playerOneLblTwo.textColor = gCustomColor
        playerOneLblThree.textColor = gCustomColor
        playerOneSelectedMonster = "萬事通"
        
            
        // 取消其他怪獸的選擇
        isPlayerOnePictureSelected = false
        playerOneImgTwo.image = UIImage(named: "開心鬼")
        playerOneImgThree.image = UIImage(named: "瞌睡蟲")
    }
    //開心鬼 O開心鬼
    @IBAction func playerOneImgTwoTapGestureRecognizer(_ sender: UITapGestureRecognizer) {

//        isPlayerOnePictureSelected = true
        playerOneImgTwo.image = UIImage(named: "O開心鬼")
        playerOneLblOne.textColor = gCustomColor
        playerOneLblTwo.textColor = orCustomColor
        playerOneLblThree.textColor = gCustomColor
        playerOneSelectedMonster = "開心鬼"
        
            
        // 取消其他怪獸的選擇
        isPlayerOnePictureSelected = false
        playerOneImgOne.image = UIImage(named: "萬事通")
        playerOneImgThree.image = UIImage(named: "瞌睡蟲")
    }
    //瞌睡蟲 O瞌睡蟲
    @IBAction func playerOneImgThreeTapGestureRecognizer(_ sender: UITapGestureRecognizer) {

//        isPlayerOnePictureSelected = true
        playerOneImgThree.image = UIImage(named: "O瞌睡蟲")
        playerOneLblOne.textColor = gCustomColor
        playerOneLblTwo.textColor = gCustomColor
        playerOneLblThree.textColor = orCustomColor
        playerOneSelectedMonster = "瞌睡蟲"
            
        // 取消其他怪獸的選擇
        isPlayerOnePictureSelected = false
        playerOneImgOne.image = UIImage(named: "萬事通")
        playerOneImgTwo.image = UIImage(named: "開心鬼")
    }
    
    //玩家二圖片觸控區
    @IBAction func playerTwoImgOneTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        isPlayerTwoPictureSelected.toggle()
                if isPlayerTwoPictureSelected == true{
                    playerTwoImgOne.image = UIImage(named: "萬事通")
                }else{
                    playerTwoImgOne.image = UIImage(named: "O萬事通")
                }
    }
    
    @IBAction func playerTwoImgTwoTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        isPlayerTwoPictureSelected.toggle()
                if isPlayerTwoPictureSelected == true{
                    playerTwoImgTwo.image = UIImage(named: "開心鬼")
                }else{
                    playerTwoImgTwo.image = UIImage(named: "O開心鬼")
                }
    }
    
    @IBAction func playerTwoImgThreeTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        isPlayerTwoPictureSelected.toggle()
                if isPlayerTwoPictureSelected == true{
                    playerTwoImgThree.image = UIImage(named: "瞌睡蟲")
                }else{
                    playerTwoImgThree.image = UIImage(named: "O瞌睡蟲")
                }
    }
    
    //按鈕啟動
    
    @IBAction func startGameTouchUp(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            if let destinationVC = segue.destination as? ViewController {
                if let playerOneSelectedMonster = sender as? String {
                    destinationVC.playerOneSelectedMonster = playerOneSelectedMonster
                }
            }
        }
    }
    
    
    @IBAction func backToPreviousPageTouchUp(_ sender: UIButton) {
    }
    
    
    //按鈕按下
    
    
    @IBAction func startGameTouchDown(_ sender: UIButton) {
        if let playerOneSelectedMonster = playerOneSelectedMonster {
                // 在這裡執行頁面過渡，將 selectedMonster 傳遞到下一頁
                performSegue(withIdentifier: "startGame", sender: playerOneSelectedMonster)
            } else {
                // 提示用戶選擇怪獸
            }
    }
    
 
    
    @IBAction func backToPreviousPageTouchDown(_ sender: UIButton) {        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
