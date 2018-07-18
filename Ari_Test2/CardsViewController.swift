//
//  CardsViewController.swift
//  Ari_Test2
//
//  Created by Arihant Arora on 6/13/18.
//  Copyright © 2018 Arihant Arora. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var deck = ["ace","card2","card3","card4","card5","card6","card7","card8","card9","card10","jack","queen","king"]
    
    var playerTotalScore = 0
    var cpuTotalScore = 0
    
    //OUTLETS
    
    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    //Generate
    @IBAction func clickDeal(_ sender: UIButton) {
        //Player Card
        let leftRandomNumber: Int = Int(arc4random_uniform(13))
        let leftCardString: String = self.deck[leftRandomNumber]
        //Set it
        self.leftCard.image = UIImage.init(named: leftCardString)
        
        //CPU Card
        let rightRandomNumber: Int = Int(arc4random_uniform(13))
        let rightCardString: String = self.deck[rightRandomNumber]
        //Set it
        self.rightCard.image = UIImage.init(named: rightCardString)
        
        //Compare cards and update scores, labels.
        
        if leftRandomNumber > rightRandomNumber{
            playerTotalScore += 1
            self.playerScoreLabel.text = String(playerTotalScore)
        }else if leftRandomNumber < rightRandomNumber{
            cpuTotalScore += 1
            self.cpuScoreLabel.text = String(cpuTotalScore)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
