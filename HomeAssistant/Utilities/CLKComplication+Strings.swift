//
//  CLKComplication+Strings.swift
//  HomeAssistant
//
//  Created by Robert Trencheny on 9/25/18.
//  Copyright © 2018 Robbie Trencheny. All rights reserved.
//

import Foundation
import UIKit
import Iconic
import WatchKit
import Shared
#if os(watchOS)
import ClockKit
#endif

// swiftlint:disable cyclomatic_complexity type_body_length file_length
public enum ComplicationGroup: String {
    case circularSmall
    case extraLarge
    case graphic
    case modular
    case utilitarian

    var name: String {
        switch self {
        case .circularSmall:
            return L10n.Watch.Labels.ComplicationGroup.CircularSmall.name
        case .extraLarge:
            return L10n.Watch.Labels.ComplicationGroup.ExtraLarge.name
        case .graphic:
            return L10n.Watch.Labels.ComplicationGroup.Graphic.name
        case .modular:
            return L10n.Watch.Labels.ComplicationGroup.Modular.name
        case .utilitarian:
            return L10n.Watch.Labels.ComplicationGroup.Utilitarian.name
        }
    }

    var description: String {
        switch self {
        case .circularSmall:
            return L10n.Watch.Labels.ComplicationGroup.CircularSmall.description
        case .extraLarge:
            return L10n.Watch.Labels.ComplicationGroup.ExtraLarge.description
        case .graphic:
            return L10n.Watch.Labels.ComplicationGroup.Graphic.description
        case .modular:
            return L10n.Watch.Labels.ComplicationGroup.Modular.description
        case .utilitarian:
            return L10n.Watch.Labels.ComplicationGroup.Utilitarian.description
        }
    }

    var members: [ComplicationGroupMember] {
        switch self {
        case .circularSmall:
            return [ComplicationGroupMember.circularSmall]
        case .extraLarge:
            return [ComplicationGroupMember.extraLarge]
        case .graphic:
            return [ComplicationGroupMember.graphicBezel, ComplicationGroupMember.graphicCircular,
                    ComplicationGroupMember.graphicCorner, ComplicationGroupMember.graphicRectangular]
        case .modular:
            return [ComplicationGroupMember.modularLarge, ComplicationGroupMember.modularSmall]
        case .utilitarian:
            return [ComplicationGroupMember.utilitarianLarge, ComplicationGroupMember.utilitarianSmall,
                    ComplicationGroupMember.utilitarianSmallFlat]
        }
    }
}

extension ComplicationGroup: CaseIterable {}

public enum ComplicationGroupMember: String {
    case circularSmall
    case extraLarge
    case graphicBezel
    case graphicCircular
    case graphicCorner
    case graphicRectangular
    case modularLarge
    case modularSmall
    case utilitarianLarge
    case utilitarianSmall
    case utilitarianSmallFlat

    init(name: String) {
        switch name {
        case "circularSmall":
            self = .circularSmall
        case "extraLarge":
            self = .extraLarge
        case "graphicBezel":
            self = .graphicBezel
        case "graphicCircular":
            self = .graphicCircular
        case "graphicCorner":
            self = .graphicCorner
        case "graphicRectangular":
            self = .graphicRectangular
        case "modularLarge":
            self = .modularLarge
        case "modularSmall":
            self = .modularSmall
        case "utilitarianLarge":
            self = .utilitarianLarge
        case "utilitarianSmall":
            self = .utilitarianSmall
        case "utilitarianSmallFlat":
            self = .utilitarianSmallFlat
        default:
            Current.Log.warning("Unknown group member name \(name)")
            self = .circularSmall
        }
    }

    #if os(watchOS)
    init(family: CLKComplicationFamily) {
        switch family {
        case CLKComplicationFamily.circularSmall:
            self = .circularSmall
        case CLKComplicationFamily.extraLarge:
            self = .extraLarge
        case CLKComplicationFamily.graphicBezel:
            self = .graphicBezel
        case CLKComplicationFamily.graphicCircular:
            self = .graphicCircular
        case CLKComplicationFamily.graphicCorner:
            self = .graphicCorner
        case CLKComplicationFamily.graphicRectangular:
            self = .graphicRectangular
        case CLKComplicationFamily.modularLarge:
            self = .modularLarge
        case CLKComplicationFamily.modularSmall:
            self = .modularSmall
        case CLKComplicationFamily.utilitarianLarge:
            self = .utilitarianLarge
        case CLKComplicationFamily.utilitarianSmall:
            self = .utilitarianSmall
        case CLKComplicationFamily.utilitarianSmallFlat:
            self = .utilitarianSmallFlat
        default:
            Current.Log.warning("Unknown group member name \(family.rawValue)")
            self = .circularSmall
        }
    }

    var family: CLKComplicationFamily {
        switch self {
        case .circularSmall:
            return .circularSmall
        case .extraLarge:
            return .extraLarge
        case .graphicBezel:
            return .graphicBezel
        case .graphicCircular:
            return .graphicCircular
        case .graphicCorner:
            return .graphicCorner
        case .graphicRectangular:
            return .graphicRectangular
        case .modularLarge:
            return .modularLarge
        case .modularSmall:
            return .modularSmall
        case .utilitarianLarge:
            return .utilitarianLarge
        case .utilitarianSmall:
            return .utilitarianSmall
        case .utilitarianSmallFlat:
            return .utilitarianSmallFlat
        }
    }
    #endif

//    #if os(iOS)
//    var family: String {
//        switch self {
//        case .circularSmall:
//            return "circularSmall"
//        case .extraLarge:
//            return "extraLarge"
//        case .graphicBezel:
//            return "graphicBezel"
//        case .graphicCircular:
//            return "graphicCircular"
//        case .graphicCorner:
//            return "graphicCorner"
//        case .graphicRectangular:
//            return "graphicRectangular"
//        case .modularLarge:
//            return "modularLarge"
//        case .modularSmall:
//            return "modularSmall"
//        case .utilitarianLarge:
//            return "utilitarianLarge"
//        case .utilitarianSmall:
//            return "utilitarianSmall"
//        case .utilitarianSmallFlat:
//            return "utilitarianSmallFlat"
//        }
//    }
//    #endif

    var name: String {
        switch self {
        case .circularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.CircularSmall.name
        case .extraLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ExtraLarge.name
        case .graphicBezel:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicBezel.name
        case .graphicCircular:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCircular.name
        case .graphicCorner:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCorner.name
        case .graphicRectangular:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicRectangular.name
        case .modularLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularLarge.name
        case .modularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularSmall.name
        case .utilitarianLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianLarge.name
        case .utilitarianSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmall.name
        case .utilitarianSmallFlat:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmallFlat.name
        }
    }

