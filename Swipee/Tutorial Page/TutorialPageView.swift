import UIKit

class TutorialPageView: UIView {
    
    
    var topView : BorderView!
    var leftView : BorderView!
    var rightView : BorderView!
    var bottomView : BorderView!
    
    var arrow : ImageViewClass!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.0)
        setupViews()
        
    }
    
    func setupViews(){
        
        topView = BorderView(frame: .zero, direction: .up)
        leftView = BorderView(frame: .zero, direction: .left)
        rightView = BorderView(frame: .zero, direction: .right)
        bottomView = BorderView(frame: .zero, direction: .down)
        
        addSubview(rightView)
        addSubview(leftView)
        addSubview(bottomView)
        addSubview(topView)
        
        setupArrow()
        setBorderViewsInCenter()

    }
    
    func setupArrow(){
        arrow = ImageViewClass(frame: .zero, "upArrow")
        addSubview(arrow)
    }
    
    func setBorderViewsInCenter(){
        for view in subviews {
            if view is BorderView {
                let v = view as! BorderView
                v.setViewInCenter()
            }
        }
    }
    
    func moveViewToCorrectPosition(_ direction: UISwipeGestureRecognizer.Direction){
        
        switch direction {
        case .up:
            topView.setViewToBorder()
        case .left:
            leftView.setViewToBorder()
        case .right:
            rightView.setViewToBorder()
        case .down:
            bottomView.setViewToBorder()
        default:
            break
        }
    }
    
    func handleSwipe(_ direction: UISwipeGestureRecognizer.Direction){
            moveViewToCorrectPosition(direction)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
