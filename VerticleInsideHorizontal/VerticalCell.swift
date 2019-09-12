//
//  VerticalCell.swift
//  VerticleInsideHorizontal
//
//  Created by Elliot Glaze on 12/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class VerticalCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let verticalSubView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let sv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .red
        return sv
    }()
    
    func setupViews() {
        backgroundColor = .green
        
        addSubview(verticalSubView)
        verticalSubView.delegate = self
        verticalSubView.dataSource = self
        verticalSubView.register(InnerVerticalCell.self, forCellWithReuseIdentifier: cellId)
        
        verticalSubView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        verticalSubView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        verticalSubView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalSubView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InnerVerticalCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 50)
    }
}
