//
//  ScreenEdgePanViewController.m
//  Gestures
//
//  Created by Yongwoo Huh on 2018-01-26.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "ScreenEdgePanViewController.h"

@interface ScreenEdgePanViewController ()
@property (nonatomic, assign) CGPoint edgeViewPosition;
@property (nonatomic, strong) UIView *edgeView;
@property (nonatomic, strong)UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (nonatomic, strong)UIPanGestureRecognizer *panGesture;

@end

@implementation ScreenEdgePanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 300;
    CGFloat height = 300;
    
    CGRect frame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 15,
                              CGRectGetMidY(self.view.bounds) - (height/2),
                              width, height);
    self.edgeView = [[UIView alloc] initWithFrame:frame];
    self.edgeViewPosition = self.edgeView.center;
    self.edgeView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:self.edgeView];
    
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewEdgePanned:)];
    edgePanGesture.edges = UIRectEdgeRight;
    self.edgeGesture = edgePanGesture;
    [self.edgeView addGestureRecognizer:edgePanGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestoreRecog:)];
    self.panGesture = panGesture;
    
}

- (void)viewEdgePanned:(UIScreenEdgePanGestureRecognizer *)sender
{
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x,
                                    oldCenter.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    CGPoint locationInView = [sender locationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
        {
//            if (oldCenter.x - locationInView.x > 150 ) {
//                self.view.backgroundColor = UIColor.blueColor;
//                [self.view setNeedsDisplay];
//            } else
//                self.view.backgroundColor = UIColor.cyanColor;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (oldCenter.x - locationInView.x >= 150 ) {
                sender.view.center = CGPointMake(self.view.center.x, oldCenter.y);
                [self.edgeView removeGestureRecognizer:self.edgeGesture];
                [self.edgeView addGestureRecognizer:self.panGesture];
                
            } else {
                self.view.backgroundColor = UIColor.cyanColor;
                sender.view.center = self.edgeViewPosition;
            }
        }
            break;
            
        default:
            break;
    }
}
- (void) panGestoreRecog:(UIPanGestureRecognizer *)sender
{
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x,
                                    oldCenter.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    CGPoint locationInView = [sender locationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
        {
         
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (self.edgeViewPosition.x - locationInView.x > 150 ) {
                sender.view.center = oldCenter;
                
            } else {
                sender.view.center = self.edgeViewPosition;
                [self.edgeView removeGestureRecognizer:self.panGesture];
                [self.edgeView addGestureRecognizer:self.edgeGesture];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
