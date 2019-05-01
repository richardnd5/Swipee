import UIKit

class ColorView: UIView {
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        
        backgroundColor = color
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: ScreenSize.width/1.5).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
