//
//  ResultViewController.swift
//  SOPT33_assignment2
//
//  Created by Gahyun Kim on 2023/10/16.
//
import UIKit

class ResultViewController: UIViewController {

    private let scrollView1 = UIScrollView()
    private let scrollView2 = UIScrollView()
    private var contentView = UIImageView()

    private var backgroundView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "background")
        return imageView
    }()

    private var locationLabel = UILabel()
    private var tempLabel = UILabel()
    private var weatherLabel = UILabel()
    private var maxminLabel = UILabel()
    

    private var descriptView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        view.layer.cornerRadius = 20
        return view
    }()

    private var descriptLabel : UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한\n때 흐린 상태가 예상됩니다. "
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .regular(size: 19)
        return label
    }()

    private var time1Label : UILabel = {
        let label = UILabel()
        label.text = "Now"
        return label
    }()

    private var time2Label : UILabel = {
        let label = UILabel()
        label.text = "10시"
        return label
    }()

    private var time3Label : UILabel = {
        let label = UILabel()
        label.text = "11시"
        return label
    }()

    private var time4Label : UILabel = {
        let label = UILabel()
        label.text = "12시"
        return label
    }()

    private var time5Label : UILabel = {
        let label = UILabel()
        label.text = "1시"
        return label
    }()

    private var time6Label : UILabel = {
        let label = UILabel()
        label.text = "7시"
        return label
    }()


    private var weather1Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cloud")
        return imageView
    }()

    private var weather2Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "drizzle")
         return imageView
    }()

    private var weather3Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "rain")
        return imageView
    }()

    private var weather4Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "thunder")
        return imageView
    }()

    private var weather5Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sunshower")
        return imageView
    }()

    private var weather6Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "rain")
        return imageView
    }()

    private var temp1Label : UILabel = {
        let label = UILabel()
        label.text = "21º"
        return label
    }()

    private var temp2Label : UILabel = {
        let label = UILabel()
        label.text = "21º"
        return label
    }()

    private var temp3Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        return label
    }()

    private var temp4Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        return label
    }()

    private var temp5Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        return label
    }()

    private var temp6Label : UILabel = {
        let label = UILabel()
        label.text = "15º"
        return label
    }()

    private var firstStackView = UIStackView()   // Now, cloud, 21
    private var secondStackView = UIStackView()  // 10시, drizzle, 21/
    private var thirdStackView = UIStackView()   // 11시, rain, 19
    private var fourthStackView = UIStackView()  // 12시, thunder, 19
    private var fifthStackView = UIStackView()   // 1시, sunshower, 19
    private var sixthStackView = UIStackView()   // 7시, rain, 15

    private var detailStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.backgroundColor = .clear
        stackview.distribution = .equalSpacing
        stackview.spacing = 7
        return stackview
    }()

    private let divideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return view
    }()

    private let bottomdivideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return view
    }()

    //하단
    private var mapImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "map")
        return imageView
    }()

    private var currentImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "current")
        return imageView
    }()

    private var dotImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "other")
        return imageView
    }()

    private lazy var menuButton : UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "pre"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private var bottomStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.backgroundColor = .clear
        stackview.isUserInteractionEnabled = true
        stackview.spacing = 10
        return stackview
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        weatherInfoLayout()
        detailLayout()
        stackLayout()
        bottomLayout()
        
        setcollectionLayout()
        setCollectionViewLayout()
        setCollectionViewConfig()
    }

    @objc func buttonPressed() {
        navigationController?.popViewController(animated: true)
    }

    //기본 레이아웃
    private func setLayout() {
        view.addSubview(backgroundView)
        view.addSubview(scrollView1)

        scrollView1.backgroundColor = .clear
        scrollView1.addSubview(contentView)
        contentView.backgroundColor = .clear

        scrollView2.showsHorizontalScrollIndicator = false //가로 스크롤 라인 false로 바꿈

        [backgroundView, scrollView1, scrollView2, contentView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        backgroundView.snp.makeConstraints {
            $0.centerX.centerY.width.height.equalToSuperview()
        }
        
        scrollView1.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalTo(scrollView1)
            $0.height.greaterThanOrEqualTo(view).priority(.high) //?
            
        }
    }


    private func weatherInfoLayout() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(maxminLabel)
        
        contentView.addSubview(descriptView)

        [locationLabel, tempLabel, weatherLabel, maxminLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.backgroundColor = .clear
            $0.textAlignment = .center
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        }

        setFont(label: locationLabel, fonttype: "SFProDisplay-Regular", size: 35, text: "의정부시")
        setFont(label: tempLabel, fonttype: "SFProDisplay-Thin", size: 90, text: "21º")
        setFont(label: weatherLabel, fonttype: "SFProDisplay-Regular", size: 25, text: "흐림")
        setFont(label: maxminLabel, fonttype: "SFProDisplay-Regular", size: 20, text: "최고:29º 최저:25º")

        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(50)
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).inset(5)
        }
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).inset(5)
        }
        maxminLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(5)
        }
        
        //시간 별 날씨 정보 박스
        descriptView.snp.makeConstraints {
            $0.top.equalTo(maxminLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(contentView).inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width-32)
            $0.height.equalTo(220)
        }
    }


    private func detailLayout() {
        [descriptLabel, divideView, detailStackView].forEach {
            descriptView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        descriptLabel.snp.makeConstraints {
            $0.top.equalTo(descriptView.snp.top).inset(10)
            $0.leading.equalTo(descriptView.snp.leading).inset(15)
            $0.trailing.equalTo(descriptView.snp.trailing).inset(10)
        }
        
        divideView.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.bottom).inset(-10)
            $0.leading.equalTo(descriptView.snp.leading).inset(10)
            $0.trailing.equalTo(descriptView.snp.trailing).inset(10)
            $0.height.equalTo(1)
        }
        
        scrollView2.addSubview(detailStackView)
        
        detailStackView.snp.makeConstraints {
            $0.top.equalTo(scrollView2.snp.top)
            $0.leading.equalTo(scrollView2.snp.leading).inset(10)
            $0.trailing.equalTo(scrollView2.snp.trailing).inset(10)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }

        detailStackView.addArrangeSubViews(firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView, sixthStackView)
    }


    private func stackLayout() {
        [weather1Image, weather2Image, weather3Image, weather4Image, weather5Image, weather6Image].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        [time1Label, time2Label, time3Label, time4Label, time5Label, time6Label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }

        [temp1Label, temp2Label, temp3Label, temp4Label, temp5Label, temp6Label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .medium(size: 21)
            $0.textColor = .white
        }


        [firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView, sixthStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.backgroundColor = .clear
            $0.alignment = .center
            $0.distribution = .fillEqually
            $0.isUserInteractionEnabled = true
        }

        scrollView1.addSubview(scrollView2)

        firstStackView.addArrangeSubViews(time1Label, weather1Image, temp1Label)
        secondStackView.addArrangeSubViews(time2Label, weather2Image, temp2Label)
        thirdStackView.addArrangeSubViews(time3Label, weather3Image, temp3Label)
        fourthStackView.addArrangeSubViews(time4Label, weather4Image, temp4Label)
        fifthStackView.addArrangeSubViews(time5Label, weather5Image, temp5Label)
        sixthStackView.addArrangeSubViews(time6Label, weather6Image, temp6Label)

        NSLayoutConstraint.activate([
            scrollView2.topAnchor.constraint(equalTo: divideView.bottomAnchor, constant: 10),
            scrollView2.centerXAnchor.constraint(equalTo: descriptView.centerXAnchor),
            scrollView2.heightAnchor.constraint(equalToConstant: 212),
            scrollView2.widthAnchor.constraint(equalToConstant: 335)
        ])
    }
    
    private func setcollectionLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(descriptView.snp.bottom).offset(20)
            $0.height.equalTo(600)
            $0.bottom.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView).inset(20)
        }
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) , height: (UIScreen.main.bounds.width - 6) / 10)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }

    private func setCollectionViewConfig() {
        self.collectionView.register(DayWeatherCollectionViewCell.self,
                                         forCellWithReuseIdentifier: DayWeatherCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.isScrollEnabled = false
        $0.layer.backgroundColor = UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 0.2).cgColor
        $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 0.5
    }
    
    
    //하단 바
    private func bottomLayout() {
        view.addSubview(bottomdivideView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangeSubViews(currentImage, dotImage)
        view.addSubview(mapImage)
        view.addSubview(menuButton)

        [bottomdivideView, bottomStackView, mapImage, currentImage, dotImage, menuButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }


        bottomdivideView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height-100)
            $0.height.equalTo(0.5)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }

        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 10),
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mapImage.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            mapImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            menuButton.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setFont(label: UILabel, fonttype: String, size: CGFloat, text: String){
        label.font = UIFont(name: fonttype, size: size)
        label.text = text
    }
    
        
}

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}


extension ResultViewController: UICollectionViewDelegate {}
extension ResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DayweatherList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCollectionViewCell.identifier,
                                                            for: indexPath) as? DayWeatherCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: DayweatherList[indexPath.row])
        return item
    }
}
