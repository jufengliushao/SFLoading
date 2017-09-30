//
//  SFLoadingViewController.h
//  SFLoadingPro
//
//  Created by cnlive-lsf on 2017/7/18.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SFShowOverBlock)();

@interface SFLoadingViewController : UIViewController
/**
 初始化方法

 @param imgs 图片数组
 @return self
 */
- (instancetype)initWithImages:(__kindof NSArray <NSString *>*)imgs;

@property (nonatomic, copy) SFShowOverBlock sf_showOverBlock; /* 展示完成bloack */

@end
