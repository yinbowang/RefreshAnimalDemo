//
//  ViewController.m
//  刷新动画
//
//  Created by wyb on 2017/2/26.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "YBRefreshGifHeader.h"

#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-64)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    
    
    UILabel *lab = [UILabel new];
    lab.textColor = [UIColor blueColor];
    lab.text = @"下拉刷新我";
    lab.frame = CGRectMake(100, 100, 100, 30);
    [self.scrollView addSubview:lab];
    
    self.scrollView.mj_header =  [YBRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.scrollView.mj_header endRefreshing];
        });
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
