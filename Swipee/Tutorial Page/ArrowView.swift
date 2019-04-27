import UIKit

class ArrowView: UIImageView {
    
    var noteImage = UIImage()
    var imageName : String!
    
    init(frame: CGRect, _ imageName: String) {
        super.init(frame: frame)
        self.imageName = imageName
        setImage(name: imageName)
        
    }
    
    func setImage(name: String){
        
        image = resizedImage(name: name)
        contentMode = .scaleAspectFit
    }
    
    func switchArrowImage(to direction: UISwipeGestureRecognizer.Direction){
        
        scaleTo(scaleTo: 1.0, time: 1.0, {
            switch direction {
            case .up:
                self.setImage(name: "upArrow")
                self.fadeTo(opacity: 1.0, time: 0.5)
            case .left:
                self.setImage(name: "leftArrow")
                self.fadeTo(opacity: 1.0, time: 0.5)
            case .right:
                self.setImage(name: "rightArrow")
                self.fadeTo(opacity: 1.0, time: 0.5)
            case .down:
                self.setImage(name: "downArrow")
                self.fadeTo(opacity: 1.0, time: 0.5)
            default:
                break
            }
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

