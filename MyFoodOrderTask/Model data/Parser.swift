//
//  Parser.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 07.10.23.
//

import Foundation
class Parser{
    
    func parseJsonFile (  completion: ( ( [FoodCategory] )  ->Void  )  ) {
        if let file = Bundle.main.url(forResource: "FoodMenu", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: file)
                let items = try JSONDecoder().decode([FoodCategory].self, from: data)
                completion(items)
                
            }
            catch{
                print(error.localizedDescription)
            }
            
            
        }
        
    }
    
}
