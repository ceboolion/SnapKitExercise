//  Created by Roman Cebula on 04/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import UIKit
import SnapKit

class TableViewController: UIViewController {
    
  let tableView: UITableView = {
    let table = UITableView()
    table.rowHeight = 100
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    setupViews()
  }

  
  func setup(){
    view.backgroundColor = .white
  }
  
  func setupViews(){
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.customCell)
    view.addSubview(tableView)
    tableView.snp.makeConstraints { (make) in
      make.edges.equalTo(self.view)
    }
  }
}

class CustomCell: UITableViewCell {
  
  static var customCell = "cell"
  
  let customImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "duvell.jpg")!
    imageView.contentMode = .scaleAspectFit
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 20
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: CustomCell.customCell)
    self.backgroundColor = .systemBlue
    setup()
  }
  
  func setup(){
    self.addSubview(customImage)
    customImage.snp.makeConstraints { (make) in
      make.top.right.equalTo(15)
      make.bottom.left.equalTo(-15)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.customCell, for: indexPath) as! CustomCell
    return cell
  }
}
