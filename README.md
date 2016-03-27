CCCycleScrollView

*iOS Objective-C自定义轮播，无限循环图片播放。*

使用方式：

```
CCCycleScrollView *cyclePlayView = [[CCCycleScrollView alloc]initWithImages:images];
```
>初始化方法有：

```
- (instancetype)initWithImages:(NSArray *)images;
- (instancetype)initWithImages:(NSArray *)images withFrame:(CGRect)frame;
- (instancetype)initWithImages:(NSArray *)images withPageViewLocation:(CCCycleScrollPageViewPosition)pageLocation withPageChangeTime:(NSTimeInterval)changeTime withFrame:(CGRect)frame;
```
设置pageControl的位置为底部右侧：
（默认为底部中间）

```
cyclePlayView2.pageLocation = CCCycleScrollPageViewPositionBottomRight;
```
设置图片描述：

```
cyclePlayView2.pageDescrips = @[@"大海",@"花",@"长灯",@"阳光下的身影",@"秋树",@"摩天轮"];
```
Demo结果如下：
![image](https://github.com/xxxx.jpg)

