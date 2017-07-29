//
//  UIImageView+MSImageLoader.m
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import "UIImageView+MSImageLoader.h"
#import "UIImage+Utilities.h"
#import "MSImageCache.h"


@implementation UIImageView (MSImageLoader)


- (void)changeImageWith:(UIImage *)newImage
{
    [UIView transitionWithView:self
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.image = newImage;
                    } completion:nil];
}


- (void)loadImageFromURL:(NSString *)urlString
{
    [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *imgURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:imgURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!connectionError) {
            UIImage *loadedImage = [[UIImage alloc] initWithData:data];
            [MSImageCache cacheImage:loadedImage forKey:urlString andDataLength:data.length];
            [self changeImageWith:loadedImage];
        } else {
            NSLog(@"Error loading image: %@", connectionError);
        }
    }];
    
}


- (void)loadImageFromURL:(NSString *)urlString withPlaceholderImage:(UIImage *)placeholderImage
{
    UIImage *cachedImage = [MSImageCache imageForKey:urlString];
    if (cachedImage) {
        if (self.image != cachedImage) {
            self.image = cachedImage;
        }
        return;
    }
    
    if (self.image != placeholderImage) {
        self.image = placeholderImage;
        [self loadImageFromURL:urlString];
    }
}


- (void)loadImageFromURL:(NSString *)urlString withPlaceholderColor:(UIColor *)color
{
    UIImage *placeholderImage = [UIImage imageFromColor:color];
    [self loadImageFromURL:urlString withPlaceholderImage:placeholderImage];
}


- (void)loadImageFromURL:(NSString *)urlString withPlaceholderHexColor:(NSString *)hexColor
{
    UIImage *placeholderImage = [UIImage imageFromHexColor:hexColor];
    [self loadImageFromURL:urlString withPlaceholderImage:placeholderImage];
}


@end
