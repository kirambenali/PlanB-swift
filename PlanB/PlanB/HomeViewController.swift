//
//  HomeViewController.swift
//  PlanB
//
//  Created by Mac Mini 7 on 19/10/2024.
//

import UIKit

class HomeViewController: UIViewController  ,UITableViewDataSource,UITableViewDelegate {
    
    var sandwichs = ["Jambon Gruyere", "Emince Poulet Fondant", "Emince Boeuf Fondant", "Kebab Poulet", "Poulet Grille", "Rapido Jambon Fromage", "Rapido Thon", "Thon"]
    var prices = [6.2, 9.5, 7.8, 6.8, 6.8, 3.8, 3.8, 6.8]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sandwichs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
        let contentview = cell?.contentView
        let priceLabel = contentview?.viewWithTag(1) as! UILabel
        let sandwichLabel = contentview?.viewWithTag(2) as! UILabel
        let sandwichImage = contentview?.viewWithTag(3) as! UIImageView
        priceLabel.text = String(prices[indexPath.row])
        sandwichLabel.text = sandwichs[indexPath.row]

        sandwichImage.image = UIImage(named:  sandwichs[indexPath.row])
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "msegue" {
            let param = sender as! String
            let destination = segue.destination as! DetailViewController
            destination.sandwishName  = param
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = sandwichs[indexPath.row]
        performSegue(withIdentifier: "msegue", sender: movie)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveOnClickAction(_ sender: Any) {
        let data = ""
        performSegue(withIdentifier: "try", sender: data)
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
