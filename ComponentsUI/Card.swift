//
//  __FILEBASENAME__Component.swift
//  ComponentsUI
//
//  Created by Samuel Brehm on 17/03/22.
//  
//
import UIKit

public protocol CardComponentDelegate: class {
}

/// ![Snapshot](../img/CardComponentTest/testBuildRender.1.png)
public class CardComponent: UIView, ComponentType {

    /// :nodoc:
    public typealias Delegate = CardComponentDelegate
    public weak var delegate: CardComponentDelegate?

    /// :nodoc:
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CardComponent {

    public enum RenderType {
        case build(DTO)
    }

    public func render(_ type: CardComponent.RenderType) {
        switch type {
        case .build(let dto):
            print(dto.value)
        }
    }
}

extension CardComponent {

    public struct DTO {

        var value: String
        
        public init(value: String) {
            self.value = value
        }
    }
}
