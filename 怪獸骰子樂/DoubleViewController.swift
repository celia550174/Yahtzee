
import UIKit

class DoubleViewController: UIViewController {
    
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
    
    //玩家一圖片觸控區
    @IBAction func playerOneImgOneTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        //是一種切換（toggle）布林值的方法，用於將布林值的狀態反轉，即從 true 變為 false，或從 false 變為 true
        isPlayerOnePictureSelected.toggle()
                if isPlayerOnePictureSelected == true{
                    playerOneImgOne.image = UIImage(named: "萬事通")
                }else{
                    playerOneImgOne.image = UIImage(named: "O萬事通")
                }
    }
    //開心鬼 O開心鬼
    @IBAction func playerOneImgTwoTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        isPlayerOnePictureSelected.toggle()
                if isPlayerOnePictureSelected == true{
                    playerOneImgTwo.image = UIImage(named: "開心鬼")
                }else{
                    playerOneImgTwo.image = UIImage(named: "O開心鬼")
                }
    }
    //瞌睡蟲 O瞌睡蟲
    @IBAction func playerOneImgThreeTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        isPlayerOnePictureSelected.toggle()
                if isPlayerOnePictureSelected == true{
                    playerOneImgThree.image = UIImage(named: "瞌睡蟲")
                }else{
                    playerOneImgThree.image = UIImage(named: "O瞌睡蟲")
                }
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
    
    
    @IBAction func backToPreviousPageTouchUp(_ sender: UIButton) {
    }
    
    
    //按鈕按下
    
    
    @IBAction func startGameTouchDown(_ sender: UIButton) {
    }
    
 
    
    @IBAction func backToPreviousPageTouchDown(_ sender: UIButton) {        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
