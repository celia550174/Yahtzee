import UIKit

class BounsTableViewCell: UITableViewCell {

    static let identifier = "BounsTableViewCell"
    
    //表格圖顯示區
    @IBOutlet weak var bounsItemImage: UIImageView!
    @IBOutlet weak var playerOneBounsScroesImage: UIImageView!
    @IBOutlet weak var playerTwoBounsScroesImage: UIImageView!
    
    //表格文字顯示區：
    @IBOutlet weak var playerOneBounsScroesLabel: UILabel!
    @IBOutlet weak var playerTwoBounsScroesLabel: UILabel!
    
    static func Nib() -> UINib
    {
        return UINib(nibName: "BounsTableViewCell", bundle: nil)
    }
    
    func configure1(_ title:String )
    {
        self.playerOneBounsScroesLabel.text = title
    }
    func configure2(_ title:String )
    {
        self.playerTwoBounsScroesLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none //選取表格本身不會表現出任何反應
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
