//
//  SFLoadingManager.h
//  SFLoadingPro
//
//  Created by cnlive-lsf on 2017/7/18.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SFLoadingManager : NSObject
+ (instancetype)shareManager;

- (void)sf_setImages:(__kindof NSArray <NSString *>*)images;
@end
