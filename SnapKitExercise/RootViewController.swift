//  Created by Roman Cebula on 30/01/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import UIKit
import SnapKit

class RootViewController: UIViewController {
  
  let mainView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.6, alpha: 0.4)
    view.layer.cornerRadius = 20
    return view
  }()
  
  let subView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.layer.cornerRadius = 20
    return view
  }()
  
  let topView: UIView = {
    let topView = UIView()
    topView.backgroundColor = UIColor.red
    topView.layer.cornerRadius = 20
    return topView
  }()
  
  let bottomView: UIView = {
    let bottomView = UIView()
    bottomView.backgroundColor = UIColor.blue
    bottomView.layer.cornerRadius = 20
    return bottomView
  }()
  
  lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [topView,
                                                   bottomView])
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 20
    return stackView
  }()
  
  let nextVCButton: UIButton = {
    let nextVC = UIButton()
    nextVC.backgroundColor = .systemGray
    nextVC.layer.cornerRadius = 10
    nextVC.setTitle("NEXT VC", for: .normal)
    nextVC.tintColor = .black
    nextVC.addTarget(self, action: #selector(showNextVC), for: .touchUpInside)
    
    return nextVC
  }()
  
 @objc func showNextVC(){
    let nextVC = TableViewController()
  navigationController?.pushViewController(nextVC, animated: true)
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    setupViews()
  }

  func setup(){
    view.backgroundColor = .white
    title = "MyView"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func setupViews(){
    view.addSubview(mainView)
    mainView.addSubview(nextVCButton)
    mainView.addSubview(subView)
    subView.addSubview(mainStackView)
    
    mainView.snp.makeConstraints { (make) in
      make.topMargin.left.equalTo(20)
      make.bottomMargin.right.equalTo(-20)
    }
    
    nextVCButton.snp.makeConstraints { (make) in
      make.left.bottom.equalTo(10)
      make.right.bottom.equalTo(-10)
    }
    
    subView.snp.makeConstraints { (make) in
      make.width.height.equalTo(350)
      make.center.equalTo(self.mainView)
    }
    
    mainStackView.snp.makeConstraints { (make) in
      make.top.left.equalTo(20)
      make.right.bottom.equalTo(-20)
    }
  }

}

