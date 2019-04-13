import UIKit

protocol CallbackDelegate : class {
    func accompTrackNoteOnCallback(_ sequencerPosition: Double)
    func accompTrackNoteOffCallback()
    func shrinkColorView()
}

protocol GameDelegate : class {
    func UIActionOnSequencerPosition(_ sequencerPosition: Double)
    func scorePoint()
    func gameOver()
    func changeGuessColor()
    
}

protocol TitleDelegate : class {
    func animateTitle(_ sequencerPosition: Double)
}

class ViewController: UIViewController, CallbackDelegate, GameDelegate, TitleDelegate {
    
    var homePage : HomePageView!
    var playPage : PlayPageView!
    var teachingPage : TeachingPageView!
    
    enum GameState {
        case opening
        case teaching
        case playing
        case gameOver
    }
    
    var gameState = GameState.teaching

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
        loadTeachingPage()
        setupSwipeGestures()
        Sound.shared.delegate = self
        Logic.shared.delegate = self
        Sound.shared.titleDelegate = self
    }
    
    // MARK - UISetup
    func loadTeachingPage(){
        teachingPage = TeachingPageView()
        view.addSubview(teachingPage)
        teachingPage.fillSuperview()
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
        shrinkColorView()
    }
    
    // MARK - Dynamic UI Functions
    func expandColorView(){
        self.playPage.colorView.scaleTo(scaleTo: 1.05, time: 0.3)
    }
    
    func shrinkColorView() {
        self.playPage.colorView.scaleTo(scaleTo: 1.0, time: 0.4)
    }
    
    func changeGuessColor(){
        playPage.changeColorViewToColor(direction: Logic.shared.guessDirection)
        playPage.changeCorrectSlot(direction: Logic.shared.guessDirection)
    }
    
    func UIActionOnSequencerPosition(_ sequencerPosition: Double){
        playPage.scaleUpAndDownSlotPosition(position: sequencerPosition)
        expandColorView()
    }
    
    // MARK - Gestures
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        let direction = sender.direction
        Sound.shared.playSwipeSound(direction)
        
        switch gameState {
        case .opening:
            return
        case .teaching:
//            teachingPage.changeColorViewToColor(direction: direction)
            teachingPage.fadeAndRemove(time: 1.5, completion: {
                self.loadPlayPage()
            })
        case .playing:
            Logic.shared.checkSwipeForGame(direction)
        case .gameOver:
            return
        }
    }

    @objc func handlePlayButtonPressed(sender: UIButton){
        homePage.fadeAndRemove(time: 1.0)
        loadPlayPage()
    }
    
    @objc func handleRestartTap(_ sender: UIButton){
        gameState = .playing
        playPage.restartGame()
    }
    
    func animateTitle(_ sequencerPosition: Double){
//        print("sequencer position: \(sequencerPosition)")
        let sequencerInt = Int(sequencerPosition.rounded())
        teachingPage.titleView.animateTitle(sequencerPosition: sequencerInt)
    }
}
