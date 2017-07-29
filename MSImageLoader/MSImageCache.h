//
//  MSImageCache.h
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSImageCache : NSCache

+ (instancetype)sharedCache;

+ (UIImage *)imageForKey:(NSString *)key;
+ (void)cacheImage:(UIImage *)image forKey:(NSString *)key andDataLength:(NSUInteger)length;

@end
