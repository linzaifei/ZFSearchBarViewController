//
//  ViewController.m
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/20.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ViewController.h"
#import "ZFSearchViewController.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    

}
- (IBAction)Action:(UIButton *)sender {
    ZFSearchViewController *searchViewController = [[ZFSearchViewController alloc] init];
//    searchViewController.dataArr = @[@"几点几数据的",@"多撒多",@"多",@"几点几数据的",@"多撒多",@"多",@"多撒多",@"多打算大ss多",@"多打",@"几点几数据的",@"多撒多",@"多",@"几点几数据的",@"多撒多",@"多"];
    [self.navigationController pushViewController:searchViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
