//
//  ContentViewController.m
//  DXBDoubleView
//
//  Created by iXiaobo on 14-11-20.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureAction:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGestureAction:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    UISwipeGestureRecognizer *swipeGestureRecongnizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeGestureAction:)];
    [self.view addGestureRecognizer:swipeGestureRecongnizer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onPanGestureAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    NSLog(@"onPanGestureAction");
    
    NSLog(@"%@", NSStringFromCGPoint([gestureRecognizer translationInView:self.view.superview]) );

    [UIView animateWithDuration:0.5 animations:^{
    
        self.view.transform  = CGAffineTransformMakeTranslation(-240, 0);

    }];
    
}

- (void)onTapGestureAction:(UIGestureRecognizer *)gestureRecognizer
{
     NSLog(@"onTapGestureAction");
    [UIView animateWithDuration:0.5 animations:^{
        
        self.view.transform  = CGAffineTransformMakeTranslation(0, 0);
        
    }];
}



@end