    var shortName: String {
        switch self {
        case .circularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.CircularSmall.shortName
        case .extraLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ExtraLarge.shortName
        case .graphicBezel:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicBezel.shortName
        case .graphicCircular:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCircular.shortName
        case .graphicCorner:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCorner.shortName
        case .graphicRectangular:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicRectangular.shortName
        case .modularLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularLarge.shortName
        case .modularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularSmall.shortName
        case .utilitarianLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianLarge.shortName
        case .utilitarianSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmall.shortName
        case .utilitarianSmallFlat:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmallFlat.shortName
        }
    }

    var group: ComplicationGroup {
        switch self {
        case .circularSmall:
            return ComplicationGroup.circularSmall
        case .extraLarge:
            return ComplicationGroup.extraLarge
        case .graphicBezel, .graphicCircular, .graphicCorner, .graphicRectangular:
            return ComplicationGroup.graphic
        case .modularLarge, .modularSmall:
            return ComplicationGroup.modular
        case .utilitarianLarge, .utilitarianSmall, .utilitarianSmallFlat:
            return ComplicationGroup.utilitarian
        }
    }

    var description: String {
        switch self {
        case .circularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.CircularSmall.description
        case .extraLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ExtraLarge.description
        case .modularSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicBezel.description
        case .modularLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCircular.description
        case .utilitarianSmall:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicCorner.description
        case .utilitarianSmallFlat:
            return L10n.Watch.Labels.ComplicationGroupMember.GraphicRectangular.description
        case .utilitarianLarge:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularLarge.description
        case .graphicCorner:
            return L10n.Watch.Labels.ComplicationGroupMember.ModularSmall.description
        case .graphicCircular:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianLarge.description
        case .graphicBezel:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmall.description
        case .graphicRectangular:
            return L10n.Watch.Labels.ComplicationGroupMember.UtilitarianSmallFlat.description
        }
    }

    var templates: [ComplicationTemplate] {
        switch self {
        case .circularSmall:
            return [.CircularSmallRingImage, .CircularSmallSimpleImage, .CircularSmallStackImage,
                    .CircularSmallRingText, .CircularSmallSimpleText, .CircularSmallStackText]
        case .extraLarge:
            return [.ExtraLargeRingImage, .ExtraLargeSimpleImage, .ExtraLargeStackImage, .ExtraLargeColumnsText,
                    .ExtraLargeRingText, .ExtraLargeSimpleText, .ExtraLargeStackText]
        case .modularSmall:
            return [.ModularSmallRingImage, .ModularSmallSimpleImage, .ModularSmallStackImage,
                    .ModularSmallColumnsText, .ModularSmallRingText, .ModularSmallSimpleText, .ModularSmallStackText]
        case .modularLarge:
            return [.ModularLargeStandardBody, .ModularLargeTallBody, .ModularLargeColumns, .ModularLargeTable]
        case .utilitarianSmall:
            return [.UtilitarianSmallRingImage, .UtilitarianSmallRingText, .UtilitarianSmallSquare]
        case .utilitarianSmallFlat:
            return [.UtilitarianSmallFlat]
        case .utilitarianLarge:
            return [.UtilitarianLargeFlat]
        case .graphicCorner:
            return [.GraphicCornerCircularImage, .GraphicCornerGaugeImage, .GraphicCornerGaugeText,
                    .GraphicCornerStackText, .GraphicCornerTextImage]
        case .graphicCircular:
            return [.GraphicCircularImage, .GraphicCircularClosedGaugeImage, .GraphicCircularOpenGaugeImage,
                    .GraphicCircularClosedGaugeText, .GraphicCircularOpenGaugeSimpleText,
                    .GraphicCircularOpenGaugeRangeText]
        case .graphicBezel:
            return [.GraphicBezelCircularText]
        case .graphicRectangular:
            return [.GraphicRectangularStandardBody, .GraphicRectangularTextGauge, .GraphicRectangularLargeImage]
        }
    }

    #if os(watchOS)
    var errorTemplate: CLKComplicationTemplate? {
        MaterialDesignIcons.register()

        let logoImage = UIImage(named: "RoundLogo")!
        let templateImage = UIImage(named: "TemplateLogo")!
        let hassColor = UIColor(red: 0.25, green: 0.74, blue: 0.96, alpha: 1.0)

        switch self {
        case .circularSmall:
            let template = CLKComplicationTemplateCircularSmallSimpleImage()
            template.imageProvider = CLKImageProvider(onePieceImage: templateImage)
            template.tintColor = hassColor
            return template
        case .extraLarge:
            let template = CLKComplicationTemplateExtraLargeSimpleImage()
            template.imageProvider = CLKImageProvider(onePieceImage: templateImage)
            template.tintColor = hassColor
            return template
        case .graphicBezel:
            let template = CLKComplicationTemplateGraphicBezelCircularText()
            let imageTemplate = CLKComplicationTemplateGraphicCircularImage()
            imageTemplate.imageProvider = CLKFullColorImageProvider(fullColorImage: logoImage)
            template.circularTemplate = imageTemplate
            template.textProvider = CLKSimpleTextProvider(text: "??")
            return template
        case .graphicCircular:
            let template = CLKComplicationTemplateGraphicCircularImage()
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: logoImage)
            return template
        case .graphicCorner:
            let template = CLKComplicationTemplateGraphicCornerCircularImage()
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: logoImage)
            return template
        case .graphicRectangular:
            let template = CLKComplicationTemplateGraphicRectangularStandardBody()
            template.headerImageProvider = CLKFullColorImageProvider(fullColorImage: logoImage)
            template.headerTextProvider = CLKSimpleTextProvider(text: "Not configured")
            let desc = ComplicationTemplate.GraphicRectangularStandardBody.description
            template.body1TextProvider = CLKSimpleTextProvider(text: desc)
            template.body2TextProvider = CLKSimpleTextProvider(text: "has not been configured")
            return template
        case .modularLarge:
            let template = CLKComplicationTemplateModularLargeTallBody()
            template.headerTextProvider = CLKSimpleTextProvider(text: "Not configured")
            let desc = ComplicationTemplate.GraphicRectangularStandardBody.description
            template.bodyTextProvider = CLKSimpleTextProvider(text: "\(desc) has not been configured in the app")
            template.tintColor = hassColor
            return template
        case .modularSmall:
            let template = CLKComplicationTemplateModularSmallStackImage()
            template.line1ImageProvider = CLKImageProvider(onePieceImage: templateImage)
            let desc = ComplicationTemplate.ModularSmallStackImage.description
            template.line2TextProvider = CLKSimpleTextProvider(text: "\(desc) has not been configured in the app")
            template.tintColor = hassColor
            return template
        case .utilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.imageProvider = CLKImageProvider(onePieceImage: templateImage)
            let desc = ComplicationTemplate.UtilitarianLargeFlat.description
            template.textProvider = CLKSimpleTextProvider(text: "\(desc) has not been configured in the app")
            template.tintColor = hassColor
            return template
        case .utilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallSquare()
            template.imageProvider = CLKImageProvider(onePieceImage: templateImage)
            template.tintColor = hassColor
            return template
        case .utilitarianSmallFlat:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.imageProvider = CLKImageProvider(onePieceImage: templateImage)
            let desc = ComplicationTemplate.UtilitarianSmallFlat.description
            template.textProvider = CLKSimpleTextProvider(text: "\(desc) has not been configured in the app")
            template.tintColor = hassColor
            return template
        }
    }
    #endif
}

