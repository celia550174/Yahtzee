import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "3x" asset catalog image resource.
    static let _3X = ImageResource(name: "3x", bundle: resourceBundle)

    /// The "4x" asset catalog image resource.
    static let _4X = ImageResource(name: "4x", bundle: resourceBundle)

    /// The "Loading_blue" asset catalog image resource.
    static let loadingBlue = ImageResource(name: "Loading_blue", bundle: resourceBundle)

    /// The "Loading_light_y" asset catalog image resource.
    static let loadingLightY = ImageResource(name: "Loading_light_y", bundle: resourceBundle)

    /// The "Loading_orange" asset catalog image resource.
    static let loadingOrange = ImageResource(name: "Loading_orange", bundle: resourceBundle)

    /// The "Loading_text" asset catalog image resource.
    static let loadingText = ImageResource(name: "Loading_text", bundle: resourceBundle)

    /// The "O瞌睡蟲" asset catalog image resource.
    static let o瞌睡蟲 = ImageResource(name: "O瞌睡蟲", bundle: resourceBundle)

    /// The "O萬事通" asset catalog image resource.
    static let o萬事通 = ImageResource(name: "O萬事通", bundle: resourceBundle)

    /// The "O開心鬼" asset catalog image resource.
    static let o開心鬼 = ImageResource(name: "O開心鬼", bundle: resourceBundle)

    /// The "X瞌睡蟲" asset catalog image resource.
    static let x瞌睡蟲 = ImageResource(name: "X瞌睡蟲", bundle: resourceBundle)

    /// The "X萬事通" asset catalog image resource.
    static let x萬事通 = ImageResource(name: "X萬事通", bundle: resourceBundle)

    /// The "X開心鬼" asset catalog image resource.
    static let x開心鬼 = ImageResource(name: "X開心鬼", bundle: resourceBundle)

    /// The "Yahtzee" asset catalog image resource.
    static let yahtzee = ImageResource(name: "Yahtzee", bundle: resourceBundle)

    /// The "again_off" asset catalog image resource.
    static let againOff = ImageResource(name: "again_off", bundle: resourceBundle)

    /// The "again_on" asset catalog image resource.
    static let againOn = ImageResource(name: "again_on", bundle: resourceBundle)

    /// The "arrow" asset catalog image resource.
    static let arrow = ImageResource(name: "arrow", bundle: resourceBundle)

    /// The "award_1" asset catalog image resource.
    static let award1 = ImageResource(name: "award_1", bundle: resourceBundle)

    /// The "award_2" asset catalog image resource.
    static let award2 = ImageResource(name: "award_2", bundle: resourceBundle)

    /// The "award_3" asset catalog image resource.
    static let award3 = ImageResource(name: "award_3", bundle: resourceBundle)

    /// The "back_off" asset catalog image resource.
    static let backOff = ImageResource(name: "back_off", bundle: resourceBundle)

    /// The "back_on" asset catalog image resource.
    static let backOn = ImageResource(name: "back_on", bundle: resourceBundle)

    /// The "blue_1" asset catalog image resource.
    static let blue1 = ImageResource(name: "blue_1", bundle: resourceBundle)

    /// The "blue_2" asset catalog image resource.
    static let blue2 = ImageResource(name: "blue_2", bundle: resourceBundle)

    /// The "blue_3" asset catalog image resource.
    static let blue3 = ImageResource(name: "blue_3", bundle: resourceBundle)

    /// The "blue_4" asset catalog image resource.
    static let blue4 = ImageResource(name: "blue_4", bundle: resourceBundle)

    /// The "blue_5" asset catalog image resource.
    static let blue5 = ImageResource(name: "blue_5", bundle: resourceBundle)

    /// The "blue_6" asset catalog image resource.
    static let blue6 = ImageResource(name: "blue_6", bundle: resourceBundle)

    /// The "chance" asset catalog image resource.
    static let chance = ImageResource(name: "chance", bundle: resourceBundle)

    /// The "choose_Single" asset catalog image resource.
    static let chooseSingle = ImageResource(name: "choose_Single", bundle: resourceBundle)

    /// The "choose_double" asset catalog image resource.
    static let chooseDouble = ImageResource(name: "choose_double", bundle: resourceBundle)

    /// The "dice" asset catalog image resource.
    static let dice = ImageResource(name: "dice", bundle: resourceBundle)

    /// The "dice_off" asset catalog image resource.
    static let diceOff = ImageResource(name: "dice_off", bundle: resourceBundle)

    /// The "dice_on" asset catalog image resource.
    static let diceOn = ImageResource(name: "dice_on", bundle: resourceBundle)

    /// The "double_off" asset catalog image resource.
    static let doubleOff = ImageResource(name: "double_off", bundle: resourceBundle)

    /// The "double_on" asset catalog image resource.
    static let doubleOn = ImageResource(name: "double_on", bundle: resourceBundle)

    /// The "enter game button_off" asset catalog image resource.
    static let enterGameButtonOff = ImageResource(name: "enter game button_off", bundle: resourceBundle)

    /// The "enter game button_on" asset catalog image resource.
    static let enterGameButtonOn = ImageResource(name: "enter game button_on", bundle: resourceBundle)

    /// The "headshot_gray" asset catalog image resource.
    static let headshotGray = ImageResource(name: "headshot_gray", bundle: resourceBundle)

    /// The "headshot_orange" asset catalog image resource.
    static let headshotOrange = ImageResource(name: "headshot_orange", bundle: resourceBundle)

    /// The "home_blue" asset catalog image resource.
    static let homeBlue = ImageResource(name: "home_blue", bundle: resourceBundle)

    /// The "home_dice" asset catalog image resource.
    static let homeDice = ImageResource(name: "home_dice", bundle: resourceBundle)

    /// The "home_light" asset catalog image resource.
    static let homeLight = ImageResource(name: "home_light", bundle: resourceBundle)

    /// The "home_monster" asset catalog image resource.
    static let homeMonster = ImageResource(name: "home_monster", bundle: resourceBundle)

    /// The "home_orange" asset catalog image resource.
    static let homeOrange = ImageResource(name: "home_orange", bundle: resourceBundle)

    /// The "home_point" asset catalog image resource.
    static let homePoint = ImageResource(name: "home_point", bundle: resourceBundle)

    /// The "home_point1" asset catalog image resource.
    static let homePoint1 = ImageResource(name: "home_point1", bundle: resourceBundle)

    /// The "home_white" asset catalog image resource.
    static let homeWhite = ImageResource(name: "home_white", bundle: resourceBundle)

    /// The "homepage_off" asset catalog image resource.
    static let homepageOff = ImageResource(name: "homepage_off", bundle: resourceBundle)

    /// The "homepage_on" asset catalog image resource.
    static let homepageOn = ImageResource(name: "homepage_on", bundle: resourceBundle)

    /// The "leave_off" asset catalog image resource.
    static let leaveOff = ImageResource(name: "leave_off", bundle: resourceBundle)

    /// The "leave_on" asset catalog image resource.
    static let leaveOn = ImageResource(name: "leave_on", bundle: resourceBundle)

    /// The "model " asset catalog image resource.
    static let model = ImageResource(name: "model ", bundle: resourceBundle)

    /// The "play_off" asset catalog image resource.
    static let playOff = ImageResource(name: "play_off", bundle: resourceBundle)

    /// The "play_on" asset catalog image resource.
    static let playOn = ImageResource(name: "play_on", bundle: resourceBundle)

    /// The "previous page_off" asset catalog image resource.
    static let previousPageOff = ImageResource(name: "previous page_off", bundle: resourceBundle)

    /// The "previous page_on" asset catalog image resource.
    static let previousPageOn = ImageResource(name: "previous page_on", bundle: resourceBundle)

    /// The "single_off" asset catalog image resource.
    static let singleOff = ImageResource(name: "single_off", bundle: resourceBundle)

    /// The "single_on" asset catalog image resource.
    static let singleOn = ImageResource(name: "single_on", bundle: resourceBundle)

    /// The "square_gray" asset catalog image resource.
    static let squareGray = ImageResource(name: "square_gray", bundle: resourceBundle)

    /// The "square_orange border" asset catalog image resource.
    static let squareOrangeBorder = ImageResource(name: "square_orange border", bundle: resourceBundle)

    /// The "square_white" asset catalog image resource.
    static let squareWhite = ImageResource(name: "square_white", bundle: resourceBundle)

    /// The "square_yellow" asset catalog image resource.
    static let squareYellow = ImageResource(name: "square_yellow", bundle: resourceBundle)

    /// The "start game_off" asset catalog image resource.
    static let startGameOff = ImageResource(name: "start game_off", bundle: resourceBundle)

    /// The "start game_on" asset catalog image resource.
    static let startGameOn = ImageResource(name: "start game_on", bundle: resourceBundle)

    /// The "timer" asset catalog image resource.
    static let timer = ImageResource(name: "timer", bundle: resourceBundle)

    /// The "volume_off" asset catalog image resource.
    static let volumeOff = ImageResource(name: "volume_off", bundle: resourceBundle)

    /// The "volume_on" asset catalog image resource.
    static let volumeOn = ImageResource(name: "volume_on", bundle: resourceBundle)

    /// The "white_1" asset catalog image resource.
    static let white1 = ImageResource(name: "white_1", bundle: resourceBundle)

    /// The "white_2" asset catalog image resource.
    static let white2 = ImageResource(name: "white_2", bundle: resourceBundle)

    /// The "white_3" asset catalog image resource.
    static let white3 = ImageResource(name: "white_3", bundle: resourceBundle)

    /// The "white_4" asset catalog image resource.
    static let white4 = ImageResource(name: "white_4", bundle: resourceBundle)

    /// The "white_5" asset catalog image resource.
    static let white5 = ImageResource(name: "white_5", bundle: resourceBundle)

    /// The "white_6" asset catalog image resource.
    static let white6 = ImageResource(name: "white_6", bundle: resourceBundle)

    /// The "winner" asset catalog image resource.
    static let winner = ImageResource(name: "winner", bundle: resourceBundle)

    /// The "winnertop" asset catalog image resource.
    static let winnertop = ImageResource(name: "winnertop", bundle: resourceBundle)

    /// The "大順" asset catalog image resource.
    static let 大順 = ImageResource(name: "大順", bundle: resourceBundle)

    /// The "小順" asset catalog image resource.
    static let 小順 = ImageResource(name: "小順", bundle: resourceBundle)

    /// The "瞌睡蟲" asset catalog image resource.
    static let 瞌睡蟲 = ImageResource(name: "瞌睡蟲", bundle: resourceBundle)

    /// The "瞌睡蟲winner" asset catalog image resource.
    static let 瞌睡蟲winner = ImageResource(name: "瞌睡蟲winner", bundle: resourceBundle)

    /// The "萬事通" asset catalog image resource.
    static let 萬事通 = ImageResource(name: "萬事通", bundle: resourceBundle)

    /// The "萬事通winner" asset catalog image resource.
    static let 萬事通winner = ImageResource(name: "萬事通winner", bundle: resourceBundle)

    /// The "葫蘆" asset catalog image resource.
    static let 葫蘆 = ImageResource(name: "葫蘆", bundle: resourceBundle)

    /// The "開心鬼" asset catalog image resource.
    static let 開心鬼 = ImageResource(name: "開心鬼", bundle: resourceBundle)

    /// The "開心鬼winner" asset catalog image resource.
    static let 開心鬼winner = ImageResource(name: "開心鬼winner", bundle: resourceBundle)

    /// The "骰子台" asset catalog image resource.
    static let 骰子台 = ImageResource(name: "骰子台", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "3x" asset catalog image.
    static var _3X: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._3X)
