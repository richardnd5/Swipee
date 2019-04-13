import UIKit



class TeachingPageView: UIView {
    
    var topView = UIView()
    var leftView = UIView()
    var rightView = UIView()
    var bottomView = UIView()
    
    var colorView = ColorViewWithDirection()
    var positionStackView = UIStackView()
    
    var titleView : ColorfulTitleView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        changeColorViewToColor(direction: .up)
        
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.0, {
            Sound.shared.playTitleSequencer()
        })
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
        
        setupTitle()
        
        topView.alpha = 0.0
        leftView.alpha = 0.0
        rightView.alpha = 0.0
        bottomView.alpha = 0.0
        
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
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor,constant: 10).isActive = true
        titleView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -10).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleView.centerYAnchor.constraint(equalTo: safe.centerYAnchor, constant: -30).isActive = true

        fadePageIn()
    }
    
    func setupColorView(){
        addSubview(colorView)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.widthAnchor.constraint(equalToConstant: frame.width/1.5).isActive = true
        colorView.widthAnchor.constraint(equalTo: colorView.heightAnchor, multiplier: 1).isActive = true
        colorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        colorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupTitle(){
        titleView = ColorfulTitleView(frame: .zero, title: "Swipee!")
        addSubview(titleView)
    }
    
    private func setupPositionStackView(){
        positionStackView = UIStackView()
        positionStackView.axis = .horizontal
        positionStackView.distribution = .equalSpacing
        addSubview(positionStackView)
        
        // add subviews
        for i in 0..<8 {
            let view = UIView()
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
            view.tag = i
            positionStackView.addArrangedSubview(view)
        }
        
        positionStackView.translatesAutoresizingMaskIntoConstraints = false
        positionStackView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 40).isActive = true
        positionStackView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10).isActive = true
        positionStackView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -10).isActive = true
        positionStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupPositionCircleConstraints(){
        for view in positionStackView.arrangedSubviews {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: positionStackView.frame.height).isActive = true
            view.widthAnchor.constraint(equalTo: positionStackView.heightAnchor, multiplier: 1).isActive = true
            view.layer.cornerRadius = view.frame.height/2
        }
    }

    func scaleUpAndDownSlotPosition(position: Double){
        let sequencerInt = Int(position.rounded())
        
        for view in positionStackView.arrangedSubviews {
            if view.tag == sequencerInt {
                view.scaleTo(scaleTo: 1.4, time: 0.3, {
                    view.scaleTo(scaleTo: 1.0, time: 0.4)
                })
            }
        }
    }
    
    func changeColorViewToColor(direction: UISwipeGestureRecognizer.Direction){
        let color = Logic.shared.directionToColor(direction: direction)
        colorView.changeBackgroundColorGraduallyTo(color, time: 1.0)
    }
    
    func changeCorrectSlot(direction: UISwipeGestureRecognizer.Direction){
        let color = Logic.shared.directionToColor(direction: direction)
        positionStackView.arrangedSubviews[4].changeBackgroundColorGraduallyTo(color, time: 0.4)
    }
    
    func rotateColorViewArrow(_ direction: UISwipeGestureRecognizer.Direction){
        colorView.rotateArrow(direction)
    }
    
    override func layoutSubviews() {
    }
    
    func fadePageIn(){
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

