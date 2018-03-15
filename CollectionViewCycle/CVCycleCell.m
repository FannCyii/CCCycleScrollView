//
//  CVCycleCell.m
//  CollectionViewCycle
//
//  Created by Fann on 14/03/2018.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "CVCycleCell.h"

@interface CVCycleCell()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLable;
@end
@implementation CVCycleCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubView];
    }
    return self;
}

- (void)setUpSubView
{
    self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.imageView];
    
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 100, 30)];
    [self.contentView addSubview:self.titleLable];
}

- (void)updataCellWithData:(id)aData atIndex:(NSUInteger)index
{
    if ([aData isKindOfClass:[NSString class]]) {
        NSString *imageName = (NSString *)aData;
        self.imageView.image = [UIImage imageNamed:imageName];
//        self.titleLable.text = [NSString stringWithFormat:@"%lu",(unsigned long)index];
    }
}

@end
