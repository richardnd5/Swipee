import UIKit

class PositionView: UIView {
    
    var sequencerPosition : Double!
    
    init(frame: CGRect, sequencerPosition: Double) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        self.sequencerPosition = sequencerPosition
    }
    
    func setCircleBorder(){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: superview!.frame.height).isActive = true
        widthAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: 1).isActive = true
        layer.cornerRadius = frame.height/2
    }
    
    override func layoutSubviews() {
        

        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
