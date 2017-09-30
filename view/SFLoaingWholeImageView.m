//
//  SFLoaingWholeImageView.m
//  SFLoadingPro
//
//  Created by cnlive-lsf on 2017/7/18.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFLoaingWholeImageView.h"

@interface SFLoaingWholeImageView()

@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation SFLoaingWholeImageView
- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img{
    if (self  = [super initWithFrame:frame]) {
        self.imgV.image = [UIImage imageNamed:img];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    self.imgV.frame = self.bounds;
    [super drawRect:rect];
}

#pragma mark - init
- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self addSubview:_imgV];
    }
    return _imgV;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
