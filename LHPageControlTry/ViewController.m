//
//  ViewController.m
//  LHPageControlTry
//
//  Created by LinGrea on 15/12/29.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"

#import "LHPageControlView.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    LHPageControlView *lhPageControl;
}

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myScrollView.contentSize = CGSizeMake((self.view.width-40)*3, 255);
    NSLog(@"---%@",NSStringFromCGRect(self.myScrollView.frame));
    
    //-------图片
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:self.myScrollView.frame];
    image1.origin = CGPointMake(0, 0);
    image1.width = self.view.width-40;
    image1.image = [UIImage imageNamed:@"img_1"];
    [self.myScrollView addSubview:image1];
    NSLog(@"---%@",NSStringFromCGRect(image1.frame));

    UIImageView *image2 = [[UIImageView alloc]initWithFrame:self.myScrollView.frame];
    image2.origin = CGPointMake(self.view.width-40, 0);
    image2.width = self.view.width-40;
    image2.image = [UIImage imageNamed:@"img_2"];
    [self.myScrollView addSubview:image2];
    NSLog(@"---%@",NSStringFromCGRect(image2.frame));

    UIImageView *image3 = [[UIImageView alloc]initWithFrame:self.myScrollView.frame];
    image3.origin = CGPointMake((self.view.width-40)*2, 0);
    image3.width = self.view.width-40;
    image3.image = [UIImage imageNamed:@"img_3"];

    [self.myScrollView addSubview:image3];
    NSLog(@"---%@",NSStringFromCGRect(image3.frame));

    //-------pagecontrol
    lhPageControl = [[LHPageControlView alloc]initWithOriginPoint:CGPointMake(20, self.myScrollView.bottom-40) PageCount:3];
    [self.view addSubview:lhPageControl];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / (self.view.width-40)*1.0;
    //---移动
    [lhPageControl moveThePage:page];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
