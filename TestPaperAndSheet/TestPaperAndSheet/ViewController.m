//
//  ViewController.m
//  TestPaperAndSheet
//
//  Created by YZK-iOS on 2019/4/1.
//  Copyright © 2019 _zhangJ. All rights reserved.
//

#import "ViewController.h"

#import "ZJTestPaperViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *beginTestButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 88)];
    [beginTestButton setTitle:@"试题练习" forState:UIControlStateNormal];
    beginTestButton.backgroundColor = [UIColor orangeColor];
    [beginTestButton addTarget:self action:@selector(beginTestAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginTestButton];
    
    UIButton *beginTestButton1 = [[UIButton alloc] initWithFrame:CGRectMake(30, beginTestButton.bottom+20, self.view.frame.size.width-60, 88)];
    beginTestButton1.tag = 1;
    [beginTestButton1 setTitle:@"错题与收藏" forState:UIControlStateNormal];
    beginTestButton1.backgroundColor = [UIColor orangeColor];
    [beginTestButton1 addTarget:self action:@selector(beginTestAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginTestButton1];
    
    UIButton *beginTestButton2 = [[UIButton alloc] initWithFrame:CGRectMake(30, beginTestButton1.bottom+20, self.view.frame.size.width-60, 88)];
    beginTestButton2.tag = 2;
    [beginTestButton2 setTitle:@"模拟考试" forState:UIControlStateNormal];
    beginTestButton2.backgroundColor = [UIColor orangeColor];
    [beginTestButton2 addTarget:self action:@selector(beginTestAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginTestButton2];
    
    UIButton *beginTestButton3 = [[UIButton alloc] initWithFrame:CGRectMake(30, beginTestButton2.bottom+20, self.view.frame.size.width-60, 88)];
    beginTestButton3.tag = 3;
    [beginTestButton3 setTitle:@"正式考核" forState:UIControlStateNormal];
    beginTestButton3.backgroundColor = [UIColor orangeColor];
    [beginTestButton3 addTarget:self action:@selector(beginTestAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginTestButton3];
    
    
}

- (void)beginTestAction:(UIButton *)btn {
    
    if (btn.tag == 0) {
        ZJTestPaperViewController *testPaperVC = [ZJTestPaperViewController new];
        testPaperVC.testPaperType = 0;
        [self.navigationController pushViewController:testPaperVC animated:YES];
    } else if (btn.tag == 1) {
        /// ZJTestPaperTypeWrongAndCollect, ///< 错题与收藏.
        ZJTestPaperViewController *testPaperVC = [ZJTestPaperViewController new];
        [self.navigationController pushViewController:testPaperVC animated:YES];
    } else if (btn.tag == 2) {
        ZJTestPaperViewController *testPaperVC = [ZJTestPaperViewController new];
        testPaperVC.testPaperType = 1;
        [self.navigationController pushViewController:testPaperVC animated:YES];
    } else if (btn.tag == 3) {
        ZJTestPaperViewController *testPaperVC = [ZJTestPaperViewController new];
        testPaperVC.testPaperType = 2;
        [self.navigationController pushViewController:testPaperVC animated:YES];
    }
}


@end
