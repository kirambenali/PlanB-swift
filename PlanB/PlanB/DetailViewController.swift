//
//  DetailViewController.swift
//  PlanB
//
//  Created by Mac Mini 7 on 19/10/2024.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var desc: UITextView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var number: UILabel!
    
    @IBAction func quantity(_ sender: Any) {
   
        number.text = quantityy.value.description // label number yekhou compteur ta3 quntityy(outlet)
    }
    
    
    
    
    @IBOutlet weak var quantityy: UIStepper!
    // UIstepper declariha outlet w action
    
    var sandwishName : String?
    var PriceS : String?
    var descr : String?
    var i: Int = 0

    
    @IBAction func fav(_ sender: Any) {

        if getByCreateria(name : sandwishName!) {
            
            let alert = UIAlertController(title: "BoxOffice", message: "sandwish already exists.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Got it!", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            
        }else {
            
            save()
            let alert = UIAlertController(title: "BoxOffice", message: "item saved successfully. ", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    func save() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)
        let object = NSManagedObject.init(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(name?.text, forKey: "name") // si latribut dans coreData est UILabel tu ajoute.text pour extraire son text
        
        do {
            
            try managedContext.save()
            print("Shandwish saved successfully !")
            NotificationCenter.default.post(name: NSNotification.Name("FavouriteUpdated"), object: nil)

        } catch {
            
            print("shandiwish insert error !")
        }
    }
    
    
    func getByCreateria(name: String) -> Bool{
        
        var movieExist = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let predicate = NSPredicate(format: "name= %@", name)
        request.predicate = predicate
        
        do {
            let result = try managedContext.fetch(request)
            if result.count > 0 {
                
                movieExist = true
                print("shandwish exists !")
                
            }
            
        } catch {
            
            print("Fetching by criteria error !")
        }
        
       
        return movieExist
       
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: sandwishName!)
        name.text = sandwishName!
        price.text = PriceS

        // Do any additional setup after loading the view.
    }


}
// si tu as un tab fih des int  priceLabel.text = String(prices[indexPath.row]) tzid kelmet String bch tnjm tbadel
//UIstepper declaih outlet w action

// for the bar controller click sur contrller => editor =>embended in
// si tu choisis tapBar li louta tu ajoute new contorller ctr thezu lih w tekhtar controler faza
//le premier controlleur ken yetnaha flesh ta page lowl tu coche is initial viewController fil attribute 
// el bouton ta3
