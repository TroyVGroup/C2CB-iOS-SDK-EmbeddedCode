//
//  CountryCodeViewController.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 13/12/23.
//

import Foundation
open class CountryCodeViewController:UIViewController{
    let containerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 15
        return containerView
    }()
    let cancelButton: UIButton = {
        let cancelBtn = UIButton(type: .system)
        let image = Constant.getImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        cancelBtn.setImage(image, for: .normal)
        cancelBtn.contentMode = .scaleAspectFit
        return cancelBtn
    }()
    
    let searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        //searchBar.delegate = self
        searchBar.placeholder = "Search"
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.doneButtonAction()
        } else {
            // Fallback on earlier versions
        }
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .white
        searchBar.barTintColor = .white
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.cornerRadius = 8
        return searchBar
    }()
    let countryTableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var country_model = ContryCodeModelView()
    var countryDetails : countryViewDelegate?
    var searchCountryActive : Bool = false
    var clickSearchCountryCancelBtn : Bool = false
    var filtter_fetch_all_countries : [Countries]?
    var temp = 0
    func setupViews(){
        //MARK: - Container
        view.addSubview(containerView)
        print("screenSize.width-40",containerView.bounds.size.width)
        print("screenSize.height-40",containerView.bounds.size.height)
        containerView.backgroundColor = .gray
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //MARK: - cancel Button
        containerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        containerView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: cancelButton.topAnchor, constant: 40).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        containerView.addSubview(countryTableView)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        countryTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 10).isActive = true
        countryTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
        countryTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20).isActive = true
        countryTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20).isActive = true
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        countryTableView.delegate = self
        countryTableView.dataSource = self
        country_model.countryCodeVC = self
        searchBar.delegate = self
        //country_model.registerTableCell()
        countryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        country_model.getAllCountriesApiCalling()
        countryTableView.reloadData()
    }
    
    @objc private func dismissSubView(){
        dismiss(animated: true)
        print("dismissSubView")
        
    }
}
extension CountryCodeViewController:UITableViewDelegate{
   
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell :Countries?
        if(searchCountryActive) {
            cell =  filtter_fetch_all_countries?[indexPath.row]
        }else{
            cell = country_model.countriesArray[indexPath.row]
        }
        countryDetails?.getCountryDetails(countryCode:cell?.countryCode ?? "",countryName:cell?.country ?? "",code:cell?.code ?? "",countryId:cell?.id ?? "")
        dismiss(animated: true)
    }
}
extension CountryCodeViewController:UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchCountryActive) {
            return filtter_fetch_all_countries?.count ?? 0
        }else{
            return country_model.countriesArray.count
        }
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item :Countries?
        if(searchCountryActive) {
            item =  filtter_fetch_all_countries?[indexPath.row]
        }else{
            item = country_model.countriesArray[indexPath.row]
        }
        cell.textLabel?.text = (item?.code ?? "") + " " + (item?.country ?? "")
        return cell
    }
}
extension CountryCodeViewController : UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 1 {
            print("favouriteModel")
            temp = 1
            searchBar.resignFirstResponder()
        }
        filtter_fetch_all_countries = country_model.countriesArray.filter({ (text) -> Bool in
            let country_fullName = text.country?.capitalized
            let code = text.code
            
            //Create a range for both
            
            let range1 = country_fullName?.range(of: searchText,options: .caseInsensitive)
            let range2 = code?.range(of: searchText,options: .caseInsensitive)
            // print("THIS IS TEXT \(text)")
            //Return true if either match
            return range1 != nil || range2 != nil
        })
        if(filtter_fetch_all_countries?.count == 0){
            if searchBar.text == ""{
                searchCountryActive = false;
            }else{
                searchCountryActive = true;
            }
        } else {
            searchCountryActive = true;
            
        }
        self.countryTableView.reloadData()
    }
    
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        if temp == 0
        {
            searchCountryActive = true;
        }else
        {
            searchCountryActive = false;
        }
        
        
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        if clickSearchCountryCancelBtn == true{
            clickSearchCountryCancelBtn = false
            searchCountryActive = false;
        }else{
            searchCountryActive = true;
        }
        // searchfavouritesActive = false;
        searchBar.endEditing(true)
        searchBar.resignFirstResponder()
        // checkModular()
        countryTableView.reloadData()
        
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchCountryActive = false;
        clickSearchCountryCancelBtn = true
        searchBar.text = ""
        
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchCountryActive = false;
    }
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
}
