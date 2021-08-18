//
//  SpotlightFilterMaskLayer.swift
//  SpotlightAnimation
//
//  Created by fuyoufang on 2021/8/18.
//

import Foundation
import QuartzCore

/// 聚光灯效果的遮罩
class SpotlightFilterMaskLayer : CALayer {

    /// 坡度的宽度
    var gradientWidth: CGFloat = 40.0

    /// 直径
    var diameter: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(in ctx: CGContext) {
        let origin: CGPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        let clearRegionRadius: CGFloat = self.diameter * 0.5
        let blurRegionRadius: CGFloat = clearRegionRadius + gradientWidth

        let baseColorSpace = CGColorSpaceCreateDeviceRGB();
        let colours : [CGFloat] = [0.0, 0.0, 0.0, 1,
                                   0.0, 0.0, 0.0, 0.2]
        let colourLocations : [CGFloat] = [0, 1]
        guard let gradient = CGGradient(colorSpace: baseColorSpace,
                                        colorComponents: colours,
                                        locations: colourLocations,
                                        count: 2) else {
            return
        }

        ctx.drawRadialGradient(gradient,
                               startCenter: origin,
                               startRadius: clearRegionRadius,
                               endCenter: origin,
                               endRadius: blurRegionRadius,
                               options: .drawsBeforeStartLocation);

        ctx.drawPath(using: .fill)
    }

}
