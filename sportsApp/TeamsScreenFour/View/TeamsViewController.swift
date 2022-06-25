//
//  TeamsViewController.swift
//  sportsApp
//
//  Created by ahmed rabie on 25/06/2022.
//

import UIKit

class TeamsViewController: UIViewController {

    var clubs : Teams?
    var teamsArray = [Teams]()
    
    @IBOutlet var lblStrDesc: UILabel!
    @IBOutlet var lblStrStad: UILabel!
    @IBOutlet var lblStrLeg: UILabel!
    @IBOutlet var lblFYear: UILabel!
    @IBOutlet var lblStrTeam: UILabel!
    @IBOutlet var imageforth: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageforth.loadFrom(URLAddress: (clubs?.strTeamBadge) ?? "")
        lblStrTeam.text = clubs?.strTeam
        lblFYear.text = clubs?.intFormedYear
        lblStrLeg.text = clubs?.strLeague
        lblStrStad.text = clubs?.strStadium
        lblStrDesc.text = clubs?.strDescriptionEn
        
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
