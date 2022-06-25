//
//  ViewController.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionViewOneSport: UICollectionView!{
        didSet {
            collectionViewOneSport.delegate = self
            
            collectionViewOneSport.dataSource = self
            
        }
    }
    var sportsArray = [Sport]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let homeViewModel = HomeViewModel()
        homeViewModel.fetchData()
        homeViewModel.bindingData = {Sports , error in
            if let sports = Sports {
                self.sportsArray = sports
                DispatchQueue.main.async {
                    self.collectionViewOneSport.reloadData()
                }
          }
            if let error = error {
                print(error.localizedDescription)
            }
        }
     }
}
extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionViewOneSport.dequeueReusableCell(withReuseIdentifier: "sportcell" , for: indexPath) as! customSportsCollectionViewCell
        
        cell.imageCellSport.circleImage()
      
        cell.imageCellSport.loadFrom(URLAddress: sportsArray[indexPath.row].strSportThumb)
        cell.lblNameSport.text = sportsArray [indexPath.row].strSport
        
       // cell.backgroundColor = UIColor.orange 
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
    }
  
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            let leftAndRightPaddings: CGFloat = 10
            let numberOfItemsPerRow: CGFloat = 2.0
            
            let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
            return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
            
        }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let viewControl = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! ViewControllerLeg
              viewControl.legue = sportsArray[indexPath.row]
        
        navigationController?.pushViewController(viewControl, animated: true)
    }
}


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url){
                if let loadedImg = UIImage(data: imageData){
                    self?.image = loadedImg
                }
            }
        }
    }
}

 extension UIImageView{
    func circleImage()
    {
        //let radius = self.frame.height/1.2
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
     //   self.layer.backgroundColor = UIColor.orange.cgColor
        }
    
}


