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
    [beginTestButton setTitle:@"开始答题" forState:UIControlStateNormal];
    beginTestButton.backgroundColor = [UIColor orangeColor];
    [beginTestButton addTarget:self action:@selector(beginTestAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginTestButton];
    
    NSLog(@"%f,%f",[[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom,[[[UIApplication sharedApplication] delegate] window].safeAreaInsets.top);
    
}

- (void)beginTestAction {
    ZJTestPaperViewController *testPaperVC = [ZJTestPaperViewController new];
    [self.navigationController pushViewController:testPaperVC animated:YES];
}


@end
