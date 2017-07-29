//
//  ItemsTVC.m
//  MSImageLoader
//
//  Created by Mohammad Shaker on 7/29/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

#import "ItemsTVC.h"
#import "Item.h"
#import "ItemCell.h"


@interface ItemsTVC ()

@property (nonatomic) NSMutableArray *items;

@end


@implementation ItemsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    [self fetchItems];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)parseItemsWithData:(NSData *)data {
    NSString* rawJSON = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    rawJSON = [rawJSON stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
    
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error parsing JSON.");
    }
    
    self.items = [NSMutableArray new];
    for (NSDictionary *obj in jsonArray) {
        Item *item = [[Item alloc] initWithDictionary:obj error:&error];
        if (error) {
            NSLog(@"Unable to initialize items, %@", error.localizedDescription);
            continue;
        }
        [self.items addObject:item];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


- (void)fetchItems {
    NSURL *photosURL = [NSURL URLWithString:@"http://pastebin.com/raw/wgkJgazE"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:photosURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            [self parseItemsWithData:data];
        }
    }] resume];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    Item *item = [self.items objectAtIndex:indexPath.row];
//    cell.itemImageView.image = [UIImage imageFromHexColor:item.color];
    [cell.itemImageView loadImageFromURL:item.urls.regular withPlaceholderHexColor:item.color];
    cell.createdAtLbl.text = item.created_at;
    
    return cell;
}



@end
