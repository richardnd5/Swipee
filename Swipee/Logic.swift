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

enum ColorCellDirection {
    case up
    case down
    case left
    case right
    case none
}

struct ColorCell {
    var direction: ColorCellDirection!
    var position : Int!
    var color: UIColor!
    var sequencerTimeWindow : ClosedRange<Double>!
    
    var timeBuffer : Double = 0.35
    
    var rangeBeforeBeat : Range<Double>!
    var rangeAfterBeat : ClosedRange<Double>!
    
    init(direction: ColorCellDirection, position: Int){
        self.position = position
        self.direction = direction
        color = directionToColor(direction)
        calculateTimeWindow(position)
        
    }
    
    mutating func calculateTimeWindow(_ position: Int){
        
        let sequencerPosition = Double(position)/2
        
        var lowerBoundBeforeBeat = Double()
        var upperBoundBeforeBeat = Double()
        
        var lowerBoundAfterBeat = Double()
        var upperBoundAfterBeat = Double()
        
        
        if sequencerPosition == 0 {
            
            lowerBoundBeforeBeat = 4-timeBuffer
            upperBoundBeforeBeat = 4
            
            lowerBoundAfterBeat = sequencerPosition
            upperBoundAfterBeat = sequencerPosition+timeBuffer
            
        } else {
            
            lowerBoundBeforeBeat = sequencerPosition-timeBuffer
            upperBoundBeforeBeat = sequencerPosition
            
            lowerBoundAfterBeat = sequencerPosition
            upperBoundAfterBeat = sequencerPosition+timeBuffer
        }
        
        rangeBeforeBeat = lowerBoundBeforeBeat..<upperBoundBeforeBeat
        rangeAfterBeat = lowerBoundAfterBeat...upperBoundAfterBeat

        
    }
    
    func directionToColor(_ direction: ColorCellDirection) -> UIColor {
        switch direction {
        case ColorCellDirection.up:
            return .yellow
        case ColorCellDirection.left:
            return .red
        case ColorCellDirection.right:
            return .green
        case ColorCellDirection.down:
            return .purple
        case ColorCellDirection.none:
            return .clear
        }
    }
}

class Logic {
    
    weak var delegate : GameDelegate!
    static var shared = Logic()
    var guessDirection : UISwipeGestureRecognizer.Direction!
    var timeRange : ClosedRange<Double>!
    var score = 0
    var highScore = 0
    var guessSubmitted = false
    
    
    var arrayOfDirections : Array<UISwipeGestureRecognizer.Direction>!
    var arrayOfCells = [ColorCell]()

    init() {
        timeRange = 1.5...3.1
        loadHighScore()
        fillArrayOfDirections()
    }
    
    func fillArrayOfDirections(){
        
        
        for i in 0...8 {
            let rand = Int.random(in: 0...4)
            switch rand {
            case 0:
                arrayOfCells.append(ColorCell(direction: ColorCellDirection.up, position: i))
            case 1:
                arrayOfCells.append(ColorCell(direction: ColorCellDirection.down, position: i))
            case 2:
                arrayOfCells.append(ColorCell(direction: ColorCellDirection.left, position: i))
            case 3:
                arrayOfCells.append(ColorCell(direction: ColorCellDirection.right, position: i))
            default:
                arrayOfCells.append(ColorCell(direction: ColorCellDirection.none, position: i))
                
            }
            print(arrayOfCells)
            for cell in arrayOfCells {
                print(cell.rangeBeforeBeat, cell.rangeAfterBeat)
            }
        }
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
        print(position)

        if Sound.shared.sequencer.tempo > 100 {
            let rounded = (position*10).rounded()/10

            if rounded.truncatingRemainder(dividingBy: 1) == 0 {
                Haptics.shared.vibrate()
            }
        } else {
            Haptics.shared.vibrate()
        }
        
        if (0.0...1.0).contains(position) {
            Logic.shared.guessSubmitted = false
            delegate.changeGuessColor()
        }
        
        if (3.0...4.0).contains(position) && !Logic.shared.guessSubmitted {
            delegate.gameOver()
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
