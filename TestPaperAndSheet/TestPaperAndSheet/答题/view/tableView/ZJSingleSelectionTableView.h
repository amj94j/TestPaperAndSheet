//
//  ZJSingleSelectionTableView.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJCourseExamTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSingleSelectionTableView : UITableView

@property (nonatomic, strong) NSArray *answerList;

@property (nonatomic, strong) NSArray *questionList;

@property (nonatomic, copy) NSString *tempAnswer; ///< 默认选中的答案 用来查看已经做过的题.

- (void)config:(ZJCourseExamTopicModel *)model  hasFooter:(BOOL)hasFooter index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
