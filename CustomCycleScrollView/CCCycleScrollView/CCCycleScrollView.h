//
//  CCCycleScrollView.h
//  CustomCycleScrollView
//
//  Created by cheng on 16/3/24.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(int,CCCycleScrollPageViewPosition){
    
    CCCycleScrollPageViewPositionBottomLeft = 0,
    CCCycleScrollPageViewPositionBottomCenter = 1,////默认在底部中间
    CCCycleScrollPageViewPositionBottomRight = 2,
    
};


@protocol CCCycleScrollViewClickActionDeleage <NSObject>

@optional
//点击图片触发操作
- (void)cyclePageClickAction:(NSInteger)clickIndex;

@end




@interface CCCycleScrollView : UIView

@property (nonatomic, readwrite, strong)NSArray *images;
@property (nonatomic, readwrite, strong)NSArray *pageDescrips;
@property (nonatomic, readwrite, strong)UILabel *pageDescripLabel;
@property (nonatomic, readwrite, strong)UIPageControl *pageControl;
@property (nonatomic, assign)NSTimeInterval  pageChangeTime;
@property (nonatomic, assign)CCCycleScrollPageViewPosition pageLocation;
@property (nonatomic, weak)id<CCCycleScrollViewClickActionDeleage>delegate;


- (instancetype)initWithImages:(NSArray *)images;
- (instancetype)initWithImages:(NSArray *)images withFrame:(CGRect)frame;
- (instancetype)initWithImages:(NSArray *)images withPageViewLocation:(CCCycleScrollPageViewPosition)pageLocation withPageChangeTime:(NSTimeInterval)changeTime withFrame:(CGRect)frame;

@end
