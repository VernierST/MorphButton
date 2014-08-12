//
//  ViewController.swift
//  MorphButtonExample
//
//  Created by Ruben Niculcea on 8/12/14.
//  Copyright (c) 2014 Ruben Niculcea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var playButton: MorphButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.animatedImages = [
            UIImage(named:"playTransform1"),
            UIImage(named:"playTransform2"),
            UIImage(named:"playTransform3"),
            UIImage(named:"playTransform4"),
            UIImage(named:"playTransform5"),
            UIImage(named:"playTransform6"),
            UIImage(named:"playTransform7")]
    }
    
    @IBAction func playButtonTapped(sender: AnyObject) {
        println("Morph Button still works as a button.")
    }
}

