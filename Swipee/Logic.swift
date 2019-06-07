import UIKit
import AudioKit

class Logic {
    
    weak var delegate : GameDelegate!
    static var shared = Logic()
    var guessDirection : UISwipeGestureRecognizer.Direction!
    var timeRange : ClosedRange<Double>!
    var score = 0
    var highScore = 0
    var scoreCountdown = 100
    var guessSubmitted = true
    
    enum GameState {
        case Playing
        case GameOver
    }
    
    var gameState = GameState.Playing

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
                let score = calculateScoreBasedOnTime(time)
                incrementScore(score)
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
    
    func calculateScoreBasedOnTime(_ time: Double) -> Int{
        
        let sequenceLength = 2.0
        let incrementAmount = sequenceLength-time
        let number = Int(incrementAmount*10)
        
        return number
    }
    
    func incrementScore(_ amount: Int){
        score += amount
        
        if score > highScore {
            setHighScore()
        }
    }
    
    func setHighScore(){
        highScore = score
        UserDefaults.standard.set(highScore, forKey: "highScore")
    }
    
    func loadHighScore(){
        if UserDefaults.standard.object(forKey: "highScore") != nil {
            highScore = UserDefaults.standard.object(forKey: "highScore") as! Int
        }
    }
    
    func checkSwipeForGame(_ swipe: UISwipeGestureRecognizer.Direction){
        let sequencerTime = Sound.shared.sequencer.currentRelativePosition.beats
        if Logic.shared.checkSwipe(direction: swipe, time: sequencerTime) {
            delegate.scorePoint()
            delegate.flingSquare(swipe)
            Sound.shared.playSwipeSound(swipe)

        } else {
            delegate.gameOver()
        }
    }
    
    func sequencerBeatDelegator(_ position: Double){
        
        if gameState == .Playing {
            delegate.UIActionOnSequencerPosition(position)
            handleVibrate(position)
            
            if (0.0...0.1).contains(position) {
                if Logic.shared.guessSubmitted == false && score != 0 {
                    delegate.gameOver()
                } else {
                    Logic.shared.guessSubmitted = false
                    delegate.changeGuessColor()
                }
            }
        }
    }
    
    func handleVibrate(_ position: Double){
        if Sound.shared.sequencer.tempo > 100 {
            let rounded = (position*10).rounded()/10
            // half time for vibrate
            if rounded.truncatingRemainder(dividingBy: 1) == 0 {
                Haptics.shared.vibrate()
            }
        } else {
            Haptics.shared.vibrate()
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
        gameState = .Playing
        Logic.shared.score = 0
        setNewNoteToGuess()
        Sound.shared.playSequencer()
    }
    
    func endGame(){
        gameState = .GameOver
        Sound.shared.stopSequencer()
        Sound.shared.playGameOverSound()
        
        if Logic.shared.score > Logic.shared.highScore {
            Logic.shared.setHighScore()
        }
    }
    
}
