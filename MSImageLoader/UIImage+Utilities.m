//
//  UIImage+Utilities.m
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import "UIImage+Utilities.h"
#import "UIColor+HexString.h"

@implementation UIImage (Utilities)


+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (UIImage *)imageFromHexColor:(NSString *)hexStringColor {
    return [UIImage imageFromColor:[UIColor colorFromHexString:hexStringColor]];
}


@end
