//
//  HWHDiscoverIndexSubCell.m
//  HWHReader
//
//  Created by huanwh on 2018/10/26.
//  Copyright © 2018 hwh. All rights reserved.
//

/*
 item =
 {
 allTitle = "[\U6b66\U4fa0] \U4e09\U5bf8\U4eba\U95f4\U8033\U6839";
 author = "\U8033\U6839";
 bookname = "\U4e09\U5bf8\U4eba\U95f4";
 path = "/wapbook/43.html";
 }
 */

#import "HWHDiscoverIndexSubCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation HWHDiscoverIndexSubCell

-(void)setItem:(NSDictionary *)item {
    if (!item) {
        return;
    }
    self.titleLabel.text = item[@"bookname"];
    self.desLabel.text   = item[@"author"];
    
    NSString * path = item[@"path"];
    NSString * lastComponent = [path lastPathComponent];
    NSArray  * names = [lastComponent componentsSeparatedByString:@"."];
    if (names.count>0) {
        NSString * imgIndex = names.firstObject;
        NSString * first = @"0";
        if (imgIndex.length > 3) {
            first = [imgIndex substringToIndex:imgIndex.length - 3];
        }
        NSURL * imgUrl = [NSURL URLWithString:[NSString stringWithFormat:@"files/article/image/%@/%@/%@s.jpg", first, imgIndex,imgIndex] relativeToURL:[NSURL URLWithString:@"https://www.23us.so/"]];
        [self.imageView sd_setImageWithURL:imgUrl];
    }
}

@end
