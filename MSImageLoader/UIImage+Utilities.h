//
//  UIImage+Utilities.h
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilities)

+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UIImage *)imageFromHexColor:(NSString *)hexStringColor;

@end
