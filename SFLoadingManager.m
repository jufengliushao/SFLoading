//
//  SFLoadingManager.m
//  SFLoadingPro
//
//  Created by cnlive-lsf on 2017/7/18.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFLoadingManager.h"
#import "SFLoadingViewController.h"

@interface SFLoadingManager(){
    
}

@property (nonatomic, strong) SFLoadingViewController *loadingVC;

@end

SFLoadingManager *manager = nil;

static NSString *sandKey = @"SF_Loading_Key";

@implementation SFLoadingManager
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[SFLoadingManager alloc] init];
        }
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - public
- (void)sf_setImages:(__kindof NSArray<NSString *> *)images{
    if (!images.count) {
        // 参数为空
        return;
    }
    
    if ([self isFirst]) {
        // 不是第一次进入
        return;
    }
    
    [self creatLoadingViewController:images];
}

#pragma mark - private
/**
 判断是否为第一次进入

 @return YES NO
 */
- (BOOL)isFirst{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:sandKey] boolValue];
}

/**
 引导页完成，设置标志
 */
- (void)saveVisit{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:sandKey];
    [defaults synchronize];
}

/**
 返回app的Window

 @return UIWindow
 */
- (UIWindow *)getUIWindows{
    return [[UIApplication sharedApplication].windows lastObject];
}

/**
 创建展示引导页

 @param imgs image
 */
- (void)creatLoadingViewController:(NSArray *)imgs{
    self.loadingVC = [[SFLoadingViewController alloc] initWithImages:imgs];
    UIViewController *formerVC = [self getUIWindows].rootViewController;
    [self getUIWindows].rootViewController = self.loadingVC;
    BS(bs);
    self.loadingVC.sf_showOverBlock = ^{
        [bs getUIWindows].rootViewController = formerVC;
//        [bs saveVisit];
    };
}
@end
