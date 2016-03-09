//
//  HomePageScrollerTableViewCell.m
//  CFPV1
//
//  Created by zf on 16/3/9.
//  Copyright © 2016年 PY. All rights reserved.
//

#import "HomePageScrollerTableViewCell.h"
#define WIDTH self.loadScrollerView.frame.size.width
#define HEIGHT self.loadScrollerView.frame.size.height
@implementation HomePageScrollerTableViewCell

- (void)awakeFromNib
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.loadScrollerView.frame;
    scrollView.contentSize = CGSizeMake(WIDTH*4, HEIGHT);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
              for (int i = 0 ; i < 4 ;i++)
              {
                  UIImageView *imageView = [[UIImageView alloc]init];
    
                  imageView.frame = CGRectMake(WIDTH *i, 0, WIDTH, HEIGHT);
                  imageView.image = [UIImage imageNamed:@"edition1"];
                  [scrollView addSubview:imageView];
              }
    
              //1.创建pageControl
              UIPageControl *pc = [[UIPageControl alloc]init];
              self.pageControl = pc;
              //2.常规设置
              pc.numberOfPages = 4;
              CGSize size = [pc sizeForNumberOfPages:pc.numberOfPages];
              //为了定位可使用bounds+center
              //定视图的位置时，为了居中，可以通过设置视图的中心点
              pc.bounds = CGRectMake(0, 0, size.width, size.width);
              pc.center = CGPointMake(WIDTH*0.5 , HEIGHT-20);
              pc.pageIndicatorTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    
              pc.currentPageIndicatorTintColor = [UIColor whiteColor];
              //关闭与用户的交互
              pc.userInteractionEnabled = NO;
    [self.loadScrollerView addSubview:scrollView];
    [self.loadScrollerView addSubview:self.pageControl];
    
}
#pragma  mark ScrollerViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    //四舍五入偏移量除以滚动视图的一屏宽
    self.pageControl.currentPage = round(offset.x/scrollView.frame.size.width);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
