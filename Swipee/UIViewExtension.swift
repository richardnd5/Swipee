import UIKit

struct ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    static let maxWH = max(ScreenSize.width, ScreenSize.height)
}

// Function to downsample an image to save memory!! From the WWDC 2018 talk of optimizing images
func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat)-> UIImage{
    let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
    let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!
    
    let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
    let downsampleOptions =
        [kCGImageSourceCreateThumbnailFromImageAlways: true,
         kCGImageSourceShouldCacheImmediately: true,
         kCGImageSourceCreateThumbnailWithTransform: true,
         kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary
    
    let downsampledImage =
        CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)!
    return UIImage(cgImage: downsampledImage)
}

func resizedImage(name: String, frame: CGRect = ScreenSize.frame, scale: CGFloat = 1) -> UIImage{
    var image : UIImage!
    let bundleURL = Bundle.main.resourceURL?.appendingPathComponent("\(name).png")
    image = downsample(imageAt: bundleURL!, to: CGSize(width: frame.width*3, height: frame.height*3), scale: 1)
    return image
}

extension UIView {
    
    func fadeTo(opacity: CGFloat, time: Double,  _ completion: @escaping () ->() = {} ){
        UIView.animate(
            withDuration: time,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.alpha = opacity
        },
            completion: {
                _ in
                completion()
        })
    }
    
    func fadeAndRemove(time: Double, completion: @escaping ( ) -> ( ) = {} ){
        UIView.animate(
            withDuration: time,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.alpha = 0.0
        },
            completion: {
                _ in
                completion()
                self.removeFromSuperview()
        })
    }
    
    func shrinkAndRemove(time: Double, _ completion: @escaping () ->() = {} ){
        
        UIView.animate(
            withDuration: time,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.alpha = 0.0
                self.transform = CGAffineTransform(scaleX: 0.00000001, y: 0.00000001)
        },
            completion: {
                _ in
                self.removeFromSuperview()
                completion()
        })
    }
    
    func warningWiggle(){
        
        let wiggle : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        wiggle.toValue = 2
        wiggle.duration = 0.1;
        wiggle.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        wiggle.repeatCount = 4;
        wiggle.autoreverses = true
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [wiggle]
        animGroup.duration = 0.1
        animGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animGroup.isRemovedOnCompletion = false
        
        animGroup.fillMode = .forwards
        
        layer.add(animGroup, forKey: "animGroup")

    }
    
    func scaleTo(scaleTo: CGFloat, time: Double, _ completion: @escaping () -> () = {}, isSpringy: Bool = true, delay: TimeInterval = 0 ){
        
        if isSpringy {
        UIView.animate(
            withDuration: time,
            delay: delay,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 1.0,
            options: .curveEaseInOut,
            animations: {
                self.transform = CGAffineTransform(scaleX: scaleTo, y: scaleTo)
                
        },
            completion: {
                _ in
                completion()
        })
        } else {
            UIView.animate(
                withDuration: time,
                delay: 0,
                options: .curveEaseInOut,
                animations: {
                    self.transform = CGAffineTransform(scaleX: scaleTo, y: scaleTo)
                    
            },
                completion: {
                    _ in
                    completion()
            })
        }
    }
    
    func changeBackgroundColorGraduallyTo(_ color: UIColor, time: Double, isSpringy: Bool = true, _ completion: @escaping () -> () = {}  ){
        
        if isSpringy {
            UIView.animate(
                withDuration: time,
                delay: 0,
                usingSpringWithDamping: 0.55,
                initialSpringVelocity: 0.5,
                options: .curveEaseInOut,
                animations: {
                        self.backgroundColor = color
            },
                completion: {
                    _ in
                    completion()
            })
        } else {
            UIView.animate(
                withDuration: time,
                delay: 0,
                options: .curveEaseInOut,
                animations: {
                    self.backgroundColor = color
            },
                completion: {
                    _ in
                    completion()
            })
        }
    }
}
