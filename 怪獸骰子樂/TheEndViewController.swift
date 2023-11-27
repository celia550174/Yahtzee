

import UIKit

class TheEndViewController: UIViewController {

    @IBOutlet weak var victorLabel: UILabel!
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
    
    //按鈕位置
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
//    var round = 0
    var playerOneScore = ""
    var playerTwoScore = ""
    var playerOneName = "玩家一"
    var playerTwoName = "玩家二"
    
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

    func winner()->String{
        if playerOneScore == playerTwoScore
        {
            "平手"
        }
        else
        {
            playerOneScore > playerTwoScore ? playerOneName+"贏了！！！" : playerTwoName+"贏了！！！"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        victorLabel.text = winner()
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
