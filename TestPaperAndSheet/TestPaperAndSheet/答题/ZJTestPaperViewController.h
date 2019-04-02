//
//  ZJTestPaperViewController.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/1.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZJTestPaperType) {
    ZJTestPaperTypePractice = 0, ///< 试题练习.
    ZJTestPaperTypeSimulationTest, ///< 模拟考试.
    ZJTestPaperTypeFormalTest ///< 正式考核.
};

@interface ZJTestPaperViewController : UIViewController

@property (nonatomic, assign) NSInteger CourseExamId;

@property (nonatomic, assign) NSInteger defautIndex;

@property (nonatomic, assign) NSInteger type;//0:未做   1、做过了

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) ZJTestPaperType testPaperType;

@end

NS_ASSUME_NONNULL_END
