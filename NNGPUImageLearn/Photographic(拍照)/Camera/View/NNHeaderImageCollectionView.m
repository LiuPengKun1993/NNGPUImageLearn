//
//  NNHeaderImageCollectionView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNHeaderImageCollectionView.h"
#import "NNHeaderImageCollectionViewCell.h"
#import "NNFilterModel.h"

@interface NNHeaderImageCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) void (^clicked)(NSInteger type);

@property (nonatomic, strong) NNFilterModel *filterModel;

@end

@implementation NNHeaderImageCollectionView

static NSString *NNHeaderImageCollectionViewCellID = @"NNHeaderImageCollectionViewCellID";

+ (instancetype)initNNHeaderImageCollectionView:(CGRect)frame clicked:(void (^)(NSInteger))clicked {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:(UICollectionViewScrollDirectionHorizontal)];
    return [[self alloc] initWithFrame:frame collectionViewLayout:layout clicked:clicked];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout clicked:(void (^)(NSInteger))clicked {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.clicked = clicked;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[NNHeaderImageCollectionViewCell class] forCellWithReuseIdentifier:NNHeaderImageCollectionViewCellID];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filterModel.filterArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NNHeaderImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NNHeaderImageCollectionViewCellID forIndexPath:indexPath];
    cell.filter = self.filterModel.filterArray[indexPath.row];
    cell.titleLabel.text = self.filterModel.filterTitleArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, 60);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self scrollToRowWithIndexPath:indexPath animated:YES];
    if (self.clicked) {
        self.clicked(indexPath.row);
    }
}

- (void)scrollToIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self scrollToRowWithIndexPath:indexPath animated:NO];
}

- (void)scrollToRowWithIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated {
    NNHeaderImageCollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:NNHeaderImageCollectionViewCellID forIndexPath:indexPath];
    CGFloat offsetx = cell.x - self.width * 0.5;
    CGFloat offsetMax = self.contentSize.width - self.width;
    if (offsetx < 0) {
        offsetx = 0;
    } else if (offsetx > offsetMax) {
        offsetx = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetx, self.contentOffset.y);
    [self setContentOffset:offset animated:animated];
}

#pragma mark - 懒加载区域
- (NNFilterModel *)filterModel {
    if (!_filterModel) {
        _filterModel = [[NNFilterModel alloc] init];
    }
    return _filterModel;
}

@end
