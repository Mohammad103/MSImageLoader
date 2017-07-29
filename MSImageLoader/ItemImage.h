//
//  ItemImage.h
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ItemImage : JSONModel

@property (nonatomic) NSString *raw;
@property (nonatomic) NSString *full;
@property (nonatomic) NSString *regular;
@property (nonatomic) NSString *small;
@property (nonatomic) NSString *thumb;

@end
