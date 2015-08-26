//
//  LFGDropDownView.m
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import "LFGDropDownView.h"
#import "UIColor+ColorCategory.h"
@implementation LFGDropDownView
- (id)initWithFrame:(CGRect)frame data:(NSMutableArray *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataAry = [[NSMutableArray alloc]initWithArray:data];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.clipsToBounds = YES;
        
        selectRow = 0;
        
        UIView *bgView = [[UIView alloc]init];
        bgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        bgView.backgroundColor = [UIColor clearColor];
        [self addSubview:bgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewhidden)];
        [bgView addGestureRecognizer:tap];
        
        UIImageView *bgImgView = [[UIImageView alloc]init];
        bgImgView.frame = CGRectMake((self.frame.size.width-210)/2, 0, 210, 290);
        bgImgView.image = [UIImage imageNamed:@"light_green_drop_down_big_background"];
        bgImgView.userInteractionEnabled = YES;
        [self addSubview:bgImgView];
        
        UIView *headView = [[UIView alloc]init];
        headView.frame = CGRectMake(0, 0, 210, 30);
        headView.backgroundColor = [UIColor clearColor];
        
        self.groupingTableView = [[UITableView alloc]init];
        self.groupingTableView.frame = CGRectMake(0, 0, 210, 240);
        self.groupingTableView.delegate = self;
        self.groupingTableView.dataSource = self;
        self.groupingTableView.clipsToBounds = YES;
        self.groupingTableView.showsVerticalScrollIndicator = YES;
        self.groupingTableView.backgroundColor = [UIColor clearColor];
        [bgImgView addSubview:self.groupingTableView];
        
        self.groupingTableView.tableHeaderView = headView;
        
        UIButton *editBtn = [[UIButton alloc]init];
        editBtn.frame = CGRectMake(10, 240+12, 190, 31);
        [editBtn setBackgroundImage:[UIImage imageNamed:@"light_green_drop_down_background"] forState:UIControlStateNormal];
        [editBtn setBackgroundImage:[UIImage imageNamed:@"light_green_drop_down_background_highlight"] forState:UIControlStateHighlighted];
        [editBtn setTitle:@"编辑分组" forState:UIControlStateNormal];
        [editBtn setTitleColor:[UIColor colorWithHexString:@"#888888"] forState:UIControlStateNormal];
        [editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
        editBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [bgImgView addSubview:editBtn];
    }
    return self;
}
- (void)editBtnClick
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    DropDownTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[DropDownTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
    }
    [cell.groupingLb sizeToFit];
    if (indexPath.row == selectRow) {
        oldCell = cell;
        oldCell.groupingBtn.selected = YES;
        oldCell.groupingLb.textColor = [UIColor whiteColor];
    }
    
     cell.groupingLb.text = [NSString stringWithFormat:@"%@",[self.dataAry objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    oldCell.groupingBtn.selected = !oldCell.groupingBtn.selected;
    oldCell.groupingLb.textColor = [UIColor colorWithHexString:@"#888888"];
    
    DropDownTableViewCell *cell = (DropDownTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.groupingBtn.selected = !cell.groupingBtn.selected;
    cell.groupingLb.textColor = [UIColor whiteColor];
    oldCell = cell;
    selectRow = indexPath.row;
    
    if ([self.delegate respondsToSelector:@selector(viewDismiss:title:)]) {
        [self.delegate viewDismiss:YES title:[self.dataAry objectAtIndex:indexPath.row] ];
    }
}

- (void)viewhidden{
    
    if ([self.delegate respondsToSelector:@selector(viewDismiss:title:)]) {
        [self.delegate viewDismiss:NO title:nil];
    }
}

- (void)loadData:(NSMutableArray*)dataAry{
    self.dataAry = dataAry;
    [self.groupingTableView reloadData];
}

@end