#else
        .init()
#endif
    }

    /// The "4x" asset catalog image.
    static var _4X: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: ._4X)
#else
        .init()
#endif
    }

    /// The "Loading_blue" asset catalog image.
    static var loadingBlue: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .loadingBlue)
#else
        .init()
#endif
    }

    /// The "Loading_light_y" asset catalog image.
    static var loadingLightY: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .loadingLightY)
#else
        .init()
#endif
    }

    /// The "Loading_orange" asset catalog image.
    static var loadingOrange: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .loadingOrange)
#else
        .init()
#endif
    }

    /// The "Loading_text" asset catalog image.
    static var loadingText: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .loadingText)
#else
        .init()
#endif
    }

    /// The "O瞌睡蟲" asset catalog image.
    static var o瞌睡蟲: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .o瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "O萬事通" asset catalog image.
    static var o萬事通: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .o萬事通)
#else
        .init()
#endif
    }

    /// The "O開心鬼" asset catalog image.
    static var o開心鬼: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .o開心鬼)
#else
        .init()
#endif
    }

    /// The "X瞌睡蟲" asset catalog image.
    static var x瞌睡蟲: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .x瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "X萬事通" asset catalog image.
    static var x萬事通: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .x萬事通)
#else
        .init()
#endif
    }

    /// The "X開心鬼" asset catalog image.
    static var x開心鬼: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .x開心鬼)
