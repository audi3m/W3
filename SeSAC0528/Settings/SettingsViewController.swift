//
//  SettingsViewController.swift
//  SeSAC0528
//
//  Created by J Oh on 5/28/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(title: "설정 화면")
        
        
        
    }
    

    @IBAction func presentModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Settings", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: BrownViewController.id) as! BrownViewController
        
        // 3. 화면 띄우기
        present(vc, animated: true)
        
    }
    
    
    @IBAction func presentFullScreenModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Settings", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: BrownViewController.id) as! BrownViewController
        
        // 2-1. full screen 전환 효과 주기
        // full screen은 dismiss 직접 구현 필요
        vc.modalPresentationStyle = .fullScreen
        
        // modalTransitionStyle은 modalPresentationStyle에 따라 동작이 안되거나 런타임 이슈가 발생할 수 있음
        // modalTransitionStyle은 push 방식과 무관
        vc.modalTransitionStyle = .crossDissolve
        
        // 3. 화면 띄우기
        present(vc, animated: true)
        
    }
    
    @IBAction func presentNavigationModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Settings", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: BrownViewController.id) as! BrownViewController
        // nav에 따름
//        vc.modalPresentationStyle = .fullScreen
        
        // 2-1. 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        // 3. 화면 띄우기 - 타이틀 나옴. 여전히 present
        present(nav, animated: true)
        
    }
    
    @IBAction func pushModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Settings", bundle: nil)
        
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: BrownViewController.id) as! BrownViewController
        
        // 3. 화면 띄우기(방식)
        // 네비게이션 컨트롤러 없으면 아무일도 안 일어남. 옵셔널이라서 꺼지지는 않음
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}


