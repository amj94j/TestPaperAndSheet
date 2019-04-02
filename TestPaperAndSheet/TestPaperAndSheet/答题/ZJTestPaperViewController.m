//
//  ZJTestPaperViewController.m
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/1.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJTestPaperViewController.h"
#import "ZJSingleSelectionTableView.h"
//#import "MultiSelectionTableView.h"
//#import "EssayquestionTableView.h"
//#import "TestPaperResultController.h"
#import "ZJCourseExamTopicModel.h"
#import "UIAlertView+Blocks.h"

#import "ZJSheetViewController.h"

#define kBottomH  60.0f

@interface ZJTestPaperViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ZJTestPaperViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = self.defautIndex;
    
    [self setupData];
    
    [self setupCollectionView];
    
    [self setupBottomView];
    
}

#pragma mark - InitData

- (void)setupData {
    
    if (self.type == 0) {
        NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testData" ofType:@"plist" ]];
        int index = 0;
        for (int i = 0; i<10000; i++) {
            for (NSDictionary *topicDic in dataDic[@"data"]) {
                ZJCourseExamTopicModel *model = [[ZJCourseExamTopicModel alloc] init];
                [model setValuesForKeysWithDictionary:topicDic];
                model.Id = index;
                [self.dataSource addObject:model];
                index++;
            }
        }
        
        
    }
    
}

#pragma mark - UI
- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT- SafeAreaTopHeight - SafeAreaBottomHeight - kBottomH);
    // 确定水平滑动方向
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - kBottomH) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.scrollEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
    // 首次调用
    self.collectionView.contentOffset = CGPointMake(self.currentIndex*SCREEN_WIDTH, 0);
    self.title = [NSString stringWithFormat:@"%ld/%ld",self.currentIndex+1,self.dataSource.count];
}

- (void)setupBottomView {
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - kBottomH, SCREEN_WIDTH, kBottomH)];
    bottomView.backgroundColor = kHomeColor;
    [self.view addSubview:bottomView];
    
    /// 答题卡
    UIButton *sheetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sheetButton.frame = CGRectMake(0, 0, bottomView.width/3, bottomView.height);
    [sheetButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
    sheetButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [sheetButton setTitle:@"答题卡" forState:UIControlStateNormal];
    sheetButton.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:sheetButton];
    [sheetButton addTarget:self action:@selector(sheetAction) forControlEvents:UIControlEventTouchUpInside];
    
    /// 答案
    UIButton *answerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    answerButton.frame = CGRectMake(bottomView.width/3, 0, bottomView.width/3, bottomView.height);
    [answerButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
    answerButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [answerButton setTitle:@"答案" forState:UIControlStateNormal];
    answerButton.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:answerButton];
    [answerButton addTarget:self action:@selector(answerAction) forControlEvents:UIControlEventTouchUpInside];
    
    /// 收藏此题
    UIButton *collectionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    collectionButton.frame = CGRectMake(bottomView.width/3*2, 0, bottomView.width/3, bottomView.height);
    [collectionButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
    collectionButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [collectionButton setTitle:@"收藏此题" forState:UIControlStateNormal];
    collectionButton.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:collectionButton];
    [collectionButton addTarget:self action:@selector(collectionAction) forControlEvents:UIControlEventTouchUpInside];
    
}

/// 答题卡
- (void)sheetAction {
    /// 使用模态 然后将点击的数据传回来 然后跳转到相应的数据里面去
    ZJSheetViewController *vc = [ZJSheetViewController new];
    vc.dataSource = self.dataSource;
    [self.navigationController pushViewController:vc animated:YES];
    vc.action = ^(ZJCourseExamTopicModel * _Nonnull model) {
        ///
        NSLog(@"跳转到第%d题",model.Id);
        [self jumpForCurrentIndex:model.Id];
    };
    
}

- (void)answerAction {
    
}

- (void)collectionAction {
    
}

#pragma mark - Action
// 提交答案
- (void)submit {
    
    [self _updateAnswers];
    __weak typeof(self) weakSelf = self;
    BOOL isDoAll = YES;//题目是否走做完
    for (ZJCourseExamTopicModel *model in self.dataSource) {
        if (model.userAnswer.length == 0) {
            isDoAll = NO;
            break;
        }
    }
    
    if (!isDoAll) {
        [UIAlertView showWithTitle:nil message:@"有未做的题目是否确认提交?" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {//确定
                [weakSelf submitAnswer];
            }
        }];
    } else {
        [UIAlertView showWithTitle:nil message:@"提交后本次测验答案将不可修改，确定要提交?" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {//确定
                
                [weakSelf submitAnswer];
            }
        }];
        
    }
    
}

