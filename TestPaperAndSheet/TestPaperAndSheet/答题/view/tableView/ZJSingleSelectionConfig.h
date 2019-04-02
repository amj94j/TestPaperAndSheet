//
//  ZJSingleSelectionConfig.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZJCourseExamTopicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSingleSelectionConfig : NSObject


/**
 <#Description#>

 @param tableView <#tableView description#>
 @param model <#model description#>
 @param hasFooter 如果答过的题则为YES FooterView会显示相应的答案
 @param index <#index description#>
 */
+ (void)configTableView:(UITableView *)tableView model:(ZJCourseExamTopicModel *)model hasFooter:(BOOL)hasFooter index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
