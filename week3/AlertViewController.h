//
//  AlertViewController.h
//  Week_3
//
//  Created by Desire Gardner on 9/15/13.
//  Copyright (c) 2013 Desire Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewController : UIViewController

+(void)showAlertWithMessage:(NSString *)title message:(NSString *)message confirmText:(NSString *)confirm cancelText:(NSString *)cancel;

@end