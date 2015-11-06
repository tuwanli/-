//
//  ViewController.m
//  弹幕效果
//
//  Created by 涂婉丽 on 15/11/4.
//  Copyright (c) 2015年 涂婉丽. All rights reserved.
//

#import "TWLdanmuVC.h"

@interface TWLdanmuVC ()
@property (nonatomic,strong)NSArray *array;
@end

@implementation TWLdanmuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"DataList" ofType:@"plist"];
    _array = [[NSArray alloc]initWithContentsOfFile:path];
    //创建定时器
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(initLable) userInfo:nil repeats:YES];
    
}
- (void)initLable
{
    NSString *str = [_array objectAtIndex:rand()%_array.count];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(480, arc4random()%350, 250, 30)];
    lable.text = str;
    lable.font = [UIFont boldSystemFontOfSize:19];
    lable.textColor = [TWLdanmuVC rabdomColor];
    [self.view addSubview:lable];
    [self move:lable];
}
- (void)move:(UILabel *)lable
{

    [UIView animateWithDuration:8 animations:^{
    
        lable.frame = CGRectMake(-250, lable.frame.origin.y, lable.frame.size.width, lable.frame.size.height);
    } completion:^(BOOL finished){
        [lable removeFromSuperview];
        
    }];
}
//产生随机颜色
+(UIColor *)rabdomColor
{

    CGFloat R = arc4random_uniform(256)/255.0;
    CGFloat G = arc4random_uniform(256)/255.0;
    CGFloat B = arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:R green:G blue:B alpha:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
