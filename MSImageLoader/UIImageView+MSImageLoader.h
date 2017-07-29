//
//  UIImageView+MSImageLoader.h
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum MSImageLoadState : NSUInteger {
    MSImageNone,
    MSImageDownloaded,
    MSImageInProgress,
    MSImageFailed
} MSImageLoadState;


@interface UIImageView (MSImageLoader)

- (void)loadImageFromURL:(NSString *)urlString;
- (void)loadImageFromURL:(NSString *)urlString withPlaceholderColor:(UIColor *)color;
- (void)loadImageFromURL:(NSString *)urlString withPlaceholderHexColor:(NSString *)hexColor;
- (void)loadImageFromURL:(NSString *)urlString withPlaceholderImage:(UIImage *)placeholderImage;

@end