#else
        .init()
#endif
    }

    /// The "Yahtzee" asset catalog image.
    static var yahtzee: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .yahtzee)
#else
        .init()
#endif
    }

    /// The "again_off" asset catalog image.
    static var againOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .againOff)
#else
        .init()
#endif
    }

    /// The "again_on" asset catalog image.
    static var againOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .againOn)
#else
        .init()
#endif
    }

    /// The "arrow" asset catalog image.
    static var arrow: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .arrow)
#else
        .init()
#endif
    }

    /// The "award_1" asset catalog image.
    static var award1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .award1)
#else
        .init()
#endif
    }

    /// The "award_2" asset catalog image.
    static var award2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .award2)
#else
        .init()
#endif
    }

    /// The "award_3" asset catalog image.
    static var award3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .award3)
#else
        .init()
#endif
    }

    /// The "back_off" asset catalog image.
    static var backOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .backOff)
#else
        .init()
#endif
    }

    /// The "back_on" asset catalog image.
    static var backOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .backOn)
#else
        .init()
#endif
    }

    /// The "blue_1" asset catalog image.
    static var blue1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue1)
#else
        .init()
#endif
    }

    /// The "blue_2" asset catalog image.
    static var blue2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue2)
#else
        .init()
#endif
    }

    /// The "blue_3" asset catalog image.
    static var blue3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue3)
