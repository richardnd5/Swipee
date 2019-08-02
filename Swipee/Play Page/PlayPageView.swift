import UIKit

class PlayPageView: UIView {
    
    var topView = UIView()
    var leftView = UIView()
    var rightView = UIView()
    var bottomView = UIView()
    var restartButton : Button!
    var scoreLabel = UILabel()
    var highScoreLabel = UILabel()
    
    var borderWidth : CGFloat = 20
    
    var colorView : ColorView!
    
    var checkMarkView: CheckMarkView!

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
        
        topView.layer.cornerRadius = borderWidth/4
        leftView.layer.cornerRadius = borderWidth/4
        rightView.layer.cornerRadius = borderWidth/4
        bottomView.layer.cornerRadius = borderWidth/4
        
        addSubview(topView)
        addSubview(leftView)
        addSubview(rightView)
        addSubview(bottomView)
        
        setupColorView()


        
        setupScoreLabel()
        setupHighSCoreLabel()
        setupRestartButton()
        setupViewContraints()
        
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.0, {
            Logic.shared.startGame()
        })
    }
    
    func setupColorView(){
        colorView = ColorView(frame: .zero, color: .clear)
        addSubview(colorView)
        colorView.isUserInteractionEnabled = false
        colorView.setupContraints()

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
        restartButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        restartButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: frame.width/4).isActive = true
        restartButton.widthAnchor.constraint(equalTo: restartButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setupViewContraints(){
        let safe = safeAreaLayoutGuide
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: safe.leadingAnchor,constant: borderWidth).isActive = true
        topView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -borderWidth).isActive = true
        topView.heightAnchor.constraint(equalToConstant: borderWidth).isActive = true
        
        
        leftView.topAnchor.constraint(equalTo: safe.topAnchor, constant: borderWidth).isActive = true
        leftView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: borderWidth).isActive = true
        leftView.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -borderWidth).isActive = true
        
        rightView.topAnchor.constraint(equalTo: safe.topAnchor, constant: borderWidth).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: borderWidth).isActive = true
        rightView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -borderWidth).isActive = true
        
        bottomView.heightAnchor.constraint(equalToConstant: borderWidth).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: borderWidth).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -borderWidth).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        highScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 30).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        colorView.setupContraints()

        checkMarkView = CheckMarkView()
        
        addSubview(checkMarkView)
        
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        checkMarkView.widthAnchor.constraint(equalToConstant: ScreenSize.width/8).isActive = true
        checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor, multiplier: 1).isActive = true

        checkMarkView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40).isActive = true
        checkMarkView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func gameOver(){
        
        Logic.shared.endGame()
        
        checkMarkView.addDrawXMarkAnimation()
        
        let animationTime = 1.5
        
        restartButton.fadeIn(animationTime)
        scoreLabel.scaleTo(scaleTo: 2.0, time: animationTime)

        colorView.fadeTo(opacity: 0.0, time: animationTime){
            self.colorView.backgroundColor = .clear
        }
        
        updateLabels()
    }
    
    func restartGame(){
        
        
        colorView.fadeTo(opacity: 1.0, time: 0.0)
        let animationTime = 0.7
        self.scoreLabel.scaleTo(scaleTo: 1.0, time: animationTime)

        self.restartButton.fadeOut(){
            self.colorView.scaleBackUp(){
                Logic.shared.startGame()
                self.updateLabels()
            }
        }
    }
    
    func updateLabels(){
        scoreLabel.text = "Score: \(Logic.shared.score)"
        highScoreLabel.text = "High Score: \(Logic.shared.highScore)"
    }
    
//    func flingSquare(_ direction: UISwipeGestureRecognizer.Direction){
//        colorView.flingToDirection(direction) {
//
//            self.colorView.removeFromSuperview()
//            self.setupColorView()
//            self.colorView.setupContraints()
//
//        }
//    }
    
    func changeColorViewToColor(direction: UISwipeGestureRecognizer.Direction){
        colorView.backgroundColor = Logic.shared.directionToColor(direction: direction)
    }

    func setScaleBackUp(){
        colorView.scaleBackUp()
    }
    
    override func layoutSubviews() {
        setupRestartButtonContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
