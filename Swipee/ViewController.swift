import UIKit

protocol CallbackDelegate : class {
    func accompTrackNoteOnCallback(_ sequencerPosition: Double)
    func accompTrackNoteOffCallback()
}

protocol GameDelegate : class {
    func UIActionOnSequencerPosition(_ sequencerPosition: Double)
    func scorePoint()
    func gameOver()
    func changeGuessColor()
    func loadPlayPage()
}

protocol TitleDelegate : class {
    func animateTitle(_ sequencerPosition: Double)
}

class ViewController: UIViewController, CallbackDelegate, GameDelegate, TitleDelegate {

    var homePage : HomePageView!
    var playPage : PlayPageView!
    var openingPage : OpeningPageView!
    var tutorialPage : TutorialPageView!
    
    enum GameState {
        case opening
        case tutorial
        case playing
        case gameOver
    }
    
    var gameState = GameState.opening

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
//        loadTeachingPage()
        setupSwipeGestures()
        Sound.shared.delegate = self
        Logic.shared.delegate = self
        Sound.shared.titleDelegate = self
        loadPlayPage()
    }
    
    // MARK - UISetup
    func loadTeachingPage(){
        openingPage = OpeningPageView()
        view.addSubview(openingPage)
        openingPage.fillSuperview()
        
        openingPage.playButton.addTarget(self, action: #selector(handlePlayButtonPressed), for: .touchUpInside)
    }
    
    func loadHomePage(){
        
        homePage = HomePageView()
        view.addSubview(homePage)
        homePage.fillSuperview()
        
        homePage.playButton.addTarget(self, action: #selector(handlePlayButtonPressed), for: .touchUpInside)

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
        Logic.shared.setNewNoteToGuess()
        Sound.shared.incrementSequencerTempo()
    }
    
    func gameOver(){
        playPage.gameOver()
        gameState = .gameOver
    }

    func accompTrackNoteOnCallback(_ sequencerPosition: Double) {
        Logic.shared.sequencerBeatDelegator(sequencerPosition)
    }
    
    func accompTrackNoteOffCallback(){
    }
    
    // MARK - Dynamic UI Functions
    func changeGuessColor(){
        playPage.changeColorViewToColor(direction: Logic.shared.guessDirection)
//        playPage.changeCorrectSlot(direction: Logic.shared.guessDirection)
    }
    
    func UIActionOnSequencerPosition(_ sequencerPosition: Double){
        playPage.scaleUpAndDownSlotPosition(position: sequencerPosition)
//        playPage.shrinkColorView(seqPos: sequencerPosition)
        let rounded = (sequencerPosition*10).rounded()/10

        if rounded == 0.0 {
            let seqLength = Sound.shared.sequencer.length.beats
            let seqTempo = Sound.shared.sequencer.tempo
            playPage.startShrinkingView(seqLength: seqLength, seqTempo: seqTempo)
        }
    }
    
    // MARK - Gestures
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        let direction = sender.direction
        Sound.shared.playSwipeSound(direction)
        
        switch gameState {
        case .opening:
            openingPage.handleSwipe(direction)

        case .tutorial:
            tutorialPage.handleSwipe(direction)
        case .playing:
            Logic.shared.checkSwipeForGame(direction)
        case .gameOver:
            return
        }
    }

    @objc func handlePlayButtonPressed(sender: UIButton){
        openingPage.fadeAndRemove(time: 1.0){
            self.loadTutorialPage()
        }
        
    }
    
    @objc func handleRestartTap(_ sender: UIButton){
        gameState = .playing
        playPage.restartGame()
    }
    
    func animateTitle(_ sequencerPosition: Double){
//        print("sequencer position: \(sequencerPosition)")
        let sequencerInt = Int(sequencerPosition.rounded())
        openingPage.titleView.animateTitle(sequencerPosition: sequencerInt)
    }
}
