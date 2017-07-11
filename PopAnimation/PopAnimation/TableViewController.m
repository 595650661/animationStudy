//
//  TableViewController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "TableViewController.h"
#import "BaseViewController.h"
#import "PropertyNamedController.h"
#import "DecayAnimationController.h"
#import "DecayAnimationTwo.h"
#import "PopCardController.h"
#import "CircularController.h"
#import "ProgressViewController.h"
#import "FoldingViewController.h"
@interface TableViewController ()
@property (nonatomic,strong) NSArray *dataList;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = @[@"基础动画",@"PropertyNamed",@"Decay Animation",@"碰壁反弹效果",@"弹出小卡片效果",@"画圆形",@"进度条" ,@"图片折叠"];
 

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return _dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //如果队列中没有该类型cell，则会返回nil，这个时候就需要自己创建一个cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = _dataList[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
        {
            vc = [[BaseViewController alloc]init];
        }
            break;
        case 1:
        {
            vc = [[PropertyNamedController alloc]init];
        }
            break;
        case 2:
        {
            vc = [[DecayAnimationController alloc]init];
        }
            break;
        case 3:
        {
            vc = [[DecayAnimationTwo alloc]init];
        }
            break;
        case 4:
        {
            vc = [[PopCardController alloc]init];
        }
            break;
            case 5:
        {
            vc = [[CircularController alloc]init];
        }
            break;
            case 6:
        {
            vc = [[ProgressViewController alloc]init];
        }
            break;
            case 7:
        {
            vc = [[FoldingViewController alloc]init];
        }
            break;
        default:
            break;
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end


















