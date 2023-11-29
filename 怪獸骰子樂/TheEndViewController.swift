
import ImageIO
import UIKit

class TheEndViewController: UIViewController {
    
    @IBOutlet weak var gifImageViewLight: UIImageView!      //背景光輝
    
    //顯示輸贏的文字
    @IBOutlet weak var victorLabel: UILabel!
    //玩家頭像
    @IBOutlet weak var playerOneImg: UIImageView!
    @IBOutlet weak var playerTwoImg: UIImageView!
    //玩家名稱
    @IBOutlet weak var playerOneNameLbl: UILabel!
    {
        didSet{
            playerOneNameLbl.text = playerOneSelectedMonster!
        }
    }
    @IBOutlet weak var playerTwoNameLbl: UILabel!
    {
        didSet{
            playerTwoNameLbl.text = playerTwoSelectedMonster!
        }
    }
    
    //玩家分數區
    @IBOutlet weak var playerOneScoreLbl: UILabel!
    {
        didSet{
            playerOneScoreLbl.text = playerOneScore
        }
    }
    @IBOutlet weak var playerTwoScoreLbl: UILabel!
    {
        didSet{
            playerTwoScoreLbl.text = playerTwoScore
        }
    }
    
    //按鈕區
    @IBOutlet weak var again: UIButton!{
        didSet{
            again.setImage(UIImage(named: "again_off"), for: .highlighted)
        }
    }
    
    @IBOutlet weak var homePage: UIButton!{
        didSet{
            homePage.setImage(UIImage(named: "homepage_off"), for: .highlighted)
        }
    }
    
    @IBOutlet weak var leave: UIButton!{
        didSet{
            leave.setImage(UIImage(named: "leave_off"), for: .highlighted)
        }
    }
    
    //用來接收ViewController頁的值
    var playerOneScore = ""
    var playerTwoScore = ""
    var playerOneSelectedMonster: String?
    var playerTwoSelectedMonster: String?
    
    // 指定顏色的RGB值(橘紅)
    let orCustomColor = UIColor(red: 210/255.0, green: 88/255.0, blue: 38/255.0, alpha: 1.0)
    // 指定顏色的RGB值(灰)
    let gCustomColor = UIColor(red: 145/255.0, green: 142/255.0, blue: 143/255.0, alpha: 1.0)
    
    //按鈕啟動
    @IBAction func againTouchUp(_ sender: UIButton) {
    }
    
    @IBAction func homePageTouchUp(_ sender: UIButton) {
    }
    
    @IBAction func leaveTouchUp(_ sender: UIButton) {
    }
    
    
    
    //按鈕按下
    @IBAction func againTouchDown(_ sender: UIButton) {
    }
    
    @IBAction func homePageTouchDown(_ sender: UIButton) {
    }
    
    @IBAction func leaveTouchDown(_ sender: UIButton) {
        
        // 提供使用者一個確認框，確保他們真的想要離開應用程式
        let alertController = UIAlertController(
            title: "離開應用程式",
            message: "確定要離開應用程式嗎？",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let exitAction = UIAlertAction(title: "離開", style: .default) { _ in
            // 使用者確定要離開，執行退出應用程式的程式碼
            // 注意：正式的應用程式中，不推薦使用 exit(0)
            exit(0)
        }
        alertController.addAction(exitAction)
        
        present(alertController, animated: true, completion: nil)
    }

    func winner(){
        if playerOneScore == playerTwoScore
        {
            victorLabel.text = "平手"
        }
        else if playerOneScore > playerTwoScore
        {
            victorLabel.text = playerOneSelectedMonster!+"贏了！！！"
            playerOneScoreLbl.textColor = orCustomColor
            playerTwoScoreLbl.textColor = gCustomColor
            playerOneNameLbl.textColor = orCustomColor
            playerTwoNameLbl.textColor = gCustomColor
            playerOneImg.image = UIImage(named: "\(playerOneSelectedMonster!)winner")
            playerTwoImg.image = UIImage(named: "X\(playerTwoSelectedMonster!)")
        }
        else
        {
            victorLabel.text = playerTwoSelectedMonster!+"贏了！！！"
            playerOneScoreLbl.textColor = gCustomColor
            playerTwoScoreLbl.textColor = orCustomColor
            playerOneNameLbl.textColor = gCustomColor
            playerTwoNameLbl.textColor = orCustomColor
            playerOneImg.image = UIImage(named: "X\(playerOneSelectedMonster!)")
            playerTwoImg.image = UIImage(named: "\(playerTwoSelectedMonster!)winner")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winner()
        // 設置[Light]GIF圖片的文件名
              let gifImageName3 = "light"

              // 取得GIF圖片的URL或Bundle中的路徑
        if let gifImageUrl = Bundle.main.url(forResource: gifImageName3, withExtension: "gif") {
            // 使用CGImageSource來讀取GIF圖片
            if let imageSource = CGImageSourceCreateWithURL(gifImageUrl as CFURL, nil) {
                // 取得GIF圖片的幀數
                let frameCount = CGImageSourceGetCount(imageSource)
                
                // 初始化UIImage陣列來保存GIF圖片的每一幀
                var images: [UIImage] = []
                
                // 迭代每一幀，將其添加到UIImage陣列中
                for i in 0..<frameCount {
                    if let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) {
                        let uiImage = UIImage(cgImage: cgImage)
                        images.append(uiImage)
                    }
                }
                // 設置UIImageView的animationImages屬性，以顯示GIF圖片
                gifImageViewLight.animationImages = images
                gifImageViewLight.animationDuration = TimeInterval(frameCount) * 0.3 // 設置動畫持續時間
                gifImageViewLight.startAnimating() // 開始動畫
            }
        }
    }
}
