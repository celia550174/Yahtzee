import UIKit

class EnterGameViewController: UIViewController {
    
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
