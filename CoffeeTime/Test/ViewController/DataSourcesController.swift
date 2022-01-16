//
//  DataSourcesController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/15.
//

import UIKit
import RxSwift
import RxCocoa

class DataSourcesController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        
        return tableView
    }()
    let disposeBag = DisposeBag()
    var dataSource: RxTableViewSectionedAnimatedDataSource<MySection>?
    
    var array = [DataSourcesModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.red
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        let result = btn.rx.tap.asObservable()
            .startWith(())
            .flatMapLatest(addContents)
            .share(replay: 1)
        
        dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(configureCell: { data, tableV, indexpath, item in
            let cell = UITableViewCell.cellWithTableView(tableView: tableV)
            cell.textLabel?.text = item.title
            return cell
        })
        
        result
            .bind(to: tableView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
        

        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func addContents() -> Observable<[MySection]> {
        let num = Int(arc4random())
        let model = DataSourcesModel.init(identity: 1, title: "\(num)", desc: "")
        array = [model]
        let observer = Observable.just([MySection(header: "", items: array)])
        return observer
    }

}

extension DataSourcesController: UIScrollViewDelegate, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
    
}
