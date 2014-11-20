//
//  DXBSliderViewController.m
//  DXBDoubleView
//
//  Created by iXiaobo on 14-11-20.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "DXBSliderViewController.h"

@interface DXBSliderViewController ()

@end

@implementation DXBSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    bottomView = [[UIView alloc] initWithFrame:self.view.bounds];
    [bottomView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:bottomView];
    
    
    topView = [[UIView alloc] initWithFrame:self.view.bounds];
    [topView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:topView];
    
    UIPanGestureRecognizer *panGestureRecongnizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanOnTopView:)];
    [topView addGestureRecognizer:panGestureRecongnizer];
    
    
    UITapGestureRecognizer *tapGestureRecongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapOnTopView:)];
    [topView addGestureRecognizer:tapGestureRecongnizer];
    xpoint = 0;
    
    // Do any additional setup after loading the view.
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


- (void)onPanOnTopView:(UIPanGestureRecognizer *)gestureRecognizer
{
  //  self.contentView.transform  = CGAffineTransformMakeTranslation(ContentOffset, 0);
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
      //  xpoint = 0;
        
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {

        
        CGPoint position = [gestureRecognizer translationInView:self.view];
        //xpoint += position.x;
        topView.transform = CGAffineTransformMakeRotation(M_1_PI);
        
        NSLog(@"xpoint:%f position:%f",(topView.frame.origin.x + position.x),position.x);
        
      //  NSLog(@"%@,frame:%@",NSStringFromCGPoint(position),NSStringFromCGRect(topView.frame));
//        if (topView.frame.origin.x + position.x >= 0 )
//        {
//            
//            topView.transform = CGAffineTransformMakeTranslation(0, 0);
//        }
//        else if (topView.frame.origin.x + position.x <= (-1*self.view.frame.size.width*3/4))
//        {
//            
//                     
//        
//        }
//        else
//        {
//            topView.transform = CGAffineTransformMakeTranslation(position.x, 0);
//        }
        
     //   NSLog(@"%@",NSStringFromCGAffineTransform(topView.transform));

    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
//        if (xpoint < (-1*self.view.bounds.size.width/4))
//        {
////            topView.transform = CGAffineTransformMakeTranslation(-1*self.view.bounds.size.width/4, 0);
//        }
        CGPoint position = [gestureRecognizer translationInView:topView];
        if (topView.frame.origin.x + position.x <= (-1*self.view.frame.size.width*3/4))
        {
            [UIView animateWithDuration:0.3 animations:^{
                topView.transform = CGAffineTransformMakeTranslation(-1*self.view.frame.size.width*3/4, 0);
            } completion:^(BOOL finished) {
            
            }];
            
        }
    }
}

- (void)onTapOnTopView:(UITapGestureRecognizer *)gestureRecognizer
{
    if (isMoved)
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            topView.transform = CGAffineTransformMakeTranslation(0, 0);
            
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            topView.transform = CGAffineTransformMakeTranslation(-self.view.bounds.size.width*3/4, 0);
            
        }];
    }
 
    isMoved = !isMoved;
}


@end
