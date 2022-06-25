//
//  ViewControllerLeg.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import UIKit

class ViewControllerLeg: UIViewController {

    @IBOutlet var tableViewLeg: UITableView!{
        didSet{
            tableViewLeg.delegate = self
            tableViewLeg.dataSource = self
        }
    }
    var leaguesArray = [League]()
    var legue : Sport?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let leagueViewModel = LeaguesViewModel()
        leagueViewModel.fetchData()
        leagueViewModel.bindingData = {Leagues, error in
            if let leagues = Leagues {
                self.leaguesArray = leagues
                DispatchQueue.main.async {
                    self.tableViewLeg.reloadData()
                }
          }
            if let error = error {
                print(error.localizedDescription)
            }
        }
     }
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension ViewControllerLeg :UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableViewLeg.dequeueReusableCell(withIdentifier: "cellTableLeg", for: indexPath) as? TableViewCellLeg
       // cel.imgCellTable.circleImage()
        cel?.imgCellTable.loadFrom(URLAddress: leaguesArray [indexPath.row].strBadge!)
        cel?.labelCellTable.text = leaguesArray [indexPath.row].strLeague
        cel?.cellDelegate = self
        cel?.index = indexPath
        
       
        return cel!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdView") as! ViewControllerLegDetails
        vc.event = leaguesArray[indexPath.row]
       
        present(vc, animated: true, completion: nil)
    }
}

extension ViewControllerLeg: newPageYoutupe{
    func onClickYoutupe(index: Int) {
        //print("indew: \(index)")
        //print("the url: \(String(describing: leaguesArray[index].strYoutube))")
        if let YoutupeString = URL(string:"https://\(leaguesArray[index].strYoutube ?? "")"){
            UIApplication.shared.open(YoutupeString)
        }
    }
    
}
