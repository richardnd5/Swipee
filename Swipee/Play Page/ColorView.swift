import UIKit

class ColorView: UIView {
    
    var width : NSLayoutConstraint!
    var height : NSLayoutConstraint!
    var centerX : NSLayoutConstraint!
    var centerY : NSLayoutConstraint!
    
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        backgroundColor = color
        layer.zPosition = 100
    }
    
    func setupContraints(){
        translatesAutoresizingMaskIntoConstraints = false

        centerX = centerXAnchor.constraint(equalTo: superview!.centerXAnchor)
        centerY = centerYAnchor.constraint(equalTo: superview!.centerYAnchor)
        width = widthAnchor.constraint(equalToConstant: ScreenSize.width/1.5)
        height = heightAnchor.constraint(equalToConstant: ScreenSize.width/1.5)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        height.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startShrink(seqLength: Double, seqTempo: Double, _ completion: @escaping () -> () = {}){
        let timePerSecond = 60/seqTempo
        let timeMultipliedBySeqLength = timePerSecond*2
        
        width.constant = 0
        height.constant = 0
        
        UIView.animate(withDuration: timeMultipliedBySeqLength, delay: 0.0, options: .curveEaseInOut, animations: {
            self.superview?.layoutIfNeeded()
        }, completion: {_ in
            completion()
        }
        )
    }
    
    func scaleBackUp(_ completion: @escaping () -> () = {}){
        
        width.constant = ScreenSize.width/1.5
        height.constant = ScreenSize.width/1.5
        
        UIView.animate(withDuration: 0.18, delay: 0.0, options: .curveEaseInOut, animations: {
            self.superview?.layoutIfNeeded()
        }, completion: {_ in
            completion()
        }
        )
    }
}
