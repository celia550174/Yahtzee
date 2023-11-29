import UIKit
import ImageIO

class EnterGameViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!           //上三點
    @IBOutlet weak var gifImageView2: UIImageView!          //下三點
    @IBOutlet weak var gifImageViewLight: UIImageView!      //背景光輝
    
    //按鈕位置
    @IBOutlet weak var enterGame: UIButton!{
        didSet{
            enterGame.setImage(UIImage(named: "enter game button_off"), for: .highlighted)
        }
    }
    
    //按鈕啟動
    @IBAction func enterGameTouchUp(_ sender: UIButton) {
    }
    
    //按鈕按下
    @IBAction func enterGameTouchDown(_ sender: UIButton) {
    }


    //宣告首頁骰子動畫
    let home_white = UIImageView()
    let home_blue = UIImageView()
    let home_orange = UIImageView()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        // 設置[point]GIF圖片的文件名
              let gifImageName = "point"

              // 取得GIF圖片的URL或Bundle中的路徑
        if let gifImageUrl = Bundle.main.url(forResource: gifImageName, withExtension: "gif") {
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
                               gifImageView.animationImages = images
                               gifImageView.animationDuration = TimeInterval(frameCount) * 0.4 // 設置動畫持續時間
                               gifImageView.startAnimating() // 開始動畫
            }
        }
        
        // 設置[point2]GIF圖片的文件名
              let gifImageName2 = "point2"

              // 取得GIF圖片的URL或Bundle中的路徑
        if let gifImageUrl = Bundle.main.url(forResource: gifImageName2, withExtension: "gif") {
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
                               gifImageView2.animationImages = images
                               gifImageView2.animationDuration = TimeInterval(frameCount) * 0.5 // 設置動畫持續時間
                               gifImageView2.startAnimating() // 開始動畫
            }
        }
        
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

        
        // 橘骰子設定要進行動畫的視圖
        home_orange.frame = CGRect(x: 82, y: 460, width: 80, height: 80)
        home_orange.image = UIImage(named: "home_orange")
        view.addSubview(home_orange)
        // 呼叫動畫函數
        animateView()

        // 藍骰子設定要進行動畫的視圖
        home_blue.frame = CGRect(x: 163, y: 360, width: 180, height: 180)
        home_blue.image = UIImage(named: "home_blue")
        view.addSubview(home_blue)
        // 呼叫動畫函數
        animateView()
        
        // 白骰子設定要進行動畫的視圖
        home_white.frame = CGRect(x: 60, y: 210, width: 205, height: 217)
        home_white.image = UIImage(named: "home_white")
            view.addSubview(home_white)
        // 呼叫動畫函數
         animateView()
        }
    
    
        func animateView() {
            // 設定橘骰子動畫
            UIView.animate(withDuration: 3.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                // 在這裡設定視圖的最終位置
                self.home_orange.frame.origin.y +=
                6
            }, completion: nil)
            
            // 設定藍骰子動畫
            UIView.animate(withDuration: 2.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                // 在這裡設定視圖的最終位置
                self.home_blue.frame.origin.y +=
                10
            }, completion: nil)
            
            // 設定白骰子動畫
            UIView.animate(withDuration: 1.8, delay: 0, options: [.autoreverse, .repeat], animations: {
                // 在這裡設定視圖的最終位置
                self.home_white.frame.origin.y +=
                18
            }, completion: nil)
       }
}