extension ComplicationGroupMember: CaseIterable {}

// swiftlint:disable:next type_body_length
public enum ComplicationTemplate: String {
    case CircularSmallRingImage
    case CircularSmallSimpleImage
    case CircularSmallStackImage
    case CircularSmallRingText
    case CircularSmallSimpleText
    case CircularSmallStackText
    case ExtraLargeRingImage
    case ExtraLargeSimpleImage
    case ExtraLargeStackImage
    case ExtraLargeColumnsText
    case ExtraLargeRingText
    case ExtraLargeSimpleText
    case ExtraLargeStackText
    case ModularSmallRingImage
    case ModularSmallSimpleImage
    case ModularSmallStackImage
    case ModularSmallColumnsText
    case ModularSmallRingText
    case ModularSmallSimpleText
    case ModularSmallStackText
    case ModularLargeStandardBody
    case ModularLargeTallBody
    case ModularLargeColumns
    case ModularLargeTable
    case UtilitarianSmallFlat
    case UtilitarianSmallRingImage
    case UtilitarianSmallRingText
    case UtilitarianSmallSquare
    case UtilitarianLargeFlat
    case GraphicCornerCircularImage
    case GraphicCornerGaugeImage
    case GraphicCornerGaugeText
    case GraphicCornerStackText
    case GraphicCornerTextImage
    case GraphicCircularImage
    case GraphicCircularClosedGaugeImage
    case GraphicCircularOpenGaugeImage
    case GraphicCircularClosedGaugeText
    case GraphicCircularOpenGaugeSimpleText
    case GraphicCircularOpenGaugeRangeText
    case GraphicBezelCircularText
    case GraphicRectangularStandardBody
    case GraphicRectangularTextGauge
    case GraphicRectangularLargeImage

    var style: String {
        switch self {
        case .CircularSmallRingImage, .ExtraLargeRingImage, .ModularSmallRingImage, .UtilitarianSmallRingImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.ringImage
        case .CircularSmallSimpleImage, .ExtraLargeSimpleImage, .ModularSmallSimpleImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.simpleImage
        case .CircularSmallStackImage, .ExtraLargeStackImage, .ModularSmallStackImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.stackImage
        case .CircularSmallRingText, .ExtraLargeRingText, .ModularSmallRingText, .UtilitarianSmallRingText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.ringText
        case .CircularSmallSimpleText, .ExtraLargeSimpleText, .ModularSmallSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.simpleText
        case .CircularSmallStackText, .ExtraLargeStackText, .ModularSmallStackText, .GraphicCornerStackText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.stackText
        case .ExtraLargeColumnsText, .ModularSmallColumnsText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.columnsText
        case .ModularLargeStandardBody, .GraphicRectangularStandardBody:
            return L10n.Watch.Labels.ComplicationTemplate.Style.standardBody
        case .ModularLargeTallBody:
            return L10n.Watch.Labels.ComplicationTemplate.Style.tallBody
        case .ModularLargeColumns:
            return L10n.Watch.Labels.ComplicationTemplate.Style.columns
        case .ModularLargeTable:
            return L10n.Watch.Labels.ComplicationTemplate.Style.table
        case .UtilitarianSmallFlat, .UtilitarianLargeFlat:
            return L10n.Watch.Labels.ComplicationTemplate.Style.flat
        case .UtilitarianSmallSquare:
            return L10n.Watch.Labels.ComplicationTemplate.Style.square
        case .GraphicCornerCircularImage, .GraphicCircularImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.circularImage
        case .GraphicCornerGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.gaugeImage
        case .GraphicCornerGaugeText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.gaugeText
        case .GraphicCornerTextImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.textImage
        case .GraphicCircularClosedGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.closedGaugeImage
        case .GraphicCircularOpenGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.openGaugeImage
        case .GraphicCircularClosedGaugeText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.closedGaugeText
        case .GraphicCircularOpenGaugeSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.openGaugeSimpleText
        case .GraphicCircularOpenGaugeRangeText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.openGaugeRangeText
        case .GraphicBezelCircularText:
            return L10n.Watch.Labels.ComplicationTemplate.Style.circularText
        case .GraphicRectangularTextGauge:
            return L10n.Watch.Labels.ComplicationTemplate.Style.textGauge
        case .GraphicRectangularLargeImage:
            return L10n.Watch.Labels.ComplicationTemplate.Style.largeImage
        }
    }

    var description: String {
        switch self {
        case .CircularSmallRingImage:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallRingImage.description
        case .CircularSmallSimpleImage:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallSimpleImage.description
        case .CircularSmallStackImage:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallStackImage.description
        case .CircularSmallRingText:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallRingText.description
        case .CircularSmallSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallSimpleText.description
        case .CircularSmallStackText:
            return L10n.Watch.Labels.ComplicationTemplate.CircularSmallStackText.description
        case .ExtraLargeRingImage:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeRingImage.description
        case .ExtraLargeSimpleImage:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeSimpleImage.description
        case .ExtraLargeStackImage:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeStackImage.description
        case .ExtraLargeColumnsText:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeColumnsText.description
        case .ExtraLargeRingText:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeRingText.description
        case .ExtraLargeSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeSimpleText.description
        case .ExtraLargeStackText:
            return L10n.Watch.Labels.ComplicationTemplate.ExtraLargeStackText.description
        case .ModularSmallRingImage:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallRingImage.description
        case .ModularSmallSimpleImage:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallSimpleImage.description
        case .ModularSmallStackImage:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallStackImage.description
        case .ModularSmallColumnsText:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallColumnsText.description
        case .ModularSmallRingText:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallRingText.description
        case .ModularSmallSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallSimpleText.description
        case .ModularSmallStackText:
            return L10n.Watch.Labels.ComplicationTemplate.ModularSmallStackText.description
        case .ModularLargeStandardBody:
            return L10n.Watch.Labels.ComplicationTemplate.ModularLargeStandardBody.description
        case .ModularLargeTallBody:
            return L10n.Watch.Labels.ComplicationTemplate.ModularLargeTallBody.description
        case .ModularLargeColumns:
            return L10n.Watch.Labels.ComplicationTemplate.ModularLargeColumns.description
        case .ModularLargeTable:
            return L10n.Watch.Labels.ComplicationTemplate.ModularLargeTable.description
        case .UtilitarianSmallFlat:
            return L10n.Watch.Labels.ComplicationTemplate.UtilitarianSmallFlat.description
        case .UtilitarianSmallRingImage:
            return L10n.Watch.Labels.ComplicationTemplate.UtilitarianSmallRingImage.description
        case .UtilitarianSmallRingText:
            return L10n.Watch.Labels.ComplicationTemplate.UtilitarianSmallRingText.description
        case .UtilitarianSmallSquare:
            return L10n.Watch.Labels.ComplicationTemplate.UtilitarianSmallSquare.description
        case .UtilitarianLargeFlat:
            return L10n.Watch.Labels.ComplicationTemplate.UtilitarianLargeFlat.description
        case .GraphicCornerCircularImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCornerCircularImage.description
        case .GraphicCornerGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCornerGaugeImage.description
        case .GraphicCornerGaugeText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCornerGaugeText.description
        case .GraphicCornerStackText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCornerStackText.description
        case .GraphicCornerTextImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCornerTextImage.description
        case .GraphicCircularImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularImage.description
        case .GraphicCircularClosedGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularClosedGaugeImage.description
        case .GraphicCircularOpenGaugeImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularOpenGaugeImage.description
        case .GraphicCircularClosedGaugeText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularClosedGaugeText.description
        case .GraphicCircularOpenGaugeSimpleText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularOpenGaugeSimpleText.description
        case .GraphicCircularOpenGaugeRangeText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicCircularOpenGaugeRangeText.description
        case .GraphicBezelCircularText:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicBezelCircularText.description
        case .GraphicRectangularStandardBody:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicRectangularStandardBody.description
        case .GraphicRectangularTextGauge:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicRectangularTextGauge.description
        case .GraphicRectangularLargeImage:
            return L10n.Watch.Labels.ComplicationTemplate.GraphicRectangularLargeImage.description
        }
    }

