//
//  HomeViewController.swift
//  SeSAC0528
//
//  Created by J Oh on 5/28/24.
//

import UIKit

/*
 1. tableView 아웃렛 선언
 2. UITableViewDelegate, UITableViewDataSource 호출
 3. delegate = self, dataSource = self
 */

class HomeViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    
    @IBOutlet var firstFilterButton: UIButton!
    @IBOutlet var secondFilterButton: UIButton!
    @IBOutlet var thirdFilterButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    // stackView도 lazy.
    // lazy 나중에 초기화. 부르는 시점이 같아서 lazy로 차이를 둠
    lazy var buttonList = [firstFilterButton, secondFilterButton, thirdFilterButton]
    
    let list = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(title: "홈 화면")
        configureTableView()
    }
    
}

// MARK: HomeViewController UITableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    // 움직일 때 다시 그려짐 -> 비율계산이 나중에 됨
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for: indexPath) as! SampleTableViewCell
        cell.configureCell(list[indexPath.row])
        return cell
    }
    
    // 셀 클릭??
    // print, delegate, dataSource = self
    // 연결 확인,
    // 클릭되는 컨트롤이 위에 있는지
    // 제스처 중첩: 클릭+제스처
    // 터치 됨. tableView.delegate의 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        if data.ad {
            // 1. 스토리보드 가져오기(다른 파일에 있을 때)
            let sb = UIStoryboard(name: "Settings", bundle: nil)
            
            // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
            let vc = sb.instantiateViewController(withIdentifier: BrownViewController.id) as! BrownViewController
            
            // 3. 화면 띄우기
            present(vc, animated: true)
            
        } else {
            // 같은 스토리보드 파일 내에 VC로 전환할 때
            let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.id) as! DetailViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        // selection 없애기
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
}
 
// MARK: UI Configuration
extension HomeViewController {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
        
    }
}
