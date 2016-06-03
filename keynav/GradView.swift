//
//  GradView.swift
//  keynav
//
//  Created by h2ero on 5/27/16.
//  Copyright © 2016 h2ero. All rights reserved.
//

import Cocoa
import Foundation
class GradView: NSView{
    
    internal let hintChars : [[String]] = [
        ["a","f","k"],
        ["s","h","l"],
        ["d","j",";"]
    ]
    
    let hitCharBaseFontSize:CGFloat = 40;
    let hitCharMinFontSize:CGFloat = 12;
    
    override func drawRect(dirtyRect: NSRect)
    {
        // 设置透明
//        NSColor.clearColor().set()
        drawGrad()
    }
    func drawGrad() {
        drawHorizLine(1/3.0)
        drawHorizLine(2/3.0)
        drawVertLie(1/3.0)
        drawVertLie(2/3.0)
        // draw chars
        let xAxis:[CGFloat] = [
            bounds.size.width / 6,
            bounds.size.width / 6 * 3,
            bounds.size.width / 6 * 5
        ]
        let yAxis:[CGFloat] = [
            bounds.size.height / 6,
            bounds.size.height / 6 * 3,
            bounds.size.height / 6 * 5
        ]
        
        for (x, row) in hintChars.enumerate(){
            for(y, hintChar) in row.enumerate(){
                drawChar(hintChar, x:  xAxis[x] - (getHintCharFontSize()/2), y: yAxis[y] - (getHintCharFontSize() / 2))
            }
        }
    }
    
    func drawLine(p1:CGPoint ,p2 :CGPoint){
        NSColor.redColor().set()
        NSBezierPath.setDefaultLineWidth(1.0)
        NSBezierPath.strokeLineFromPoint(p1, toPoint: p2)
    }
    
    func drawHorizLine(frac:CGFloat){
        let x = frac * bounds.size.width
        drawLine(NSMakePoint(x, 0),p2: NSMakePoint(x,bounds.size.height))
    }
    
    func drawVertLie(frac:CGFloat){
        let y = frac * bounds.size.height
        drawLine(NSMakePoint(0, y),p2: NSMakePoint(bounds.size.width,y))
    }
    
    func drawChar(text:NSString,x:CGFloat, y:CGFloat)  {
        let p = NSMakePoint(x, y)
        let font = NSFont.systemFontOfSize(getHintCharFontSize())
        let paraStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        let fontColor = NSColor.greenColor()
        
        let attrs = [
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paraStyle,
            NSForegroundColorAttributeName: fontColor
        ]
        text.drawAtPoint(p, withAttributes: attrs)
    }
    func getHintCharFontSize() -> CGFloat {
        return max(hitCharBaseFontSize * bounds.size.width / 1000 , hitCharMinFontSize);
    }
    
}

