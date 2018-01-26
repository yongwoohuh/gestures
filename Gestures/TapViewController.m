//
//  TapViewController.m
//  Gestures
//
//  Created by Yongwoo Huh on 2018-01-25.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - (width/2),
                             CGRectGetMidY(self.view.bounds) - (height/2),
                             width, height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)viewTapped:(UITapGestureRecognizer *)sender
{
    UIColor *viewColor = [sender.view.backgroundColor isEqual :
                          UIColor.yellowColor] ? UIColor.orangeColor : UIColor.yellowColor;
    sender.view.backgroundColor = viewColor;
}

@end
