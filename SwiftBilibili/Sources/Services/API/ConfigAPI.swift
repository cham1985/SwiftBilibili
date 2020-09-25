//
//  ConfigAPI.swift
//  SwiftBilibili
//
//  Created by 罗文 on 2020/9/5.
//  Copyright © 2020 luowen. All rights reserved.
//  swiftlint:disable variable_name

import Moya

/// app中的一些配置API 比如广告 开屏 上传
enum ConfigAPI {
    /// 开屏图列表
    case splashList
    /// 广告列表
    case adList
    /// 标签栏列表
    case tabList
}

extension ConfigAPI: TargetType {

    var baseURL: URL {
        return URL(string: "http://app.bilibili.com")!
    }

    var path: String {
        switch self {
        case .splashList:
            return "/x/v2/splash/brand/list"
        case .adList:
            return "/x/v2/splash/list"
        case .tabList:
            return "/x/resource/show/tab"
        }
    }

    var method: Method {
        switch self {
        case .splashList,.adList,.tabList:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .splashList:
            return .requestParameters(parameters: ["network": NetStatusManager.default.reachabilityConnection.value.description.lowercased(),"ts":"1601015546","sign":"44f144f16da5ab6d758d767282df6186","statistics":"%7B%22appId%22%3A1%2C%22version%22%3A%226.10.0%22%2C%22abtest%22%3A%22%22%2C%22platform%22%3A1%7D","build":"10300","screen_height":"2436","screen_width":"1125"], encoding: URLEncoding.default)
        case .adList:
            return .requestParameters(parameters: ["ad_extra":adExtra,"birth":"","height":"2436","width":"1125","sign":"625b697f828703ee8d62f26045bba2e0","build":"10300","ts":"1601015546","statistics":"%7B%22appId%22%3A1%2C%22version%22%3A%226.10.0%22%2C%22abtest%22%3A%22%22%2C%22platform%22%3A1%7D"], encoding: URLEncoding.default)
        case .tabList:
            return .requestParameters(parameters: ["appver":"10300","filtered":"1","sign":"9ce189481c9014339ee1fbda152bcb03","build":"10300","ts":"1601015545","statistics":"%7B%22appId%22%3A1%2C%22version%22%3A%226.10.0%22%2C%22abtest%22%3A%22%22%2C%22platform%22%3A1%7D"], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}

extension ConfigAPI {
    var adExtra: String {
        return  "F6209EEC4D712ADB7AAF94480A782BC7DA2715C77FE25001F5FB49394B682198E786E46161C40B92AC5EF0BA4C1EB739E3F12AED4E2BF5D32A3FA3EBC23ED21100C43C049922D2E0A0F975D04A29EB11056B6CE74833E7D536C165634438CD9CA1F10C777100E28C088F4D7D8DB0357B234756C288FD4E8CCC7229D84F81614028BCB0BFDFCD5C23C0D46EFA89E36C7A2C9C10475268A264482DB9A230708C86DE8CDD4C68D547A4D5EE48BE8D5BB52E477E46C9100A8C1B09FBA458FD36012905C71CC354884D3BE08E87AB992C739432E35A0ACA8FF89CF58B0ED9A58D01548E335F5A254C1E54308AD8ACB8A0D331691484193653FFC27CD53B80BD1F868E020CDAACAA80B45EF6BBFF41D17FA2F35F395DAB1907FB427103CF7D9DBA0508FD1CF2827FDBB805FE317C3FB59A33444333012BCA1EE34FAFD5F7EDFE3C77448B05B49DCCEE860769E15408631C033325C6F4BE951400EE2D24F2440475B644E0AAFCCB8FD5FF732D8CCEE55A5CB8587A4A6C1F7738F747BD2C9734C162FE3F292850CB6AB3FCE9B835B4A51285F73F55C7410E67A5AEAF20B2B23B6939FA62E9D95588482B2EA2F9BAEC2AFC207FDF5A1088F7CACFB28AFD88E63465A22C56112345541A46B1B2AC62F81A0D202CD3F6C917EC923F724441B9535161F5FB841B635DF87F75C97148885980B7368F76C3A2D08276845F9D82B7753CDBA1977456C642071F7E6D1F0C3C08A0E0720FECE72BC9B4A8633AB593DFB51251169413"
    }
}