    var type: String {
        switch self {
        case .CircularSmallRingImage, .CircularSmallSimpleImage, .CircularSmallStackImage:
            return "image"
        case .CircularSmallRingText, .CircularSmallSimpleText, .CircularSmallStackText:
            return "text"
        case .ExtraLargeRingImage, .ExtraLargeSimpleImage, .ExtraLargeStackImage:
            return "image"
        case .ExtraLargeColumnsText, .ExtraLargeRingText, .ExtraLargeSimpleText, .ExtraLargeStackText:
            return "text"
        case .ModularSmallRingImage, .ModularSmallSimpleImage, .ModularSmallStackImage:
            return "image"
        case .ModularSmallColumnsText, .ModularSmallRingText, .ModularSmallSimpleText, .ModularSmallStackText:
            return "text"
        case .ModularLargeStandardBody, .ModularLargeTallBody:
            return "body"
        case .ModularLargeColumns, .ModularLargeTable:
            return "table"
        case .UtilitarianSmallFlat, .UtilitarianSmallRingImage, .UtilitarianSmallRingText:
            return "text"
        case .UtilitarianSmallSquare:
            return "image"
        case .UtilitarianLargeFlat:
            return "text"
        case .GraphicCornerGaugeText, .GraphicCornerStackText:
            return "text"
        case .GraphicCornerCircularImage, .GraphicCornerGaugeImage, .GraphicCornerTextImage:
            return "image"
        case .GraphicCircularClosedGaugeText, .GraphicCircularOpenGaugeSimpleText, .GraphicCircularOpenGaugeRangeText:
            return "text"
        case .GraphicCircularImage, .GraphicCircularClosedGaugeImage, .GraphicCircularOpenGaugeImage:
            return "image"
        case .GraphicBezelCircularText:
            return "text"
        case .GraphicRectangularStandardBody, .GraphicRectangularTextGauge:
            return "text"
        case .GraphicRectangularLargeImage:
            return "image"
        }
    }

    var group: ComplicationGroup {
        switch self {
        case .CircularSmallRingImage, .CircularSmallSimpleImage, .CircularSmallStackImage, .CircularSmallRingText,
             .CircularSmallSimpleText, .CircularSmallStackText:
            return .circularSmall
        case .ExtraLargeRingImage, .ExtraLargeSimpleImage, .ExtraLargeStackImage, .ExtraLargeColumnsText,
             .ExtraLargeRingText, .ExtraLargeSimpleText, .ExtraLargeStackText:
            return .extraLarge
        case .ModularSmallRingImage, .ModularSmallSimpleImage, .ModularSmallStackImage,
             .ModularSmallColumnsText, .ModularSmallRingText, .ModularSmallSimpleText, .ModularSmallStackText,
             .ModularLargeStandardBody, .ModularLargeTallBody, .ModularLargeColumns, .ModularLargeTable:
            return .modular
        case .UtilitarianSmallFlat, .UtilitarianSmallRingImage, .UtilitarianSmallRingText, .UtilitarianSmallSquare,
             .UtilitarianLargeFlat:
            return .utilitarian
        case .GraphicCornerCircularImage, .GraphicCornerGaugeImage, .GraphicCornerGaugeText, .GraphicCornerStackText,
             .GraphicCornerTextImage, .GraphicCircularImage, .GraphicCircularClosedGaugeImage,
             .GraphicCircularOpenGaugeImage, .GraphicCircularClosedGaugeText, .GraphicCircularOpenGaugeSimpleText,
             .GraphicCircularOpenGaugeRangeText, .GraphicBezelCircularText, .GraphicRectangularStandardBody,
             .GraphicRectangularTextGauge, .GraphicRectangularLargeImage:
            return .graphic
        }
    }

    var groupMember: ComplicationGroupMember {
        switch self {
        case .CircularSmallRingImage, .CircularSmallSimpleImage, .CircularSmallStackImage, .CircularSmallRingText,
             .CircularSmallSimpleText, .CircularSmallStackText:
            return .circularSmall
        case .ExtraLargeRingImage, .ExtraLargeSimpleImage, .ExtraLargeStackImage, .ExtraLargeColumnsText,
             .ExtraLargeRingText, .ExtraLargeSimpleText, .ExtraLargeStackText:
            return .extraLarge
        case .ModularSmallRingImage, .ModularSmallSimpleImage, .ModularSmallStackImage, .ModularSmallColumnsText,
             .ModularSmallRingText, .ModularSmallSimpleText, .ModularSmallStackText:
            return .modularSmall
        case .ModularLargeStandardBody, .ModularLargeTallBody, .ModularLargeColumns, .ModularLargeTable:
            return .modularLarge
        case .UtilitarianSmallFlat:
            return .utilitarianSmallFlat
        case .UtilitarianSmallRingImage, .UtilitarianSmallRingText, .UtilitarianSmallSquare:
            return .utilitarianSmall
        case .UtilitarianLargeFlat:
            return .utilitarianLarge
        case .GraphicCornerCircularImage, .GraphicCornerGaugeImage, .GraphicCornerGaugeText, .GraphicCornerStackText,
             .GraphicCornerTextImage:
            return .graphicCorner
        case .GraphicCircularImage, .GraphicCircularClosedGaugeImage, .GraphicCircularOpenGaugeImage,
             .GraphicCircularClosedGaugeText, .GraphicCircularOpenGaugeSimpleText, .GraphicCircularOpenGaugeRangeText:
            return .graphicCircular
        case .GraphicBezelCircularText:
            return .graphicBezel
        case .GraphicRectangularStandardBody, .GraphicRectangularTextGauge, .GraphicRectangularLargeImage:
            return .graphicRectangular
        }
    }

