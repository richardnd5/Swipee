//
//  CheckMarkView.swift
//
//  Code generated using QuartzCode 1.66.3 on 4/18/19.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class CheckMarkView: UIView, CAAnimationDelegate {
    
    var layers = [String: CALayer]()
    var completionBlocks = [CAAnimation: (Bool) -> Void]()
    var updateLayerValueForCompletedAnimation : Bool = false
    
    
    
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
        
    }
    
    func setupLayers(){
        self.backgroundColor = UIColor(red:1.00, green: 1.00, blue:1.00, alpha:0.0)
        
        let checkMark = CAShapeLayer()
        self.layer.addSublayer(checkMark)
        layers["checkMark"] = checkMark
        
        let X = CALayer()
        self.layer.addSublayer(X)
        layers["X"] = X
        let downX = CAShapeLayer()
        X.addSublayer(downX)
        layers["downX"] = downX
        let upX = CAShapeLayer()
        X.addSublayer(upX)
        layers["upX"] = upX
        
        resetLayerProperties(forLayerIdentifiers: nil)
        setupLayerFrames()
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("checkMark"){
            let checkMark = layers["checkMark"] as! CAShapeLayer
            checkMark.lineCap       = .round
            checkMark.lineJoin      = .round
            checkMark.fillColor     = nil
            checkMark.strokeColor   = UIColor(red:0.143, green: 0.664, blue:0, alpha:1).cgColor
            checkMark.lineWidth     = 8
            checkMark.strokeEnd     = 0
            checkMark.shadowColor   = UIColor(red:0, green: 0, blue:0, alpha:0.427).cgColor
            checkMark.shadowOpacity = 0.43
            checkMark.shadowOffset  = CGSize(width: 4, height: 4)
            checkMark.shadowRadius  = 5
        }
        if layerIds == nil || layerIds.contains("downX"){
            let downX = layers["downX"] as! CAShapeLayer
            downX.lineCap     = .round
            downX.lineJoin    = .round
            downX.fillColor   = nil
            downX.strokeColor = UIColor(red:0.804, green: 0.0532, blue:0.118, alpha:1).cgColor
            downX.lineWidth   = 8
            downX.strokeEnd   = 0
        }
        if layerIds == nil || layerIds.contains("upX"){
            let upX = layers["upX"] as! CAShapeLayer
            upX.lineCap     = .round
            upX.lineJoin    = .round
            upX.fillColor   = nil
            upX.strokeColor = UIColor(red:0.804, green: 0.0532, blue:0.118, alpha:1).cgColor
            upX.lineWidth   = 8
            upX.strokeEnd   = 0
        }
        
        CATransaction.commit()
    }
    
    func setupLayerFrames(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if let checkMark = layers["checkMark"] as? CAShapeLayer{
            checkMark.frame = CGRect(x: 0.10311 * checkMark.superlayer!.bounds.width, y: 0.04892 * checkMark.superlayer!.bounds.height, width: 0.79378 * checkMark.superlayer!.bounds.width, height: 0.90169 * checkMark.superlayer!.bounds.height)
            checkMark.path  = checkMarkPath(bounds: layers["checkMark"]!.bounds).cgPath
        }
        
        if let X = layers["X"]{
            X.frame = CGRect(x: 0.0855 * X.superlayer!.bounds.width, y: 0.0855 * X.superlayer!.bounds.height, width: 0.829 * X.superlayer!.bounds.width, height: 0.829 * X.superlayer!.bounds.height)
        }
        
        if let downX = layers["downX"] as? CAShapeLayer{
            downX.frame = CGRect(x: 0, y: 0, width:  downX.superlayer!.bounds.width, height:  downX.superlayer!.bounds.height)
            downX.path  = downXPath(bounds: layers["downX"]!.bounds).cgPath
        }
        
        if let upX = layers["upX"] as? CAShapeLayer{
            upX.frame = CGRect(x: 0.00143 * upX.superlayer!.bounds.width, y: 0.00143 * upX.superlayer!.bounds.height, width: 0.99714 * upX.superlayer!.bounds.width, height: 0.99714 * upX.superlayer!.bounds.height)
            upX.path  = upXPath(bounds: layers["upX"]!.bounds).cgPath
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addDrawCheckMarkAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.636, endTime: CFTimeInterval = 1, completionBlock: ((_ finished: Bool) -> Void)? = nil){
        let endTime = endTime * totalDuration
        
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = endTime
            completionAnim.delegate = self
            completionAnim.setValue("drawCheckMark", forKey:"animId")
            completionAnim.setValue(true, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"drawCheckMark")
            if let anim = layer.animation(forKey: "drawCheckMark"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : CAMediaTimingFillMode = reverseAnimation ? .both : .forwards
        
        ////CheckMark animation
        let checkMarkStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
        checkMarkStrokeEndAnim.values         = [0, 1]
        checkMarkStrokeEndAnim.keyTimes       = [0, 1]
        checkMarkStrokeEndAnim.duration       = 0.315 * totalDuration
        checkMarkStrokeEndAnim.beginTime      = 0.079 * totalDuration
        checkMarkStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
        
        let checkMarkOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
        checkMarkOpacityAnim.values   = [0, 1, 1, 0]
        checkMarkOpacityAnim.keyTimes = [0, 0.221, 0.394, 1]
        checkMarkOpacityAnim.duration = totalDuration
        
        var checkMarkDrawCheckMarkAnim : CAAnimationGroup = QCMethod.group(animations: [checkMarkStrokeEndAnim, checkMarkOpacityAnim], fillMode:fillMode)
        if (reverseAnimation){ checkMarkDrawCheckMarkAnim = QCMethod.reverseAnimation(anim: checkMarkDrawCheckMarkAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["checkMark"]?.add(checkMarkDrawCheckMarkAnim, forKey:"checkMarkDrawCheckMarkAnim")
    }
    
    func addDrawXMarkAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.759, endTime: CFTimeInterval = 1, completionBlock: ((_ finished: Bool) -> Void)? = nil){
        let endTime = endTime * totalDuration
        
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = endTime
            completionAnim.delegate = self
            completionAnim.setValue("drawXMark", forKey:"animId")
            completionAnim.setValue(true, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"drawXMark")
            if let anim = layer.animation(forKey: "drawXMark"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : CAMediaTimingFillMode = reverseAnimation ? .both : .forwards
        
        ////DownX animation
        let downXOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
        downXOpacityAnim.values   = [0, 1, 1, 0]
        downXOpacityAnim.keyTimes = [0, 0.0246, 0.458, 1]
        downXOpacityAnim.duration = 1 * totalDuration
        
        let downXStrokeEndAnim      = CAKeyframeAnimation(keyPath:"strokeEnd")
        downXStrokeEndAnim.values   = [0, 1]
        downXStrokeEndAnim.keyTimes = [0, 1]
        downXStrokeEndAnim.duration = 0.213 * totalDuration
        
        var downXDrawXMarkAnim : CAAnimationGroup = QCMethod.group(animations: [downXOpacityAnim, downXStrokeEndAnim], fillMode:fillMode)
        if (reverseAnimation){ downXDrawXMarkAnim = QCMethod.reverseAnimation(anim: downXDrawXMarkAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["downX"]?.add(downXDrawXMarkAnim, forKey:"downXDrawXMarkAnim")
        
        ////UpX animation
        let upXOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
        upXOpacityAnim.values   = [0, 0, 1, 1, 0]
        upXOpacityAnim.keyTimes = [0, 0.228, 0.249, 0.449, 1]
        upXOpacityAnim.duration = totalDuration
        
        let upXStrokeEndAnim      = CAKeyframeAnimation(keyPath:"strokeEnd")
        upXStrokeEndAnim.values   = [0, 0, 1]
        upXStrokeEndAnim.keyTimes = [0, 0.638, 1]
        upXStrokeEndAnim.duration = 0.383 * totalDuration
        
        var upXDrawXMarkAnim : CAAnimationGroup = QCMethod.group(animations: [upXOpacityAnim, upXStrokeEndAnim], fillMode:fillMode)
        if (reverseAnimation){ upXDrawXMarkAnim = QCMethod.reverseAnimation(anim: upXDrawXMarkAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["upX"]?.add(upXDrawXMarkAnim, forKey:"upXDrawXMarkAnim")
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
        if identifier == "drawCheckMark"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["checkMark"]!.animation(forKey: "checkMarkDrawCheckMarkAnim"), theLayer:layers["checkMark"]!)
        }
        else if identifier == "drawXMark"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["downX"]!.animation(forKey: "downXDrawXMarkAnim"), theLayer:layers["downX"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["upX"]!.animation(forKey: "upXDrawXMarkAnim"), theLayer:layers["upX"]!)
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "drawCheckMark"{
            layers["checkMark"]?.removeAnimation(forKey: "checkMarkDrawCheckMarkAnim")
        }
        else if identifier == "drawXMark"{
            layers["downX"]?.removeAnimation(forKey: "downXDrawXMarkAnim")
            layers["upX"]?.removeAnimation(forKey: "upXDrawXMarkAnim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            layer.removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func checkMarkPath(bounds: CGRect) -> UIBezierPath{
        let checkMarkPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        checkMarkPath.move(to: CGPoint(x:minX, y: minY + 0.57207 * h))
        checkMarkPath.addLine(to: CGPoint(x:minX + 0.41491 * w, y: minY + h))
        checkMarkPath.addLine(to: CGPoint(x:minX + w, y: minY))
        
        return checkMarkPath
    }
    
    func downXPath(bounds: CGRect) -> UIBezierPath{
        let downXPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        downXPath.move(to: CGPoint(x:minX, y: minY))
        downXPath.addLine(to: CGPoint(x:minX + w, y: minY + h))
        
        return downXPath
    }
    
    func upXPath(bounds: CGRect) -> UIBezierPath{
        let upXPath = UIBezierPath()
        let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
        
        upXPath.move(to: CGPoint(x:minX + w, y: minY))
        upXPath.addLine(to: CGPoint(x:minX, y: minY + h))
        
        return upXPath
    }
    
    
}
