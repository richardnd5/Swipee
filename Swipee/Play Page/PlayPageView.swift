import UIKit

class PlayPageView: UIView {
    
    var topView = UIView()
    var leftView = UIView()
    var rightView = UIView()
    var bottomView = UIView()
    var restartButton : Button!
    var scoreLabel = UILabel()
    var highScoreLabel = UILabel()
    var colorView = UIView()
    var positionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

        Logic.shared.loadHighScore()
        updateLabels()
    }
    
    func setupViews(){
        
        topView.backgroundColor = .yellow
        leftView.backgroundColor = .red
        rightView.backgroundColor = .green
        bottomView.backgroundColor = .purple
        
        addSubview(topView)
        addSubview(leftView)
        addSubview(rightView)
        addSubview(bottomView)
        addSubview(colorView)
        
        setupScoreLabel()
        setupHighSCoreLabel()
        setupRestartButton()
        setupStackView()
        
        setupViewContraints()
        
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.0, {
            Logic.shared.startGame()
        })
    }
    
    private func setupStackView(){
        positionStackView = UIStackView()
        positionStackView.axis = .horizontal
        positionStackView.distribution = .equalSpacing
        addSubview(positionStackView)
        
        for i in 0..<8 {
            
            let view = PositionView(frame: .zero, sequencerPosition: Double(i)/2)
            positionStackView.addArrangedSubview(view)
        }
    }

    private func setupScoreLabel(){
        scoreLabel.text = "Score: \(Logic.shared.score)"
        scoreLabel.sizeToFit()
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont(name: "Avenir Light", size: 16)
        addSubview(scoreLabel)
    }
    
    private func setupHighSCoreLabel(){
        highScoreLabel.text = "High Score: \(Logic.shared.highScore)"
        highScoreLabel.sizeToFit()
        highScoreLabel.textAlignment = .center
        highScoreLabel.font = UIFont(name: "Avenir Light", size: 12)
        addSubview(highScoreLabel)
    }
    
    private func setupRestartButton(){
        restartButton = Button(frame: .zero, name: "restartButton")
        addSubview(restartButton)
        restartButton.alpha = 0.0
        
    }
    
    private func setupRestartButtonContraints(){
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40).isActive = true
        restartButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: frame.width/4).isActive = true
        restartButton.widthAnchor.constraint(equalTo: restartButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupPositionCircleConstraints(){
        for view in positionStackView.arrangedSubviews {
            let v = view as! PositionView
            v.setCircleBorder()
            
        }
    }
    
    private func setupViewContraints(){
        let safe = safeAreaLayoutGuide
        let viewSize : CGFloat = 10

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: viewSize).isActive = true
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: viewSize).isActive = true
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        leftView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        leftView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: viewSize).isActive = true
        
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: viewSize).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        highScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        positionStackView.translatesAutoresizingMaskIntoConstraints = false
        positionStackView.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 10).isActive = true
        positionStackView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10).isActive = true
        positionStackView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -10).isActive = true
        positionStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: positionStackView.bottomAnchor, constant: 20).isActive = true
        colorView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 20).isActive = true
        colorView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -20).isActive = true
        colorView.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: -80).isActive = true
        
    }
 
    func gameOver(){
        
        Logic.shared.endGame()

        let animationTime = 1.5
        
        restartButton.fadeIn(animationTime)
        scoreLabel.scaleTo(scaleTo: 2.0, time: animationTime)
        
        let endingPosition = CGPoint(x: scoreLabel.frame.origin.x, y: scoreLabel.frame.origin.y-50)
        scoreLabel.moveViewTo(endingPosition, time: animationTime)
        
        updateLabels()
    }
    
    func restartGame(){
        
        Logic.shared.startGame()
        
        let animationTime = 0.7
        
        restartButton.fadeOut()
        scoreLabel.scaleTo(scaleTo: 1.0, time: animationTime)
        
        let startingPosition = CGPoint(x: scoreLabel.frame.origin.x, y: scoreLabel.frame.origin.y+50)
        scoreLabel.moveViewTo(startingPosition, time: animationTime)
        
        updateLabels()
    }
    
    func updateLabels(){
        scoreLabel.text = "Score: \(Logic.shared.score)"
        highScoreLabel.text = "High Score: \(Logic.shared.highScore)"
    }
    
    func scaleUpAndDownSlotPosition(position: Double){

        let rounded = (position*10).rounded()/10
        

        for view in positionStackView.arrangedSubviews {
            let v = view as! PositionView
            if v.sequencerPosition == rounded {
                view.scaleTo(scaleTo: 1.4, time: 0.1, {
                    view.scaleTo(scaleTo: 1.0, time: 0.2)
                })
            }
        }
    }
    
    func changeColorViewToColor(direction: UISwipeGestureRecognizer.Direction){
        colorView.backgroundColor = Logic.shared.directionToColor(direction: direction)
    }
    
    func changeCorrectSlot(direction: UISwipeGestureRecognizer.Direction){
        let color = Logic.shared.directionToColor(direction: direction)
        positionStackView.arrangedSubviews[4].changeBackgroundColorGraduallyTo(color, time: 0.4)
    }
    
    override func layoutSubviews() {
        setupRestartButtonContraints()
        setupPositionCircleConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
