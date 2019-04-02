//
//  ZJSingleSelectionConfig.m
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJSingleSelectionConfig.h"

@implementation ZJSingleSelectionConfig


+ (void)configTableView:(UITableView *)tableView model:(ZJCourseExamTopicModel *)model hasFooter:(BOOL)hasFooter index:(NSInteger)index {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    UILabel *numLb = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 0, 0)];
    numLb.text = [@(index+1).description stringByAppendingString:@"."];
    [numLb sizeToFit];
    [headerView addSubview:numLb];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    topView.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:topView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH/2-20, 40)];
    titleLabel.text = @"单选题";
    [topView addSubview:titleLabel];
    
    UILabel *testNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2-20, 40)];
    testNumLabel.text = model.location;
    testNumLabel.textAlignment = NSTextAlignmentRight;
    [topView addSubview:testNumLabel];
    
    
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(10, topView.bottom + 10, SCREEN_WIDTH - 20, 0)];
    titleLb.numberOfLines = 0;
    titleLb.text = model.question;
    [titleLb sizeToFit];
    [headerView addSubview:titleLb];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(8, titleLb.bottom + 10, SCREEN_WIDTH - 16, 1)];
    line.backgroundColor = kHomeColor;
    [headerView addSubview:line];
    
    headerView.height = line.bottom + 10;
    tableView.tableHeaderView = headerView;
    
    
    
    //    if (hasFooter) {
    //        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    //
    //        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(8, 20, footView.width -16, 1)];
    //        lineView.backgroundColor = kHomeColor;
    //        [footView addSubview:lineView];
    //
    //        UILabel *messageLb = [[UILabel alloc] initWithFrame:CGRectMake(10, lineView.bottom+10, footView.width-20, 0)];
    //        messageLb.numberOfLines = 0;
    //        BOOL hasFoot = YES;
    //        if (self.model.exerciseType == 4) {//问答题
    //
    //
    //            messageLb.text = @"待审批";
    //            messageLb.textColor = [UIColor redColor];
    //
    //            [messageLb sizeToFit];
    //
    //        }else{
    //
    //            if (model.userAnswer.length > 0) {
    //                if ([model.userAnswer isEqualToString:self.model.answer]) {//答案正确
    ////                    self.isRight = YES;
    //                    messageLb.text = [NSString stringWithFormat:@"正确答案：%@  你选对了",self.model.answer];
    //                    [messageLb sizeToFit];
    //                    messageLb.textColor =  RGB(152, 207, 90);
    //                }else{
    ////                    self.isRight = NO;
    //                    messageLb.text = [NSString stringWithFormat:@"正确答案：%@  你错选为%@",self.model.answer,model.userAnswer];
    //                    [messageLb sizeToFit];
    //                    messageLb.textColor = [UIColor redColor];
    //                }
    //
    //            }else{
    ////                self.isRight = NO;
    //                messageLb.text = [NSString stringWithFormat:@"正确答案：%@  你未作答",self.model.answer];
    //                [messageLb sizeToFit];
    //                messageLb.textColor = [UIColor redColor];
    //            }
    //
    //
    //        }
    //        [footView addSubview:messageLb];
    //
    //
    //        UILabel *scoreLb = [[UILabel alloc] initWithFrame:CGRectMake(10, messageLb.bottom + 10, footView.width-20, 0)];
    //        scoreLb.textColor = [UIColor darkGrayColor];
    //        UITextView *remarkLb = nil;
    //        if (!hasFoot) {
    //            scoreLb.text = @"";
    //            [scoreLb sizeToFit];
    //        }else{
    ////            if (self.isRight) {
    //                scoreLb.text = [NSString stringWithFormat:@"得分：%i分",self.model.score];
    ////            }else{
    //                scoreLb.text = @"得分：0分";
    ////            }
    //
    //            [scoreLb sizeToFit];
    //
    //            //  答案解析
    //            remarkLb = [[UITextView alloc] initWithFrame:CGRectMake(10, scoreLb.bottom+10, footView.width-20, 100)];
    //            NSString *text = [NSString stringWithFormat:@"题目解析：%@",NONullString(self.model.remark)];
    //            remarkLb.text = text;
    //            remarkLb.textColor = [UIColor darkGrayColor];
    //            remarkLb.font = [UIFont systemFontOfSize:17];
    //            remarkLb.editable = NO;
    //            CGFloat remarkH = [remarkLb sizeThatFits:CGSizeMake(footView.width-20, MAXFLOAT)].height;
    //            ViewBorderRadiusColor(remarkLb, 5, 1, kHomeColor);
    //            remarkLb.height = MAX(remarkH, 100);
    //            [footView addSubview:remarkLb];
    //
    //
    //
    //        }
    //
    //        [footView addSubview:scoreLb];
    //
    //        footView.height =  MAX(scoreLb.bottom, remarkLb.bottom)  + 10;
    //
    //        self.tableFooterView = footView;
    //
    //
    //    }
}

@end
