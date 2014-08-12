MorphButton
============

MorphButton is a class that makes it easy to animate a morphing button from one state to another.  

<Insert Image of Morph Button GIF here>

### Usage

MorphButton is a subclass of UIControl, so that means all the control events: "Value Changed", "Touch Drag Outside" and everyones favorite "Touch Up Inside" all work as expected.  

### Properties

* image : A UIImage for the default state of the button
* selectedImage : A UIImage for the selected state of the button
* animatedImages : An array of images for the transition from the image to the selectedImage
* animationDuration : The duration that the animatedImages transition should take
* imageContentMode : The content mode of all of the images

### Example
Using a MorphButton is as easy as creating it and adding it to a view:
```swift
        let animatedButton =
            MorphButton(image: UIImage(named:"play"),
                selectedImage: UIImage(named:"pause"),
               animatedImages: [
                    UIImage(named:"playTransform1"),
                    UIImage(named:"playTransform2"),
                    UIImage(named:"playTransform3"),
                    UIImage(named:"playTransform4"),
                    UIImage(named:"playTransform5"),
                    UIImage(named:"playTransform6"),
                    UIImage(named:"playTransform7")])
        self.view.addSubview(animatedButton)
```
Also included is an example project that animates a play button into a pause button, complete with all the assets used.  

### License

Usage is provided under the [MIT License](http://opensource.org/licenses/MIT).  
Copyright (c) 2014 Vernier Software & Technology. All rights reserved.