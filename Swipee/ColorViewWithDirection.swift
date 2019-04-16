import UIKit

class ColorViewWithDirection: UIView {
    
    var buttonImage : UIImage!
    
    var arrowView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    func setupImageView(){
        let image = resizedImage(name: "backButton")
        arrowView = UIImageView(image: image)
        addSubview(arrowView)
        
        setImageViewConstraints()
        arrowView.alpha = 0.0

    }
    
    func setImageViewConstraints(){
        
        let arrowSize : CGFloat = 80
        
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.widthAnchor.constraint(equalToConstant: arrowSize).isActive = true
        arrowView.widthAnchor.constraint(equalTo: arrowView.heightAnchor, multiplier: 1).isActive = true
        arrowView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    func rotateArrow(_ direction: UISwipeGestureRecognizer.Direction){
//        var amount = 0
//        switch direction {
//        case .up:
//            amount = 0
//        case .left:
//            amount = -1
//        case .right:
//            amount = 1
//        case .down:
//            amount = 2
//        default:
//            break
//        }

        
        let rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi)
        rotationAnimation.duration = 1
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        rotationAnimation.fillMode = .both

        arrowView.layer.add(rotationAnimation, forKey: nil)

    }

    override func layoutSubviews() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