- (void)submitAnswer {

}

// 下一题
- (void)next {
    self.collectionView.contentOffset = CGPointMake((self.currentIndex + 1)*SCREEN_WIDTH, 0);
}

// 上一题
- (void)previous {
    self.collectionView.contentOffset = CGPointMake((self.currentIndex - 1)*SCREEN_WIDTH, 0);
}

/// 跳转到相应的题页面
- (void)jumpForCurrentIndex:(int)currentIndex {
    self.collectionView.contentOffset = CGPointMake(currentIndex*SCREEN_WIDTH, 0);
}

- (void)popSelf {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - collectionView delegate&dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.backgroundColor = [UIColor cyanColor];
    ZJCourseExamTopicModel *model = self.dataSource[indexPath.row];
    
    ZJSingleSelectionTableView *tableView = [[ZJSingleSelectionTableView alloc] initWithFrame:CGRectZero];
    model.location = [NSString stringWithFormat:@"%d/%ld",model.Id+1,self.dataSource.count];
    tableView.frame = CGRectMake(0, 0,  self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    [cell.contentView addSubview:tableView];
    
//    if (self.type == 1) {//做过了  看题目
        [tableView config:model hasFooter:YES index:indexPath.item];
        tableView.tempAnswer = model.userAnswer;
//
//    } else {
//        [tableView config:model hasFooter:NO index:indexPath.item];
//        tableView.tempAnswer = model.userAnswer;
//    }
    
    return cell;
    
}


#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index =  (scrollView.contentOffset.x+scrollView.frame.size.width*0.5)/scrollView.frame.size.width;
    //  index == self.defautIndex   为了点击某一题进入  更新底部按钮状态
    if (index != self.currentIndex || index == self.defautIndex) {//页面改变了
        // 这里设置成-1  为了index == self.defautIndex 失效
        self.defautIndex = -1;
        
        // 更新保存的答案
        [self _updateAnswers];
        
        self.currentIndex = index;
        
        self.title = [NSString stringWithFormat:@"%ld/%ld",self.currentIndex+1,self.dataSource.count];
        
        
        if (self.currentIndex == self.dataSource.count-1) {//最后一题
            
            if (self.type == 1) {//已提交则显示上一题
//                [self.rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.left.equalTo(SCREEN_WIDTH);
//                }];
                
            } else {// 未提交显示提交
                [self _changeRightBtnStatusLeftMargin:SCREEN_WIDTH*0.4 title:NSLocalizedString(@"提交", nil) titleColor:[UIColor whiteColor] backColor:RGB(85, 207, 226) action:@selector(submit)];
            }
            
        }else if(self.currentIndex == 0){//第一题
            
            [self _changeRightBtnStatusLeftMargin:0 title:NSLocalizedString(@"下一题", nil) titleColor:RGB(100, 100, 100) backColor:[UIColor whiteColor] action:@selector(next)];
            
        }else{//中间题
            
            [self _changeRightBtnStatusLeftMargin:(SCREEN_WIDTH*0.5) title:NSLocalizedString(@"下一题", nil) titleColor:RGB(100, 100, 100) backColor:[UIColor whiteColor] action:@selector(next)];
            
        }
    }
    
    
}

#pragma mark - privite
- (void)_changeRightBtnStatusLeftMargin:(CGFloat)leftMargin title:(NSString *)title  titleColor:(UIColor *)titleColor backColor:(UIColor *)backColor action:(SEL)action{
    
    
//    [self.rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.rightBtn.superview).offset(leftMargin);
//    }];
//    [self.rightBtn setTitleColor:titleColor forState:UIControlStateNormal];
//    [self.rightBtn setTitle:title forState:UIControlStateNormal];
//    self.rightBtn.backgroundColor = backColor;
//    // 移除btn所有事件
//    [[self.rightBtn allTargets] enumerateObjectsUsingBlock: ^(id object, BOOL *stop) {
//        [self.rightBtn removeTarget:object action:NULL forControlEvents:UIControlEventAllEvents];
//    }];
//    [self.rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 更新暂存的答案
- (void)_updateAnswers{
    
    for (UICollectionViewCell *cell in [self.collectionView visibleCells]) {
        
//        BaseTestPaperTableView *tableView = cell.contentView.subviews[0];
//        
//        [self.dataSource enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(CourseExamTopicModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
//            
//            if (model.Id == [tableView.answer[@"exerId"] intValue]) {
//                model.userAnswer = tableView.answer[@"answer"];
//            }
//            
//        }];
        
    }
    
}



@end
