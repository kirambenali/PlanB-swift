//
//  FavouiteViewController.swift
//  PlanB
//
//  Created by Mac Mini 7 on 19/10/2024.
//

import UIKit
import CoreData
class FavouriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var items = [String]()
    func fetchData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
               let managedContext = persistantContainer.viewContext
               
               let request = NSFetchRequest<NSManagedObject>(entityName: "Entity")// select * from Movie
               
               do {
                  let resultReq =  try  managedContext.fetch(request)
                   for item in resultReq {
                       items.append(item.value(forKey: "name") as! String)
                       
                   }
                   
               } catch  {
                   print("fetch error")
               }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    var sandwichs = ["Jambon Gruyere", "Emince Poulet Fondant", "Emince Boeuf Fondant", "Kebab Poulet", "Poulet Grille", "Rapido Jambon Fromage", "Rapido Thon", "Thon"]
    var prices = [6.2, 9.5, 7.8, 6.8, 6.8, 3.8, 3.8, 6.8]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sandwichs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentview = cell?.contentView
        let priceLabel = contentview?.viewWithTag(1) as! UILabel
        let sandwichLabel = contentview?.viewWithTag(2) as! UILabel
        let sandwichImage = contentview?.viewWithTag(3) as! UIImageView
        priceLabel.text = String(prices[indexPath.row])
        sandwichLabel.text = sandwichs[indexPath.row]

        sandwichImage.image = UIImage(named:  sandwichs[indexPath.row])
        return cell!
    }
    
    
    
    
    
    //var item = ["Longsleeve Violeta","Shirt"]
   

    

    

}


    


