/*
 So every cell has a time window.
 
 When you swipe. It iterates through the array. Checks all fields for validity.
 
 If one is wrong. Stop the game.
 
 What is the gameplay look like? What happens?
 
 Keep track of number of guess swipes.
 
 Haha. Cute idea. Have each app icon be part of a larger picture. You download all of them and on the home page, it displays a scene of some kind. No functionality, it just looks cool.
 */

import UIKit
import AudioKit

class Logic {
    
    weak var delegate : GameDelegate!
    static var shared = Logic()
    var guessDirection : UISwipeGestureRecognizer.Direction!
    var timeRange : ClosedRange<Double>!
    var score = 0
    var highScore = 0
    var guessSubmitted = true
    

    init() {
        timeRange = 0.0...4.0
        loadHighScore()
    }

    
    func setNewNoteToGuess(){
        guessDirection = generateRandomSwipeDirection()
        let noteNumber = directionToPitch(guessDirection)
        Sound.shared.setGuessTrackWithNextGuess(noteNumber: noteNumber)
    }
    
    private func generateRandomSwipeDirection() -> UISwipeGestureRecognizer.Direction {
        let randomInt = Int.random(in: 0...3)
        
        switch randomInt {
        case 0:
            return UISwipeGestureRecognizer.Direction.up
        case 1:
            return UISwipeGestureRecognizer.Direction.left
        case 2:
            return UISwipeGestureRecognizer.Direction.right
        case 3:
            return UISwipeGestureRecognizer.Direction.down
        default:
            return UISwipeGestureRecognizer.Direction.up
        }
    }
    
    private func directionToPitch(_ direction: UISwipeGestureRecognizer.Direction) -> MIDINoteNumber {
        switch direction {
        case .up:
            return SoundDirection.up.rawValue
        case .left:
            return SoundDirection.left.rawValue
        case .right:
            return SoundDirection.right.rawValue
        case .down:
            return SoundDirection.down.rawValue
        default:
            return SoundDirection.up.rawValue
        }
    }
    
    func checkSwipe(direction: UISwipeGestureRecognizer.Direction, time: Double)-> Bool{
        
        if direction == guessDirection {
            if timeRange.contains(time) {
                incrementScore()
                guessSubmitted = true
                return true
            } else if time < timeRange.lowerBound {
                return false
            } else if time > timeRange.upperBound {
                return false
            }
        } else {
            return false
        }
        return true
    }
    
    func incrementScore(){
        score += 1
        if score > highScore {
            setHighScore()
        }
    }
    
    func setHighScore(){
        highScore = score
        UserDefaults.standard.set(highScore, forKey: "highScore")
    }
    
    func loadHighScore(){
        //load data
        if UserDefaults.standard.object(forKey: "highScore") != nil {
            highScore = UserDefaults.standard.object(forKey: "highScore") as! Int
        }
    }
    
    func checkSwipeForGame(_ swipe: UISwipeGestureRecognizer.Direction){
        let sequencerTime = Sound.shared.sequencer.currentRelativePosition.beats
        if Logic.shared.checkSwipe(direction: swipe, time: sequencerTime) {
            delegate.scorePoint()
        } else {
            delegate.gameOver()
        }
    }
    
    func sequencerBeatDelegator(_ position: Double){
        
        delegate.UIActionOnSequencerPosition(position)

        if Sound.shared.sequencer.tempo > 100 {
            let rounded = (position*10).rounded()/10

            if rounded.truncatingRemainder(dividingBy: 1) == 0 {
                Haptics.shared.vibrate()
            }
        } else {
            Haptics.shared.vibrate()
        }
        
        if (0.0...0.1).contains(position) {
            if Logic.shared.guessSubmitted == false && score != 0 {
                delegate.gameOver()
            }
            Logic.shared.guessSubmitted = false
            delegate.changeGuessColor()
        }
        
        if (1.5...2.0).contains(position) && !Logic.shared.guessSubmitted {
            
        }
        
    }
    
    func directionToColor(direction: UISwipeGestureRecognizer.Direction) -> UIColor {
        switch direction {
        case .up:
            return .yellow
        case .left:
            return .red
        case .right:
            return .green
        case .down:
            return .purple
        default:
            return .black
        }
    }
    
    func startGame(){
        Logic.shared.score = 0
        setNewNoteToGuess()
        Sound.shared.playSequencer()
    }
    
    func endGame(){
        Sound.shared.stopSequencer()
        Sound.shared.playGameOverSound()
        
        if Logic.shared.score > Logic.shared.highScore {
            Logic.shared.setHighScore()
        }
    }
    
}
