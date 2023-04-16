//
//  NewsInfoVC.swift
//  MyNews
//
//  Created by Keerthi Devipriya(kdp) on 16/04/23.
//

import UIKit

class NewsInfoVC: UIViewController {
    
    var infoModel: NewsInfoModel?
    
    lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Info"//infoModel
        getNewsInfoModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setUpTableView()
            self.setUpUI()
            self.setUpAutoLayout()
        }
        
    }
    
    func setUpUI() {
        view.addSubview(infoTableView)
    }
    
    func setUpTableView() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        //infoTableView.register(ItemInfoCell.self, forCellReuseIdentifier: ItemInfoCell.reuseIdentifier)
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "key")

    }
    
    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            infoTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            infoTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func getNewsInfoModel() {
        Api.getNewsInfo { news in
            self.infoModel = news
        }
    }
    
}

extension NewsInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoModel?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "key", for: indexPath) as? UITableViewCell else { return UITableViewCell() }
        let model = infoModel?.articles[indexPath.row]
        cell.textLabel?.text = model?.source.name
        //cell.backgroundColor = .red
        //cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* let strName = infoModel?.articles[indexPath.row].author ?? ""
        //getNewsInfo(strName)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigateToDetailVC()
        }*/
    }
        
}

extension NewsInfoVC {
    
    func navigateToDetailVC() {
        let vc = NewsInfoVC()
        vc.infoModel = infoModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
        