    var textAreas: [ComplicationTextAreas] {
        switch self {
        case .CircularSmallRingImage:
            return []
        case .CircularSmallSimpleImage:
            return []
        case .CircularSmallStackImage:
            return [.Line2]
        case .CircularSmallRingText:
            return [.InsideRing]
        case .CircularSmallSimpleText:
            return [.Center]
        case .CircularSmallStackText:
            return [.Line1, .Line2]
        case .ExtraLargeRingImage:
            return []
        case .ExtraLargeSimpleImage:
            return []
        case .ExtraLargeStackImage:
            return [.Line2]
        case .ExtraLargeColumnsText:
            return [.Row1Column1, .Row1Column2, .Row2Column1, .Row2Column2]
        case .ExtraLargeRingText:
            return [.InsideRing]
        case .ExtraLargeSimpleText:
            return [.Center]
        case .ExtraLargeStackText:
            return [.Line1, .Line2]
        case .ModularSmallRingImage:
            return []
        case .ModularSmallSimpleImage:
            return []
        case .ModularSmallStackImage:
            return [.Line2]
        case .ModularSmallColumnsText:
            return [.Row1Column1, .Row1Column2, .Row2Column1, .Row2Column2]
        case .ModularSmallRingText:
            return [.InsideRing]
        case .ModularSmallSimpleText:
            return [.Center]
        case .ModularSmallStackText:
            return [.Line1, .Line2]
        case .ModularLargeStandardBody:
            return [.Header, .Body1, .Body2]
        case .ModularLargeTallBody:
            return [.Header, .Center]
        case .ModularLargeColumns:
            return [.Row1Column1, .Row1Column2, .Row2Column1, .Row2Column2]
        case .ModularLargeTable:
            return [.Header, .Row1Column1, .Row1Column2, .Row2Column1, .Row2Column2]
        case .UtilitarianSmallFlat:
            return [.Center]
        case .UtilitarianSmallRingImage:
            return []
        case .UtilitarianSmallRingText:
            return [.InsideRing]
        case .UtilitarianSmallSquare:
            return []
        case .UtilitarianLargeFlat:
            return [.Center]
        case .GraphicCornerCircularImage:
            return []
        case .GraphicCornerGaugeImage:
            return [.Leading, .Trailing]
        case .GraphicCornerGaugeText:
            return [.Outer, .Leading, .Trailing]
        case .GraphicCornerStackText:
            return [.Outer, .Inner]
        case .GraphicCornerTextImage:
            return [.Center]
        case .GraphicCircularImage:
            return []
        case .GraphicCircularClosedGaugeImage:
            return []
        case .GraphicCircularOpenGaugeImage:
            return [.Center]
        case .GraphicCircularClosedGaugeText:
            return [.Center]
        case .GraphicCircularOpenGaugeSimpleText:
            return [.Center, .Bottom]
        case .GraphicCircularOpenGaugeRangeText:
            return [.Center, .Leading, .Trailing]
        case .GraphicBezelCircularText:
            return [.Center]
        case .GraphicRectangularStandardBody:
            return [.Header, .Body1, .Body2]
        case .GraphicRectangularTextGauge:
            return [.Header, .Body1]
        case .GraphicRectangularLargeImage:
            return [.Header]
        }
    }

    #if os(watchOS)
    // swiftlint:disable:next function_body_length
    init(_ template: CLKComplicationTemplate) {
        switch template {
        case is CLKComplicationTemplateCircularSmallRingImage:
            self = .CircularSmallRingImage
        case is CLKComplicationTemplateCircularSmallSimpleImage:
            self = .CircularSmallSimpleImage
        case is CLKComplicationTemplateCircularSmallStackImage:
            self = .CircularSmallStackImage
        case is CLKComplicationTemplateCircularSmallRingText:
            self = .CircularSmallRingText
        case is CLKComplicationTemplateCircularSmallSimpleText:
            self = .CircularSmallSimpleText
        case is CLKComplicationTemplateCircularSmallStackText:
            self = .CircularSmallStackText
        case is CLKComplicationTemplateExtraLargeRingImage:
            self = .ExtraLargeRingImage
        case is CLKComplicationTemplateExtraLargeSimpleImage:
            self = .ExtraLargeSimpleImage
        case is CLKComplicationTemplateExtraLargeStackImage:
            self = .ExtraLargeStackImage
        case is CLKComplicationTemplateExtraLargeColumnsText:
            self = .ExtraLargeColumnsText
        case is CLKComplicationTemplateExtraLargeRingText:
            self = .ExtraLargeRingText
        case is CLKComplicationTemplateExtraLargeSimpleText:
            self = .ExtraLargeSimpleText
        case is CLKComplicationTemplateExtraLargeStackText:
            self = .ExtraLargeStackText
        case is CLKComplicationTemplateModularSmallRingImage:
            self = .ModularSmallRingImage
        case is CLKComplicationTemplateModularSmallSimpleImage:
            self = .ModularSmallSimpleImage
        case is CLKComplicationTemplateModularSmallStackImage:
            self = .ModularSmallStackImage
        case is CLKComplicationTemplateModularSmallColumnsText:
            self = .ModularSmallColumnsText
        case is CLKComplicationTemplateModularSmallRingText:
            self = .ModularSmallRingText
        case is CLKComplicationTemplateModularSmallSimpleText:
            self = .ModularSmallSimpleText
        case is CLKComplicationTemplateModularSmallStackText:
            self = .ModularSmallStackText
        case is CLKComplicationTemplateModularLargeStandardBody:
            self = .ModularLargeStandardBody
        case is CLKComplicationTemplateModularLargeTallBody:
            self = .ModularLargeTallBody
        case is CLKComplicationTemplateModularLargeColumns:
            self = .ModularLargeColumns
        case is CLKComplicationTemplateModularLargeTable:
            self = .ModularLargeTable
        case is CLKComplicationTemplateUtilitarianSmallFlat:
            self = .UtilitarianSmallFlat
        case is CLKComplicationTemplateUtilitarianSmallRingImage:
            self = .UtilitarianSmallRingImage
        case is CLKComplicationTemplateUtilitarianSmallRingText:
            self = .UtilitarianSmallRingText
        case is CLKComplicationTemplateUtilitarianSmallSquare:
            self = .UtilitarianSmallSquare
        case is CLKComplicationTemplateUtilitarianLargeFlat:
            self = .UtilitarianLargeFlat
        case is CLKComplicationTemplateGraphicCornerCircularImage:
            self = .GraphicCornerCircularImage
        case is CLKComplicationTemplateGraphicCornerGaugeImage:
            self = .GraphicCornerGaugeImage
        case is CLKComplicationTemplateGraphicCornerGaugeText:
            self = .GraphicCornerGaugeText
        case is CLKComplicationTemplateGraphicCornerStackText:
            self = .GraphicCornerStackText
        case is CLKComplicationTemplateGraphicCornerTextImage:
            self = .GraphicCornerTextImage
        case is CLKComplicationTemplateGraphicCircularImage:
            self = .GraphicCircularImage
        case is CLKComplicationTemplateGraphicCircularClosedGaugeImage:
            self = .GraphicCircularClosedGaugeImage
        case is CLKComplicationTemplateGraphicCircularOpenGaugeImage:
            self = .GraphicCircularOpenGaugeImage
        case is CLKComplicationTemplateGraphicCircularClosedGaugeText:
            self = .GraphicCircularClosedGaugeText
        case is CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText:
            self = .GraphicCircularOpenGaugeSimpleText
        case is CLKComplicationTemplateGraphicCircularOpenGaugeRangeText:
            self = .GraphicCircularOpenGaugeRangeText
        case is CLKComplicationTemplateGraphicBezelCircularText:
            self = .GraphicBezelCircularText
        case is CLKComplicationTemplateGraphicRectangularStandardBody:
            self = .GraphicRectangularStandardBody
        case is CLKComplicationTemplateGraphicRectangularTextGauge:
            self = .GraphicRectangularTextGauge
        case is CLKComplicationTemplateGraphicRectangularLargeImage:
            self = .GraphicRectangularLargeImage
        default:
            Current.Log.warning("Unknown template \(template)")
            self = .ModularSmallStackText
        }
    }

