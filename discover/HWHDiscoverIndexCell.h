//
//  HWHDiscoverIndexCell.h
//  HWHReader
//
//  Created by huanwh on 2018/10/26.
//  Copyright © 2018 hwh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWHDiscoverIndexCell : UICollectionViewCell
@property(weak, nonatomic) IBOutlet UICollectionView * collectionView;
@property(strong, nonatomic) NSArray * items;
@end

NS_ASSUME_NONNULL_END
