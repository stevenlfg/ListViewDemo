//
//  LFGDropDownView.h
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownTableViewCell.h"
@protocol MXGroupingSelectViewDelegate <NSObject>

- (void)viewDismiss:(BOOL)isChange title:(NSString*)title ;
@optional
- (void)editGrouping;

@end
@interface LFGDropDownView : UIView<UITableViewDelegate,UITableViewDataSource>
{
    DropDownTableViewCell *oldCell;
    NSInteger selectRow;
}
@property(nonatomic,strong)NSMutableArray *dataAry;
@property(nonatomic,strong)UITableView *groupingTableView;
@property(nonatomic,weak) id<MXGroupingSelectViewDelegate>delegate;
- (id)initWithFrame:(CGRect)frame data:(NSMutableArray *)data;
- (void)loadData:(NSMutableArray*)dataAry;
@end
