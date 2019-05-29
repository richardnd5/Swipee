import UIKit

class BorderView: UIView {
    
    var top : NSLayoutConstraint!
    var leading : NSLayoutConstraint!
    var trailing : NSLayoutConstraint!
    var bottom : NSLayoutConstraint!
    var height : NSLayoutConstraint!
    var width : NSLayoutConstraint!
    var centerX : NSLayoutConstraint!
    var centerY : NSLayoutConstraint!
    
    var direction : UISwipeGestureRecognizer.Direction!
    
    var borderWidth : CGFloat = 20
    
    var arrow : ArrowView!
    
    var arrowTop : NSLayoutConstraint!
    var arrowLeading : NSLayoutConstraint!
    var arrowTrailing : NSLayoutConstraint!
    var arrowBottom : NSLayoutConstraint!
    var arrowWidth: NSLayoutConstraint!
    var arrowHeight : NSLayoutConstraint!
    
    
    init(frame: CGRect, direction: UISwipeGestureRecognizer.Direction) {
        super.init(frame: frame)
        setColorBasedOnDirection(direction)
        self.direction = direction
        
        scaleTo(scaleTo: 0.0, time:  0.0)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = borderWidth/4
        
        setupArrow()
        
    }
    
    func setupArrow(){
        
        let arrowImageName = getArrowString(from: direction)
        arrow = ArrowView(frame: .zero, arrowImageName)
        addSubview(arrow)
        arrow.scaleTo(scaleTo: 0.0, time: 0.0)
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        arrow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        arrow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
    }
    
    func getArrowString(from direction: UISwipeGestureRecognizer.Direction) -> String {
        switch direction {
        case .up:
            return "upArrow"
        case .left:
            return "leftArrow"
        case .right:
            return "rightArrow"
        case .down:
            return "downArrow"
        default:
            return "upArrow"
        }
    }
    
    func showArrow(){
        arrow.scaleTo(scaleTo: 1.0, time: 1.0)
    }
    
    func hideArrow(){
        arrow.scaleTo(scaleTo: 0.0, time: 1.0)
    }
    
    func setColorBasedOnDirection(_ direction: UISwipeGestureRecognizer.Direction){
        
        switch direction {
        case .up:
            backgroundColor = .yellow
        case .left:
            backgroundColor = .red
        case .right:
            backgroundColor = .green
        case .down:
            backgroundColor = .purple
        default:
            break
        }
    }
    
    func setViewInCenter(){
        centerX = centerXAnchor.constraint(equalTo: superview!.centerXAnchor)
        centerY = centerYAnchor.constraint(equalTo: superview!.centerYAnchor)
        width = widthAnchor.constraint(equalToConstant: ScreenSize.width/3)
        height = widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        height.isActive = true
    }
    
    func setArrowLayout(){
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        arrowTop  = topAnchor.constraint(equalTo: topAnchor, constant: 30)
        arrowLeading = leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        arrowTrailing = trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        arrowBottom = bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        arrowWidth = widthAnchor.constraint(equalToConstant: 0)
        arrowHeight = heightAnchor.constraint(equalToConstant: 0)
        
        arrowTop.isActive = true
        arrowLeading.isActive = true
        arrowTrailing.isActive = true
        arrowBottom.isActive = true
        
        arrowWidth.isActive = false
        arrowHeight.isActive = false
        
    }
    
    func shrinkArrowMoveViewToBorder(_ completion: @escaping () -> () = {}){
        arrow.shrinkAndRemove(time: 0.3){
            self.setViewToBorder(){
                completion()
            }
        }
    }
    
    func setViewToBorder(_ completion: @escaping () -> () = {}){
        
        let dir = direction!
        let safe = superview!.safeAreaLayoutGuide
        
        switch dir {
        case .up:
            top = topAnchor.constraint(equalTo: safe.topAnchor)
            leading = leadingAnchor.constraint(equalTo: safe.leadingAnchor,constant: borderWidth)
            trailing = trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -borderWidth)
            bottom = heightAnchor.constraint(equalToConstant: borderWidth)
        case .left:
            top = topAnchor.constraint(equalTo: safe.topAnchor, constant: borderWidth)
            leading = leadingAnchor.constraint(equalTo: safe.leadingAnchor)
            trailing = widthAnchor.constraint(equalToConstant: borderWidth)
            bottom = bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -borderWidth)
        case .right:
            top = topAnchor.constraint(equalTo: safe.topAnchor, constant: borderWidth)
            leading = widthAnchor.constraint(equalToConstant: borderWidth)
            trailing = trailingAnchor.constraint(equalTo: safe.trailingAnchor)
            bottom = bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -borderWidth)
        case .down:
            top = heightAnchor.constraint(equalToConstant: borderWidth)
            leading = leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: borderWidth)
            trailing = trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -borderWidth)
            bottom = bottomAnchor.constraint(equalTo: safe.bottomAnchor)
        default:
            break
        }
        
        centerX.isActive = false
        centerY.isActive = false
        width.isActive = false
        height.isActive = false
        
        top.isActive = true
        leading.isActive = true
        trailing.isActive = true
        bottom.isActive = true
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseInOut, animations: {
            self.superview?.layoutIfNeeded()
        }, completion: {_ in
            completion()
        }
        )
    }
    
    func springIn(){
        scaleTo(scaleTo: 1.0, time: 1.0, isSpringy: true, delay: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
