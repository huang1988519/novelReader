//
//  HWHDiscoverIndexSubCell.h
//  HWHReader
//
//  Created by huanwh on 2018/10/26.
//  Copyright © 2018 hwh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWHDiscoverIndexSubCell : UICollectionViewCell
@property (nonatomic, strong)NSDictionary * item;

@property (nonatomic, weak) IBOutlet UIImageView * imageView;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UILabel * desLabel;
@property (nonatomic, weak) IBOutlet UIButton * addButton;
@end

NS_ASSUME_NONNULL_END
