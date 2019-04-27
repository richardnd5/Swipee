import UIKit

class PositionStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        alpha = 0.0
    }
    
    func setupViews(){
        
        axis = .horizontal
        distribution = .equalSpacing
        
        for i in 0..<8 {
            let view = PositionView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), sequencerPosition: Double(i)/2)
            addArrangedSubview(view)
        }
    }
    
    func animateViewEntrance(){
        
        for view in arrangedSubviews {
            let v = view as! PositionView
            v.scaleTo(scaleTo: 1.0, time: 1.0)
            v.setCircleBorder()
            
        }
    }
    
    func setupPositionCircleConstraints(){
        for view in arrangedSubviews {
            let v = view as! PositionView
            v.scaleTo(scaleTo: 0.0, time: 0.0)
        }
    }
    
    func fadeIn(){
        fadeTo(opacity: 1.0, time: 1.0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
