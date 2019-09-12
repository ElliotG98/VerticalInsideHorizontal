//
//  HorizontalCell.swift
//  VerticleInsideHorizontal
//
//  Created by Elliot Glaze on 12/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class HorizontalCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let horizontalSubView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let sv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        sv.backgroundColor = .blue
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    func setupViews() {
        backgroundColor = .red
        addSubview(horizontalSubView)
        
        horizontalSubView.dataSource = self
        horizontalSubView.delegate = self
        horizontalSubView.register(VerticalCell.self, forCellWithReuseIdentifier: cellId)
        
        horizontalSubView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalSubView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizontalSubView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = horizontalSubView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VerticalCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
}
