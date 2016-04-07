//
//  EM+ChatOppositeCell.h
//  Changliao
//
//  Created by metthew on 15/8/24.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EM_ChatOppositeCell : UITableViewCell

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *details;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) UIImage *avatarImage;

@property (nonatomic, assign) BOOL hiddenTopLine;
@property (nonatomic, assign) BOOL hiddenBottomLine;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end