#else
        .init()
#endif
    }

    /// The "blue_4" asset catalog image.
    static var blue4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue4)
#else
        .init()
#endif
    }

    /// The "blue_5" asset catalog image.
    static var blue5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue5)
#else
        .init()
#endif
    }

    /// The "blue_6" asset catalog image.
    static var blue6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blue6)
#else
        .init()
#endif
    }

    /// The "chance" asset catalog image.
    static var chance: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chance)
#else
        .init()
#endif
    }

    /// The "choose_Single" asset catalog image.
    static var chooseSingle: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chooseSingle)
#else
        .init()
#endif
    }

    /// The "choose_double" asset catalog image.
    static var chooseDouble: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chooseDouble)
#else
        .init()
#endif
    }

    /// The "dice" asset catalog image.
    static var dice: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .dice)
#else
        .init()
#endif
    }

    /// The "dice_off" asset catalog image.
    static var diceOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .diceOff)
#else
        .init()
#endif
    }

    /// The "dice_on" asset catalog image.
    static var diceOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .diceOn)
#else
        .init()
#endif
    }

    /// The "double_off" asset catalog image.
    static var doubleOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .doubleOff)
#else
        .init()
#endif
    }

    /// The "double_on" asset catalog image.
    static var doubleOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .doubleOn)
#else
        .init()
#endif
    }

    /// The "enter game button_off" asset catalog image.
    static var enterGameButtonOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .enterGameButtonOff)
#else
        .init()
#endif
    }

    /// The "enter game button_on" asset catalog image.
    static var enterGameButtonOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .enterGameButtonOn)
