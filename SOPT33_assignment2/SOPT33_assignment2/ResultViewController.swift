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
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "의정부시"
        label.font = .regular(size: 35)
        return label
    }()
    
    private var tempLabel : UILabel = {
        let label = UILabel()
        label.text = " 21º"
        label.font = .thin(size: 90)
        return label
    }()

    private var weatherLabel : UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = .regular(size: 25)
        return label
    }()
    
    private var maxminLabel : UILabel = {
        let label = UILabel()
        label.text = "최고:29º 최저:25º"
        label.font = .regular(size: 20)
        return label
    }()
    
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
    }
    
    @objc func buttonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    //기본 레이아웃
    func setLayout() {
        view.addSubview(backgroundView)
        view.addSubview(scrollView1)
        
        scrollView1.backgroundColor = .clear
        scrollView1.addSubview(contentView)
        contentView.backgroundColor = .clear

        scrollView2.showsHorizontalScrollIndicator = false //가로 스크롤 라인 false로 바꿈 

        [backgroundView, scrollView1, scrollView2, contentView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //배경화면 레이아웃 잡기
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
        
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
        descriptView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            locationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tempLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            tempLabel.heightAnchor.constraint(equalToConstant: 100),
            
            weatherLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5),
            weatherLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxminLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            maxminLabel.heightAnchor.constraint(equalToConstant: 25),
            
            descriptView.topAnchor.constraint(equalTo: maxminLabel.bottomAnchor, constant: 50),
            descriptView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            descriptView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            descriptView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-32),
            descriptView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
    }
    
    
    func detailLayout() {
        [descriptLabel, divideView, detailStackView].forEach {
            descriptView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

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
        
        detailStackView.addArrangeSubViews(firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView, sixthStackView)
    }


    func stackLayout() {
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
    
    
    func bottomLayout() {
        view.addSubview(bottomdivideView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangeSubViews(currentImage, dotImage)
        view.addSubview(mapImage)
        view.addSubview(menuButton)
        
        [bottomdivideView, bottomStackView, mapImage, currentImage, dotImage, menuButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            bottomdivideView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            bottomdivideView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomdivideView.heightAnchor.constraint(equalToConstant: 0.5),
            bottomdivideView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            bottomStackView.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 10),
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapImage.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            mapImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            menuButton.topAnchor.constraint(equalTo: bottomdivideView.bottomAnchor, constant: 2),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