    var CLKComplicationTemplate: CLKComplicationTemplate {
        switch self {
        case .CircularSmallRingImage:
            return CLKComplicationTemplateCircularSmallRingImage()
        case .CircularSmallSimpleImage:
            return CLKComplicationTemplateCircularSmallSimpleImage()
        case .CircularSmallStackImage:
            return CLKComplicationTemplateCircularSmallStackImage()
        case .CircularSmallRingText:
            return CLKComplicationTemplateCircularSmallRingText()
        case .CircularSmallSimpleText:
            return CLKComplicationTemplateCircularSmallSimpleText()
        case .CircularSmallStackText:
            return CLKComplicationTemplateCircularSmallStackText()
        case .ExtraLargeRingImage:
            return CLKComplicationTemplateExtraLargeRingImage()
        case .ExtraLargeSimpleImage:
            return CLKComplicationTemplateExtraLargeSimpleImage()
        case .ExtraLargeStackImage:
            return CLKComplicationTemplateExtraLargeStackImage()
        case .ExtraLargeColumnsText:
            return CLKComplicationTemplateExtraLargeColumnsText()
        case .ExtraLargeRingText:
            return CLKComplicationTemplateExtraLargeRingText()
        case .ExtraLargeSimpleText:
            return CLKComplicationTemplateExtraLargeSimpleText()
        case .ExtraLargeStackText:
            return CLKComplicationTemplateExtraLargeStackText()
        case .ModularSmallRingImage:
            return CLKComplicationTemplateModularSmallRingImage()
        case .ModularSmallSimpleImage:
            return CLKComplicationTemplateModularSmallSimpleImage()
        case .ModularSmallStackImage:
            return CLKComplicationTemplateModularSmallStackImage()
        case .ModularSmallColumnsText:
            return CLKComplicationTemplateModularSmallColumnsText()
        case .ModularSmallRingText:
            return CLKComplicationTemplateModularSmallRingText()
        case .ModularSmallSimpleText:
            return CLKComplicationTemplateModularSmallSimpleText()
        case .ModularSmallStackText:
            return CLKComplicationTemplateModularSmallStackText()
        case .ModularLargeStandardBody:
            return CLKComplicationTemplateModularLargeStandardBody()
        case .ModularLargeTallBody:
            return CLKComplicationTemplateModularLargeTallBody()
        case .ModularLargeColumns:
            return CLKComplicationTemplateModularLargeColumns()
        case .ModularLargeTable:
            return CLKComplicationTemplateModularLargeTable()
        case .UtilitarianSmallFlat:
            return CLKComplicationTemplateUtilitarianSmallFlat()
        case .UtilitarianSmallRingImage:
            return CLKComplicationTemplateUtilitarianSmallRingImage()
        case .UtilitarianSmallRingText:
            return CLKComplicationTemplateUtilitarianSmallRingText()
        case .UtilitarianSmallSquare:
            return CLKComplicationTemplateUtilitarianSmallSquare()
        case .UtilitarianLargeFlat:
            return CLKComplicationTemplateUtilitarianLargeFlat()
        case .GraphicCornerCircularImage:
            return CLKComplicationTemplateGraphicCornerCircularImage()
        case .GraphicCornerGaugeImage:
            return CLKComplicationTemplateGraphicCornerGaugeImage()
        case .GraphicCornerGaugeText:
            return CLKComplicationTemplateGraphicCornerGaugeText()
        case .GraphicCornerStackText:
            return CLKComplicationTemplateGraphicCornerStackText()
        case .GraphicCornerTextImage:
            return CLKComplicationTemplateGraphicCornerTextImage()
        case .GraphicCircularImage:
            return CLKComplicationTemplateGraphicCircularImage()
        case .GraphicCircularClosedGaugeImage:
            return CLKComplicationTemplateGraphicCircularClosedGaugeImage()
        case .GraphicCircularOpenGaugeImage:
            return CLKComplicationTemplateGraphicCircularOpenGaugeImage()
        case .GraphicCircularClosedGaugeText:
            return CLKComplicationTemplateGraphicCircularClosedGaugeText()
        case .GraphicCircularOpenGaugeSimpleText:
            return CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText()
        case .GraphicCircularOpenGaugeRangeText:
            return CLKComplicationTemplateGraphicCircularOpenGaugeRangeText()
        case .GraphicBezelCircularText:
            return CLKComplicationTemplateGraphicBezelCircularText()
        case .GraphicRectangularStandardBody:
            return CLKComplicationTemplateGraphicRectangularStandardBody()
        case .GraphicRectangularTextGauge:
            return CLKComplicationTemplateGraphicRectangularTextGauge()
        case .GraphicRectangularLargeImage:
            return CLKComplicationTemplateGraphicRectangularLargeImage()
        }
    }