#else
        .init()
#endif
    }

    /// The "headshot_gray" asset catalog image.
    static var headshotGray: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .headshotGray)
#else
        .init()
#endif
    }

    /// The "headshot_orange" asset catalog image.
    static var headshotOrange: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .headshotOrange)
#else
        .init()
#endif
    }

    /// The "home_blue" asset catalog image.
    static var homeBlue: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeBlue)
#else
        .init()
#endif
    }

    /// The "home_dice" asset catalog image.
    static var homeDice: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeDice)
#else
        .init()
#endif
    }

    /// The "home_light" asset catalog image.
    static var homeLight: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeLight)
#else
        .init()
#endif
    }

    /// The "home_monster" asset catalog image.
    static var homeMonster: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeMonster)
#else
        .init()
#endif
    }

    /// The "home_orange" asset catalog image.
    static var homeOrange: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeOrange)
#else
        .init()
#endif
    }

    /// The "home_point" asset catalog image.
    static var homePoint: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homePoint)
#else
        .init()
#endif
    }

    /// The "home_point1" asset catalog image.
    static var homePoint1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homePoint1)
#else
        .init()
#endif
    }

    /// The "home_white" asset catalog image.
    static var homeWhite: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homeWhite)
#else
        .init()
#endif
    }

    /// The "homepage_off" asset catalog image.
    static var homepageOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homepageOff)
#else
        .init()
#endif
    }

    /// The "homepage_on" asset catalog image.
    static var homepageOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .homepageOn)
#else
        .init()
#endif
    }

    /// The "leave_off" asset catalog image.
    static var leaveOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .leaveOff)
#else
        .init()
#endif
    }

    /// The "leave_on" asset catalog image.
    static var leaveOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .leaveOn)
#else
        .init()
#endif
    }

    /// The "model " asset catalog image.
    static var model: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .model)
#else
        .init()
#endif
    }

    /// The "play_off" asset catalog image.
    static var playOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .playOff)
#else
        .init()
#endif
    }

    /// The "play_on" asset catalog image.
    static var playOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .playOn)
#else
        .init()
#endif
    }

    /// The "previous page_off" asset catalog image.
    static var previousPageOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .previousPageOff)
#else
        .init()
#endif
    }

    /// The "previous page_on" asset catalog image.
    static var previousPageOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .previousPageOn)
#else
        .init()
#endif
    }

    /// The "single_off" asset catalog image.
    static var singleOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .singleOff)
#else
        .init()
#endif
    }

    /// The "single_on" asset catalog image.
    static var singleOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .singleOn)
#else
        .init()
#endif
    }

    /// The "square_gray" asset catalog image.
    static var squareGray: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .squareGray)
#else
        .init()
#endif
    }

    /// The "square_orange border" asset catalog image.
    static var squareOrangeBorder: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .squareOrangeBorder)
#else
        .init()
#endif
    }

    /// The "square_white" asset catalog image.
    static var squareWhite: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .squareWhite)
#else
        .init()
#endif
    }

    /// The "square_yellow" asset catalog image.
    static var squareYellow: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .squareYellow)
#else
        .init()
#endif
    }

    /// The "start game_off" asset catalog image.
    static var startGameOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .startGameOff)
#else
        .init()
#endif
    }

    /// The "start game_on" asset catalog image.
    static var startGameOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .startGameOn)
#else
        .init()
#endif
    }

    /// The "timer" asset catalog image.
    static var timer: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .timer)
#else
        .init()
#endif
    }

    /// The "volume_off" asset catalog image.
    static var volumeOff: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .volumeOff)
#else
        .init()
#endif
    }

    /// The "volume_on" asset catalog image.
    static var volumeOn: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .volumeOn)
#else
        .init()
#endif
    }

    /// The "white_1" asset catalog image.
    static var white1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white1)
#else
        .init()
#endif
    }

    /// The "white_2" asset catalog image.
    static var white2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white2)
#else
        .init()
#endif
    }

    /// The "white_3" asset catalog image.
    static var white3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white3)
