import UIKit

class HomePageView: UIView {
    
    var playButton : Button!
    var instructionLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        alpha = 0.0
        fadeTo(opacity: 1.0, time: 1.5)

    }
    
    func setupViews(){
        playButton = Button(frame: .zero, name: "playButton")
        addSubview(playButton)
//        playButton.alpha = 0.0
        
        instructionLabel = UILabel()
        instructionLabel.text = "Swipee!"
        instructionLabel.textAlignment = .center
        instructionLabel.font = UIFont(name: "Avenir Light", size: 32)
        addSubview(instructionLabel)
    }
    
    func setupConstraints(){
        let safe = safeAreaLayoutGuide
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: safe.topAnchor, constant: 50).isActive = true
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: frame.width/3).isActive = true
        playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor, multiplier: 1).isActive = true
        
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: frame.height/5).isActive = true
//        instructionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
