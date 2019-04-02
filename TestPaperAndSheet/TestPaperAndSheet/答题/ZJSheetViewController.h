//
//  ZJSheetViewController.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/1.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseExamTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ selecedWhichTopic)(CourseExamTopicModel *model);

@interface ZJSheetViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataSource;

/// @brief 点击事件 - 存储block作为属性要记得用copy，而不是assign
@property (nonatomic, copy) selecedWhichTopic action;

@end

NS_ASSUME_NONNULL_END
