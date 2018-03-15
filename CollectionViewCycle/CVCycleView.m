//
//  CVCycleView.m
//  CollectionViewCycle
//
//  Created by Fann on 14/03/2018.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "CVCycleView.h"
#import "CVCycleCell.h"

@interface CVCycleView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imageArrays;
@end

@implementation CVCycleView

- (instancetype)init
{
    if (self = [super init]) {
        [self setUpCycle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpCycle];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpCycle];
}


- (void)setUpCycle
{
    self.backgroundColor = [UIColor grayColor];
    [self addSubview:self.collectionView];
    
    self.imageArrays = @[@"cycle_image1",@"cycle_image2",@"cycle_image3",@"cycle_image4",@"cycle_image5",@"cycle_image6"];
}

#pragma mark - Accessers
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = self.frame.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO; //这里注释掉可以查看当前各个index的偏移方式
        [_collectionView registerClass:[CVCycleCell class] forCellWithReuseIdentifier:NSStringFromClass([CVCycleCell class])];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.totalCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CVCycleCell class]) forIndexPath:indexPath];
    [cell updataCellWithData: [self.imageArrays objectAtIndex:indexPath.item%self.imageArrays.count] atIndex:indexPath.item];
    //查看实际显示的index
//    [cell updataCellWithData: [self.imageArrays objectAtIndex:indexPath.item%self.imageArrays.count] atIndex:indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    NSIndexPath *indexPath = [collectionView indexPathForItemAtPoint:scrollView.contentOffset];
    if (indexPath.item == 0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArrays.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    NSIndexPath *indexPath = [collectionView indexPathForItemAtPoint:scrollView.contentOffset];
    if (indexPath.item == 0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArrays.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }else if (indexPath.item + 1 == self.totalCount) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

- (NSUInteger)totalCount
{
    return self.imageArrays.count > 0 ? (self.imageArrays.count + 2) : 0;
}

@end
