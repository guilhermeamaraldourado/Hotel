//
//  HoteisViewCollection.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 12/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class HoteisViewCollection: UIViewController {
    
    @IBOutlet weak var collectionHoteis: UICollectionView!
    var viewModel = HoteisViewModel()
    private var SEGUE_HOTEL = "segueToHotel"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
}

extension HoteisViewCollection: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: SEGUE_HOTEL, sender: self)
    }
}

extension HoteisViewCollection: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.hoteis.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionHoteis.dequeueReusableCell(withReuseIdentifier: "cellHotelCollection", for: indexPath) as! CellHotelCollection
        cell.hotelName.text = viewModel.hoteis.value[indexPath.row].Name
        cell.hotelImage.image = UIImage(named: "hotel")
        return cell
    }
}

extension HoteisViewCollection: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: view.frame.width - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 16)
    }
    
}