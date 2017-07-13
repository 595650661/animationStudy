//
//  TableViewController.m
//  绘图基础
//
//  Created by jiangjunhui on 2017/7/12.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "TableViewController.h"
#import "Quartz2dViewController.h"
#import "BesizerViewController.h"
@interface TableViewController ()
@property (nonatomic,strong) NSArray *dataList;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    NSArray *quartzList = @[@"画线段",@"画三角形",@"画矩形",@"画圆",@"画扇形",@"画曲线",@"画特效",@"绘制文字",@"绘制图片",@"变换运用",@"pdf"];
    NSArray *besizerList = @[@"画线段",@"画三角形",@"画矩形",@"画圆",@"画扇形",@"画曲线"];
    _dataList = @[quartzList,besizerList];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *data = (NSArray*)_dataList[section];
    return data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //如果队列中没有该类型cell，则会返回nil，这个时候就需要自己创建一个cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = _dataList[indexPath.section][indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"CoreGraphics(Quartz2d绘图)";
    }else{
       return @"贝塞尔曲线学习";
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc;
    if (indexPath.section == 0) {
       vc = [[Quartz2dViewController alloc]init];
    }else{
        vc = [[BesizerViewController alloc]init];
    }
    
    vc.title = _dataList[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
