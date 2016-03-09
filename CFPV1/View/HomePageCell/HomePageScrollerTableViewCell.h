//
//  HomePageScrollerTableViewCell.h
//  CFPV1
//
//  Created by zf on 16/3/9.
//  Copyright © 2016年 PY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageScrollerTableViewCell : UITableViewCell <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *loadScrollerView;
@property (weak,nonatomic)UIPageControl *pageControl;
@end
