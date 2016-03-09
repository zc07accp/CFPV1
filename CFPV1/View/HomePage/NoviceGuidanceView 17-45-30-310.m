//
//  NoviceGuidanceView.m
//  CFPV1
//
//  Created by zf on 16/3/9.
//  Copyright © 2016年 PY. All rights reserved.
//

#import "NoviceGuidanceView.h"

@implementation NoviceGuidanceView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(NoviceGuidanceView *)instanceNoviceGuidanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NoviceGuidance" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self =[ super initWithCoder:aDecoder];
    return self;
}
@end
