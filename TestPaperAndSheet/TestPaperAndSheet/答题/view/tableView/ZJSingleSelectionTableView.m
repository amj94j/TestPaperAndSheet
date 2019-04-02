//
//  ZJSingleSelectionTableView.m
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJSingleSelectionTableView.h"
#import "ZJSingleSelectCell.h"

#import "ZJSingleSelectionConfig.h"

@interface ZJSingleSelectionTableView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *rowHeightDic;

@property (nonatomic, strong) ZJCourseExamTopicModel *model;

@property (nonatomic, assign) NSInteger selected;

@end

@implementation ZJSingleSelectionTableView


- (NSArray *)answerList{
    if (!_answerList) {
        _answerList = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",];
    }
    return _answerList;
    
}

- (NSArray *)questionList{
    if (!_questionList) {
        _questionList =  @[NONullString(_model.itemA),NONullString(_model.itemB),NONullString(_model.itemC),NONullString(_model.itemD),NONullString(_model.itemE),NONullString(_model.itemF),NONullString(_model.itemG),NONullString(_model.itemH),NONullString(_model.itemI),NONullString(_model.itemJ)];
    }
    return _questionList;
}


- (NSMutableDictionary *)rowHeightDic{
    if (!_rowHeightDic) {
        _rowHeightDic = [NSMutableDictionary dictionary];
    }
    return _rowHeightDic;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selected = -1;
        [self registerNib:[UINib nibWithNibName:@"ZJSingleSelectCell" bundle:nil] forCellReuseIdentifier:@"ZJSingleSelectCell"];
    }
    return self;
}


- (void)config:(ZJCourseExamTopicModel *)model  hasFooter:(BOOL)hasFooter index:(NSInteger)index {
    [ZJSingleSelectionConfig configTableView:self model:model hasFooter:hasFooter index:index];
    
    self.model = model;
    
    self.delegate = self;
    self.dataSource = self;
    
    //    [self reloadData];
}


#pragma mark - TableViewDelegate & TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.model.exerciseType == 3) return 2;
    
    return self.model.itemNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSingleSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZJSingleSelectCell" forIndexPath:indexPath];
    cell.contentLb.text = [NSString stringWithFormat:@"%@.%@",self.answerList[indexPath.row],self.questionList[indexPath.row]];
    
    if (indexPath.row == self.selected) {
//        if (!self.canEdit) {
//            if (!self.isRight) {
//                cell.contentLb.textColor = [UIColor redColor];
//            }else{
//                cell.contentLb.textColor = [UIColor darkGrayColor];
//            }
//
//        }
        cell.btn.selected = YES;
        
    }else{
        cell.btn.selected = NO;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selected = indexPath.row;
    self.model.userAnswer = self.answerList[_selected];
    if (self.block) {
        self.block(self.model);
    }
    [self reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *number = [self.rowHeightDic objectForKey:@(indexPath.row).description];
    
    
    if (number) {
        return number.floatValue;
    }else{
        CGFloat height = [self _getHeightWithStr:self.questionList[indexPath.row]];
        
        [self.rowHeightDic setValue:[NSNumber numberWithFloat:height] forKey:@(indexPath.row).description];
        return height;
    }
}

- (CGFloat)_getHeightWithStr:(NSString *)str {
    return  [self calculateStringHeight:str width:SCREEN_WIDTH - 10 -18 -5 -10 fontSize:17] + 15;
}

//  计算文字高度
- (CGFloat)calculateStringHeight:(NSString *)str width:(CGFloat)width fontSize:(CGFloat)size {

    return  [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil].size.height;

}


//- (void)setTempAnswer:(NSString *)tempAnswer {
//    if (tempAnswer.length == 0)
//        return;
//    _selected = [self.answerList indexOfObject:tempAnswer];
//    [self reloadData];
//}

//- (NSDictionary *)answer {
//    
//    if (self.selected != -1) return  @{@"exerId":@(self.model.Id),@"answer":self.answerList[_selected]};
//    return @{@"exerId":@(self.model.Id),@"answer":@""};
//    
//}



@end
