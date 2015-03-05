//
//  Calculator.swift
//  WorthCal
//
//  Created by Jiang Chuncheng on 3/5/15.
//  Copyright (c) 2015 SenseForce. All rights reserved.
//

import Foundation

/**
*  计算器
*  计算公式：
*       身价 = 月薪 × 12 × 40 ÷ ( (下班时刻 - 上班时刻) × 5 + 周末加班小时数)
*       工作效率 = 40 ÷ ( (下班时刻 - 上班时刻) × 5 + 周末加班小时数)
*/
class Calculator: NSObject {
    class func calculateWithSalary(salary: Float, onTime onDate: NSDate, offTime offDate: NSDate, overtimeHour overtime: Float) -> WorthModel {
        var worthModel = WorthModel()
        
        worthModel.salary = salary;
        worthModel.onDate = onDate;
        worthModel.offDate = offDate;
        worthModel.overtime = overtime;
        
        //计算工作效率
        var efficiency = 1.0;
        var hoursPerWeek = fabs(offDate.timeIntervalSinceDate(onDate)) / 3600 * 5 + Double(overtime)
        if (hoursPerWeek > 0) {
            efficiency = 40.0 / hoursPerWeek
        }
        worthModel.efficiency = Float(efficiency)
        
        //计算身价
        var worth = salary * 12 * Float(efficiency)
        worthModel.worth = worth
        
        //生成描述信息
        var desc = String(format: "您的身价：%.0f元\n工作效率：%.0f %%", worth, efficiency * 100)
        worthModel.desc = desc;
        
        return worthModel
    }
}
