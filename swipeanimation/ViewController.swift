//
//  ViewController.swift
//  swipeanimation
//
//  Created by Mario Perozo on 4/9/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView!
    var v: Float = 0
    var audioPlayer: AVAudioPlayer = AVAudioPlayer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let path: String = Bundle.main.path(forResource: "Acid", ofType: "mp3")!;
        print("path = \(path)");

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path));
        } catch {
            print(error)
        }

        audioPlayer.numberOfLoops = -1;   //infinite loop
        audioPlayer.volume = 0.3;
        audioPlayer.play();
        
        picture.image = UIImage(named: "frame_\(v)")
        picture.alpha = 1.0;
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        if v >= 0 && v <= 91 {
            picture.image = UIImage(named: "frame_\(v)")
            picture.image = UIImage(named: "frame_\(v+1)");
            v = v + 1
        }
        else if v == 92 {
                v = 0
    }
    
        
    }
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if v >= 1 && v <= 92 {
                picture.image = UIImage(named: "frame_\(v)")
                picture.image = UIImage(named: "frame_\(v-1)");
                v = v - 1
            }
            else if v == 0 {
                    v = 92
        }
    }
    

}
