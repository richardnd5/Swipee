import Foundation
import UIKit

class Haptics {
    
    private var generator = UIImpactFeedbackGenerator()
    static var shared = Haptics()
    
    init() {
        generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
    }
    
    func vibrate(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy){
        generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        generator.prepare()
    }
}
