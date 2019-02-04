//
//  QuartoViewTable.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 21/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit
import FSPagerView

protocol verMais {
    func verMais()
}

class QuartoViewTable: UITableViewController, FSPagerViewDelegate, FSPagerViewDataSource, verMais {

    private let SEGUE_DESCRICAO = "segueToDescricaoQuarto"
    
    var quarto: Room?
    var imageViews: [CustomImageView] = []
    var pageControl: FSPageControl!
    var pageView: FSPagerView!
    var comodidadesTeste: [Comodidade] = []
    var nomesComodidades = ["Ar condicionado","Secador", "Chuveiro",  "Wi-fi"]
    var numerosComodidades = [1,9,16,71]
    //byParameter
    var viewModel: HoteisViewModel?
    var hotelEscolhido = 0
    var quartoEscolhido = 0
    var urlsImages: [String]? {
        didSet{
            if let urls = urlsImages{
                for url in urls{
                    let custom = CustomImageView()
                    custom.loadImageUsingUrlString(urlString: url)
                    imageViews.append(custom)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quarto = viewModel?.hoteis.value[hotelEscolhido].RoomTypes![quartoEscolhido]
        
        pageView = FSPagerView()
        view.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        let pageViewHeight = view.frame.width * 0.5625

        view.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: pageView)
        view.addConstraintsWithVisualFormat(format: "V:|[v0(\(pageViewHeight))]", views: pageView)
        
        pageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        pageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        pageView.dataSource = self
        pageView.delegate = self
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        pageControl = FSPageControl(frame: CGRect(x: (view.frame.width / 2) - 40, y: (view.frame.width * 0.5625) - 30, width: 80, height: 40))
        pageControl.numberOfPages = (urlsImages?.count)!
        
        for i in 0...3{
            var com = Comodidade()
            com.Code = String(numerosComodidades[i])
            com.Name = nomesComodidades[i]
            comodidadesTeste.append(com)
        }
        
        self.view.addSubview(pageControl)
    }
    
    func verMais() {
        performSegue(withIdentifier: SEGUE_DESCRICAO, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewDescricao
        vc.texto = viewModel?.hoteis.value[hotelEscolhido].RoomTypes![quartoEscolhido].Description
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageViews.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = imageViews[index].image
        pageControl.currentPage = index
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return view.frame.width * 0.5625
        case 1:
            return 100
        case 4:
            return 87
        default:
            return 150
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuartoInfo") as! CellQuartoInfo
            cell.lblNomeQuarto.text = viewModel?.hoteis.value[hotelEscolhido].RoomTypes![quartoEscolhido].Name
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuartoDescricao") as! CellQuartoDescricao
            cell.lblDescricaoQuarto.text = viewModel?.hoteis.value[hotelEscolhido].RoomTypes![quartoEscolhido].Description
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuartoComodidades") as! CellQuartoComodidades
            cell.comodidades = comodidadesTeste
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellEscolherQuarto") as! CellEscolherQuarto
            return cell
        default:
            return UITableViewCell()
        }
    }
}
