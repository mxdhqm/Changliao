//
//  EM+ExplorerBaseCell.h
//  Changliao
//
//  Created by metthew on 15/8/23.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EM_ExplorerBaseCell : UITableViewCell

@property (nonatomic, assign) BOOL selectedItem;
@property (nonatomic, assign, readonly) BOOL upload;
@property (nonatomic, strong) NSDictionary *fileInfo;

@end