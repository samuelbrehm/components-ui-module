//
//  CardComponent.swift
//  ComponentsUI
//
//  Created by Samuel Brehm on 17/03/22.
//  
//
import UIKit

public protocol CardComponentDelegate: AnyObject {
    func cardComponentDidTapFavoriteButton(_ component: CardComponent)
}

/// ![Snapshot](../img/CardComponentTest/testBuildRender.1.png)
public class CardComponent: UIView, ComponentType {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    /// :nodoc:
    public typealias Delegate = CardComponentDelegate
    public weak var delegate: CardComponentDelegate?
    
    /// :nodoc:
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        self.delegate?.cardComponentDidTapFavoriteButton(self)
    }
    
    
}

extension CardComponent {
    
    public enum RenderType {
        case build(DTO)
        case loading(Bool)
        case favorite(Bool)
    }
    
    public func render(_ type: CardComponent.RenderType) {
        switch type {
        case .build(let dto):
            titleLabel?.text = dto.title
            contentLabel?.text = dto.content
            setFavoriteImage(dto.isFavorite)
            
        case .loading(let isLoading):
            titleLabel?.backgroundColor = isLoading ? UIColor(named: .background) : UIColor.white
            titleLabel?.textColor = isLoading ? UIColor.clear : UIColor(named: .title)
            isLoading ? titleLabel?.startShimmering() : titleLabel?.stopShimmering()
            
            contentLabel?.backgroundColor = isLoading ? UIColor(named: .background) : UIColor.white
            contentLabel?.textColor = isLoading ? UIColor.clear : UIColor(named: .content)
            isLoading ? contentLabel?.startShimmering() : contentLabel?.stopShimmering()
            
            favoriteButton?.isHidden = isLoading
            
        case .favorite(let isFavorite):
            setFavoriteImage(isFavorite)
        }
    }
    
    private func setFavoriteImage(_ isFavorite: Bool) {
        let imageName = isFavorite ? "ic_favorite_on" : "ic_favorite_off"
        let image = UIImage(named: imageName, in: Bundle(for: CardComponent.self), compatibleWith: nil)
        favoriteButton?.setImage(image, for: .normal)
    }
}

extension CardComponent {
    
    public struct DTO {
        
        var title: String
        var content: String
        var isFavorite: Bool
        
        public init(title: String, content: String, isFavorite: Bool) {
            self.title = title
            self.content = content
            self.isFavorite = isFavorite
        }
    }
}