#else
        .init()
#endif
    }

    /// The "white_4" asset catalog image.
    static var white4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white4)
#else
        .init()
#endif
    }

    /// The "white_5" asset catalog image.
    static var white5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white5)
#else
        .init()
#endif
    }

    /// The "white_6" asset catalog image.
    static var white6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .white6)
#else
        .init()
#endif
    }

    /// The "winner" asset catalog image.
    static var winner: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .winner)
#else
        .init()
#endif
    }

    /// The "winnertop" asset catalog image.
    static var winnertop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .winnertop)
#else
        .init()
#endif
    }

    /// The "大順" asset catalog image.
    static var 大順: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .大順)
#else
        .init()
#endif
    }

    /// The "小順" asset catalog image.
    static var 小順: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .小順)
#else
        .init()
#endif
    }

    /// The "瞌睡蟲" asset catalog image.
    static var 瞌睡蟲: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "瞌睡蟲winner" asset catalog image.
    static var 瞌睡蟲winner: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .瞌睡蟲winner)
#else
        .init()
#endif
    }

    /// The "萬事通" asset catalog image.
    static var 萬事通: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .萬事通)
#else
        .init()
#endif
    }

    /// The "萬事通winner" asset catalog image.
    static var 萬事通winner: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .萬事通winner)
#else
        .init()
#endif
    }

    /// The "葫蘆" asset catalog image.
    static var 葫蘆: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .葫蘆)
#else
        .init()
#endif
    }

    /// The "開心鬼" asset catalog image.
    static var 開心鬼: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .開心鬼)
#else
        .init()
#endif
    }

    /// The "開心鬼winner" asset catalog image.
    static var 開心鬼winner: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .開心鬼winner)
#else
        .init()
#endif
    }

    /// The "骰子台" asset catalog image.
    static var 骰子台: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .骰子台)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "3x" asset catalog image.
    static var _3X: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._3X)
#else
        .init()
#endif
    }

    /// The "4x" asset catalog image.
    static var _4X: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: ._4X)
#else
        .init()
#endif
    }

    /// The "Loading_blue" asset catalog image.
    static var loadingBlue: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .loadingBlue)
#else
        .init()
#endif
    }

    /// The "Loading_light_y" asset catalog image.
    static var loadingLightY: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .loadingLightY)
#else
        .init()
#endif
    }

    /// The "Loading_orange" asset catalog image.
    static var loadingOrange: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .loadingOrange)
#else
        .init()
#endif
    }

    /// The "Loading_text" asset catalog image.
    static var loadingText: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .loadingText)
#else
        .init()
#endif
    }

    /// The "O瞌睡蟲" asset catalog image.
    static var o瞌睡蟲: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .o瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "O萬事通" asset catalog image.
    static var o萬事通: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .o萬事通)
#else
        .init()
#endif
    }

    /// The "O開心鬼" asset catalog image.
    static var o開心鬼: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .o開心鬼)
#else
        .init()
#endif
    }

    /// The "X瞌睡蟲" asset catalog image.
    static var x瞌睡蟲: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .x瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "X萬事通" asset catalog image.
    static var x萬事通: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .x萬事通)
#else
        .init()
#endif
    }

    /// The "X開心鬼" asset catalog image.
    static var x開心鬼: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .x開心鬼)
#else
        .init()
#endif
    }

    /// The "Yahtzee" asset catalog image.
    static var yahtzee: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .yahtzee)
#else
        .init()
#endif
    }

    /// The "again_off" asset catalog image.
    static var againOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .againOff)
#else
        .init()
#endif
    }

    /// The "again_on" asset catalog image.
    static var againOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .againOn)
#else
        .init()
#endif
    }

    /// The "arrow" asset catalog image.
    static var arrow: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .arrow)
#else
        .init()
#endif
    }

    /// The "award_1" asset catalog image.
    static var award1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .award1)
#else
        .init()
#endif
    }

    /// The "award_2" asset catalog image.
    static var award2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .award2)
#else
        .init()
#endif
    }

    /// The "award_3" asset catalog image.
    static var award3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .award3)
