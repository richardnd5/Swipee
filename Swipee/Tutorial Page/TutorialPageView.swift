import UIKit

class TutorialPageView: UIView {
    
    
    var topView : BorderView!
    var leftView : BorderView!
    var rightView : BorderView!
    var bottomView : BorderView!
    var arrow : ArrowView!
    var positionStackView : PositionStackView!
    
    var checkMarkView: CheckMarkView!
    
    var tutorialStep = 0
    
    weak var delegate : GameDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alpha = 0.0
        
        setupViews()
        fadeTo(opacity: 1.0, time: 1.5){
            self.stepThroughActions(step: self.tutorialStep)
        }
        
    }
    
    func setupViews(){
        
        topView = BorderView(frame: .zero, direction: .up)
        leftView = BorderView(frame: .zero, direction: .left)
        rightView = BorderView(frame: .zero, direction: .right)
        bottomView = BorderView(frame: .zero, direction: .down)
        checkMarkView = CheckMarkView()
        
        addSubview(rightView)
        addSubview(leftView)
        addSubview(bottomView)
        addSubview(topView)
        addSubview(checkMarkView)
        
        setupStackView()
        setBorderViewsInCenter()
        

        
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        checkMarkView.widthAnchor.constraint(equalToConstant: ScreenSize.width/4).isActive = true
        checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor, multiplier: 1).isActive = true
        checkMarkView.topAnchor.constraint(equalTo: positionStackView.bottomAnchor,constant: 30).isActive = true
        checkMarkView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func setupStackView(){
        positionStackView = PositionStackView()
        addSubview(positionStackView)
        
        let safe = safeAreaLayoutGuide

        
        positionStackView.translatesAutoresizingMaskIntoConstraints = false
        positionStackView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 40).isActive = true
        positionStackView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 40).isActive = true
        positionStackView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -40).isActive = true
        positionStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        positionStackView.setupViews()
        positionStackView.setupPositionCircleConstraints()

    }
    
    func setBorderViewsInCenter(){
        for view in subviews {
            if view is BorderView {
                let v = view as! BorderView
                v.setViewInCenter()
            }
        }
    }
    
    func stepThroughActions(step: Int, direction: UISwipeGestureRecognizer.Direction = UISwipeGestureRecognizer.Direction.up){
        switch step {
        case 0:
            topView.scaleTo(scaleTo: 1.0, time: 0.5, {
                self.topView.showArrow()
                self.tutorialStep += 1
            })
        case 1:
            if direction == .up {
                tutorialStep += 1
                checkMarkView.addDrawCheckMarkAnimation()
                topView.shrinkArrowMoveViewToBorder(){
                    self.bottomView.scaleTo(scaleTo: 1.0, time: 0.5, {
                        self.bottomView.showArrow()
                    })
                }
            } else {
                warningWiggle()
                checkMarkView.addDrawXMarkAnimation(totalDuration: 0.7)
            }
        case 2:
            if direction == .down {
                tutorialStep += 1
                checkMarkView.addDrawCheckMarkAnimation()
                bottomView.shrinkArrowMoveViewToBorder(){
                    self.leftView.scaleTo(scaleTo: 1.0, time: 0.5,{
                        self.leftView.showArrow()
                    })
                }
            } else {
                warningWiggle()
                checkMarkView.addDrawXMarkAnimation(totalDuration: 0.7)
            }
        case 3:
            if direction == .left {
                tutorialStep += 1
                checkMarkView.addDrawCheckMarkAnimation()
                leftView.shrinkArrowMoveViewToBorder(){
                    self.rightView.scaleTo(scaleTo: 1.0, time: 0.5, {
                        self.rightView.showArrow()
                    })
                }
            } else {
                warningWiggle()
                checkMarkView.addDrawXMarkAnimation(totalDuration: 0.7)
            }
            
        case 4:
            if direction == .right {
                tutorialStep += 1
                checkMarkView.addDrawCheckMarkAnimation { _ in
                }
                    rightView.shrinkArrowMoveViewToBorder(){
//                    self.positionStackView.animateViewEntrance()
                    self.fadeAndRemove(time: 1.0)
                }
            } else {
                warningWiggle()
                checkMarkView.addDrawXMarkAnimation(totalDuration: 0.7)
            }
            delegate!.loadPlayPage()

        default:
            break
        }
    }
    
    func handleSwipe(_ direction: UISwipeGestureRecognizer.Direction){
        stepThroughActions(step: tutorialStep, direction: direction)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
