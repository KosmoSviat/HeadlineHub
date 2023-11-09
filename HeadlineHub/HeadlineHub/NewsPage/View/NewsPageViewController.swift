//
//  NewsPageViewController.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 9.08.2023.
//

import UIKit
import SnapKit

final class NewsPageViewController: UIViewController {
    
    //MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let textView = UILabel()
        textView.font = .systemFont(ofSize: 16)
        textView.numberOfLines = 0
        return textView
    }()
    
    // MARK: - Properties
    private let viewModel: NewsPageViewModelProtocol
    let mockTitle = "New teaser"
    let mockDate = "17.01.2023"
    let mockDescription = """
Стриминговый сервис компании Amazon Prime Video выпустил первый тизер второго сезона супергеройского мультсериала «Неуязвимый». Ролик опубликован 22 июля на канале компании в YouTube, сообщает портал Collider.

В видео напомнили о главных героях анимационного сериала и представили новых. Так, в мультфильме появится Атом Ева, которую озвучит актриса Джиллиан Джейкобс.

Эпизод назван «Непобедимый атомный канун». В нем рассказывается, как персонаж получил свои силы и стал героем. Оказалось, что Ева была создана как правительственное оружие, которым манипулировали.

Первая половина эпизодов будет показана на Amazon Prime Video 3 ноября. Вторая станет доступна в начале 2024 года.

«Неуязвимый» рассказывает историю обычного школьника Марка Грейсона, отец которого — самый могущественный супергерой на Земле. Когда юноша обнаруживает, что у него тоже есть суперсилы, он начинает тренировки с отцом и выясняет, что его родственник совсем не тот, кем хочет казаться.

Первый сезон мультсериала вышел весной 2021 года и стал одной из самых высокооцененных премьер в истории Amazon.

В мае онлайн-кинотеатр Hulu показал тизер восьмого сезона мультсериала «Футурама». Первый раз «Футурама» была показана широкой аудитории в 1999 году на телеканале Fox.
"""
    
    // MARK: - Life cycle
    init(viewModel: NewsPageViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData, let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "MyImage")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(5)
            make.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(5)
            make.trailing.equalTo(dateLabel.snp.leading).offset(5)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.lastBaseline.equalTo(titleLabel.snp.lastBaseline)
            make.trailing.equalToSuperview().inset(5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.leading.trailing.equalToSuperview().inset(5)
        }
    }
}
