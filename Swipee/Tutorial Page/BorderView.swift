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
    
    
    init(frame: CGRect, direction: UISwipeGestureRecognizer.Direction) {
        super.init(frame: frame)
        setColorBasedOnDirection(direction)
        self.direction = direction
        
//        scaleTo(scaleTo: 0.0, time: 0.0)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = borderWidth/4
        

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
    
    func setViewToBorder(){
        
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
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.superview?.layoutIfNeeded()
        }, completion: nil)
    }
    
    func springIn(){
        scaleTo(scaleTo: 1.0, time: 1.0, isSpringy: true, delay: 1.0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
