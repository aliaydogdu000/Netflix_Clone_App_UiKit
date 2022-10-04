//
//  TitleTableViewCell.swift
//  Netflix Clone App
//
//  Created by Ali Aydoğdu on 4.10.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlesPosterUIimageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIimageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
        
    }
    
    private func applyConstraints(){
        let titlesPosterUIimageViewConstraints = [
            titlesPosterUIimageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIimageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            titlesPosterUIimageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            titlesPosterUIimageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIimageView.trailingAnchor,constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIimageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: model.posterURL) else {
            return
        }
        titlesPosterUIimageView.sd_setImage(with: url,completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
