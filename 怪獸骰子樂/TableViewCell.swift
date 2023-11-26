
import UIKit

let kTableViewCell = "TableViewCell"

enum TableViewType{
    case left
    case right
}


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var playerOneScroeButton: UIButton!{
        didSet {
            // 在 didSet 裡設定圖片
            playerOneScroeButton.setImage(UIImage(named: "square_yellow"), for: .normal)
            playerOneScroeButton.setImage(UIImage(named: "square_gray"), for: .selected)
        }
    }
    @IBOutlet weak var playerTwoScroeButton: UIButton!{
        didSet {
            // 在 didSet 裡設定圖片
            playerTwoScroeButton.setImage(UIImage(named: "square_yellow"), for: .normal)
            playerTwoScroeButton.setImage(UIImage(named: "square_gray"), for: .selected)
        }
    }
    
    
    @IBOutlet weak var playerOneScroeLabel: UILabel!
    @IBOutlet weak var playerTwoScroeLabel: UILabel!
    
    var playerOneScroeButtonClosure:()->() = {}
    var playerTwoScroeButtonClosure:()->() = {}
    
    
    @IBAction func playerOneScroeButtonAction(_ sender: UIButton) {
        sender.isHighlighted = true
        
        playerOneScroeButtonClosure()
    }
    
    
    @IBAction func playerTwoScroeButtonAction(_ sender: UIButton) {
        sender.isHighlighted = true
        
        playerTwoScroeButtonClosure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none //選取表格本身不會有反應
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setupView(){
        self.playerOneScroeButton.clipsToBounds = true
        self.playerOneScroeButton.contentMode = .scaleAspectFill
        //框線粗細
        self.playerOneScroeButton.layer.borderWidth = 1.0
        self.playerOneScroeButton.layer.borderColor = UIColor.gray.cgColor
        self.playerOneScroeButton.layer.cornerRadius = self.playerOneScroeButton.bounds.width / 12
        
        
        self.playerTwoScroeButton.clipsToBounds = true
        self.playerTwoScroeButton.contentMode = .scaleAspectFill
        self.playerTwoScroeButton.layer.borderWidth = 1.0
        //在這邊改變框框顏色
        self.playerTwoScroeButton.layer.borderColor = UIColor.gray.cgColor
        //改變外框圓角
        self.playerTwoScroeButton.layer.cornerRadius = self.playerTwoScroeButton.bounds.width / 12
        
    }
    
    
    func setupCell(row: Int,
                   _ type: TableViewType ,
                   _ playerOneData: PlayerScoreSheet ,
                   _ playerTwoData: PlayerScoreSheet){
        
        var itemInfo: (imageName: String, title: String, btnSelected: BtnType, title2: String, btnSelected2: BtnType) = ("", "", .none, "", .none)
        
        
        if type == .left {
            switch row {
            case 0:
                itemInfo = ("blue_1",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.one)),
                            playerOneData.isPlayerScoreBtnSelected[0],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.one)),
                            playerTwoData.isPlayerScoreBtnSelected[0])
            case 1:
                itemInfo = ("blue_2",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.two)),
                            playerOneData.isPlayerScoreBtnSelected[1],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.two)),
                            playerTwoData.isPlayerScoreBtnSelected[1])
            case 2:
                itemInfo = ("blue_3",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.three)),
                            playerOneData.isPlayerScoreBtnSelected[2],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.three)),
                            playerTwoData.isPlayerScoreBtnSelected[2])
            case 3:
                itemInfo = ("blue_4",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.four)),
                            playerOneData.isPlayerScoreBtnSelected[3],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.four)),
                            playerTwoData.isPlayerScoreBtnSelected[3])
            case 4:
                itemInfo = ("blue_5",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.five)),
                            playerOneData.isPlayerScoreBtnSelected[4],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.five)),
                            playerTwoData.isPlayerScoreBtnSelected[4])
            case 5:
                itemInfo = ("blue_6",getPlayerScoreValue(row: row,
                                                         playerOneData,
                                                         String(playerOneData.sixe)),
                            playerOneData.isPlayerScoreBtnSelected[5],
                            getPlayerScoreValue(row: row,
                                                playerTwoData,
                                                String(playerTwoData.sixe)),
                            playerTwoData.isPlayerScoreBtnSelected[5])
                
            default:
                break
            }
        }
        else {
            switch row {
            case 0:
                itemInfo = ("3x",getPlayerScoreValue(row: row + 7,
                                                     playerOneData,
                                                     String(playerOneData.threeOfAKind)),
                            playerOneData.isPlayerScoreBtnSelected[6],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.threeOfAKind)),
                            playerTwoData.isPlayerScoreBtnSelected[6])
            case 1:
                itemInfo = ("4x",getPlayerScoreValue(row: row + 7,
                                                     playerOneData,
                                                     String(playerOneData.fourOfAKind)),
                            playerOneData.isPlayerScoreBtnSelected[7],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.fourOfAKind)),
                            playerTwoData.isPlayerScoreBtnSelected[7])
            case 2:
                itemInfo = ("葫蘆", getPlayerScoreValue(row: row + 7,
                                                      playerOneData,
                                                      String(playerOneData.fullHouse)),
                            playerOneData.isPlayerScoreBtnSelected[8],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.fullHouse)),
                            playerTwoData.isPlayerScoreBtnSelected[8])
            case 3:
                itemInfo = ("小順", getPlayerScoreValue(row: row + 7,
                                                      playerOneData,
                                                      String(playerOneData.smStraight)),
                            playerOneData.isPlayerScoreBtnSelected[9],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.smStraight)),
                            playerTwoData.isPlayerScoreBtnSelected[9])
            case 4:
                itemInfo = ("大順", getPlayerScoreValue(row: row + 7,
                                                      playerOneData,
                                                      String(playerOneData.lgStraight)),
                            playerOneData.isPlayerScoreBtnSelected[10],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.lgStraight)),
                            playerTwoData.isPlayerScoreBtnSelected[10])
            case 5:
                itemInfo = ("Yahtzee", getPlayerScoreValue(row: row + 7,
                                                           playerOneData,
                                                           String(playerOneData.fiveOfAKind)),
                            playerOneData.isPlayerScoreBtnSelected[11],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.fiveOfAKind)),
                            playerTwoData.isPlayerScoreBtnSelected[11])
            case 6:
                itemInfo = ("chance", getPlayerScoreValue(row: row + 7,
                                                          playerOneData,
                                                          String(playerOneData.chance)),
                            playerOneData.isPlayerScoreBtnSelected[12],
                            getPlayerScoreValue(row: row + 7,
                                                playerTwoData,
                                                String(playerTwoData.chance)),
                            playerTwoData.isPlayerScoreBtnSelected[12])
            default:
                break
            }
        }
        
        self.itemImage.image = UIImage(named: itemInfo.imageName)
        
        self.playerOneScroeLabel.text = itemInfo.title
        self.playerTwoScroeLabel.text = itemInfo.title2
        self.playerOneScroeButton.isSelected = itemInfo.btnSelected != .none
        self.playerTwoScroeButton.isSelected = itemInfo.btnSelected2 != .none
    }
    
    // 判斷 playerScroeLabel 要用哪個資料，如果 playerScore 不是 0 的話就顯示 playerScore 的分數
    func getPlayerScoreValue(row: Int, _ playerData: PlayerScoreSheet, _ defaultString: String) -> String{
        
        return playerData.playerScore[row] != 0 ? String(playerData.playerScore[row]) : defaultString
    }
}