#else
        .init()
#endif
    }

    /// The "back_off" asset catalog image.
    static var backOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .backOff)
#else
        .init()
#endif
    }

    /// The "back_on" asset catalog image.
    static var backOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .backOn)
#else
        .init()
#endif
    }

    /// The "blue_1" asset catalog image.
    static var blue1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue1)
#else
        .init()
#endif
    }

    /// The "blue_2" asset catalog image.
    static var blue2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue2)
#else
        .init()
#endif
    }

    /// The "blue_3" asset catalog image.
    static var blue3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue3)
#else
        .init()
#endif
    }

    /// The "blue_4" asset catalog image.
    static var blue4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue4)
#else
        .init()
#endif
    }

    /// The "blue_5" asset catalog image.
    static var blue5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue5)
#else
        .init()
#endif
    }

    /// The "blue_6" asset catalog image.
    static var blue6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blue6)
#else
        .init()
#endif
    }

    /// The "chance" asset catalog image.
    static var chance: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .chance)
#else
        .init()
#endif
    }

    /// The "choose_Single" asset catalog image.
    static var chooseSingle: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .chooseSingle)
#else
        .init()
#endif
    }

    /// The "choose_double" asset catalog image.
    static var chooseDouble: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .chooseDouble)
#else
        .init()
#endif
    }

    /// The "dice" asset catalog image.
    static var dice: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .dice)
#else
        .init()
#endif
    }

    /// The "dice_off" asset catalog image.
    static var diceOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .diceOff)
#else
        .init()
#endif
    }

    /// The "dice_on" asset catalog image.
    static var diceOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .diceOn)
#else
        .init()
#endif
    }

    /// The "double_off" asset catalog image.
    static var doubleOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .doubleOff)
#else
        .init()
#endif
    }

    /// The "double_on" asset catalog image.
    static var doubleOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .doubleOn)
#else
        .init()
#endif
    }

    /// The "enter game button_off" asset catalog image.
    static var enterGameButtonOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .enterGameButtonOff)
#else
        .init()
#endif
    }

    /// The "enter game button_on" asset catalog image.
    static var enterGameButtonOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .enterGameButtonOn)
#else
        .init()
#endif
    }

    /// The "headshot_gray" asset catalog image.
    static var headshotGray: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .headshotGray)
#else
        .init()
#endif
    }

    /// The "headshot_orange" asset catalog image.
    static var headshotOrange: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .headshotOrange)
#else
        .init()
#endif
    }

    /// The "home_blue" asset catalog image.
    static var homeBlue: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeBlue)
#else
        .init()
#endif
    }

    /// The "home_dice" asset catalog image.
    static var homeDice: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeDice)
#else
        .init()
#endif
    }

    /// The "home_light" asset catalog image.
    static var homeLight: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeLight)
#else
        .init()
#endif
    }

    /// The "home_monster" asset catalog image.
    static var homeMonster: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeMonster)
#else
        .init()
#endif
    }

    /// The "home_orange" asset catalog image.
    static var homeOrange: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeOrange)
#else
        .init()
#endif
    }

    /// The "home_point" asset catalog image.
    static var homePoint: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homePoint)
#else
        .init()
#endif
    }

    /// The "home_point1" asset catalog image.
    static var homePoint1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homePoint1)
#else
        .init()
#endif
    }

    /// The "home_white" asset catalog image.
    static var homeWhite: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homeWhite)
#else
        .init()
#endif
    }

    /// The "homepage_off" asset catalog image.
    static var homepageOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homepageOff)
#else
        .init()
#endif
    }

    /// The "homepage_on" asset catalog image.
    static var homepageOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .homepageOn)
#else
        .init()
#endif
    }

    /// The "leave_off" asset catalog image.
    static var leaveOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .leaveOff)
#else
        .init()
#endif
    }

    /// The "leave_on" asset catalog image.
    static var leaveOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .leaveOn)
#else
        .init()
#endif
    }

    /// The "model " asset catalog image.
    static var model: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .model)
#else
        .init()
