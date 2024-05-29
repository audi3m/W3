//
//  SampleTableViewCell.swift
//  SeSAC0528
//
//  Created by J Oh on 5/28/24.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    // '타입' 프로퍼티. 인스턴스 만들지 않고 바로 사용
    static let identifier = "SampleTableViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var reviewImageView: UIImageView!
    
    // 처음에
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    // 재사용 셀 초기
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        reviewImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reviewImageView.layer.cornerRadius = reviewImageView.frame.width / 2
    }
    
    func configureLayout() {
        contentLabel.font = .boldSystemFont(ofSize: 15)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .brown
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.backgroundColor = .gray
        profileImageView.contentMode = .scaleAspectFill
        
        reviewImageView.backgroundColor = .gray
        reviewImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(_ data: Travel) {
        contentLabel.text = data.titleDescription
        
        if data.ad {
            backgroundColor = .yellow
        }
    }
    
}
