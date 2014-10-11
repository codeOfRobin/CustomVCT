 //
//  Ranimator.m
//  CustomVCT
//
//  Created by Robin Malhotra on 12/10/14.
//  Copyright (c) 2014 Robin's code kitchen. All rights reserved.
//

#import "Ranimator.h"

@implementation Ranimator
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *fromVC=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.presenting)
    {
        [[transitionContext containerView] addSubview:fromVC.view];
        [[transitionContext containerView] addSubview:toVC.view];
        
        __block CGRect startingFrame = toVC.view.frame;
        startingFrame.origin.y = CGRectGetHeight(startingFrame);
        toVC.view.frame = startingFrame;
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        UIVisualEffectView *visualEffectView;
        visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        visualEffectView.frame = fromVC.view.bounds;
        [fromVC.view addSubview:visualEffectView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             startingFrame.origin.y -= 150;
                             toVC.view.frame = startingFrame;
                         }
                         completion:^(BOOL finished){
                             [transitionContext completeTransition:YES];
                         }];

    }
    else
    {
        toVC.view.userInteractionEnabled=YES;
        [[transitionContext containerView]addSubview:toVC.view];
        [[transitionContext containerView]addSubview:fromVC.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
                             CGRect frame=fromVC.view.frame;
                             frame.origin.y += 150;
                             fromVC.view.frame = frame;
                         }
                         completion:^(BOOL finished){
                             [transitionContext completeTransition:YES];
                         }];

    }

    
    
}
@end
