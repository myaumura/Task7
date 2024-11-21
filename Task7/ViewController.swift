//
//  ViewController.swift
//  Task7
//
//  Created by Gusev Kirill on 21.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .secondarySystemBackground
        view.backgroundColor = .systemBackground
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "picture")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }

    private func buildUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
       
        scrollView.frame = view.bounds
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.delegate = self
        
        imageView.frame = .init(origin: .zero, size: .init(width: view.bounds.width, height: 270))
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < 0 {
            imageView.frame = .init(x: 0,
                                    y: offset,
                                    width: view.bounds.width,
                                    height: 270 - offset)
            scrollView.verticalScrollIndicatorInsets = .init(top: 270 - offset - view.layoutMargins.top,
                                                             left: 0,
                                                             bottom: 0,
                                                             right: 0)
        }
    }
}
