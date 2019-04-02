//
//  ZJTestPaperBottomView.h
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/2.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZJTestPaperBottomType) {
    ZJTestPaperBottomTypePractice = 0, ///< 练习.
    ZJTestPaperBottomTypeTest ///< 考试.
};

@protocol ZJTestPaperBottomViewDelegate <NSObject>

@optional
- (void)sheetClick:(NSInteger)type;
- (void)answerClick;
- (void)collectionClick;
- (void)endClick;

@end

@interface ZJTestPaperBottomView : UIView

@property (nonatomic, assign) ZJTestPaperBottomType type;

@property (nonatomic, weak) id<ZJTestPaperBottomViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
