//
//  WorthModel.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 3/5/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import Foundation

/**
*  身价模型
*/
class WorthModel: NSObject {
    var onDate: NSDate!     //上班时间
    var offDate: NSDate!    //下班时间
    var salary: Float!      //月薪
    var overtime: Float!    //周末加班小时数
    
    var worth: Float!       //身价
    var efficiency: Float!  //工作效率
    var desc: String!       //结果描述
}
