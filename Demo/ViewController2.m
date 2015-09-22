//
//  ViewController2.m
//  Demo
//
//  Created by tom on 15/9/7.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property(nonatomic,strong) UIScrollView   *scrollView ;


@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar *bar=self.navigationController.toolbar ;
    UIButton *btn   =[UIButton buttonWithType:UIButtonTypeContactAdd];
    [bar addSubview:btn];
    self.navigationController.toolbarHidden=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 100, 320, 80);
    CGFloat width=30;
    self.scrollView=scrollView;
    
    for (int i=0; i<19; i++) {
        NSString *name=[NSString stringWithFormat:@"%d",i];
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        imageView.frame=CGRectMake(i*width, 0, width, width);
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize=CGSizeMake(800, 0);
    [self.view addSubview:scrollView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 
        [UIView animateWithDuration:3 animations:^{
            self.navigationController.toolbar.transform=CGAffineTransformMakeTranslation(0, -300);
        }];
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.scrollView.scrollEnabled=NO;
    NSLog(@"touchBegan");
 
}

- (void) notificationTest {
    NSLog(@"notificationTest");
}

@end
