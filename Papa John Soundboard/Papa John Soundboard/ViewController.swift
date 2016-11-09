//
//  ViewController.swift
//  Papa John Soundboard
//
//  Created by Ross Nelson on 11/3/16.
//  Copyright © 2016 Rossmallow. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var audioPlayer = AVAudioPlayer()
    
    let clipTitles = [/*"Stop", */"In The House", "Welcome", "Bo", "Watch Me", "High Tech", "Zesty", "Jalapenos", "Making Pizza", /*"Hehe", */"Never Ordered", "Where've You Been", "Hahahehehe", "Hehehe", "Sodie Pops 1", "Cheesesticks", "Allowance", "Sodie Pops 2", "Let It Happen", "Click Of The Mouse", "Mhmhm", "Big Tip", "Chant"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.clipTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView?.image = UIImage(named: clipTitles[indexPath.row])
        cell.titleLabel?.text = self.clipTitles[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: AVAudioSessionCategoryOptions.mixWithOthers)
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: clipTitles[indexPath.row], ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
}

