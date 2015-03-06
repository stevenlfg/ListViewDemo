//
//  MyDropListViewController.m
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import "MyDropListViewController.h"
#import "LFGDropDownView.h"
@interface MyDropListViewController ()<MXGroupingSelectViewDelegate>
{
    LFGDropDownView *dropDownListView;
    UIButton  *titleBtn;
    UILabel *titleLb;
    BOOL isBtnSelect;
}
@end
@implementation MyDropListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    titleBtn = [[UIButton alloc]init];
    titleBtn.backgroundColor = [UIColor clearColor];
    
    titleLb = [[UILabel alloc]init];
    titleLb.text = @"全部好友";
    [titleLb setNumberOfLines:1];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.textColor = [UIColor whiteColor];
    titleLb.font = [UIFont boldSystemFontOfSize:18];
    [titleLb sizeToFit];
    titleLb.frame = CGRectMake(0, 12, titleLb.frame.size.width, 20);
    [titleBtn addSubview:titleLb];
    
    titleBtn.frame = CGRectMake((200-titleLb.frame.size.width)/2, 0, titleLb.frame.size.width+21, 44);
    [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow_highlight"] forState:UIControlStateHighlighted];
    [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(14, titleLb.frame.size.width+6, 15, 0)];
    [titleBtn addTarget:self action:@selector(navHeadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
    NSMutableArray *groupingDataAry = [[NSMutableArray alloc]initWithObjects:@"全部好友",@"联系人",@"特别关注",@"朋友",@"同事",@"家人", nil];
    
    dropDownListView = [[LFGDropDownView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height) data:groupingDataAry];
    dropDownListView.hidden = YES;
    dropDownListView.delegate = self;
    [self.view addSubview:dropDownListView];


}
- (void)navHeadBtnClick:(UIButton *)sender
{
    if (isBtnSelect) {
        [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow"] forState:UIControlStateNormal];
        [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow_highlight"] forState:UIControlStateHighlighted];
        isBtnSelect = NO;
    }else{
        [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow_up"] forState:UIControlStateNormal];
        [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow_up_highlight"] forState:UIControlStateHighlighted];
        isBtnSelect = YES;
    }
    dropDownListView.hidden = !dropDownListView.hidden;
}
- (void)viewDismiss:(BOOL)isChange title:(NSString *)title{
    
        dropDownListView.hidden = YES;
        titleBtn.selected = !titleBtn.selected;
        if (isChange) {
            isBtnSelect = NO;
            [titleBtn removeFromSuperview];
            titleBtn = [[UIButton alloc]init];
            titleBtn.backgroundColor = [UIColor clearColor];
            
            titleLb = [[UILabel alloc]init];
            titleLb.text = title;
            [titleLb setNumberOfLines:1];
            titleLb.textAlignment = NSTextAlignmentCenter;
            titleLb.backgroundColor = [UIColor clearColor];
            titleLb.textColor = [UIColor whiteColor];
            titleLb.font = [UIFont boldSystemFontOfSize:18];
            [titleLb sizeToFit];
            titleLb.frame = CGRectMake(0, 12, titleLb.frame.size.width, 20);
            [titleBtn addSubview:titleLb];
            
            titleBtn.frame = CGRectMake((200-titleLb.frame.size.width)/2, 0, titleLb.frame.size.width+21, 44);
            [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow"] forState:UIControlStateNormal];
            [titleBtn setImage:[UIImage imageNamed:@"light_green_drop_down_arrow_highlight"] forState:UIControlStateSelected];
            [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(14, titleLb.frame.size.width+6, 15, 0)];
            [titleBtn addTarget:self action:@selector(navHeadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            self.navigationItem.titleView = titleBtn;
  } 

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
