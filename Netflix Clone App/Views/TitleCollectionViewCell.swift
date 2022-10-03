//
//  TitleCollectionViewCell.swift
//  Netflix Clone App
//
//  Created by Ali Aydoğdu on 1.10.2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        
    }
    
    public func configure(with model : String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return}
        posterImageView.sd_setImage(with: url,completed: nil)
    }
}
