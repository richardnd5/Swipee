import UIKit

class TutorialPageView: UIView {
    
    weak var delegate : GameDelegate?
    
    var topView : BorderView!
    var leftView : BorderView!
    var rightView : BorderView!
    var bottomView : BorderView!
    var arrow : ArrowView!
    var checkMarkView: CheckMarkView!
    
    var tutorialStep = 0
    var canSwipe = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 0.6){
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
        
        // Set border views in the center of the screen after they have been instatiated.
        for view in subviews {
            if view is BorderView {
                let v = view as! BorderView
                v.setViewInCenter()
            }
        }
        
        checkMarkView.translatesAutoresizingMaskIntoConstraints = false
        checkMarkView.widthAnchor.constraint(equalToConstant: ScreenSize.width/5).isActive = true
        checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor, multiplier: 1).isActive = true
        checkMarkView.topAnchor.constraint(equalTo: topAnchor,constant: 90).isActive = true
        checkMarkView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func stepThroughActions(step: Int, direction: UISwipeGestureRecognizer.Direction = UISwipeGestureRecognizer.Direction.up){
        switch step {
        case 0:
            Sound.shared.playSwipeSound(.up)
            topView.scaleTo(scaleTo: 1.0, time: 0.5, {
                self.topView.showArrow()
                self.tutorialStep += 1
                self.canSwipe = true
            })
        case 1:
            if direction == .up {
                tutorialStep += 1
                checkMarkView.addDrawCheckMarkAnimation()
                topView.shrinkArrowMoveViewToBorder(){
                    
                    Sound.shared.playSwipeSound(.down)
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
                    
                    Sound.shared.playSwipeSound(.left)
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
                    Sound.shared.playSwipeSound(.right)
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
                    self.fadeAndRemove(time: 1.0)
                    self.delegate!.loadPlayPage()
                }
            } else {
                warningWiggle()
                checkMarkView.addDrawXMarkAnimation(totalDuration: 0.7)
            }

        default:
            break
        }
    }
    
    func handleSwipe(_ direction: UISwipeGestureRecognizer.Direction){
        if canSwipe {
            stepThroughActions(step: tutorialStep, direction: direction)
            Sound.shared.playSwipeSound(direction)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
