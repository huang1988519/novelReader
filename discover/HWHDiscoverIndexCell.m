//
//  HWHDiscoverIndexCell.m
//  HWHReader
//
//  Created by huanwh on 2018/10/26.
//  Copyright © 2018 hwh. All rights reserved.
//

#import "HWHDiscoverIndexCell.h"
#import "HWHDiscoverIndexSubCell.h"

@interface HWHDiscoverIndexCell () <UICollectionViewDataSource>

@end


@implementation HWHDiscoverIndexCell

-(void)setItems:(NSArray *)items {
    if (!items || ![items isKindOfClass:[NSArray class]]) {
        _items = nil;
    }else {
        _items = items;
    }
    [self.collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count ?: 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWHDiscoverIndexSubCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subcell" forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    UIView * sep = [cell viewWithTag:100];
    sep.hidden = (indexPath.row+1)%3 == 0;
    return cell;
}

@end
