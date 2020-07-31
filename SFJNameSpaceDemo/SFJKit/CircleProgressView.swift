//
//  CircleProgressView.swift
//  SFJTestDemo
//
//  Created by Shafujiu on 2020/7/31.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit

class CircleProgressView: UIView {
    private let lineWidth: CGFloat = 3
    private let bgLineColor: UIColor = .gray
    
    private var endprogress: CGFloat = 0
    private var progressColor = UIColor.cyan
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
            
    }
    
    func setProgress(_ progress: CGFloat, progressColor: UIColor) {
        endprogress = progress
        self.progressColor = progressColor
        setNeedsDisplay()
    }
    
    // #0F1B33
    override func draw(_ rect: CGRect) {
        
        // 背景
        let bgpath = UIBezierPath.init(ovalIn: bounds).cgPath
        let bgLayer = CAShapeLayer()
        bgLayer.frame = bounds
        bgLayer.fillColor = UIColor.clear.cgColor
        bgLayer.strokeColor = bgLineColor.cgColor
        bgLayer.lineWidth = lineWidth
        bgLayer.path = bgpath
        layer.addSublayer(bgLayer)
        
        // 进度
        let tracklayer = CAShapeLayer()
        tracklayer.frame = bounds
        let center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
        let endProgress: CGFloat = endprogress
        var endAngle: CGFloat = 0
        if endProgress <= 0.25 {
            endAngle = -CGFloat.pi * 0.5 + 2 * CGFloat.pi * endProgress
        }else {
            endAngle = 2 * CGFloat.pi * (endProgress - 0.25)
        }
        // 注意起点位置
        let path = UIBezierPath(arcCenter: center, radius: tracklayer.bounds.width * 0.5, startAngle: -CGFloat.pi * 0.5, endAngle: endAngle , clockwise: true).cgPath
        tracklayer.fillColor = UIColor.clear.cgColor
        tracklayer.strokeColor = progressColor.cgColor
        tracklayer.lineWidth = lineWidth
        tracklayer.path = path
        tracklayer.lineCap = CAShapeLayerLineCap.round
        layer.addSublayer(tracklayer)
        // 文字
        let text = "\(Int(endProgress * 100))%"
        let textLayer = CATextLayer()
        let font = UIFont.systemFont(ofSize: 14)
        textLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: font.lineHeight)
        textLayer.fontSize = 14
        textLayer.truncationMode = .middle
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.string = text
        textLayer.alignmentMode = .center
        textLayer.isWrapped = true
        textLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        layer.addSublayer(textLayer)
    }
    
}

