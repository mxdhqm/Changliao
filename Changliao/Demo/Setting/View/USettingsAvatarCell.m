//
//  USettingsAvatarCell.m
//  Changliao
//
//  Created by metthew on 15/9/6.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "USettingsAvatarCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface USettingsAvatarCell()

@property (nonatomic, strong) UIImageView *avatarView;

@end

@implementation USettingsAvatarCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager{
    return 75;
}

- (void)cellDidLoad{
    [super cellDidLoad];
    _avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 65, 65)];
    _avatarView.layer.masksToBounds = YES;
    _avatarView.layer.cornerRadius = 65 / 2.0;
    [self.contentView addSubview:_avatarView];
}

- (void)cellWillAppear{
    [super cellWillAppear];
    USettingAvatarItem *avatarItem = (USettingAvatarItem *)self.item;
    if (avatarItem.avatar) {
        [_avatarView sd_setImageWithURL:avatarItem.avatar placeholderImage:[UIImage imageNamed:@"EM_Resource.bundle/images/avatar_default"]];
    }else{
        _avatarView.image = [UIImage imageNamed:@"EM_Resource.bundle/images/avatar_default"];
    }
}

@end