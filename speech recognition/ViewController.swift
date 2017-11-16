//
//  ViewController.swift
//  speech recognition
//
//  Created by Admin on 02/11/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Speech
import AVFoundation
import AVKit
class ViewController: UIViewController,SFSpeechRecognizerDelegate,AVAudioPlayerDelegate
{
    @IBOutlet weak var txt_show: UITextView!
    
    @IBOutlet weak var btn_play: UIButton!
    var str  = ""
    @IBOutlet weak var view1: UIView!
    var time = TimeInterval()
    var flag = 1
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(Tap))
        tap.numberOfTapsRequired = 1
        view1.addGestureRecognizer(tap)

        
        print("today")
//        let path = Bundle.main.url(forResource: "Despacito - DJMaza.Life - 192Kbps", withExtension:"mp3")
//        do
//        {
//            player = try! AVAudioPlayer(contentsOf: path!)
//            player.prepareToPlay()
//            player.volume = 0.5
//            player.play()
//        }
//
//        catch{
//
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pause(_ sender: Any)
    {
       
        self.player.pause()
       // time = 0.0
//       time = self.player.currentTime
//        print(time)
    }
    @objc func Tap()
    {
        
        print("tapped")
        if flag == 1
        {
            flag = 0
            navigationController?.setNavigationBarHidden(true, animated: true)
            navigationController?.isNavigationBarHidden = true
        }
        else if flag == 0
        {
            flag = 1
            navigationController?.setNavigationBarHidden(false, animated: true)
            navigationController?.isNavigationBarHidden = false
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func btn_play(_ sender: Any)
    {

        SFSpeechRecognizer.requestAuthorization { Authstatus in
            if Authstatus == SFSpeechRecognizerAuthorizationStatus.authorized{
            if  let path = Bundle.main.url(forResource: "example", withExtension:"m4a")
               
                {
                    do{
                        self.player = try! AVAudioPlayer(contentsOf: path)
                        let time: TimeInterval = self.player.currentTime
                        print(time)

                        self.player.play()
                         let duartion: TimeInterval = self.player.duration
                        print(duartion)
                    }
                    catch
                    {
                        print("error")
                    }
//                    let recognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "fr-FR"))
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request){(result,error) in
//                        if let error  = error {
//                            print("problem\(error)")
//                        }else{
//                            self.txt_show.text = result?.bestTranscription.formattedString
//                        }
                        var isFinal = false
                        
                        if result != nil {
                            
                            self.txt_show .text = result?.bestTranscription.formattedString
                            isFinal = (result?.isFinal)!
                        }
                    }
                }
            }
        }


   }
    
      

    
}

