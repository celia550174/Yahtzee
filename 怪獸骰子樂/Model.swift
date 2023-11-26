
import Foundation

//定義列舉類型
enum DiceValue: Int
{
    case one = 1, two, three, four, five, six
}

/*
 因應需求 button 會有三種狀態
 也可以個別設定樣式
 */
enum BtnType{
    /// 未點選
    case none
    /// 目前選擇的按鈕
    case isSelected
    /// 已選過的按鈕（有分數了）
    case done
}

struct Game
{
    
    //儲存骰子是否被選取的bool值
    var isDiceSelected: [Bool] = [false, false, false, false, false]
    
    // 設置初始的擲骰子次數為3（或你想要的次數）
    var rollCount = 3

}

struct PlayerScoreSheet
{
    
    //儲存表格按鈕是否被選擇的Bool
    var isPlayerScoreBtnSelected:[BtnType] = [.none,.none,.none,.none,.none,.none,.none,.none,.none,.none,.none,.none,.none]
    //儲存玩家分數的陣列
    var playerScore = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    
    //自訂儲存分數用變數群
    var one = 0
    var two = 0
    var three = 0
    var four = 0
    var five = 0
    var sixe = 0
    var bonus = 0          //如果1~6相加分數超過63分再額外+35分
    
    var threeOfAKind = 0   //三條
    var fourOfAKind = 0    //四條
    var fullHouse = 0      //葫蘆+25
    var smStraight = 0     //小順+30
    var lgStraight = 0     //大順+40
    var chance = 0         //機會
    var fiveOfAKind = 0    //五條+50//YAHTZEE
    

    init(_ diceRoll: [DiceValue])
    {
        
        // 然後調用計算得分的方法
        calculateScore(diceRoll)
    }

    // 计算得分的方法
    mutating func calculateScore(_ diceRoll: [DiceValue])
    {
        // 使用原始 diceRoll 数组计算其他得分
        
        one = diceRoll.filter { $0 == .one }.reduce(0) { $0 + $1.rawValue }
        two = diceRoll.filter { $0 == .two }.reduce(0) { $0 + $1.rawValue }
        three = diceRoll.filter { $0 == .three }.reduce(0) { $0 + $1.rawValue }
        four = diceRoll.filter { $0 == .four }.reduce(0) { $0 + $1.rawValue }
        five = diceRoll.filter { $0 == .five }.reduce(0) { $0 + $1.rawValue }
        sixe = diceRoll.filter { $0 == .six }.reduce(0) { $0 + $1.rawValue }

        //檢查是否滿足加分條件
        bonus = getBonus()
        //三條
        threeOfAKind = getThreeOfAKind(diceRoll)
        //四條
        fourOfAKind = getFourOfAKind(diceRoll)
        //五條
        fiveOfAKind = getFiveOfAKind(diceRoll)
        
        // 葫蘆
        fullHouse = getFullHouse(diceRoll)

        // 使用 sortedNumbers 计算小顺
        smStraight = getSmStraight(diceRoll)
        
        // 大順
        lgStraight = getLgStraight(diceRoll)

        
        // 计算骰子总和
        chance = getChance(diceRoll)

        // 发送通知，通知视图需要更新
        NotificationCenter.default.post(name: .scoresUpdated, object: nil)
        
    }
    
    func getSortedCounts(_ diceRoll: [DiceValue]) -> [Int]{
        let counts = Dictionary(grouping: diceRoll, by: { $0 }).map { $0.value.count }
        //遞減排序
        let sortedCounts = counts.sorted(by: { $0 > $1 })
        return sortedCounts
    }
    
    private func getBonus() -> Int{
        return ((one + two + three + four + five + sixe) >= 63) ? 35 : 0
    }
    
    private func getThreeOfAKind(_ diceRoll: [DiceValue]) -> Int{
        
        //三條
        let maxCount = getSortedCounts(diceRoll).first ?? 0
        
        let total = diceRoll.reduce(0){total ,a in total + a.rawValue}
        
        return (maxCount >= 3) ? total : 0
    }
    
    private func getFourOfAKind(_ diceRoll: [DiceValue]) -> Int{

        let maxCount = getSortedCounts(diceRoll).first ?? 0
        let total = diceRoll.reduce(0){total ,a in total + a.rawValue}
        
        return (maxCount >= 4) ? total : 0
    }
    
    private func getFiveOfAKind(_ diceRoll: [DiceValue]) -> Int{
        // 将重复的数字用集合 Set 去掉
        let uniqueNumbers = Set(diceRoll)
        // 检查是否存在 5 个相同的骰子
        return (uniqueNumbers.count == 1 && diceRoll.count == 5) ? 50 : 0
    }
    
    private func getFullHouse(_ diceRoll: [DiceValue]) -> Int{
        let sortedCounts = getSortedCounts(diceRoll)
        return (sortedCounts == [3, 2]) ? 25 : 0
    }
    //提醒自己！！小順的方法還需要調整，目前還有問題，[12356]也被算分了
    private func getSmStraight(_ diceRoll: [DiceValue]) -> Int{
        // 将重复的数字用集合 Set 去掉
        let uniqueNumbers = Set(diceRoll)
        // 轉回陣列
        let sortedNumbers = Array(uniqueNumbers)
        let sortedRoll = sortedNumbers.map { $0.rawValue }.sorted()
        var isConsecutive = false
            if sortedRoll.count >= 4 {
                for i in 1..<sortedRoll.count {
                    if sortedRoll[i] == sortedRoll[i - 1] + 1 {
                        isConsecutive = true
                    } else {
                        var smStraightArray = sortedRoll
                        smStraightArray.remove(at: i)
                        if smStraightArray.count == 4{
                            isConsecutive = true
                            break
                        }
                        else
                        {
                            isConsecutive = false
                            break
                        }
                    }
                }
            }
        return isConsecutive ? 30 : 0
    }
    
    private func getLgStraight(_ diceRoll: [DiceValue]) -> Int{
        let isLgStraight = diceRoll.map({ $0.rawValue }).sorted() == [2, 3, 4, 5, 6] || diceRoll.map({ $0.rawValue }).sorted() == [1, 2, 3, 4, 5]
        return isLgStraight ? 40 : 0
    }
    
    private func getChance(_ diceRoll: [DiceValue]) -> Int{
        return diceRoll.reduce(0) { $0 + $1.rawValue }
    }
    
}
