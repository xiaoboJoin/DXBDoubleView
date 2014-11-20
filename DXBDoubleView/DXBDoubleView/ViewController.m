//
//  ViewController.m
//  DXBDoubleView
//
//  Created by iXiaobo on 14-11-20.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ContentViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];

    [self addChildViewController:detailViewController];
    [self.view addSubview:detailViewController.view];
    [detailViewController.view setBounds:[self.view bounds]];
    
    
    ContentViewController *mainViewController = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
    [self addChildViewController:mainViewController];
    [self.view addSubview:mainViewController.view];
    [mainViewController.view setBounds:self.view.bounds];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