#endif
    }

    /// The "play_off" asset catalog image.
    static var playOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .playOff)
#else
        .init()
#endif
    }

    /// The "play_on" asset catalog image.
    static var playOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .playOn)
#else
        .init()
#endif
    }

    /// The "previous page_off" asset catalog image.
    static var previousPageOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .previousPageOff)
#else
        .init()
#endif
    }

    /// The "previous page_on" asset catalog image.
    static var previousPageOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .previousPageOn)
#else
        .init()
#endif
    }

    /// The "single_off" asset catalog image.
    static var singleOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .singleOff)
#else
        .init()
#endif
    }

    /// The "single_on" asset catalog image.
    static var singleOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .singleOn)
#else
        .init()
#endif
    }

    /// The "square_gray" asset catalog image.
    static var squareGray: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .squareGray)
#else
        .init()
#endif
    }

    /// The "square_orange border" asset catalog image.
    static var squareOrangeBorder: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .squareOrangeBorder)
#else
        .init()
#endif
    }

    /// The "square_white" asset catalog image.
    static var squareWhite: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .squareWhite)
#else
        .init()
#endif
    }

    /// The "square_yellow" asset catalog image.
    static var squareYellow: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .squareYellow)
#else
        .init()
#endif
    }

    /// The "start game_off" asset catalog image.
    static var startGameOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .startGameOff)
#else
        .init()
#endif
    }

    /// The "start game_on" asset catalog image.
    static var startGameOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .startGameOn)
#else
        .init()
#endif
    }

    /// The "timer" asset catalog image.
    static var timer: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .timer)
#else
        .init()
#endif
    }

    /// The "volume_off" asset catalog image.
    static var volumeOff: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .volumeOff)
#else
        .init()
#endif
    }

    /// The "volume_on" asset catalog image.
    static var volumeOn: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .volumeOn)
#else
        .init()
#endif
    }

    /// The "white_1" asset catalog image.
    static var white1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white1)
#else
        .init()
#endif
    }

    /// The "white_2" asset catalog image.
    static var white2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white2)
#else
        .init()
#endif
    }

    /// The "white_3" asset catalog image.
    static var white3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white3)
#else
        .init()
#endif
    }

    /// The "white_4" asset catalog image.
    static var white4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white4)
#else
        .init()
#endif
    }

    /// The "white_5" asset catalog image.
    static var white5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white5)
#else
        .init()
#endif
    }

    /// The "white_6" asset catalog image.
    static var white6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .white6)
#else
        .init()
#endif
    }

    /// The "winner" asset catalog image.
    static var winner: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .winner)
#else
        .init()
#endif
    }

    /// The "winnertop" asset catalog image.
    static var winnertop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .winnertop)
#else
        .init()
#endif
    }

    /// The "大順" asset catalog image.
    static var 大順: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .大順)
#else
        .init()
#endif
    }

    /// The "小順" asset catalog image.
    static var 小順: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .小順)
#else
        .init()
#endif
    }

    /// The "瞌睡蟲" asset catalog image.
    static var 瞌睡蟲: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .瞌睡蟲)
#else
        .init()
#endif
    }

    /// The "瞌睡蟲winner" asset catalog image.
    static var 瞌睡蟲winner: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .瞌睡蟲winner)
#else
        .init()
#endif
    }

    /// The "萬事通" asset catalog image.
    static var 萬事通: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .萬事通)
#else
        .init()
#endif
    }

    /// The "萬事通winner" asset catalog image.
    static var 萬事通winner: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .萬事通winner)
#else
        .init()
#endif
    }

    /// The "葫蘆" asset catalog image.
    static var 葫蘆: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .葫蘆)
#else
        .init()
#endif
    }

    /// The "開心鬼" asset catalog image.
    static var 開心鬼: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .開心鬼)
#else
        .init()
#endif
    }

    /// The "開心鬼winner" asset catalog image.
    static var 開心鬼winner: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .開心鬼winner)
#else
        .init()
#endif
    }

    /// The "骰子台" asset catalog image.
    static var 骰子台: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .骰子台)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif