//
//  ViewController.m
//  CustomVCT
//
//  Created by Robin Malhotra on 11/10/14.
//  Copyright (c) 2014 Robin's code kitchen. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "Ranimator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"options"])
    {
        MenuViewController *vc=segue.destinationViewController;
        vc.transitioningDelegate=self;
        vc.modalPresentationStyle=UIModalPresentationCustom;
    }
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    Ranimator *animator=[[Ranimator alloc]init];
    animator.presenting=YES;
    return animator;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    Ranimator *animator=[Ranimator new];
    return animator;
}
@end
