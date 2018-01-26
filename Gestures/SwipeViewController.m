//
//  SwipeViewController.m
//  Gestures
//
//  Created by Yongwoo Huh on 2018-01-26.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation SwipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isOpen = NO;
    UIView *brownView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds) - 25, self.view.bounds.size.width, 50)];
    brownView.backgroundColor = UIColor.brownColor;
    [brownView setClipsToBounds:YES];
    [self.view addSubview:brownView];
    
    UIView *swipeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, brownView.bounds.size.width, brownView.bounds.size.height)];
    swipeView.backgroundColor = UIColor.whiteColor;
    [brownView addSubview:swipeView];
    
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    [swipeGestureRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeView addGestureRecognizer:swipeGestureRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    [swipeGestureRight setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeView addGestureRecognizer:swipeGestureLeft];
    
}

- (void)viewSwiped:(UISwipeGestureRecognizer *)sender
{
    if (!self.isOpen && sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swiped left");
        [UIView animateWithDuration:0.5 animations:^{
            sender.view.frame = CGRectOffset(sender.view.frame, -100.0, 0.0);
            self.isOpen = YES;
        }];
    } else if(self.isOpen && sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swiped right");
        [UIView animateWithDuration:0.5 animations:^{
            sender.view.frame = CGRectOffset(sender.view.frame, 100.0, 0.0);
        }];
    }
}
@end