    // https://gist.github.com/robbiet480/2a38d499323cb964d47b2f5d8004694a
    var imageSize: CGSize? {
        // Template: Device Size: Image Size @1x
        let imageSizes: [String: [Int: CGSize]] = [
            "CircularSmallRingImage": [
                38: CGSize(width: 40, height: 40),
                40: CGSize(width: 44, height: 44),
                42: CGSize(width: 44, height: 44),
                44: CGSize(width: 48, height: 48)
            ],
            "CircularSmallSimpleImage": [
                38: CGSize(width: 32, height: 32),
                40: CGSize(width: 36, height: 36),
                42: CGSize(width: 36, height: 36),
                44: CGSize(width: 40, height: 40)
            ],
            "CircularSmallStackImage": [
                38: CGSize(width: 32, height: 14),
                40: CGSize(width: 34, height: 16),
                42: CGSize(width: 34, height: 16),
                44: CGSize(width: 38, height: 18)
            ],
            "ModularSmallRingImage": [
                38: CGSize(width: 36, height: 36),
                40: CGSize(width: 38, height: 38),
                42: CGSize(width: 38, height: 38),
                44: CGSize(width: 42, height: 42)
            ],
            "ModularSmallSimpleImage": [
                38: CGSize(width: 52, height: 52),
                40: CGSize(width: 58, height: 58),
                42: CGSize(width: 58, height: 58),
                44: CGSize(width: 64, height: 64)
            ],
            "ModularSmallStackImage": [
                38: CGSize(width: 52, height: 28),
                40: CGSize(width: 58, height: 30),
                42: CGSize(width: 58, height: 30),
                44: CGSize(width: 64, height: 34)
            ],
            "ModularLargeColumnsImage": [
                38: CGSize(width: 64, height: 22),
                40: CGSize(width: 74, height: 24),
                42: CGSize(width: 74, height: 24),
                44: CGSize(width: 84, height: 28)
            ],
            "ModularLargeStandardBody": [
                38: CGSize(width: 64, height: 22),
                40: CGSize(width: 74, height: 24),
                42: CGSize(width: 74, height: 24),
                44: CGSize(width: 84, height: 28)
            ],
            "ModularLargeTable": [
                38: CGSize(width: 64, height: 22),
                40: CGSize(width: 74, height: 24),
                42: CGSize(width: 74, height: 24),
                44: CGSize(width: 84, height: 28)
            ],
            "UtilitarianSmallFlatImage": [
                38: CGSize(width: 42, height: 18),
                40: CGSize(width: 44, height: 20),
                42: CGSize(width: 44, height: 20)
                // 44: CGSize(width: 20, height: 20) -- 44mm is marked "N/A" in HIG
            ],
            "UtilitarianSmallRingImage": [
                38: CGSize(width: 28, height: 28),
                40: CGSize(width: 28, height: 28),
                42: CGSize(width: 28, height: 28),
                44: CGSize(width: 32, height: 32)
            ],
            "UtilitarianSmallSquareImage": [
                38: CGSize(width: 40, height: 40),
                40: CGSize(width: 44, height: 44),
                42: CGSize(width: 44, height: 44),
                44: CGSize(width: 50, height: 50)
            ],
            "UtilitarianLargeFlatImage": [
                38: CGSize(width: 42, height: 18),
                40: CGSize(width: 44, height: 20),
                42: CGSize(width: 44, height: 20)
                // 44: CGSize(width: 20, height: 20) -- 44mm is marked "N/A" in HIG
            ],
            "ExtraLargeRingImage": [
                38: CGSize(width: 126, height: 126),
                40: CGSize(width: 133, height: 133),
                42: CGSize(width: 133, height: 133),
                44: CGSize(width: 146, height: 146)
            ],
            "ExtraLargeSimpleImage": [
                38: CGSize(width: 182, height: 182),
                40: CGSize(width: 203, height: 203),
                42: CGSize(width: 203, height: 203),
                44: CGSize(width: 224, height: 224)
            ],
            "ExtraLargeStackImage": [
                38: CGSize(width: 156, height: 84),
                40: CGSize(width: 174, height: 90),
                42: CGSize(width: 174, height: 90),
                44: CGSize(width: 192, height: 102)
            ],
            "GraphicCornerCircularImage": [
                40: CGSize(width: 64, height: 64),
                44: CGSize(width: 72, height: 72)
            ],
            "GraphicCornerGaugeImage": [
                40: CGSize(width: 40, height: 40),
                44: CGSize(width: 44, height: 44)
            ],
            "GraphicCornerTextImage": [
                40: CGSize(width: 40, height: 40),
                44: CGSize(width: 44, height: 44)
            ],
            "GraphicCircularImage": [
                40: CGSize(width: 84, height: 84),
                44: CGSize(width: 94, height: 94)
            ],
            "GraphicCircularClosedGaugeImage": [
                40: CGSize(width: 54, height: 54),
                44: CGSize(width: 62, height: 62)
            ],
            "GraphicCircularOpenGaugeImage": [
                40: CGSize(width: 22, height: 22),
                44: CGSize(width: 24, height: 24)
            ],
            "GraphicRectangularLargeImage": [
                40: CGSize(width: 300, height: 94),
                44: CGSize(width: 342, height: 108)
            ],
            "GraphicRectangularStandardBody": [
                40: CGSize(width: 24, height: 24),
                44: CGSize(width: 27, height: 27)
            ],
            "GraphicRectangularTextGauge": [
                40: CGSize(width: 24, height: 24),
                44: CGSize(width: 27, height: 27)
            ]
        ]

        let deviceSize = WKInterfaceDevice.currentResolution().rawValue

        if let sizeDict = imageSizes[self.rawValue], let size = sizeDict[deviceSize] {
            return size
        }

        return nil
    }

    var placeholderImageSize: CGSize? {
        // Template: Device Size: Image Size @1x
        let imageSizes: [String: [Int: CGSize]] = [
            "circularSmall": [
                38: CGSize(width: 32, height: 32),
                40: CGSize(width: 36, height: 36),
                42: CGSize(width: 36, height: 36),
                44: CGSize(width: 40, height: 40)
            ],
            "extraLarge": [
                38: CGSize(width: 156, height: 156),
                40: CGSize(width: 174, height: 174),
                42: CGSize(width: 174, height: 174),
                44: CGSize(width: 192, height: 192)
            ],
            "modular": [
                38: CGSize(width: 52, height: 52),
                40: CGSize(width: 58, height: 58),
                42: CGSize(width: 58, height: 58),
                44: CGSize(width: 64, height: 64)
            ],
            "utilitarian": [
                38: CGSize(width: 40, height: 40),
                40: CGSize(width: 44, height: 44),
                42: CGSize(width: 44, height: 44),
                44: CGSize(width: 50, height: 50)
            ],
            "graphicCorner": [
                40: CGSize(width: 40, height: 40),
                44: CGSize(width: 44, height: 44)
            ],
            "graphicCircular": [
                40: CGSize(width: 84, height: 84),
                44: CGSize(width: 94, height: 94)
            ],
            "graphicBezel": [
                40: CGSize(width: 84, height: 84),
                44: CGSize(width: 94, height: 94)
            ],
            "graphicRectangular": [
                40: CGSize(width: 300, height: 94),
                44: CGSize(width: 342, height: 108)
            ]
        ]

        let deviceSize = WKInterfaceDevice.currentResolution().rawValue

        var key: String = self.group.rawValue

        if self.group == .graphic {
            key = self.groupMember.rawValue
        }

        if let sizeDict = imageSizes[key], let size = sizeDict[deviceSize] {
            return size
        }

        return nil
    }
    #endif

