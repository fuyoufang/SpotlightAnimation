//
//  SpotlightAnimationView.swift
//  SpotlightAnimation
//
//  Created by fuyoufang on 2021/8/18.
//

import UIKit

/// 聚光灯逐渐扩大的动画
public class SpotlightAnimationView: UIView {
    /// 显示的图片
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "lion")
        return imageView
    }()
    
    /// 遮罩
    let maskLayer: SpotlightFilterMaskLayer = {
        let layer = SpotlightFilterMaskLayer()
        layer.shouldRasterize = true
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(imageView)
        
        imageView.layer.mask = maskLayer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        maskLayer.frame = bounds
        maskLayer.diameter = min(maskLayer.bounds.width, maskLayer.bounds.height)
    }
    
    // MARK: - 开始动画
    func begin() {
        let fromValue = imageView.bounds
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.fromValue = fromValue
        animation.toValue = CGRect(x: fromValue.origin.x - 100,
                                   y: fromValue.origin.y - 100,
                                   width: fromValue.size.width + 200,
                                   height: fromValue.size.height + 200)
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        
        maskLayer.add(animation, forKey: nil)
    }
    
    // MARK: - 结束动画
    func stopAnimation() {
        
    }
}
