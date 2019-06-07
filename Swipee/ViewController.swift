import UIKit

protocol CallbackDelegate : class {
    func accompTrackNoteOnCallback(_ sequencerPosition: Double)
}

protocol GameDelegate : class {
    func UIActionOnSequencerPosition(_ sequencerPosition: Double)
    func scorePoint()
    func gameOver()
    func changeGuessColor()
    func loadPlayPage()
    func flingSquare(_ direction: UISwipeGestureRecognizer.Direction)
}

class ViewController: UIViewController, CallbackDelegate, GameDelegate {

    var playPage : PlayPageView!
    var openingPage : OpeningPageView!
    var tutorialPage : TutorialPageView!
    
    var gameState = AppState.opening

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
        loadOpeningPage()
        setupSwipeGestures()
        Sound.shared.delegate = self
        Logic.shared.delegate = self

    }
    
    func loadOpeningPage(){
        openingPage = OpeningPageView()
        view.addSubview(openingPage)
        openingPage.fillSuperview()
        
        openingPage.playButton.addTarget(self, action: #selector(handlePlayButtonPressed), for: .touchUpInside)
    }
    
    func loadPlayPage(){
        
        gameState = .playing
        playPage = PlayPageView()
        view.addSubview(playPage)
        playPage.fillSuperview()
        
        playPage.restartButton.addTarget(self, action: #selector(handleRestartTap), for: .touchUpInside)
    }
    
    func loadTutorialPage(){
        
        gameState = .tutorial
        tutorialPage = TutorialPageView()
        tutorialPage.delegate = self
        view.addSubview(tutorialPage)
        tutorialPage.fillSuperview()
    }
    
    func setupSwipeGestures(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
    }
    
    func scorePoint(){
        playPage.updateLabels()
        playPage.checkMarkView.addDrawCheckMarkAnimation()
        
        Logic.shared.setNewNoteToGuess()
        Sound.shared.incrementSequencerTempo()
    }
    
    func flingSquare(_ direction: UISwipeGestureRecognizer.Direction) {
        playPage.flingSquare(direction)
    }
    
    func gameOver(){
        playPage.gameOver()
        gameState = .gameOver
    }

    func accompTrackNoteOnCallback(_ sequencerPosition: Double) {
        Logic.shared.sequencerBeatDelegator(sequencerPosition)
    }
    

    // MARK - Dynamic UI Functions
    func changeGuessColor(){
        playPage.changeColorViewToColor(direction: Logic.shared.guessDirection)
    }
    
    func UIActionOnSequencerPosition(_ sequencerPosition: Double){


        let rounded = (sequencerPosition*10).rounded()/10

        if rounded == 0.0 {
            let seqLength = Sound.shared.sequencer.length.beats
            let seqTempo = Sound.shared.sequencer.tempo
            
            if Logic.shared.guessSubmitted {
                playPage.colorView.scaleBackUp()
            } else if !Logic.shared.guessSubmitted && Logic.shared.score == 0{
                playPage.colorView.scaleBackUp()
            }
            
            playPage.colorView.startShrink(seqLength: seqLength, seqTempo: seqTempo)
        }
    }
    
    // MARK - Gestures
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        let direction = sender.direction
        
        switch gameState {
        case .opening:
            return
        case .tutorial:
            tutorialPage.handleSwipe(direction)
        case .playing:
            Logic.shared.checkSwipeForGame(direction)
        case .gameOver:
            return
        }
    }

    @objc func handlePlayButtonPressed(sender: UIButton){
        openingPage.fadeAndRemove(time: 0.6){
            self.loadTutorialPage()
        }
    }
    
    @objc func handleRestartTap(_ sender: UIButton){
        gameState = .playing
        playPage.restartGame()
    }
}
