import UIKit
extension UIImage{
    
    //水印位置枚举
    enum WaterMarkCorner{
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
    
    //添加图片水印方法
    func waterMarkedImage(waterMarkImage:UIImage, corner:WaterMarkCorner = .BottomRight,
        margin:CGPoint = CGPoint(x: 20, y: 20), alpha:CGFloat = 1) -> UIImage{
            
            var markFrame = CGRectMake(0, 0, waterMarkImage.size.width, waterMarkImage.size.height)
            let imageSize = self.size//底部的image
            
            switch corner{
            case .TopLeft:
                markFrame.origin = margin
            case .TopRight:
                markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                    y: margin.y)
            case .BottomLeft:
                markFrame.origin = CGPoint(x: margin.x,
                    y: imageSize.height - waterMarkImage.size.height - margin.y)
            case .BottomRight:
                markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                    y: imageSize.height - waterMarkImage.size.height - margin.y)
            }
            
            // 开始给图片添加图片
            UIGraphicsBeginImageContext(imageSize)
            self.drawInRect(CGRectMake(0, 0, imageSize.width, imageSize.height))
            waterMarkImage.drawInRect(markFrame, blendMode: .Normal, alpha: alpha)
            let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return waterMarkedImage
    }
}