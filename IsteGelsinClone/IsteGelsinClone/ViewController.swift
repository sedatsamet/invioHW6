//
//  ViewController.swift
//  IsteGelsinClone
//
//  Created by Sedat Samet Oypan on 7.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var buttonBildirim: UIButton!
    @IBOutlet weak var buttonAdresSecim: UIButton!
    @IBOutlet weak var buttonTeslimat: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kampanyalarCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var hexagonCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var kampanyaListesi:[String] = ["kampanya1","kampanya2","kampanya3","kampanya4","kampanya5","kampanya1","kampanya2","kampanya3","kampanya4","kampanya5"]
    
    var hexagonListesi = [HexagonKampanyaItem]()
    var categoryListesi = [CategoryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Page control initial value
        pageControl.currentPage = 0
        pageControl.numberOfPages = kampanyaListesi.count
        
        // Extensions
        allViewsAttributes()
        itemAppend()
        categoryCollectionViewDesign()
        
        kampanyalarCollectionView.delegate = self
        kampanyalarCollectionView.dataSource = self
        
        hexagonCollectionView.delegate = self
        hexagonCollectionView.dataSource = self
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        tabBarController?.delegate = self
        setupMiddleButton()
    }
}

// MARK: View Designs
extension ViewController {
    func allViewsAttributes() {
        companyNameLabel.font = UIFont(name: "CreHappiness", size: 15)!
        
        buttonBildirim.layer.cornerRadius = 0.5 * (buttonBildirim!.bounds.size.width)
        buttonBildirim.clipsToBounds = true
        
        let qrScannerImage = UIImage(named: "qr_code_scanner_icon")
        searchBar.setImage(qrScannerImage, for: .bookmark, state: .normal)
        searchBar.showsBookmarkButton = true
        
        buttonAdresSecim.tintColor = UIColor.black
        buttonAdresSecim.subtitleLabel?.tintColor = UIColor.darkGray
        buttonAdresSecim.layer.cornerRadius = 20
        buttonAdresSecim.clipsToBounds = true
        
        buttonTeslimat.tintColor = UIColor.black
        buttonTeslimat.subtitleLabel?.tintColor = UIColor.darkGray
        buttonTeslimat.layer.cornerRadius = 20
        buttonTeslimat.clipsToBounds = true

        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.selected.titleTextAttributes = [.font: UIFont(name: "CreHappiness", size: 18)!]
        tabBarItemAppearance.normal.titleTextAttributes = [.font: UIFont(name: "CreHappiness", size: 18)!]
        tabBarAppearance.shadowColor = UIColor.white
        tabBarAppearance.shadowImage = UIImage()
        tabBarAppearance.backgroundColor = UIColor.white
        tabBarItem.standardAppearance = tabBarAppearance
        tabBarItem.scrollEdgeAppearance = tabBarAppearance
    }
}
// MARK: - Custom Middle Button Design
extension ViewController : UITabBarControllerDelegate {
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 37
                                                  , y: -35, width: 70 , height: 70))
        middleButton.setBackgroundImage(UIImage(named: "middleButton"), for: .normal)
        
        middleButton.layer.cornerRadius = 30
        middleButton.layer.shadowOpacity = 0.05
        tabBarController?.tabBar.layer.shadowOpacity = 0.1
        
        tabBarController?.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(sepetButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    @objc func sepetButtonAction(sender:UIButton){
        self.tabBarController?.selectedIndex = 2
    }
}
// MARK: - Item Append Func to use in HexagonCollectionViewCell & CategoriesCollectionViewCell
extension ViewController {
    func itemAppend(){
        let hexItem1 = HexagonKampanyaItem(hexagonImageName: "indirimliUrunler", hexagonText: "İndirimli Ürünler")
        let hexItem2 = HexagonKampanyaItem(hexagonImageName: "sodexoIleOde", hexagonText: "Sodexo ile Öde")
        let hexItem3 = HexagonKampanyaItem(hexagonImageName: "yeniUrunler", hexagonText: "Yeni Ürünler")
        let hexItem4 = HexagonKampanyaItem(hexagonImageName: "uygunFiyat", hexagonText: "Uygun Fiyat")
        let hexItem5 = HexagonKampanyaItem(hexagonImageName: "bitiriyoruz", hexagonText: "Bitiriyoruz")
        let hexItem6 = HexagonKampanyaItem(hexagonImageName: "organik", hexagonText: "Organik")
        let hexItem7 = HexagonKampanyaItem(hexagonImageName: "glutensiz", hexagonText: "Glutensiz")
        let hexItem8 = HexagonKampanyaItem(hexagonImageName: "vegan", hexagonText: "Vegan")
        hexagonListesi.append(hexItem1)
        hexagonListesi.append(hexItem2)
        hexagonListesi.append(hexItem3)
        hexagonListesi.append(hexItem4)
        hexagonListesi.append(hexItem5)
        hexagonListesi.append(hexItem6)
        hexagonListesi.append(hexItem7)
        hexagonListesi.append(hexItem8)
        
        let categoryItem1 = CategoryItem(categoryImageName: "meyveSebze", categoryText: "Meyve, Sebze")
        let categoryItem2 = CategoryItem(categoryImageName: "etTavukBalik", categoryText: "Et, Tavuk, Balik")
        let categoryItem3 = CategoryItem(categoryImageName: "sutUrunleri", categoryText: "Süt Ürünleri")
        let categoryItem4 = CategoryItem(categoryImageName: "kahvaltilik", categoryText: "Kahvaltılık")
        let categoryItem5 = CategoryItem(categoryImageName: "temelGida", categoryText: "Temel Gıda")
        let categoryItem6 = CategoryItem(categoryImageName: "donukHazirGida", categoryText: "Donuk, Hazır Gıda")
        let categoryItem7 = CategoryItem(categoryImageName: "pastaVeMalzemeleri", categoryText: "Pasta ve Malzemeleri")
        let categoryItem8 = CategoryItem(categoryImageName: "firinPastane", categoryText: "Fırın, Pastane")
        let categoryItem9 = CategoryItem(categoryImageName: "dondurmaTatli", categoryText: "Dondurma, Tatlı")
        let categoryItem10 = CategoryItem(categoryImageName: "atistirmalik", categoryText: "Atıştırmalık")
        let categoryItem11 = CategoryItem(categoryImageName: "suIcecek", categoryText: "Su, İçecek")
        let categoryItem12 = CategoryItem(categoryImageName: "cayVeKahveDukkani", categoryText: "Çay ve Kahve Dükkanı")
        let categoryItem13 = CategoryItem(categoryImageName: "temizlikDeterjan", categoryText: "Temizlik, Deterjan")
        let categoryItem14 = CategoryItem(categoryImageName: "kisiselBakim", categoryText: "Kişisel Bakım")
        let categoryItem15 = CategoryItem(categoryImageName: "vitaminDermokozmetik", categoryText: "Vitamin, Dermokozmetik")
        let categoryItem16 = CategoryItem(categoryImageName: "bebek", categoryText: "Bebek")
        let categoryItem17 = CategoryItem(categoryImageName: "evcilDostlara", categoryText: "Evcil Dostlara")
        let categoryItem18 = CategoryItem(categoryImageName: "evYasam", categoryText: "Ev Yaşam")
        let categoryItem19 = CategoryItem(categoryImageName: "teknolojiOfis", categoryText: "Teknoloji, Ofis")
        let categoryItem20 = CategoryItem(categoryImageName: "kitapDergi", categoryText: "Kitap, Dergi")
        
        categoryListesi.append(categoryItem1)
        categoryListesi.append(categoryItem2)
        categoryListesi.append(categoryItem3)
        categoryListesi.append(categoryItem4)
        categoryListesi.append(categoryItem5)
        categoryListesi.append(categoryItem6)
        categoryListesi.append(categoryItem7)
        categoryListesi.append(categoryItem8)
        categoryListesi.append(categoryItem9)
        categoryListesi.append(categoryItem10)
        categoryListesi.append(categoryItem11)
        categoryListesi.append(categoryItem12)
        categoryListesi.append(categoryItem13)
        categoryListesi.append(categoryItem14)
        categoryListesi.append(categoryItem15)
        categoryListesi.append(categoryItem16)
        categoryListesi.append(categoryItem17)
        categoryListesi.append(categoryItem18)
        categoryListesi.append(categoryItem19)
        categoryListesi.append(categoryItem20)
    }
}
// MARK: - Pagecontrol -> Showing CurrentPage
extension ViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.kampanyalarCollectionView.frame.size.width
        pageControl.currentPage = Int(self.kampanyalarCollectionView.contentOffset.x) / Int(pageWidth)
    }
}
// MARK: - Collection Views
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.kampanyalarCollectionView {
            return kampanyaListesi.count
        }else if collectionView == self.hexagonCollectionView{
            return hexagonListesi.count
        }else {
            return categoryListesi.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.kampanyalarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kampanyaCell", for: indexPath) as! KampanyaCollectionViewCell
            cell.kampanyaImageView.image = UIImage(named: kampanyaListesi[indexPath.row])
            return cell
        }else if collectionView == self.hexagonCollectionView{
            let hexagonItem = hexagonListesi[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hexagonCell", for: indexPath) as! HexagonCollectionViewCell
            cell.hexagonImageView.image = UIImage(named: hexagonItem.hexagonImageName!)
            cell.hexagonLabel.text = hexagonItem.hexagonText
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
            let categoryItem = categoryListesi[indexPath.row]
            cell.categoryImageView.image = UIImage(named: categoryItem.categoryImageName!)
            cell.categoryNameLabel.text = categoryItem.categoryText
            return cell
        }
    }
}
// MARK: - Category CollectionView Design
extension ViewController {
    func categoryCollectionViewDesign(){
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        
        let ekranGenisligi = UIScreen.main.bounds.width
        let hucreGenisligi = (ekranGenisligi - 20) / 4
        // 4 item, kenarlar 3, ara boşluklar 4 -> (ekranGenisligi - 18) / 4
        tasarim.itemSize = CGSize(width: hucreGenisligi , height: hucreGenisligi * 1.3)
        categoriesCollectionView.backgroundColor = UIColor(named: "backgroundRenk2")
        categoriesCollectionView.collectionViewLayout = tasarim
    }
}


