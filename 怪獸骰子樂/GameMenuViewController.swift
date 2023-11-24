
import UIKit

class GameMenuViewController: UIViewController {

    //按鈕位置
    @IBOutlet weak var singleGame: UIButton!{
        didSet{
            singleGame.setImage(UIImage(named: "single_off"), for: .highlighted)
        }
    }
    @IBOutlet weak var doubleGame: UIButton!{
        didSet{
            doubleGame.setImage(UIImage(named: "double_off"), for: .highlighted)
        }
    }
 
    
    //按鈕啟動
    @IBAction func singleGameTouchup(_ sender: UIButton) {
    }
    @IBAction func doubleGameTouchup(_ sender: UIButton) {
    }
   
    
    //按鈕按下
    @IBAction func singleGameTouchDown(_ sender: UIButton) {
    }
    @IBAction func doubleGameTouchDown(_ sender: UIButton) {        
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
