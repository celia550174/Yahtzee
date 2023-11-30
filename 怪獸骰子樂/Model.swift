
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
    var fiveOfAKind = 0    //五條+50//YAHTZEE
    var chance = 0         //機會
    

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
        
        // 如果已經計分過五條，則每次再擲出一個 Yahtzee 另外加 100 分
        if isPlayerScoreBtnSelected[11] == .done {
            let uniqueNumbers = Set(diceRoll)
            // 检查是否存在 5 个相同的骰子
            if (uniqueNumbers.count == 1 && diceRoll.count == 5){(playerScore[12] += 100)}
            
        }

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
        ((playerScore[0] + playerScore[1] + playerScore[2] + playerScore[3] + playerScore[4] + playerScore[5]) >= 63) ? 35 : 0
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
    //五條被選定後又擲出五條需要再加分
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

    private func getSmStraight(_ diceRoll: [DiceValue]) -> Int {
        // 轉成 set 去除重複的數字
        let uniqueNumbers = Set(diceRoll)
        // 轉回陣列
        let sortedNumbers = Array(uniqueNumbers)
        // 將點數排序
        let sortedRoll = sortedNumbers.map { $0.rawValue }.sorted()
        
        print(sortedRoll)
        
        // 定義小順的可能組合
        let possibleSmStraights: [Set<Int>] = [
            [1, 2, 3, 4],
            [2, 3, 4, 5],
            [3, 4, 5, 6]
        ].map { Set($0) }

        // 檢查點數是否構成小順的其中一個組合
        if possibleSmStraights.contains { $0.isSubset(of: Set(sortedRoll)) } {
            return 30
        } else {
            return 0
        }
    }

    
    private func getLgStraight(_ diceRoll: [DiceValue]) -> Int{
        let isLgStraight = diceRoll.map({ $0.rawValue }).sorted() == [2, 3, 4, 5, 6] || diceRoll.map({ $0.rawValue }).sorted() == [1, 2, 3, 4, 5]
        return isLgStraight ? 40 : 0
    }
    
    private func getChance(_ diceRoll: [DiceValue]) -> Int{
        return diceRoll.reduce(0) { $0 + $1.rawValue }
    }
    
}
