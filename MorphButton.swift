//
//  MorphButton.swift
//  MorphButton
//
//  Created by Ruben Niculcea on 8/6/14.
//  Copyright (c) 2014 Vernier Software & Technology. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014 Vernier Software & Technology. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

@IBDesignable class MorphButton : UIControl {
    
    var animatedImages = [UIImage]()
    var imageContentMode:UIViewContentMode = .Center
        {didSet {self.buttonImageView.contentMode = self.imageContentMode}}
    @IBInspectable var image:UIImage = UIImage()
        {didSet {
            self.buttonImageView.image = self.image
            // This is required for the subview to show up on IB correctly
            self.buttonImageView.frame = self.bounds
        }}
    @IBInspectable var selectedImage:UIImage = UIImage()
    @IBInspectable var animationDuration:Float = 0.3
    @IBInspectable var highlightedAdjustsImage:Bool = false
    private var buttonImageView =  UIImageView()
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.clearColor()
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        self.setup()
    }
    
    init(image:UIImage, selectedImage:UIImage, animatedImages:[UIImage]) {
        super.init()
        self.backgroundColor = UIColor.clearColor()
        self.image = image
        self.selectedImage = selectedImage
        self.animatedImages = animatedImages
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.addSubview(self.buttonImageView)
        self.buttonImageView.frame = self.bounds
        self.buttonImageView.image = self.image
        self.buttonImageView.contentMode = .Center
        self.buttonImageView.animationRepeatCount = 1
        self.buttonImageView.animationDuration = NSTimeInterval(self.animationDuration)
        self.addTarget(self, action: "animate", forControlEvents: .TouchUpInside)
        self.addTarget(self, action: "adjustImage", forControlEvents: .TouchDown)
        self.addTarget(self, action: "adjustImage", forControlEvents: .TouchDragEnter)
        self.addTarget(self, action: "unadjustImage", forControlEvents: .TouchUpInside)
        self.addTarget(self, action: "unadjustImage", forControlEvents: .TouchDragExit)
    }
    
    private func highlightImage(image: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let drawRect = CGRectMake(0, 0, image.size.width, image.size.height)
        image.drawInRect(drawRect)
        UIColor(white: 0, alpha: 0.5).set()
        UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage
    }
    
    func unadjustImage() {
        self.highlighted = false
        if highlightedAdjustsImage {
            if selected {
                self.buttonImageView.image = self.selectedImage
            } else {
                self.buttonImageView.image = self.image
            }
        }
    }
    
    func adjustImage() {
        self.highlighted = true
        if highlightedAdjustsImage {
            self.buttonImageView.image = self.highlightImage(self.buttonImageView.image!)
        }
    }
    
    func animate() {
        self.setSelected(!super.selected)
    }
    
    func setSelected(selected:Bool) {
        if super.selected == selected { return; }
        
        if selected {
            self.buttonImageView.animationImages = self.animatedImages
            self.buttonImageView.image = self.selectedImage
            self.buttonImageView.startAnimating()
        } else {
            self.buttonImageView.animationImages = self.animatedImages.reverse()
            self.buttonImageView.image = self.image
            self.buttonImageView.startAnimating()
        }
        
        super.selected = selected
    }
}
