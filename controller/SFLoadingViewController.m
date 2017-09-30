//
//  SFLoadingViewController.m
//  SFLoadingPro
//
//  Created by cnlive-lsf on 2017/7/18.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFLoadingViewController.h"

#import "SFLoaingWholeImageView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SFLoadingViewController (){
    NSArray *imagesTitles;
    NSMutableArray *viewArr;
}

@property (nonatomic, strong) UIScrollView *loadingSV; /* 轮播图 */
@property (nonatomic, strong) UIButton *overButton; /* 完成button */

@end

@implementation SFLoadingViewController
- (instancetype)initWithImages:(__kindof NSArray <NSString *>*)imgs{
    if (self  = [super init]) {
        imagesTitles = imgs;
        viewArr = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method
- (void)createView{
    for (int i = 0; i < imagesTitles.count; i++) {
        SFLoaingWholeImageView *view = [[SFLoaingWholeImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT) img:imagesTitles[i]];
        view.backgroundColor = [UIColor colorWithRed:arc4random() %256/256.0 green:arc4random() %256/256.0 blue:arc4random() %256/256.0 alpha:1.0];
        [self.loadingSV addSubview:view];
        [viewArr addObject:view];
    }
    
    [[viewArr lastObject] addSubview:self.overButton];
}

#pragma mark - Action method
- (void)showOverAction:(UIButton *)sender{
    if(self.sf_showOverBlock){
        self.sf_showOverBlock();
    }
}

#pragma mark - init
- (UIScrollView *)loadingSV{
    if (!_loadingSV) {
        _loadingSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _loadingSV.contentSize = CGSizeMake(SCREEN_WIDTH * imagesTitles.count, SCREEN_HEIGHT);
        _loadingSV.showsVerticalScrollIndicator = NO;
        _loadingSV.showsHorizontalScrollIndicator = NO;
        _loadingSV.bounces = NO;
        _loadingSV.pagingEnabled = YES;
        [self.view addSubview:_loadingSV];
    }
    return _loadingSV;
}

- (UIButton *)overButton{
    if (!_overButton) {
        _overButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_overButton addTarget:self action:@selector(showOverAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_overButton setTitle:@"ENTER" forState:(UIControlStateNormal)];
        [_overButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _overButton.frame = CGRectMake((SCREEN_WIDTH - 80)/2.0, (SCREEN_HEIGHT - 30 - 100), 80, 30);
    }
    return _overButton;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