    var hasRing: Bool {
        switch self {
        case .CircularSmallRingImage, .CircularSmallRingText, .ExtraLargeRingImage, .ExtraLargeRingText,
             .ModularSmallRingImage, .ModularSmallRingText, .UtilitarianSmallRingImage, .UtilitarianSmallRingText:
            return true
        default:
            return false
        }
    }

    var hasGauge: Bool {
        switch self {
        case .GraphicCircularClosedGaugeImage, .GraphicCircularClosedGaugeText, .GraphicCircularOpenGaugeImage,
             .GraphicCircularOpenGaugeRangeText, .GraphicCircularOpenGaugeSimpleText, .GraphicCornerGaugeImage,
             .GraphicCornerGaugeText, .GraphicRectangularTextGauge:
            return true
        default:
            return false
        }
    }

    var gaugeCanBeEitherStyle: Bool {
        switch self {
        case .GraphicCornerGaugeImage, .GraphicCornerGaugeText, .GraphicRectangularTextGauge:
            return true
        default:
            return false
        }
    }

    var gaugeIsOpenStyle: Bool {
        switch self {
        case .GraphicCircularOpenGaugeImage, .GraphicCircularOpenGaugeRangeText, .GraphicCircularOpenGaugeSimpleText:
            return true
        default:
            return false
        }
    }

    var gaugeIsClosedStyle: Bool {
        switch self {
        case .GraphicCircularClosedGaugeImage, .GraphicCircularClosedGaugeText:
            return true
        default:
            return false
        }
    }

    var hasImage: Bool {
        switch self {
        case .CircularSmallRingImage, .CircularSmallSimpleImage, .CircularSmallStackImage, .ExtraLargeRingImage,
             .ExtraLargeSimpleImage, .ExtraLargeStackImage, .GraphicCircularClosedGaugeImage, .GraphicCircularImage,
             .GraphicCircularOpenGaugeImage, .GraphicCornerCircularImage, .GraphicCornerGaugeImage,
             .GraphicCornerTextImage, .GraphicRectangularLargeImage, .GraphicRectangularStandardBody,
             .GraphicRectangularTextGauge, .ModularLargeColumns, .ModularLargeStandardBody, .ModularLargeTable,
             .ModularSmallRingImage, .ModularSmallSimpleImage, .ModularSmallStackImage, .UtilitarianLargeFlat,
             .UtilitarianSmallFlat, .UtilitarianSmallRingImage, .UtilitarianSmallSquare:
            return true
        default:
            return false
        }
    }

    var supportsRow2Alignment: Bool {
        switch self {
        case .ModularLargeColumns, .ModularLargeTable, .ExtraLargeColumnsText:
            return true
        default:
            return false
        }
    }
}

extension ComplicationTemplate: CaseIterable {}

public enum ComplicationTextAreas: String, CaseIterable {
    case Body1 = "Body 1"
    case Body2 = "Body 2"
    case Bottom = "Bottom"
    case Center = "Center"
    case Header = "Header"
    case Inner = "Inner"
    case InsideRing = "Inside Ring"
    case Leading = "Leading"
    case Line1 = "Line 1"
    case Line2 = "Line 2"
    case Outer = "Outer"
    case Row1Column1 = "Row 1, Column 1"
    case Row1Column2 = "Row 1, Column 2"
    case Row2Column1 = "Row 2, Column 1"
    case Row2Column2 = "Row 2, Column 2"
    case Row3Column1 = "Row 3, Column 1"
    case Row3Column2 = "Row 3, Column 2"
    case Trailing = "Trailing"

    var description: String {
        switch self {
        case .Body1:
            return L10n.Watch.Labels.ComplicationTextAreas.Body1.description
        case .Body2:
            return L10n.Watch.Labels.ComplicationTextAreas.Body2.description
        case .Bottom:
            return L10n.Watch.Labels.ComplicationTextAreas.Bottom.description
        case .Center:
            return L10n.Watch.Labels.ComplicationTextAreas.Center.description
        case .Header:
            return L10n.Watch.Labels.ComplicationTextAreas.Header.description
        case .Inner:
            return L10n.Watch.Labels.ComplicationTextAreas.Inner.description
        case .InsideRing:
            return L10n.Watch.Labels.ComplicationTextAreas.InsideRing.description
        case .Leading:
            return L10n.Watch.Labels.ComplicationTextAreas.Leading.description
        case .Line1:
            return L10n.Watch.Labels.ComplicationTextAreas.Line1.description
        case .Line2:
            return L10n.Watch.Labels.ComplicationTextAreas.Line2.description
        case .Outer:
            return L10n.Watch.Labels.ComplicationTextAreas.Outer.description
        case .Row1Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row1Column1.description
        case .Row1Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row1Column2.description
        case .Row2Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row2Column1.description
        case .Row2Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row2Column2.description
        case .Row3Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row3Column1.description
        case .Row3Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row3Column2.description
        case .Trailing:
            return L10n.Watch.Labels.ComplicationTextAreas.Trailing.description
        }
    }

    var label: String {
        switch self {
        case .Body1:
            return L10n.Watch.Labels.ComplicationTextAreas.Body1.label
        case .Body2:
            return L10n.Watch.Labels.ComplicationTextAreas.Body2.label
        case .Bottom:
            return L10n.Watch.Labels.ComplicationTextAreas.Bottom.label
        case .Center:
            return L10n.Watch.Labels.ComplicationTextAreas.Center.label
        case .Header:
            return L10n.Watch.Labels.ComplicationTextAreas.Header.label
        case .Inner:
            return L10n.Watch.Labels.ComplicationTextAreas.Inner.label
        case .InsideRing:
            return L10n.Watch.Labels.ComplicationTextAreas.InsideRing.label
        case .Leading:
            return L10n.Watch.Labels.ComplicationTextAreas.Leading.label
        case .Line1:
            return L10n.Watch.Labels.ComplicationTextAreas.Line1.label
        case .Line2:
            return L10n.Watch.Labels.ComplicationTextAreas.Line2.label
        case .Outer:
            return L10n.Watch.Labels.ComplicationTextAreas.Outer.label
        case .Row1Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row1Column1.label
        case .Row1Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row1Column2.label
        case .Row2Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row2Column1.label
        case .Row2Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row2Column2.label
        case .Row3Column1:
            return L10n.Watch.Labels.ComplicationTextAreas.Row3Column1.label
        case .Row3Column2:
            return L10n.Watch.Labels.ComplicationTextAreas.Row3Column2.label
        case .Trailing:
            return L10n.Watch.Labels.ComplicationTextAreas.Trailing.label
        }
    }

    var slug: String {
        var cleanLocation = self.rawValue
        cleanLocation = cleanLocation.replacingOccurrences(of: " ", with: "")
        cleanLocation = cleanLocation.replacingOccurrences(of: ",", with: "")

        return cleanLocation
    }
}
