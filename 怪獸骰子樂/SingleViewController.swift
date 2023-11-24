
import UIKit

class SingleViewController: UIViewController {

    //按鈕位置
    @IBOutlet weak var startGame: UIButton!
    {
        didSet{
            startGame.setImage(UIImage(named: "start game_off"), for: .highlighted)
        }
    }
    
    @IBOutlet weak var backToPreviousPage: UIButton!
    {
        didSet{
            backToPreviousPage.setImage(UIImage(named: "previous page_off"), for: .highlighted)
        }
    }
    
    
    //按鈕啟動
    
    @IBAction func startGameTouchUP(_ sender: UIButton) {
        
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
