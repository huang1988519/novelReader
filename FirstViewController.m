//
//  FirstViewController.m
//  HWHReader
//
//  Created by huanwh on 2018/10/24.
//  Copyright © 2018 hwh. All rights reserved.
//


#import "FirstViewController.h"
#import "HWHDiscoverIndexCell.h"
#import "HWHDiscoverCellHeaderView.h"


@import WebKit;

@interface FirstViewController () <
    WKNavigationDelegate,
    UICollectionViewDelegate,
    UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) WKWebView *webview;
@property (strong, nonatomic) NSArray *datasource;
@end

static NSString * kHWHErrorDomain = @"[HWHReader][ERROR]";


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWebView];
}

- (void)setWebView {
    self.webview = [[WKWebView alloc] initWithFrame:CGRectZero];
    self.webview.navigationDelegate = self;
    NSURLRequest * request= [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.23us.so/"]];
    [self.webview loadRequest:request];
}

- (IBAction)jsGetBooks:(id)sender {
    
    [self.webview evaluateJavaScript:@"getRecBookTitls()" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@",result);
        if (error || ![result isKindOfClass:[NSString class]]) {
            NSLog(@"%@ , %@",kHWHErrorDomain,error);
            return ;
        }
        
        NSError * jsonError = nil;
        NSData * data = [result dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        if (jsonError || ![json isKindOfClass:[NSArray class]]) {
            NSLog(@"%@ , %@",kHWHErrorDomain,jsonError);
            return ;
        }
        
        self.datasource = [json copy];
        [self.collectionView reloadData];
    }];
}

#pragma mark -  UICollectionView Delegate & Datasource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWHDiscoverIndexCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.collectionView.contentOffset = CGPointZero;
    NSDictionary * item = self.datasource[indexPath.row];
    cell.items = item[@"books"];
    
    HWHDiscoverCellHeaderView * headerView = [cell viewWithTag:100];
    headerView.titleLabel.text = item[@"className"];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datasource.count ?: 0;
}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self injectionJs];
    [self jsGetBooks:nil];
}


#pragma mark - js helper

- (void)injectionJs {
    NSString * jsPath = [[NSBundle mainBundle] pathForResource:@"parser" ofType:@"js"];
    NSString * js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
    
    [self.webview evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@",result);
    }];
}
@end
