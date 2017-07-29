//
//  MSImageCache.m
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import "MSImageCache.h"


@implementation MSImageCache


+ (instancetype)sharedCache
{
    static MSImageCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [[MSImageCache alloc] init];
        sharedCache.name = @"MSImageCache";
        sharedCache.countLimit = 20; // Max 20 images in memory.
        sharedCache.totalCostLimit = 300 * 1024 * 1024; // Max 10MB used.
    });
    return sharedCache;
}


+ (void)cacheImage:(UIImage *)image forKey:(NSString *)key andDataLength:(NSUInteger)length
{
    [[MSImageCache sharedCache] setObject:image forKey:key cost:length];
}


+ (UIImage *)imageForKey:(NSString *)key
{
    return [[MSImageCache sharedCache] objectForKey:key];
}

@end
