//
//  AppDelegate.h
//  RomanNumbers
//
//  Created by Ammad on 07/04/16.
//  Copyright © 2016 Emy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigation;


@end

