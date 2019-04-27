import UIKit



class PositionView: UIView {
    
    var sequencerPosition : Double!
    
    var direction : UISwipeGestureRecognizer.Direction!
    var color : UIColor!
    
    init(frame: CGRect, sequencerPosition: Double) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        self.sequencerPosition = sequencerPosition
    }
    
    func setCircleBorder(){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height/2
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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
