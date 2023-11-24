

import UIKit

class TheEndViewController: UIViewController {

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
