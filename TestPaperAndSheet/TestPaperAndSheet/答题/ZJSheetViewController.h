//
//  ZJSheetViewController.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/1.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJCourseExamTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ selecedWhichTopic)(ZJCourseExamTopicModel *model);

@interface ZJSheetViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy) selecedWhichTopic action;

@end

NS_ASSUME_NONNULL_END
