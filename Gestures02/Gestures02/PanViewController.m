//
//  PanViewController.m
//  Gestures02
//
//  Created by Yongwoo Huh on 2018-01-25.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController
- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender
{
//    CGPoint locationInView = [sender locationInView:self.view];
//    sender.view.center = locationInView;
    
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    
    [sender setTranslation:CGPointZero inView:self.view];
    
}

@end
