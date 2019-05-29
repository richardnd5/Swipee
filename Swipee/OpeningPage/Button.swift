import UIKit

class Button: UIButton {
    
    var name : String!
    var buttonImage : UIImage!
    
    init(frame: CGRect, name: String) {
        super.init(frame: frame)
        self.name = name
        setImage()
        setTouchEvents()
    }
    
    private func setImage(){
        let imageSize = CGRect(x: 0, y: 0, width: 700, height: 700)
        buttonImage = resizedImage(name: name, frame: imageSize)
        setImage(buttonImage, for: .normal)
        contentMode = .scaleAspectFit
        adjustsImageWhenHighlighted = false
    }
    
    func resizeImage(to size: CGSize){
        let imageSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        buttonImage = resizedImage(name: name, frame: imageSize)
        setImage(buttonImage, for: .normal)
        contentMode = .scaleAspectFit
    }
    
    private func setTouchEvents(){
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        addTarget(self, action: #selector(touchUpOutside), for: .touchDragExit)
    }
    
    func fadeIn(_ time: Double = 1){
        fadeTo(opacity: 1.0, time: time)
    }
    
    func fadeOut(_ time: Double = 0.5, _ completion: @escaping () -> () = {}){
        fadeTo(opacity: 0.0, time: time){
            completion()
        }
    }
    
    // button touch events
    @objc private func touchDown(_ sender: UIButton?) {
        sender!.scaleTo(scaleTo: 0.8, time: 0.4)
    }
    
    @objc private func touchUpInside(_ sender: UIButton?) {
        sender!.scaleTo(scaleTo: 1, time: 0.4)
    }
    
    @objc private func touchUpOutside(_ sender: UIButton?) {
        sender!.scaleTo(scaleTo: 1, time: 0.4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
