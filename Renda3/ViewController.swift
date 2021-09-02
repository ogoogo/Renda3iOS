//
//  ViewController.swift
//  Renda3
//
//  Created by 生越冴恵 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textView:UILabel!
    @IBOutlet var timerLabel:UILabel!
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    @IBOutlet var startButton:UIButton!
    @IBOutlet var pointLabel:UILabel!
    @IBOutlet var countText:UILabel!
    @IBOutlet var pointText:UILabel!
    var timer : Timer=Timer()
    var number:Int=0
    var questionNumber:Int!
    var count:Int=30
    var point:Int=0
    var random:Int!
    
    
    
    var imageArray=[UIImage(named: "kusa0"),UIImage(named: "kusa1"),UIImage(named: "kusa2")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerLabel.isHidden=true
        imageView.isHidden=true
        yesButton.isHidden=true
        noButton.isHidden=true
        pointText.isHidden=true
        pointLabel.isHidden=true
        countText.isHidden=true
        
        
       
    }
    
    @IBAction func start(){
        timerLabel.isHidden=false
        imageView.isHidden=false
        yesButton.isHidden=false
        noButton.isHidden=false
        startButton.isHidden=true
        pointLabel.isHidden=false
        pointText.isHidden=false
        countText.isHidden=false
        
        setGame()
        timer=Timer.scheduledTimer(timeInterval: 1.0,
                                   target: self,
                                   selector: #selector(self.nowTimer),
                                   userInfo: nil,
                                   repeats: true)
        
        
        
    }
    
    @IBAction func yes(){
        number += 1
        if imageView.image==UIImage(named: "suzuran"){
            point -= 10
            pointLabel.textColor=UIColor.red
            pointLabel.text=String(point)
            number=0
            setGame()
        }else{
            point += 1
            pointLabel.textColor=UIColor(red: 163/255, green: 95/255, blue: 63/255, alpha: 1)
            pointLabel.text=String(point)
            if number == questionNumber{
                imageView.image=UIImage(named: "suzuran")
            }else{
                imageView.image=imageArray[defferentKusa()]
        }
    }
    }
    
    @IBAction func no(){
        if imageView.image==UIImage(named: "suzuran"){
            point += 1
            pointLabel.textColor=UIColor(red: 163/255, green: 95/255, blue: 63/255, alpha: 1)
            pointLabel.text=String(point)
            number=0
            setGame()
        }
        
    }
    
    func setGame(){
        questionNumber=Int.random(in: 3...15)
        random = Int.random(in:0 ... 2)
        imageView.image=UIImage(named: "kusa"+String(random))
    }
    
    @objc func nowTimer(){
        count -= 1
        timerLabel.text=String(count)
        
        if count==0{
            timer.invalidate()
            self.performSegue(withIdentifier: "toResult", sender: point)
            
            timerLabel.isHidden=true
            imageView.isHidden=true
            yesButton.isHidden=true
            noButton.isHidden=true
            pointText.isHidden=true
            pointLabel.isHidden=true
            countText.isHidden=true
            startButton.isHidden=false
            
            
            number=0
            count=30
            point=0
            pointLabel.text=String(point)
            timerLabel.text=String(count)
           
        }
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let secondViewController :ResultViewController = segue.destination as! ResultViewController
            secondViewController.point = sender as! Int
        }
    }
    
    func defferentKusa()->Int{
        
        if imageView.image==imageArray[0]{
            return Int.random(in:1...2)
        }else if imageView.image==imageArray[1]{
            let num = Int.random(in: 0...1)
            if num == 1{
                return 2
            }else{
                return 0
            }
        }else{
            return Int.random(in: 0...1)
        }
        
    


    }
    }



