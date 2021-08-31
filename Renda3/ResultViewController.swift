//
//  ResultViewController.swift
//  Renda3
//
//  Created by 生越冴恵 on 2021/08/30.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var imageView:UIImageView!
    
    var point:Int=0
    @IBOutlet var pointLabel:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointLabel.text=String(point)
        
        if point >= 100{
            imageView.image=UIImage(named: "banner2")
        }else if point >= 70{
            imageView.image=UIImage(named: "banner1")
        }else if point >= 40{
            imageView.image=UIImage(named: "banner5")
        }else if point >= 0{
            imageView.image=UIImage(named: "banner3")
        }else{
            imageView.image=UIImage(named: "banner4")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
