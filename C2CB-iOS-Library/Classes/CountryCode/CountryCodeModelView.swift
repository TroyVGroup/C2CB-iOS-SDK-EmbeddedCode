//
//  CountryCodeModelView.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 14/12/23.
//

import Foundation
protocol countryViewDelegate{
    func getCountryDetails(countryCode:String,countryName:String,code:String,countryId:String)
}
open class ContryCodeModelView{
    var countryCodeVC:CountryCodeViewController?
    var countriesArray = [Countries]()
    func getAllCountriesApiCalling(){
        API.get(Endpoint: .getAllCountries, parameter: nil, completion: {(response , error) in
            if let error = error{
               // Toast.showAlertMessage(message: error, alertType: .error)
                //self.addNewContact?.showAlert(title: "Error", message: error)
                showAlert(title: "Error", message: error, view: self.countryCodeVC ?? UIViewController())
                return
            }
           // self.countriesArray.removeAll()
            if let countries = response!["countries"],
            let data = Constant.jsonToData(json: countries),
                let mode = try? JSONDecoder().decode([Countries].self, from: data){
                self.countriesArray.append(contentsOf: mode)
                DispatchQueue.main.async {
                    self.countryCodeVC?.countryTableView.reloadData()
                  //  self.getchannelMode(channel_id: "657b0f55632f4ca91909ce0e")
                }
               
//                for value in mode{
//                    openAllCountriesDatabse(country: value.country ?? "", code: value.code ?? "", isocode: value.isocode ?? "", id: value.id ?? "")
//                }
                //openAllCountriesDatabse(country: mode.country, code: mode.code, isocode: mode.isocode, id: mode.id)
                    //recentTbl.reloadData()
                }
            //print("Response",response)
           
            
        })

    }
    
    
    
    func getchannelMode(channel_id:String){
        API.get(Endpoint: .getChannelMode, parameter: channel_id, completion: {(response , error) in
            if let error = error{
                // Toast.showAlertMessage(message: error, alertType: .error)
                //self.addNewContact?.showAlert(title: "Error", message: error)
                showAlert(title: "Error", message: error, view: self.countryCodeVC ?? UIViewController())
                return
            }
            print("Channel_Response:::::::::::::",response)

            
        })
    }
}
