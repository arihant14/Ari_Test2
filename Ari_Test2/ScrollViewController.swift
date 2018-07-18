//
//  ScrollViewController.swift
//  Ari_Test2
//
//  Created by Arihant Arora on 6/13/18.
//  Copyright © 2018 Arihant Arora. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    //Initializing the color options and other objects.
    
    var colorArray = [UIColor.red, UIColor.blue, UIColor.green]
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //First, we make the main frame
        
        let x = CGRect.init(x: 0, y: 90, width: self.view.frame.width, height: CGFloat.init(330))
        
        //Then, we make the scrollview
        
        scrollView = UIScrollView.init(frame: x)
        scrollView.delegate = self
        
        //Set scrollview background
        
        scrollView.backgroundColor = UIColor.cyan
        scrollView.contentInset = UIEdgeInsets.init(top: CGFloat.init(300), left: CGFloat.init(0), bottom: CGFloat.init(1200), right: CGFloat.init(0))
        self.view.addSubview(scrollView)
        
        var number : Int
        var colorSelected: [Int] = []
        var indexArray:[Int] = []
        
        //Stop running while loop when 9 tiles are generated
        
        while indexArray.count < 8{
            //Second while loop makes sure each color gets printed only once in a set of 3s.
            
            while colorSelected.count < 3{
                number = Int(arc4random_uniform(UInt32(colorArray.count)))
                
                while colorSelected.contains(number){
                    number = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
                colorSelected.append(number)
            }
            print(colorSelected)
            for index in colorSelected{
                indexArray.append(index)
            }
            colorSelected = []
        }
        for yAxis in 0 ... 8{
            let childView = UIView.init()
            childView.backgroundColor = colorArray[indexArray.popLast()!]
            childView.frame = CGRect.init(x: Int(scrollView.frame.width/2.6), y: yAxis*100, width: 100, height: 100)
            scrollView.addSubview(childView)
    }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
