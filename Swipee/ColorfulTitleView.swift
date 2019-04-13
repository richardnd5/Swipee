import UIKit

class ColorfulTitleView: UIView {
    
    var titleArray : [String]!
    var titleStackView : UIStackView!
    
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        titleArray = splitTitleIntoArray(title)
        setupViews()
        setupLayout()
        
    }
    
    func splitTitleIntoArray(_ title: String) -> [String] {
        let array = title.map { String($0) }
        return array
    }
    
    func setupViews(){
        titleStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.distribution = .fillEqually
        addSubview(titleStackView)
        fillStackViewFromArray(titleArray)
    }
    
    func fillStackViewFromArray(_ array: [String]){
        for char in array {
            let charLabel = UILabel()
            charLabel.text = char
            charLabel.font = UIFont(name: "Avenir Light", size: 40)
            charLabel.textColor = randomColor()
            charLabel.adjustsFontSizeToFitWidth = true
            charLabel.textAlignment = .center
            charLabel.alpha = 0.0
            titleStackView.addArrangedSubview(charLabel)
        }
    }
    
    func setupLayout(){
        titleStackView.fillSuperview()
    }
    
    func animateTitle(sequencerPosition: Int){
        
        if sequencerPosition <= titleStackView.arrangedSubviews.count-1 {
        let viewInSequence = titleStackView.arrangedSubviews[sequencerPosition]
            changeFontColorOfTitleCharacter(view: viewInSequence)
            scaleCharacterUpAndDown(viewInSequence)
            viewInSequence.fadeTo(opacity: 1.0, time: 0.4)
        }
    }
    
    func changeFontColorOfTitleCharacter(view: UIView){
        let v = view as! UILabel
        v.textColor = randomColor()
    }
    
    func scaleCharacterUpAndDown(_ view: UIView){
        view.scaleTo(scaleTo: 1.3,time: 0.4, {
            view.scaleTo(scaleTo: 1.0,time: 1.4)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
