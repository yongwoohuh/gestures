//
//  RotationViewController.m
//  Gestures
//
//  Created by Yongwoo Huh on 2018-01-26.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - (width/2),
                              CGRectGetMidY(self.view.bounds) - (height/2),
                              width, height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotaionGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(viewRotated:)];
    [view addGestureRecognizer:rotaionGesture];
}

- (void)viewRotated:(UIRotationGestureRecognizer *)sender
{
    sender.view.transform  = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0.0;
}

@end
