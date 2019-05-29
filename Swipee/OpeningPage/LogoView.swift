//
//  LogoView.swift
//
//  Code generated using QuartzCode 1.66.4 on 5/11/19.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class LogoView: UIView, CAAnimationDelegate {
    
    var layers = [String: CALayer]()
    var completionBlocks = [CAAnimation: (Bool) -> Void]()
    var updateLayerValueForCompletedAnimation : Bool = false
    
    var color : UIColor!
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    override var frame: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    override var bounds: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    func setupProperties(){
        self.color = UIColor(red:0.991, green: 0.701, blue:0.135, alpha:1)
    }
    
    func setupLayers(){
        self.backgroundColor = UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0)
        
        let SwipeeLogo = CALayer()
        self.layer.addSublayer(SwipeeLogo)
        layers["SwipeeLogo"] = SwipeeLogo
        let ExclamDot = CAShapeLayer()
        SwipeeLogo.addSublayer(ExclamDot)
        layers["ExclamDot"] = ExclamDot
        let ExclamLine = CAShapeLayer()
        SwipeeLogo.addSublayer(ExclamLine)
        layers["ExclamLine"] = ExclamLine
        let S = CAShapeLayer()
        SwipeeLogo.addSublayer(S)
        layers["S"] = S
        let W = CAShapeLayer()
        SwipeeLogo.addSublayer(W)
        layers["W"] = W
        let ILine = CAShapeLayer()
        SwipeeLogo.addSublayer(ILine)
        layers["ILine"] = ILine
        let IDot = CAShapeLayer()
        SwipeeLogo.addSublayer(IDot)
        layers["IDot"] = IDot
        let P = CAShapeLayer()
        SwipeeLogo.addSublayer(P)
        layers["P"] = P
        let E1 = CAShapeLayer()
        SwipeeLogo.addSublayer(E1)
        layers["E1"] = E1
        let E2 = CAShapeLayer()
        SwipeeLogo.addSublayer(E2)
        layers["E2"] = E2
        
        resetLayerProperties(forLayerIdentifiers: nil)
        setupLayerFrames()
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("ExclamDot"){
            let ExclamDot = layers["ExclamDot"] as! CAShapeLayer
            ExclamDot.lineCap     = .round
            ExclamDot.lineJoin    = .round
            ExclamDot.fillColor   = nil
            ExclamDot.strokeColor = UIColor.black.cgColor
            ExclamDot.lineWidth   = 0.3
            ExclamDot.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("ExclamLine"){
            let ExclamLine = layers["ExclamLine"] as! CAShapeLayer
            ExclamLine.lineCap     = .round
            ExclamLine.lineJoin    = .round
            ExclamLine.fillColor   = nil
            ExclamLine.strokeColor = UIColor.black.cgColor
            ExclamLine.lineWidth   = 0.3
            ExclamLine.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("S"){
            let S = layers["S"] as! CAShapeLayer
            S.lineCap     = .round
            S.lineJoin    = .round
            S.fillColor   = nil
            S.strokeColor = UIColor.black.cgColor
            S.lineWidth   = 0.3
            S.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("W"){
            let W = layers["W"] as! CAShapeLayer
            W.lineCap     = .round
            W.lineJoin    = .round
            W.fillColor   = nil
            W.strokeColor = UIColor.black.cgColor
            W.lineWidth   = 0.3
            W.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("ILine"){
            let ILine = layers["ILine"] as! CAShapeLayer
            ILine.lineCap     = .round
            ILine.lineJoin    = .round
            ILine.fillColor   = nil
            ILine.strokeColor = UIColor.black.cgColor
            ILine.lineWidth   = 0.3
            ILine.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("IDot"){
            let IDot = layers["IDot"] as! CAShapeLayer
            IDot.lineCap     = .round
            IDot.lineJoin    = .round
            IDot.fillColor   = nil
            IDot.strokeColor = UIColor.black.cgColor
            IDot.lineWidth   = 0.3
            IDot.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("P"){
            let P = layers["P"] as! CAShapeLayer
            P.lineCap     = .round
            P.lineJoin    = .round
            P.fillColor   = nil
            P.strokeColor = UIColor.black.cgColor
            P.lineWidth   = 0.3
            P.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("E1"){
            let E1 = layers["E1"] as! CAShapeLayer
            E1.lineCap     = .round
            E1.lineJoin    = .round
            E1.fillColor   = nil
            E1.strokeColor = UIColor.black.cgColor
            E1.lineWidth   = 0.3
            E1.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("E2"){
            let E2 = layers["E2"] as! CAShapeLayer
            E2.lineCap     = .round
            E2.lineJoin    = .round
            E2.fillColor   = nil
            E2.strokeColor = UIColor.black.cgColor
            E2.lineWidth   = 0.3
            E2.strokeEnd   = 0
        }
        
        CATransaction.commit()
    }
    
    func setupLayerFrames(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if let SwipeeLogo = layers["SwipeeLogo"]{
            SwipeeLogo.frame = CGRect(x: 0.02 * SwipeeLogo.superlayer!.bounds.width, y: 0.3619 * SwipeeLogo.superlayer!.bounds.height, width: 0.96 * SwipeeLogo.superlayer!.bounds.width, height: 0.28822 * SwipeeLogo.superlayer!.bounds.height)
        }
        
        if let ExclamDot = layers["ExclamDot"] as? CAShapeLayer{
            ExclamDot.frame = CGRect(x: 0.96742 * ExclamDot.superlayer!.bounds.width, y: 0.61228 * ExclamDot.superlayer!.bounds.height, width: 0.03258 * ExclamDot.superlayer!.bounds.width, height: 0.10968 * ExclamDot.superlayer!.bounds.height)
            ExclamDot.path  = ExclamDotPath(bounds: layers["ExclamDot"]!.bounds).cgPath
        }
        
        if let ExclamLine = layers["ExclamLine"] as? CAShapeLayer{
            ExclamLine.frame = CGRect(x: 0.973 * ExclamLine.superlayer!.bounds.width, y: 0.01462 * ExclamLine.superlayer!.bounds.height, width: 0.02137 * ExclamLine.superlayer!.bounds.width, height: 0.5133 * ExclamLine.superlayer!.bounds.height)
            ExclamLine.path  = ExclamLinePath(bounds: layers["ExclamLine"]!.bounds).cgPath
        }
        
        if let S = layers["S"] as? CAShapeLayer{
            S.frame = CGRect(x: 0, y: 0, width: 0.1348 * S.superlayer!.bounds.width, height: 0.73176 * S.superlayer!.bounds.height)
            S.path  = SPath(bounds: layers["S"]!.bounds).cgPath
        }
        
        if let W = layers["W"] as? CAShapeLayer{
            W.frame = CGRect(x: 0.15298 * W.superlayer!.bounds.width, y: 0.25066 * W.superlayer!.bounds.height, width: 0.20585 * W.superlayer!.bounds.width, height: 0.46459 * W.superlayer!.bounds.height)
            W.path  = WPath(bounds: layers["W"]!.bounds).cgPath
        }
        
        if let ILine = layers["ILine"] as? CAShapeLayer{
            ILine.frame = CGRect(x: 0.38808 * ILine.superlayer!.bounds.width, y: 0.25066 * ILine.superlayer!.bounds.height, width: 0.02025 * ILine.superlayer!.bounds.width, height: 0.46459 * ILine.superlayer!.bounds.height)
            ILine.path  = ILinePath(bounds: layers["ILine"]!.bounds).cgPath
        }
        
        if let IDot = layers["IDot"] as? CAShapeLayer{
            IDot.frame = CGRect(x: 0.38358 * IDot.superlayer!.bounds.width, y: 0.0279 * IDot.superlayer!.bounds.height, width: 0.02902 * IDot.superlayer!.bounds.width, height: 0.09793 * IDot.superlayer!.bounds.height)
            IDot.path  = IDotPath(bounds: layers["IDot"]!.bounds).cgPath
        }
        
        if let P = layers["P"] as? CAShapeLayer{
            P.frame = CGRect(x: 0.45444 * P.superlayer!.bounds.width, y: 0.24105 * P.superlayer!.bounds.height, width: 0.14829 * P.superlayer!.bounds.width, height: 0.75895 * P.superlayer!.bounds.height)
            P.path  = PPath(bounds: layers["P"]!.bounds).cgPath
        }
        
        if let E1 = layers["E1"] as? CAShapeLayer{
            E1.frame = CGRect(x: 0.6279 * E1.superlayer!.bounds.width, y: 0.24096 * E1.superlayer!.bounds.height, width: 0.137 * E1.superlayer!.bounds.width, height: 0.48486 * E1.superlayer!.bounds.height)
            E1.path  = E1Path(bounds: layers["E1"]!.bounds).cgPath
        }
        
        if let E2 = layers["E2"] as? CAShapeLayer{
            E2.frame = CGRect(x: 0.79258 * E2.superlayer!.bounds.width, y: 0.24096 * E2.superlayer!.bounds.height, width: 0.13656 * E2.superlayer!.bounds.width, height: 0.48486 * E2.superlayer!.bounds.height)
            E2.path  = E2Path(bounds: layers["E2"]!.bounds).cgPath
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addDrawPathAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = 2.386
            completionAnim.delegate = self
            completionAnim.setValue("drawPath", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"drawPath")
            if let anim = layer.animation(forKey: "drawPath"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : CAMediaTimingFillMode = .forwards
        
        ////ExclamDot animation
        let ExclamDotStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        ExclamDotStrokeEndAnim.values         = [0, 1]
        ExclamDotStrokeEndAnim.keyTimes       = [0, 1]
        ExclamDotStrokeEndAnim.duration       = 0.294
        ExclamDotStrokeEndAnim.beginTime      = 1.2
        ExclamDotStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamDotOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        ExclamDotOpacityAnim.values         = [0, 1]
        ExclamDotOpacityAnim.keyTimes       = [0, 1]
        ExclamDotOpacityAnim.duration       = 0.0469
        ExclamDotOpacityAnim.beginTime      = 1.15
        ExclamDotOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamDotFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        ExclamDotFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                                 UIColor(red:0.32, green: 0.38, blue:1.00, alpha:1.0).cgColor]
        ExclamDotFillColorAnim.keyTimes       = [0, 1]
        ExclamDotFillColorAnim.duration       = 0.6
        ExclamDotFillColorAnim.beginTime      = 1.79
        ExclamDotFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamDot = layers["ExclamDot"] as! CAShapeLayer
        
        let ExclamDotTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        ExclamDotTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                                 NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                                 NSValue(caTransform3D: CATransform3DIdentity)]
        ExclamDotTransformAnim.keyTimes       = [0, 0.506, 1]
        ExclamDotTransformAnim.duration       = 0.6
        ExclamDotTransformAnim.beginTime      = 1.79
        ExclamDotTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamDotDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [ExclamDotStrokeEndAnim, ExclamDotOpacityAnim, ExclamDotFillColorAnim, ExclamDotTransformAnim], fillMode:fillMode)
        ExclamDot.add(ExclamDotDrawPathAnim, forKey:"ExclamDotDrawPathAnim")
        
        ////ExclamLine animation
        let ExclamLineStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        ExclamLineStrokeEndAnim.values         = [0, 1]
        ExclamLineStrokeEndAnim.keyTimes       = [0, 1]
        ExclamLineStrokeEndAnim.duration       = 0.299
        ExclamLineStrokeEndAnim.beginTime      = 1.09
        ExclamLineStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamLineOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        ExclamLineOpacityAnim.values         = [0, 1]
        ExclamLineOpacityAnim.keyTimes       = [0, 1]
        ExclamLineOpacityAnim.duration       = 0.0469
        ExclamLineOpacityAnim.beginTime      = 1.04
        ExclamLineOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamLineFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        ExclamLineFillColorAnim.values         = [UIColor(red:0, green: 0, blue:0, alpha:0).cgColor,
                                                  UIColor(red:0.32, green: 0.38, blue:1.00, alpha:1.0).cgColor]
        ExclamLineFillColorAnim.keyTimes       = [0, 1]
        ExclamLineFillColorAnim.duration       = 0.6
        ExclamLineFillColorAnim.beginTime      = 1.78
        ExclamLineFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamLine = layers["ExclamLine"] as! CAShapeLayer
        
        let ExclamLineTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        ExclamLineTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                                  NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                                  NSValue(caTransform3D: CATransform3DIdentity)]
        ExclamLineTransformAnim.keyTimes       = [0, 0.506, 1]
        ExclamLineTransformAnim.duration       = 0.6
        ExclamLineTransformAnim.beginTime      = 1.78
        ExclamLineTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ExclamLineDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [ExclamLineStrokeEndAnim, ExclamLineOpacityAnim, ExclamLineFillColorAnim, ExclamLineTransformAnim], fillMode:fillMode)
        ExclamLine.add(ExclamLineDrawPathAnim, forKey:"ExclamLineDrawPathAnim")
        
        ////S animation
        let SStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        SStrokeEndAnim.values         = [0, 1]
        SStrokeEndAnim.keyTimes       = [0, 1]
        SStrokeEndAnim.duration       = 0.294
        SStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let SOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        SOpacityAnim.values         = [0, 1]
        SOpacityAnim.keyTimes       = [0, 1]
        SOpacityAnim.duration       = 0.0469
        SOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let SFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        SFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                         UIColor(red:0.889, green: 0.0909, blue:0.12, alpha:1).cgColor]
        SFillColorAnim.keyTimes       = [0, 1]
        SFillColorAnim.duration       = 0.6
        SFillColorAnim.beginTime      = 1.33
        SFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let S = layers["S"] as! CAShapeLayer
        
        let STransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        STransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                         NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                         NSValue(caTransform3D: CATransform3DIdentity)]
        STransformAnim.keyTimes       = [0, 0.468, 1]
        STransformAnim.duration       = 0.6
        STransformAnim.beginTime      = 1.33
        STransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let SDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [SStrokeEndAnim, SOpacityAnim, SFillColorAnim, STransformAnim], fillMode:fillMode)
        S.add(SDrawPathAnim, forKey:"SDrawPathAnim")
        
        ////W animation
        let WStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        WStrokeEndAnim.values         = [0, 1]
        WStrokeEndAnim.keyTimes       = [0, 1]
        WStrokeEndAnim.duration       = 0.294
        WStrokeEndAnim.beginTime      = 0.199
        WStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let WOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        WOpacityAnim.values         = [0, 1]
        WOpacityAnim.keyTimes       = [0, 1]
        WOpacityAnim.duration       = 0.0469
        WOpacityAnim.beginTime      = 0.152
        WOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let WFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        WFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                         UIColor(red:0.144, green: 0.715, blue:0.292, alpha:1).cgColor]
        WFillColorAnim.keyTimes       = [0, 1]
        WFillColorAnim.duration       = 0.6
        WFillColorAnim.beginTime      = 1.38
        WFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let W = layers["W"] as! CAShapeLayer
        
        let WTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        WTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                         NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                         NSValue(caTransform3D: CATransform3DIdentity)]
        WTransformAnim.keyTimes       = [0, 0.495, 1]
        WTransformAnim.duration       = 0.6
        WTransformAnim.beginTime      = 1.38
        WTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let WDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [WStrokeEndAnim, WOpacityAnim, WFillColorAnim, WTransformAnim], fillMode:fillMode)
        W.add(WDrawPathAnim, forKey:"WDrawPathAnim")
        
        ////ILine animation
        let ILineStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        ILineStrokeEndAnim.values         = [0, 1]
        ILineStrokeEndAnim.keyTimes       = [0, 1]
        ILineStrokeEndAnim.duration       = 0.294
        ILineStrokeEndAnim.beginTime      = 0.356
        ILineStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ILineOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        ILineOpacityAnim.values         = [0, 1]
        ILineOpacityAnim.keyTimes       = [0, 1]
        ILineOpacityAnim.duration       = 0.0469
        ILineOpacityAnim.beginTime      = 0.309
        ILineOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ILineFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        ILineFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                             self.color.cgColor]
        ILineFillColorAnim.keyTimes       = [0, 1]
        ILineFillColorAnim.duration       = 0.6
        ILineFillColorAnim.beginTime      = 1.46
        ILineFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ILine = layers["ILine"] as! CAShapeLayer
        
        let ILineTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        ILineTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                             NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                             NSValue(caTransform3D: CATransform3DIdentity)]
        ILineTransformAnim.keyTimes       = [0, 0.49, 1]
        ILineTransformAnim.duration       = 0.6
        ILineTransformAnim.beginTime      = 1.46
        ILineTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let ILineDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [ILineStrokeEndAnim, ILineOpacityAnim, ILineFillColorAnim, ILineTransformAnim], fillMode:fillMode)
        ILine.add(ILineDrawPathAnim, forKey:"ILineDrawPathAnim")
        
        ////IDot animation
        let IDotStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        IDotStrokeEndAnim.values         = [0, 1]
        IDotStrokeEndAnim.keyTimes       = [0, 1]
        IDotStrokeEndAnim.duration       = 0.295
        IDotStrokeEndAnim.beginTime      = 0.506
        IDotStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let IDotOpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        IDotOpacityAnim.values         = [0, 1]
        IDotOpacityAnim.keyTimes       = [0, 1]
        IDotOpacityAnim.duration       = 0.0458
        IDotOpacityAnim.beginTime      = 0.46
        IDotOpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let IDotFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        IDotFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                            UIColor(red:0.991, green: 0.701, blue:0.135, alpha:1).cgColor]
        IDotFillColorAnim.keyTimes       = [0, 1]
        IDotFillColorAnim.duration       = 0.6
        IDotFillColorAnim.beginTime      = 1.46
        IDotFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let IDot = layers["IDot"] as! CAShapeLayer
        
        let IDotTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        IDotTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                            NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                            NSValue(caTransform3D: CATransform3DIdentity)]
        IDotTransformAnim.keyTimes       = [0, 0.517, 1]
        IDotTransformAnim.duration       = 0.6
        IDotTransformAnim.beginTime      = 1.46
        IDotTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let IDotDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [IDotStrokeEndAnim, IDotOpacityAnim, IDotFillColorAnim, IDotTransformAnim], fillMode:fillMode)
        IDot.add(IDotDrawPathAnim, forKey:"IDotDrawPathAnim")
        
        ////P animation
        let PStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        PStrokeEndAnim.values         = [0, 1]
        PStrokeEndAnim.keyTimes       = [0, 1]
        PStrokeEndAnim.duration       = 0.294
        PStrokeEndAnim.beginTime      = 0.665
        PStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let POpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        POpacityAnim.values         = [0, 1]
        POpacityAnim.keyTimes       = [0, 1]
        POpacityAnim.duration       = 0.0469
        POpacityAnim.beginTime      = 0.618
        POpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let PFillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        PFillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                         UIColor(red:0.632, green: 0.184, blue:0.606, alpha:1).cgColor]
        PFillColorAnim.keyTimes       = [0, 1]
        PFillColorAnim.duration       = 0.6
        PFillColorAnim.beginTime      = 1.53
        PFillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let P = layers["P"] as! CAShapeLayer
        
        let PTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        PTransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                         NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                         NSValue(caTransform3D: CATransform3DIdentity)]
        PTransformAnim.keyTimes       = [0, 0.504, 1]
        PTransformAnim.duration       = 0.6
        PTransformAnim.beginTime      = 1.53
        PTransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let PDrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [PStrokeEndAnim, POpacityAnim, PFillColorAnim, PTransformAnim], fillMode:fillMode)
        P.add(PDrawPathAnim, forKey:"PDrawPathAnim")
        
        ////E1 animation
        let E1StrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        E1StrokeEndAnim.values         = [0, 1]
        E1StrokeEndAnim.keyTimes       = [0, 1]
        E1StrokeEndAnim.duration       = 0.294
        E1StrokeEndAnim.beginTime      = 0.82
        E1StrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E1OpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        E1OpacityAnim.values         = [0, 1]
        E1OpacityAnim.keyTimes       = [0, 1]
        E1OpacityAnim.duration       = 0.0469
        E1OpacityAnim.beginTime      = 0.773
        E1OpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E1FillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        E1FillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                          UIColor(red:0.928, green: 0.956, blue:0, alpha:1).cgColor]
        E1FillColorAnim.keyTimes       = [0, 1]
        E1FillColorAnim.duration       = 0.6
        E1FillColorAnim.beginTime      = 1.61
        E1FillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E1 = layers["E1"] as! CAShapeLayer
        
        let E1TransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        E1TransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                          NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                          NSValue(caTransform3D: CATransform3DIdentity)]
        E1TransformAnim.keyTimes       = [0, 0.515, 1]
        E1TransformAnim.duration       = 0.6
        E1TransformAnim.beginTime      = 1.61
        E1TransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E1DrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [E1StrokeEndAnim, E1OpacityAnim, E1FillColorAnim, E1TransformAnim], fillMode:fillMode)
        E1.add(E1DrawPathAnim, forKey:"E1DrawPathAnim")
        
        ////E2 animation
        let E2StrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        E2StrokeEndAnim.values         = [0, 1]
        E2StrokeEndAnim.keyTimes       = [0, 1]
        E2StrokeEndAnim.duration       = 0.295
        E2StrokeEndAnim.beginTime      = 0.954
        E2StrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E2OpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
        E2OpacityAnim.values         = [0, 1]
        E2OpacityAnim.keyTimes       = [0, 1]
        E2OpacityAnim.duration       = 0.0469
        E2OpacityAnim.beginTime      = 0.907
        E2OpacityAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E2FillColorAnim            = CAKeyframeAnimation(keyPath:"fillColor")
        E2FillColorAnim.values         = [UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0).cgColor,
                                          UIColor(red:0.889, green: 0.0909, blue:0.12, alpha:1).cgColor]
        E2FillColorAnim.keyTimes       = [0, 1]
        E2FillColorAnim.duration       = 0.6
        E2FillColorAnim.beginTime      = 1.69
        E2FillColorAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E2 = layers["E2"] as! CAShapeLayer
        
        let E2TransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        E2TransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                          NSValue(caTransform3D: CATransform3DMakeScale(1.4, 1.4, 1)),
                                          NSValue(caTransform3D: CATransform3DIdentity)]
        E2TransformAnim.keyTimes       = [0, 0.432, 1]
        E2TransformAnim.duration       = 0.6
        E2TransformAnim.beginTime      = 1.69
        E2TransformAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let E2DrawPathAnim : CAAnimationGroup = QCMethod.group(animations: [E2StrokeEndAnim, E2OpacityAnim, E2FillColorAnim, E2TransformAnim], fillMode:fillMode)
        E2.add(E2DrawPathAnim, forKey:"E2DrawPathAnim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "drawPath"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["ExclamDot"]!.animation(forKey: "ExclamDotDrawPathAnim"), theLayer:layers["ExclamDot"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["ExclamLine"]!.animation(forKey: "ExclamLineDrawPathAnim"), theLayer:layers["ExclamLine"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["S"]!.animation(forKey: "SDrawPathAnim"), theLayer:layers["S"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["W"]!.animation(forKey: "WDrawPathAnim"), theLayer:layers["W"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["ILine"]!.animation(forKey: "ILineDrawPathAnim"), theLayer:layers["ILine"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["IDot"]!.animation(forKey: "IDotDrawPathAnim"), theLayer:layers["IDot"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["P"]!.animation(forKey: "PDrawPathAnim"), theLayer:layers["P"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["E1"]!.animation(forKey: "E1DrawPathAnim"), theLayer:layers["E1"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["E2"]!.animation(forKey: "E2DrawPathAnim"), theLayer:layers["E2"]!)
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "drawPath"{
            layers["ExclamDot"]?.removeAnimation(forKey: "ExclamDotDrawPathAnim")
            layers["ExclamLine"]?.removeAnimation(forKey: "ExclamLineDrawPathAnim")
            layers["S"]?.removeAnimation(forKey: "SDrawPathAnim")
            layers["W"]?.removeAnimation(forKey: "WDrawPathAnim")
            layers["ILine"]?.removeAnimation(forKey: "ILineDrawPathAnim")
            layers["IDot"]?.removeAnimation(forKey: "IDotDrawPathAnim")
            layers["P"]?.removeAnimation(forKey: "PDrawPathAnim")
            layers["E1"]?.removeAnimation(forKey: "E1DrawPathAnim")
            layers["E2"]?.removeAnimation(forKey: "E2DrawPathAnim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            layer.removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func ExclamDotPath(bounds: CGRect) -> UIBezierPath{
        let ExclamDotPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        ExclamDotPath.move(to: CGPoint(x:minX + 0.33371 * w, y: minY + 0.03019 * h))
        ExclamDotPath.addCurve(to: CGPoint(x:minX + 0.05408 * w, y: minY + 0.26931 * h), controlPoint1:CGPoint(x:minX + 0.168 * w, y: minY + 0.09168 * h), controlPoint2:CGPoint(x:minX + 0.11967 * w, y: minY + 0.12926 * h))
        ExclamDotPath.addCurve(to: CGPoint(x:minX + 0.27502 * w, y: minY + 0.94567 * h), controlPoint1:CGPoint(x:minX + -0.0702 * w, y: minY + 0.52892 * h), controlPoint2:CGPoint(x:minX + 0.02646 * w, y: minY + 0.8227 * h))
        ExclamDotPath.addCurve(to: CGPoint(x:minX + w, y: minY + 0.49818 * h), controlPoint1:CGPoint(x:minX + 0.61335 * w, y: minY + 1.11305 * h), controlPoint2:CGPoint(x:minX + w, y: minY + 0.87394 * h))
        ExclamDotPath.addCurve(to: CGPoint(x:minX + 0.33371 * w, y: minY + 0.03019 * h), controlPoint1:CGPoint(x:minX + w, y: minY + 0.14634 * h), controlPoint2:CGPoint(x:minX + 0.66513 * w, y: minY + -0.08595 * h))
        ExclamDotPath.close()
        ExclamDotPath.move(to: CGPoint(x:minX + 0.33371 * w, y: minY + 0.03019 * h))
        
        return ExclamDotPath
    }
    
    func ExclamLinePath(bounds: CGRect) -> UIBezierPath{
        let ExclamLinePath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        ExclamLinePath.move(to: CGPoint(x:minX, y: minY + 0.5 * h))
        ExclamLinePath.addLine(to: CGPoint(x:minX, y: minY + h))
        ExclamLinePath.addLine(to: CGPoint(x:minX + 0.5 * w, y: minY + h))
        ExclamLinePath.addLine(to: CGPoint(x:minX + w, y: minY + h))
        ExclamLinePath.addLine(to: CGPoint(x:minX + w, y: minY + 0.5 * h))
        ExclamLinePath.addLine(to: CGPoint(x:minX + w, y: minY))
        ExclamLinePath.addLine(to: CGPoint(x:minX + 0.5 * w, y: minY))
        ExclamLinePath.addLine(to: CGPoint(x:minX, y: minY))
        ExclamLinePath.addLine(to: CGPoint(x:minX, y: minY + 0.5 * h))
        ExclamLinePath.close()
        ExclamLinePath.move(to: CGPoint(x:minX, y: minY + 0.5 * h))
        
        return ExclamLinePath
    }
    
    func SPath(bounds: CGRect) -> UIBezierPath{
        let SPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        SPath.move(to: CGPoint(x:minX + 0.36883 * w, y: minY + 0.00974 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.04923 * w, y: minY + 0.18433 * h), controlPoint1:CGPoint(x:minX + 0.21195 * w, y: minY + 0.03482 * h), controlPoint2:CGPoint(x:minX + 0.09763 * w, y: minY + 0.0978 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.04923 * w, y: minY + 0.35739 * h), controlPoint1:CGPoint(x:minX + 0.0242 * w, y: minY + 0.23041 * h), controlPoint2:CGPoint(x:minX + 0.0242 * w, y: minY + 0.31131 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.47147 * w, y: minY + 0.54479 * h), controlPoint1:CGPoint(x:minX + 0.0993 * w, y: minY + 0.447 * h), controlPoint2:CGPoint(x:minX + 0.18942 * w, y: minY + 0.48693 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.66173 * w, y: minY + 0.58934 * h), controlPoint1:CGPoint(x:minX + 0.54991 * w, y: minY + 0.56117 * h), controlPoint2:CGPoint(x:minX + 0.63503 * w, y: minY + 0.58114 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.82111 * w, y: minY + 0.7368 * h), controlPoint1:CGPoint(x:minX + 0.77104 * w, y: minY + 0.62313 * h), controlPoint2:CGPoint(x:minX + 0.82111 * w, y: minY + 0.66921 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.74851 * w, y: minY + 0.84637 * h), controlPoint1:CGPoint(x:minX + 0.82111 * w, y: minY + 0.7839 * h), controlPoint2:CGPoint(x:minX + 0.80192 * w, y: minY + 0.8136 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.17524 * w, y: minY + 0.81872 * h), controlPoint1:CGPoint(x:minX + 0.59581 * w, y: minY + 0.94007 * h), controlPoint2:CGPoint(x:minX + 0.29874 * w, y: minY + 0.92573 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.14186 * w, y: minY + 0.79363 * h), controlPoint1:CGPoint(x:minX + 0.15938 * w, y: minY + 0.80489 * h), controlPoint2:CGPoint(x:minX + 0.14436 * w, y: minY + 0.79363 * h))
        SPath.addCurve(to: CGPoint(x:minX, y: minY + 0.86173 * h), controlPoint1:CGPoint(x:minX + 0.13101 * w, y: minY + 0.79312 * h), controlPoint2:CGPoint(x:minX, y: minY + 0.8561 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.06592 * w, y: minY + 0.9073 * h), controlPoint1:CGPoint(x:minX, y: minY + 0.86531 * h), controlPoint2:CGPoint(x:minX + 0.03004 * w, y: minY + 0.88579 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.47564 * w, y: minY + 0.99997 * h), controlPoint1:CGPoint(x:minX + 0.17941 * w, y: minY + 0.97386 * h), controlPoint2:CGPoint(x:minX + 0.29373 * w, y: minY + 0.99946 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.741 * w, y: minY + 0.96618 * h), controlPoint1:CGPoint(x:minX + 0.59748 * w, y: minY + 1.00048 * h), controlPoint2:CGPoint(x:minX + 0.64421 * w, y: minY + 0.99434 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.87285 * w, y: minY + 0.90883 * h), controlPoint1:CGPoint(x:minX + 0.79441 * w, y: minY + 0.95082 * h), controlPoint2:CGPoint(x:minX + 0.82612 * w, y: minY + 0.93699 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.99885 * w, y: minY + 0.70351 * h), controlPoint1:CGPoint(x:minX + 0.97048 * w, y: minY + 0.84944 * h), controlPoint2:CGPoint(x:minX + 1.0072 * w, y: minY + 0.79056 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.92292 * w, y: minY + 0.57142 * h), controlPoint1:CGPoint(x:minX + 0.99385 * w, y: minY + 0.64719 * h), controlPoint2:CGPoint(x:minX + 0.97132 * w, y: minY + 0.60777 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.51987 * w, y: minY + 0.43983 * h), controlPoint1:CGPoint(x:minX + 0.85616 * w, y: minY + 0.52124 * h), controlPoint2:CGPoint(x:minX + 0.77939 * w, y: minY + 0.49615 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.27621 * w, y: minY + 0.36354 * h), controlPoint1:CGPoint(x:minX + 0.37134 * w, y: minY + 0.40757 * h), controlPoint2:CGPoint(x:minX + 0.32294 * w, y: minY + 0.39221 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.21279 * w, y: minY + 0.25806 * h), controlPoint1:CGPoint(x:minX + 0.22614 * w, y: minY + 0.33282 * h), controlPoint2:CGPoint(x:minX + 0.21279 * w, y: minY + 0.3108 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.23782 * w, y: minY + 0.18433 * h), controlPoint1:CGPoint(x:minX + 0.21279 * w, y: minY + 0.21659 * h), controlPoint2:CGPoint(x:minX + 0.21529 * w, y: minY + 0.20942 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.38969 * w, y: minY + 0.10599 * h), controlPoint1:CGPoint(x:minX + 0.26786 * w, y: minY + 0.15156 * h), controlPoint2:CGPoint(x:minX + 0.32377 * w, y: minY + 0.12238 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.53406 * w, y: minY + 0.09473 * h), controlPoint1:CGPoint(x:minX + 0.43058 * w, y: minY + 0.09627 * h), controlPoint2:CGPoint(x:minX + 0.45311 * w, y: minY + 0.09422 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.78356 * w, y: minY + 0.15105 * h), controlPoint1:CGPoint(x:minX + 0.66006 * w, y: minY + 0.09473 * h), controlPoint2:CGPoint(x:minX + 0.70679 * w, y: minY + 0.10548 * h))
        SPath.addLine(to: CGPoint(x:minX + 0.8378 * w, y: minY + 0.18331 * h))
        SPath.addLine(to: CGPoint(x:minX + 0.89872 * w, y: minY + 0.15464 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.94128 * w, y: minY + 0.09115 * h), controlPoint1:CGPoint(x:minX + 0.98467 * w, y: minY + 0.11419 * h), controlPoint2:CGPoint(x:minX + 0.98383 * w, y: minY + 0.11623 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.52822 * w, y: minY + 0.00001 * h), controlPoint1:CGPoint(x:minX + 0.83196 * w, y: minY + 0.02612 * h), controlPoint2:CGPoint(x:minX + 0.71013 * w, y: minY + -0.0005 * h))
        SPath.addCurve(to: CGPoint(x:minX + 0.36883 * w, y: minY + 0.00974 * h), controlPoint1:CGPoint(x:minX + 0.45896 * w, y: minY + 0.00001 * h), controlPoint2:CGPoint(x:minX + 0.41139 * w, y: minY + 0.00308 * h))
        SPath.close()
        SPath.move(to: CGPoint(x:minX + 0.36883 * w, y: minY + 0.00974 * h))
        
        return SPath
    }
    
    func WPath(bounds: CGRect) -> UIBezierPath{
        let WPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        WPath.move(to: CGPoint(x:minX, y: minY + 0.00565 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.10601 * w, y: minY + 0.50403 * h), controlPoint1:CGPoint(x:minX, y: minY + 0.00887 * h), controlPoint2:CGPoint(x:minX + 0.04809 * w, y: minY + 0.23306 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.21202 * w, y: minY + 0.99597 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.26831 * w, y: minY + 0.99597 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.32459 * w, y: minY + 0.99597 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.37869 * w, y: minY + 0.75 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.46667 * w, y: minY + 0.34919 * h), controlPoint1:CGPoint(x:minX + 0.4082 * w, y: minY + 0.61452 * h), controlPoint2:CGPoint(x:minX + 0.44809 * w, y: minY + 0.43387 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.50109 * w, y: minY + 0.19355 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.53169 * w, y: minY + 0.33306 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.62022 * w, y: minY + 0.73548 * h), controlPoint1:CGPoint(x:minX + 0.54809 * w, y: minY + 0.40887 * h), controlPoint2:CGPoint(x:minX + 0.58798 * w, y: minY + 0.59032 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.67814 * w, y: minY + h))
        WPath.addLine(to: CGPoint(x:minX + 0.73388 * w, y: minY + h))
        WPath.addLine(to: CGPoint(x:minX + 0.78962 * w, y: minY + h))
        WPath.addLine(to: CGPoint(x:minX + 0.89508 * w, y: minY + 0.50565 * h))
        WPath.addCurve(to: CGPoint(x:minX + w, y: minY + 0.00565 * h), controlPoint1:CGPoint(x:minX + 0.95301 * w, y: minY + 0.23468 * h), controlPoint2:CGPoint(x:minX + w, y: minY + 0.00968 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.94262 * w, y: minY), controlPoint1:CGPoint(x:minX + w, y: minY + 0.00242 * h), controlPoint2:CGPoint(x:minX + 0.97432 * w, y: minY))
        WPath.addLine(to: CGPoint(x:minX + 0.88579 * w, y: minY))
        WPath.addLine(to: CGPoint(x:minX + 0.87486 * w, y: minY + 0.05403 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.79836 * w, y: minY + 0.45081 * h), controlPoint1:CGPoint(x:minX + 0.86885 * w, y: minY + 0.08468 * h), controlPoint2:CGPoint(x:minX + 0.83443 * w, y: minY + 0.2629 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.7306 * w, y: minY + 0.79516 * h), controlPoint1:CGPoint(x:minX + 0.7623 * w, y: minY + 0.63871 * h), controlPoint2:CGPoint(x:minX + 0.73169 * w, y: minY + 0.79355 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.64044 * w, y: minY + 0.39919 * h), controlPoint1:CGPoint(x:minX + 0.72951 * w, y: minY + 0.79677 * h), controlPoint2:CGPoint(x:minX + 0.68907 * w, y: minY + 0.61855 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.55137 * w, y: minY))
        WPath.addLine(to: CGPoint(x:minX + 0.50109 * w, y: minY))
        WPath.addLine(to: CGPoint(x:minX + 0.45027 * w, y: minY))
        WPath.addLine(to: CGPoint(x:minX + 0.36066 * w, y: minY + 0.40081 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.26885 * w, y: minY + 0.79032 * h), controlPoint1:CGPoint(x:minX + 0.31148 * w, y: minY + 0.62177 * h), controlPoint2:CGPoint(x:minX + 0.27049 * w, y: minY + 0.79677 * h))
        WPath.addCurve(to: CGPoint(x:minX + 0.19235 * w, y: minY + 0.39113 * h), controlPoint1:CGPoint(x:minX + 0.26776 * w, y: minY + 0.78387 * h), controlPoint2:CGPoint(x:minX + 0.23333 * w, y: minY + 0.60403 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.11749 * w, y: minY + 0.00403 * h))
        WPath.addLine(to: CGPoint(x:minX + 0.05847 * w, y: minY + 0.00161 * h))
        WPath.addCurve(to: CGPoint(x:minX, y: minY + 0.00565 * h), controlPoint1:CGPoint(x:minX + 0.02623 * w, y: minY + 0.00081 * h), controlPoint2:CGPoint(x:minX, y: minY + 0.00242 * h))
        WPath.close()
        WPath.move(to: CGPoint(x:minX, y: minY + 0.00565 * h))
        
        return WPath
    }
    
    func ILinePath(bounds: CGRect) -> UIBezierPath{
        let ILinePath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        ILinePath.move(to: CGPoint(x:minX, y: minY + 0.5 * h))
        ILinePath.addLine(to: CGPoint(x:minX, y: minY + h))
        ILinePath.addLine(to: CGPoint(x:minX + 0.5 * w, y: minY + h))
        ILinePath.addLine(to: CGPoint(x:minX + w, y: minY + h))
        ILinePath.addLine(to: CGPoint(x:minX + w, y: minY + 0.5 * h))
        ILinePath.addLine(to: CGPoint(x:minX + w, y: minY))
        ILinePath.addLine(to: CGPoint(x:minX + 0.5 * w, y: minY))
        ILinePath.addLine(to: CGPoint(x:minX, y: minY))
        ILinePath.addLine(to: CGPoint(x:minX, y: minY + 0.5 * h))
        ILinePath.close()
        ILinePath.move(to: CGPoint(x:minX, y: minY + 0.5 * h))
        
        return ILinePath
    }
    
    func IDotPath(bounds: CGRect) -> UIBezierPath{
        let IDotPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        IDotPath.move(to: CGPoint(x:minX + 0.36432 * w, y: minY + 0.02126 * h))
        IDotPath.addCurve(to: CGPoint(x:minX, y: minY + 0.48801 * h), controlPoint1:CGPoint(x:minX + 0.17053 * w, y: minY + 0.07482 * h), controlPoint2:CGPoint(x:minX, y: minY + 0.29289 * h))
        IDotPath.addCurve(to: CGPoint(x:minX + 0.37982 * w, y: minY + 0.97771 * h), controlPoint1:CGPoint(x:minX, y: minY + 0.72521 * h), controlPoint2:CGPoint(x:minX + 0.13178 * w, y: minY + 0.89354 * h))
        IDotPath.addCurve(to: CGPoint(x:minX + 0.67826 * w, y: minY + 0.95476 * h), controlPoint1:CGPoint(x:minX + 0.48447 * w, y: minY + 1.01214 * h), controlPoint2:CGPoint(x:minX + 0.5426 * w, y: minY + 1.00832 * h))
        IDotPath.addCurve(to: CGPoint(x:minX + 0.36432 * w, y: minY + 0.02126 * h), controlPoint1:CGPoint(x:minX + 1.27124 * w, y: minY + 0.73286 * h), controlPoint2:CGPoint(x:minX + 0.97281 * w, y: minY + -0.14708 * h))
        IDotPath.close()
        IDotPath.move(to: CGPoint(x:minX + 0.36432 * w, y: minY + 0.02126 * h))
        
        return IDotPath
    }
    
    func PPath(bounds: CGRect) -> UIBezierPath{
        let PPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        PPath.move(to: CGPoint(x:minX + 0.42099 * w, y: minY + 0.00278 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.18053 * w, y: minY + 0.08226 * h), controlPoint1:CGPoint(x:minX + 0.32769 * w, y: minY + 0.01364 * h), controlPoint2:CGPoint(x:minX + 0.24273 * w, y: minY + 0.04178 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + 0.1104 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + 0.06153 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + 0.01266 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.06827 * w, y: minY + 0.01266 * h))
        PPath.addLine(to: CGPoint(x:minX, y: minY + 0.01266 * h))
        PPath.addLine(to: CGPoint(x:minX, y: minY + 0.50633 * h))
        PPath.addLine(to: CGPoint(x:minX, y: minY + h))
        PPath.addLine(to: CGPoint(x:minX + 0.06827 * w, y: minY + h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + 0.76452 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.13654 * w, y: minY + 0.52953 * h))
        PPath.addLine(to: CGPoint(x:minX + 0.18432 * w, y: minY + 0.55915 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.50898 * w, y: minY + 0.63962 * h), controlPoint1:CGPoint(x:minX + 0.2708 * w, y: minY + 0.61346 * h), controlPoint2:CGPoint(x:minX + 0.37623 * w, y: minY + 0.63962 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.99899 * w, y: minY + 0.29899 * h), controlPoint1:CGPoint(x:minX + 0.80557 * w, y: minY + 0.63962 * h), controlPoint2:CGPoint(x:minX + 1.01644 * w, y: minY + 0.49349 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.92541 * w, y: minY + 0.14299 * h), controlPoint1:CGPoint(x:minX + 0.99368 * w, y: minY + 0.24024 * h), controlPoint2:CGPoint(x:minX + 0.96713 * w, y: minY + 0.18396 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.64855 * w, y: minY + 0.01068 * h), controlPoint1:CGPoint(x:minX + 0.86321 * w, y: minY + 0.08078 * h), controlPoint2:CGPoint(x:minX + 0.75398 * w, y: minY + 0.02895 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.42099 * w, y: minY + 0.00278 * h), controlPoint1:CGPoint(x:minX + 0.59318 * w, y: minY + 0.00081 * h), controlPoint2:CGPoint(x:minX + 0.47257 * w, y: minY + -0.00314 * h))
        PPath.close()
        PPath.move(to: CGPoint(x:minX + 0.59545 * w, y: minY + 0.08918 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.84198 * w, y: minY + 0.26394 * h), controlPoint1:CGPoint(x:minX + 0.71758 * w, y: minY + 0.10991 * h), controlPoint2:CGPoint(x:minX + 0.8177 * w, y: minY + 0.18051 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.44602 * w, y: minY + 0.55619 * h), controlPoint1:CGPoint(x:minX + 0.8928 * w, y: minY + 0.4387 * h), controlPoint2:CGPoint(x:minX + 0.70013 * w, y: minY + 0.58087 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.24956 * w, y: minY + 0.14447 * h), controlPoint1:CGPoint(x:minX + 0.1426 * w, y: minY + 0.52657 * h), controlPoint2:CGPoint(x:minX + 0.02579 * w, y: minY + 0.28072 * h))
        PPath.addCurve(to: CGPoint(x:minX + 0.59545 * w, y: minY + 0.08918 * h), controlPoint1:CGPoint(x:minX + 0.33831 * w, y: minY + 0.09016 * h), controlPoint2:CGPoint(x:minX + 0.47333 * w, y: minY + 0.06894 * h))
        PPath.close()
        PPath.move(to: CGPoint(x:minX + 0.59545 * w, y: minY + 0.08918 * h))
        
        return PPath
    }
    
    func E1Path(bounds: CGRect) -> UIBezierPath{
        let E1Path = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        E1Path.move(to: CGPoint(x:minX + 0.40064 * w, y: minY + 0.00841 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.165 * w, y: minY + 0.12973 * h), controlPoint1:CGPoint(x:minX + 0.31443 * w, y: minY + 0.02619 * h), controlPoint2:CGPoint(x:minX + 0.2233 * w, y: minY + 0.07332 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.05088 * w, y: minY + 0.27733 * h), controlPoint1:CGPoint(x:minX + 0.09686 * w, y: minY + 0.19464 * h), controlPoint2:CGPoint(x:minX + 0.08536 * w, y: minY + 0.2101 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.0008 * w, y: minY + 0.53079 * h), controlPoint1:CGPoint(x:minX + 0.01393 * w, y: minY + 0.35151 * h), controlPoint2:CGPoint(x:minX + -0.00413 * w, y: minY + 0.4427 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.15433 * w, y: minY + 0.86307 * h), controlPoint1:CGPoint(x:minX + 0.00983 * w, y: minY + 0.67066 * h), controlPoint2:CGPoint(x:minX + 0.05581 * w, y: minY + 0.76957 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.55582 * w, y: minY + 0.99907 * h), controlPoint1:CGPoint(x:minX + 0.26435 * w, y: minY + 0.96662 * h), controlPoint2:CGPoint(x:minX + 0.38176 * w, y: minY + 1.0068 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.79556 * w, y: minY + 0.9388 * h), controlPoint1:CGPoint(x:minX + 0.65927 * w, y: minY + 0.99444 * h), controlPoint2:CGPoint(x:minX + 0.70853 * w, y: minY + 0.98207 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.95895 * w, y: minY + 0.8028 * h), controlPoint1:CGPoint(x:minX + 0.84564 * w, y: minY + 0.9133 * h), controlPoint2:CGPoint(x:minX + 0.95895 * w, y: minY + 0.8198 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.90394 * w, y: minY + 0.75102 * h), controlPoint1:CGPoint(x:minX + 0.95895 * w, y: minY + 0.79816 * h), controlPoint2:CGPoint(x:minX + 0.93432 * w, y: minY + 0.7742 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.84893 * w, y: minY + 0.70775 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.8284 * w, y: minY + 0.73248 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.47454 * w, y: minY + 0.8708 * h), controlPoint1:CGPoint(x:minX + 0.7463 * w, y: minY + 0.83371 * h), controlPoint2:CGPoint(x:minX + 0.60098 * w, y: minY + 0.89012 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.17568 * w, y: minY + 0.61579 * h), controlPoint1:CGPoint(x:minX + 0.33578 * w, y: minY + 0.84993 * h), controlPoint2:CGPoint(x:minX + 0.21673 * w, y: minY + 0.74793 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.16254 * w, y: minY + 0.55552 * h), controlPoint1:CGPoint(x:minX + 0.16829 * w, y: minY + 0.59261 * h), controlPoint2:CGPoint(x:minX + 0.16254 * w, y: minY + 0.56556 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.16254 * w, y: minY + 0.53774 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.58127 * w, y: minY + 0.53774 * h))
        E1Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.53774 * h))
        E1Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.49215 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.66337 * w, y: minY + 0.01614 * h), controlPoint1:CGPoint(x:minX + w, y: minY + 0.26265 * h), controlPoint2:CGPoint(x:minX + 0.86617 * w, y: minY + 0.07332 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.40064 * w, y: minY + 0.00841 * h), controlPoint1:CGPoint(x:minX + 0.59933 * w, y: minY + -0.00163 * h), controlPoint2:CGPoint(x:minX + 0.46633 * w, y: minY + -0.0055 * h))
        E1Path.close()
        E1Path.move(to: CGPoint(x:minX + 0.64777 * w, y: minY + 0.1506 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.79146 * w, y: minY + 0.26419 * h), controlPoint1:CGPoint(x:minX + 0.70361 * w, y: minY + 0.17069 * h), controlPoint2:CGPoint(x:minX + 0.76272 * w, y: minY + 0.21705 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.83579 * w, y: minY + 0.40019 * h), controlPoint1:CGPoint(x:minX + 0.81445 * w, y: minY + 0.30051 * h), controlPoint2:CGPoint(x:minX + 0.83579 * w, y: minY + 0.36619 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.83579 * w, y: minY + 0.42183 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.49835 * w, y: minY + 0.42183 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.1609 * w, y: minY + 0.42183 * h))
        E1Path.addLine(to: CGPoint(x:minX + 0.16583 * w, y: minY + 0.39247 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.43102 * w, y: minY + 0.13592 * h), controlPoint1:CGPoint(x:minX + 0.18635 * w, y: minY + 0.28428 * h), controlPoint2:CGPoint(x:minX + 0.30951 * w, y: minY + 0.16451 * h))
        E1Path.addCurve(to: CGPoint(x:minX + 0.64777 * w, y: minY + 0.1506 * h), controlPoint1:CGPoint(x:minX + 0.48275 * w, y: minY + 0.12432 * h), controlPoint2:CGPoint(x:minX + 0.59605 * w, y: minY + 0.13128 * h))
        E1Path.close()
        E1Path.move(to: CGPoint(x:minX + 0.64777 * w, y: minY + 0.1506 * h))
        
        return E1Path
    }
    
    func E2Path(bounds: CGRect) -> UIBezierPath{
        let E2Path = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        E2Path.move(to: CGPoint(x:minX + 0.39951 * w, y: minY + 0.00841 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.15651 * w, y: minY + 0.13823 * h), controlPoint1:CGPoint(x:minX + 0.30313 * w, y: minY + 0.0285 * h), controlPoint2:CGPoint(x:minX + 0.23064 * w, y: minY + 0.06714 * h))
        E2Path.addCurve(to: CGPoint(x:minX, y: minY + 0.50297 * h), controlPoint1:CGPoint(x:minX + 0.04201 * w, y: minY + 0.24642 * h), controlPoint2:CGPoint(x:minX, y: minY + 0.34378 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.15157 * w, y: minY + 0.86307 * h), controlPoint1:CGPoint(x:minX, y: minY + 0.65984 * h), controlPoint2:CGPoint(x:minX + 0.04201 * w, y: minY + 0.75952 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.55437 * w, y: minY + 0.99907 * h), controlPoint1:CGPoint(x:minX + 0.26194 * w, y: minY + 0.96662 * h), controlPoint2:CGPoint(x:minX + 0.37974 * w, y: minY + 1.0068 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.79489 * w, y: minY + 0.9388 * h), controlPoint1:CGPoint(x:minX + 0.65815 * w, y: minY + 0.99444 * h), controlPoint2:CGPoint(x:minX + 0.70758 * w, y: minY + 0.98207 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.95881 * w, y: minY + 0.8028 * h), controlPoint1:CGPoint(x:minX + 0.84514 * w, y: minY + 0.9133 * h), controlPoint2:CGPoint(x:minX + 0.95881 * w, y: minY + 0.8198 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.90362 * w, y: minY + 0.75102 * h), controlPoint1:CGPoint(x:minX + 0.95881 * w, y: minY + 0.79816 * h), controlPoint2:CGPoint(x:minX + 0.9341 * w, y: minY + 0.7742 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.84761 * w, y: minY + 0.70775 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.83196 * w, y: minY + 0.72861 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.47282 * w, y: minY + 0.8708 * h), controlPoint1:CGPoint(x:minX + 0.757 * w, y: minY + 0.8283 * h), controlPoint2:CGPoint(x:minX + 0.60049 * w, y: minY + 0.89012 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.21911 * w, y: minY + 0.71161 * h), controlPoint1:CGPoint(x:minX + 0.37315 * w, y: minY + 0.85534 * h), controlPoint2:CGPoint(x:minX + 0.2743 * w, y: minY + 0.79352 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.1598 * w, y: minY + 0.55861 * h), controlPoint1:CGPoint(x:minX + 0.19357 * w, y: minY + 0.67375 * h), controlPoint2:CGPoint(x:minX + 0.1598 * w, y: minY + 0.58797 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.1598 * w, y: minY + 0.53774 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.5799 * w, y: minY + 0.53774 * h))
        E2Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.53774 * h))
        E2Path.addLine(to: CGPoint(x:minX + w, y: minY + 0.49292 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.66227 * w, y: minY + 0.01614 * h), controlPoint1:CGPoint(x:minX + 0.99918 * w, y: minY + 0.25646 * h), controlPoint2:CGPoint(x:minX + 0.86985 * w, y: minY + 0.07487 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.39951 * w, y: minY + 0.00841 * h), controlPoint1:CGPoint(x:minX + 0.59802 * w, y: minY + -0.00163 * h), controlPoint2:CGPoint(x:minX + 0.46458 * w, y: minY + -0.0055 * h))
        E2Path.close()
        E2Path.move(to: CGPoint(x:minX + 0.6112 * w, y: minY + 0.13901 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.83196 * w, y: minY + 0.37778 * h), controlPoint1:CGPoint(x:minX + 0.73064 * w, y: minY + 0.16914 * h), controlPoint2:CGPoint(x:minX + 0.81796 * w, y: minY + 0.26265 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.83773 * w, y: minY + 0.42183 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.49753 * w, y: minY + 0.42183 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.15815 * w, y: minY + 0.42183 * h))
        E2Path.addLine(to: CGPoint(x:minX + 0.1631 * w, y: minY + 0.39247 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.42916 * w, y: minY + 0.13669 * h), controlPoint1:CGPoint(x:minX + 0.18369 * w, y: minY + 0.28428 * h), controlPoint2:CGPoint(x:minX + 0.30972 * w, y: minY + 0.16296 * h))
        E2Path.addCurve(to: CGPoint(x:minX + 0.6112 * w, y: minY + 0.13901 * h), controlPoint1:CGPoint(x:minX + 0.47776 * w, y: minY + 0.12587 * h), controlPoint2:CGPoint(x:minX + 0.5626 * w, y: minY + 0.12741 * h))
        E2Path.close()
        E2Path.move(to: CGPoint(x:minX + 0.6112 * w, y: minY + 0.13901 * h))
        
        return E2Path
    }
    
    
}
