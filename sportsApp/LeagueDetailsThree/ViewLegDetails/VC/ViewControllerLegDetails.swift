//
//  ViewControllerLegDetails.swift
//  sportsApp
//
//  Created by ahmed rabie on 23/06/2022.
//

import UIKit

class ViewControllerLegDetails: UIViewController{

    @IBOutlet var collectionViewOne: UICollectionView!{
        didSet{
            collectionViewOne.delegate = self
            collectionViewOne.dataSource = self
        }
    }
    var eventsArray = [Eventes]()
    var teamsArray = [Teams]()
    @IBOutlet var collectionViewTwo: UICollectionView!{
        didSet{
            collectionViewTwo.delegate = self
            collectionViewTwo.dataSource = self
        }
    }
    
    @IBOutlet var collectionViewThree: UICollectionView!
   
    var event : League?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //featchEvents
        let eventsViewModel = EventsViewModel()
        eventsViewModel.fetchData()
        eventsViewModel.bindingData = {EventsModel , error in
            if let event = EventsModel {
                self.eventsArray = event
            }
                DispatchQueue.main.async {
                    self.collectionViewOne.reloadData()
                    self.collectionViewTwo.reloadData()
                }
          
            if let error = error {
                print(error.localizedDescription)
            }
        }
     
        //featchTeams
        let teamsViewModel = TeamsViewModel()
        teamsViewModel.fetchData()
        teamsViewModel.bindingData = { teams , error in
            if let teams = teams{
                self.teamsArray = teams
            }
            DispatchQueue.main.async {
                self.collectionViewThree.reloadData()
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


extension ViewControllerLegDetails: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne{
            print("Upcoming Events")
            return eventsArray.count
        }
        else if collectionView == collectionViewTwo{
            print("Latest Result")
            return eventsArray.count
        }
        else
        {
            print("Teams")
            return teamsArray.count
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionViewOne)
        {
            let cell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "cellFirst", for: indexPath) as! FirstCollectionViewCell
            cell.firstLablInFirstCell.text = eventsArray[indexPath.row].strEvent
            cell.secondLabelInFirstCell.text = eventsArray[indexPath.row].dateEvent
            cell.thirdLabelInFirstCell.text = eventsArray[indexPath.row].strTime
            return cell
        }
        else if (collectionView == collectionViewTwo)
        {
            let cell  = collectionViewTwo.dequeueReusableCell(withReuseIdentifier: "cellSecond", for: indexPath) as! SecondCollectionViewCell
            cell.firstLblInSecCell.text = eventsArray[indexPath.row].strEvent
            cell.secondLblInSecCell.text = eventsArray[indexPath.row].intHomeScore
            cell.thirdLblInSecCell.text = eventsArray[indexPath.row].intAwayScore
            return cell
        }
        else{
            let cell = collectionViewThree.dequeueReusableCell(withReuseIdentifier: "cellThird", for: indexPath) as! ThirdCollectionViewCell
            cell.imageInThirdCell.loadFrom(URLAddress: teamsArray[indexPath.row].strTeamBadge!)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == collectionViewThree)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "teamsForth") as! TeamsViewController
            vc.clubs = teamsArray[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }
    
}
