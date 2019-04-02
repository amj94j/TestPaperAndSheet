//
//  ZJTestPaperBottomView.m
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ZJTestPaperBottomView.h"

@implementation ZJTestPaperBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setType:(ZJTestPaperBottomType)type {
    if (type == ZJTestPaperBottomTypePractice) {
        /// 答题卡
        UIButton *sheetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        sheetButton.frame = CGRectMake(0, 0, self.width/3, self.height);
        [sheetButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        sheetButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [sheetButton setTitle:@"答题卡" forState:UIControlStateNormal];
        sheetButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:sheetButton];
        [sheetButton addTarget:self action:@selector(sheetAction:) forControlEvents:UIControlEventTouchUpInside];
        
        /// 答案
        UIButton *answerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        answerButton.frame = CGRectMake(self.width/3, 0, self.width/3, self.height);
        [answerButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        answerButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [answerButton setTitle:@"答案" forState:UIControlStateNormal];
        answerButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:answerButton];
        [answerButton addTarget:self action:@selector(answerAction) forControlEvents:UIControlEventTouchUpInside];
        
        /// 收藏此题
        UIButton *collectionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        collectionButton.frame = CGRectMake(self.width/3*2, 0, self.width/3, self.height);
        [collectionButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        collectionButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [collectionButton setTitle:@"收藏此题" forState:UIControlStateNormal];
        collectionButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:collectionButton];
        [collectionButton addTarget:self action:@selector(collectionAction) forControlEvents:UIControlEventTouchUpInside];
    } else if (type == ZJTestPaperBottomTypeTest) {
        /// 答题卡
        UIButton *sheetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        sheetButton.tag = 1;
        sheetButton.frame = CGRectMake(0, 0, self.width/2, self.height);
        [sheetButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        sheetButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [sheetButton setTitle:@"答题卡" forState:UIControlStateNormal];
        sheetButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:sheetButton];
        [sheetButton addTarget:self action:@selector(sheetAction:) forControlEvents:UIControlEventTouchUpInside];
        
        /// 交卷
        UIButton *endButton = [UIButton buttonWithType:UIButtonTypeSystem];
        endButton.frame = CGRectMake(self.width/2, 0, self.width/2, self.height);
        [endButton setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        endButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [endButton setTitle:@"交卷" forState:UIControlStateNormal];
        endButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:endButton];
        [endButton addTarget:self action:@selector(endAction) forControlEvents:UIControlEventTouchUpInside];
    }
}


/// 答题卡
- (void)sheetAction:(UIButton *)btn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetClick:)]) {
        [self.delegate sheetClick:btn.tag];
    }
}

- (void)answerAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(answerClick)]) {
        [self.delegate answerClick];
    }
}

- (void)collectionAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionClick)]) {
        [self.delegate collectionClick];
    }
}

- (void)endAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(endClick)]) {
        [self.delegate endClick];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
