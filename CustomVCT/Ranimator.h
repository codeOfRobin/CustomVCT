//
//  Ranimator.h
//  CustomVCT
//
//  Created by Robin Malhotra on 12/10/14.
//  Copyright (c) 2014 Robin's code kitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Ranimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign, getter=isPresented) BOOL presenting;
@end
