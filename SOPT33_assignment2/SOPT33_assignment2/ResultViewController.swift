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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = .regular(size: 35)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tempLabel : UILabel = {
        let label = UILabel()
        label.text = " 21º"
        label.font = .thin(size: 90)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var weatherLabel : UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = .regular(size: 25)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var maxminLabel : UILabel = {
        let label = UILabel()
        label.text = "최고:29º 최저:25º"
        label.font = .regular(size: 20)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var descriptLabel : UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한\n때 흐린 상태가 예상됩니다. "
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .regular(size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var time1Label : UILabel = {
        let label = UILabel()
        label.text = "Now"
        label.font = .medium(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var time2Label : UILabel = {
        let label = UILabel()
        label.text = "10시"
        label.font = .medium(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var time3Label : UILabel = {
        let label = UILabel()
        label.text = "11시"
        label.font = .medium(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var time4Label : UILabel = {
        let label = UILabel()
        label.text = "12시"
        label.font = .medium(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var time5Label : UILabel = {
        let label = UILabel()
        label.text = "1시"
        label.font = .medium(size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weather1Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var weather2Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "drizzle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    private var weather3Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "rain")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var weather4Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "thunder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var weather5Image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sunshower")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var temp1Label : UILabel = {
        let label = UILabel()
        label.text = "21º"
        label.font = .medium(size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var temp2Label : UILabel = {
        let label = UILabel()
        label.text = "21º"
        label.font = .medium(size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var temp3Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        label.font = .medium(size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var temp4Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        label.font = .medium(size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var temp5Label : UILabel = {
        let label = UILabel()
        label.text = "19º"
        label.font = .medium(size: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Now, cloud, 21
    private var firstStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.backgroundColor = .clear
        stackview.alignment = .center   //가운데 정렬
        stackview.distribution = .fillEqually
        stackview.isUserInteractionEnabled = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    // 10시, drizzle, 21
    private var secondStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.backgroundColor = .clear
        stackview.alignment = .center   //가운데 정렬
        stackview.distribution = .fillEqually
        stackview.isUserInteractionEnabled = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    // 11시, rain, 19
    private var thirdStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.backgroundColor = .clear
        stackview.alignment = .center   //가운데 정렬
        stackview.distribution = .fillEqually
        stackview.isUserInteractionEnabled = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    // 12시, thunder, 19
    private var fourthStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.backgroundColor = .clear
        stackview.alignment = .center   //가운데 정렬
        stackview.distribution = .fillEqually
        stackview.isUserInteractionEnabled = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    // 1시, sunshower, 19
    private var fifthStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.backgroundColor = .clear
        stackview.alignment = .center   //가운데 정렬
        stackview.distribution = .fillEqually
        stackview.isUserInteractionEnabled = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    
    private var detailStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.backgroundColor = .clear
        stackview.distribution = .equalSpacing
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()

    private let divideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomdivideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //하단
    private var mapImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "map")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var currentImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "current")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var dotImage: UIImageView = {
       let imageView = UIImageView()
        
        imageView.image = #imageLiteral(resourceName: "other")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var menuButton : UIButton = {
        let button  = UIButton()
        //imageView.image = #imageLiteral(resourceName: "list")
        button.setImage(UIImage(named: "pre"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var bottomStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.backgroundColor = .clear
        stackview.isUserInteractionEnabled = true
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        weatherInfoLayout()
        detailLayout()
        stackLayout()
        bottomLayout()

    }
    
    @objc func buttonPressed() {
        let firstVC = ViewController()
        print("button pressed")
        //self.navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(firstVC, animated: true)
    }
    
    //기본 레이아웃
    func setLayout() {
        view.addSubview(backgroundView)
        view.addSubview(scrollView1)
        
        scrollView1.backgroundColor = .clear
        scrollView1.addSubview(contentView)
        contentView.backgroundColor = .clear
        
        
        scrollView1.translatesAutoresizingMaskIntoConstraints = false
        scrollView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView1.alwaysBounceVertical = true //세로 스크롤이 콘텐츠뷰의 끝에 도달할 때 튀어 오르기가 항상 발생하는지를 결정하는 부울 값
        scrollView1.showsVerticalScrollIndicator = true //세로 스크롤 바 표시 여부를 제어하는 부울 값
        
        scrollView2.alwaysBounceHorizontal = true //가로 스크롤
        scrollView2.showsHorizontalScrollIndicator = true //가로 스크롤

        
        
        //배경화면 레이아웃 잡기
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
        
        //스크롤뷰
        NSLayoutConstraint.activate([
            scrollView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView1.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView1.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView1.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView1.bottomAnchor)
        ])
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultHigh
        contentViewHeight.isActive = true
        

    }
    
    func weatherInfoLayout() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(maxminLabel)
        contentView.addSubview(descriptView)
        
        
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tempLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 100),
            
            weatherLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5),
            weatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weatherLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxminLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            maxminLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            maxminLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            maxminLabel.heightAnchor.constraint(equalToConstant: 25),
            
            descriptView.topAnchor.constraint(equalTo: maxminLabel.bottomAnchor, constant: 50),
            descriptView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            descriptView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            descriptView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-32),
            descriptView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
    }
    
    
    func detailLayout() {
        [descriptLabel, divideView].forEach {
            descriptView.addSubview($0)}

        NSLayoutConstraint.activate([
            descriptLabel.topAnchor.constraint(equalTo: descriptView.topAnchor, constant: 5),
            descriptLabel.leadingAnchor.constraint(equalTo: descriptView.leadingAnchor, constant: 10),
            descriptLabel.trailingAnchor.constraint(equalTo: descriptView.trailingAnchor, constant: -10),
      
            divideView.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor, constant: 10),
            divideView.leadingAnchor.constraint(equalTo: descriptView.leadingAnchor, constant: 10),
            divideView.trailingAnchor.constraint(equalTo: descriptView.trailingAnchor, constant: -10),
            divideView.heightAnchor.constraint(equalToConstant: 1),
            

            
        ])
        
        scrollView2.addSubview(detailStackView)
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: scrollView2.topAnchor),
            detailStackView.leadingAnchor.constraint(equalTo: scrollView2.leadingAnchor, constant: 10),
            detailStackView.trailingAnchor.constraint(equalTo: scrollView2.trailingAnchor, constant: -10),
            detailStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        detailStackView.addArrangeSubViews(firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView)
        

 
    }

    
    
    
    func stackLayout() {
        scrollView1.addSubview(scrollView2)
        scrollView2.showsHorizontalScrollIndicator = true
        scrollView2.alwaysBounceVertical = true
        scrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        firstStackView.addArrangeSubViews(time1Label, weather1Image, temp1Label)
        secondStackView.addArrangeSubViews(time2Label, weather2Image, temp2Label)
        thirdStackView.addArrangeSubViews(time3Label, weather3Image, temp3Label)
        fourthStackView.addArrangeSubViews(time4Label, weather4Image, temp4Label)
        fifthStackView.addArrangeSubViews(time5Label, weather5Image, temp5Label)

        NSLayoutConstraint.activate([
            scrollView2.topAnchor.constraint(equalTo: divideView.bottomAnchor, constant: 10),
            scrollView2.centerXAnchor.constraint(equalTo: descriptView.centerXAnchor),
            //scrollView2.trailingAnchor.constraint(equalTo: scrollView1.trailingAnchor),
            scrollView2.heightAnchor.constraint(equalToConstant: 212),
            scrollView2.widthAnchor.constraint(equalToConstant: 335)
        ])
    }
    
    
    func bottomLayout() {
        
        view.addSubview(bottomdivideView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangeSubViews(mapImage, currentImage, dotImage, menuButton)
        
        NSLayoutConstraint.activate([
            bottomdivideView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bottomdivideView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomdivideView.heightAnchor.constraint(equalToConstant: 0.5),
            bottomdivideView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            bottomStackView.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            bottomStackView.leadingAnchor.constraint(equalTo: bottomdivideView.leadingAnchor, constant: 5),
            //bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        ])
        
    }
    
    
}




extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}


