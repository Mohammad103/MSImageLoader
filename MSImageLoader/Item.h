//
//  Item.h
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ItemImage.h"

@interface Item : JSONModel

@property (nonatomic) NSString *id;
@property (nonatomic) NSString *created_at;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSString *color;
@property (nonatomic) NSInteger likes;
@property (nonatomic) BOOL liked_by_user;
//@property (nonatomic) User *user;
@property (nonatomic) NSArray *current_user_collections;
@property (nonatomic) ItemImage *urls;
//@property (nonatomic) NSArray<Category *> categories;
//@property (nonatomic) ItemLinks *links;

    
@end
