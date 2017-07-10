//
//  TableViewController.m
//  PopAnimation
//
//  Created by jiangjunhui on 2017/7/10.
//  Copyright © 2017年 jiangjunhui. All rights reserved.
//

#import "TableViewController.h"
#import "BaseViewController.h"
@interface TableViewController ()
@property (nonatomic,strong) NSArray *dataList;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = @[@"基础动画",@"PropertyNamed",@"3",@"4",@"5",@"6"];

    

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
            
        default:
            break;
    }
    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end


















