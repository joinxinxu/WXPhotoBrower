//
//  ViewController.m
//  WXPhotoBrowerDemo
//
//  Created by wangxinxu on 2017/6/12.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "WXPhotoBrower.h"
#import "MBProgressHUD.h"

@interface ViewController ()<KNPhotoBrowerDelegate, MBProgressHUDDelegate>
{
     BOOL     _ApplicationStatusIsHidden;
}

@property (nonatomic, strong) NSMutableArray *itemsArray;

@property (nonatomic, strong) WXPhotoBrower *photoBrower;

@end

@implementation ViewController

- (NSMutableArray *)itemsArray{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 清缓存, 方便调试
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
    NSArray *urlArr = @[
                         @"http://ifts.qijiimg.com/ict/20160518/5e4458ef7db0449aab466bb722851be0.jpg",
                        @"http://ifts.qijiimg.com/ict/20160517/3f30c99f30354243b174e7d14298ee26.jpg",
                        @"http://ifts.qijiimg.com/ict/20160517/5e259b35c40047838bb2399dcf6de9fc.jpg",
                        @"http://ifts.qijiimg.com/ict/20160511/19a541ccfd6b47518ab13f9fb3eb0e34.jpg",
                        @"http://ifts.qijiimg.com/ict/20160518/1214798e20e141e2b8139a3d7bb9b8ca.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                        @"http://ifts.qijiimg.com/ict/20160518/192eaefdc51e4f4db8c176ab5799366a.jpg",
                         @"http://ww2.sinaimg.cn/bmiddle/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg"
                        ];
    
    CGFloat viewWidth = self.view.frame.size.width;
    // 背景View =======================
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 100, viewWidth - 20, viewWidth - 20)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    // 布局 九宫格
    for (NSInteger i = 0 ;i < urlArr.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)]];
        imageView.tag = i;
        [imageView sd_setImageWithURL:urlArr[i] placeholderImage:nil];
        imageView.backgroundColor = [UIColor grayColor];
        CGFloat width = (view.frame.size.width - 40) / 3;
        NSInteger row = i / 3;
        NSInteger col = i % 3;
        CGFloat x = 10 + col * (10 + width);
        CGFloat y = 10 + row * (10 + width);
        imageView.frame = CGRectMake(x, y, width, width);
        
        KNPhotoItems *items = [[KNPhotoItems alloc] init];
        items.url = [urlArr[i] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        items.sourceView = imageView;
        [self.itemsArray addObject:items];
        
        [view addSubview:imageView];
    }
}

#pragma mark 实现
- (void)click:(UITapGestureRecognizer *)tap{
    WXPhotoBrower *photoBrower = [[WXPhotoBrower alloc] init];
    photoBrower.itemsArr = [_itemsArray copy];
    photoBrower.currentIndex = tap.view.tag;
    
    [photoBrower setIsNeedRightTopBtn:NO]; // 是否需要 右上角 操作功能按钮
    [photoBrower setIsNeedPictureLongPress:NO]; // 是否 需要 长按图片 弹出框功能 .默认:需要
    [photoBrower setIsNeedPageControl:YES];  // 是否需要 底部 UIPageControl, Default is NO
    
    [photoBrower present];
    _photoBrower = photoBrower;
    
    // 设置代理方法 --->可不写
    [photoBrower setDelegate:self];
    
    // 这里是 设置 状态栏的 隐藏 ---> 可不写
    _ApplicationStatusIsHidden = YES;
    [self setNeedsStatusBarAppearanceUpdate];
}

// 下面方法 是让 '状态栏' 在 PhotoBrower 显示的时候 消失, 消失的时候 显示 ---> 根据项目需求而定
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)prefersStatusBarHidden{
    if(_ApplicationStatusIsHidden){
        return YES;
    }
    return NO;
}

#pragma mark - Delegate

/* PhotoBrower 即将消失 */
- (void)photoBrowerWillDismiss{
    NSLog(@"Will Dismiss");
    _ApplicationStatusIsHidden = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

/* PhotoBrower 右上角按钮的点击 */
- (void)photoBrowerRightOperationActionWithIndex:(NSInteger)index{
    NSLog(@"operation:%zd",index);
}

/**
 *  删除当前图片
 *
 *  @param index 相对 下标
 */
- (void)photoBrowerRightOperationDeleteImageSuccessWithRelativeIndex:(NSInteger)index{
    NSLog(@"delete-Relative:%zd",index);
}

/**
 *  删除当前图片
 *
 *  @param index 绝对 下标
 */
- (void)photoBrowerRightOperationDeleteImageSuccessWithAbsoluteIndex:(NSInteger)index{
    NSLog(@"delete-Absolute:%zd",index);
}

/* PhotoBrower 保存图片是否成功 */
- (void)photoBrowerWriteToSavedPhotosAlbumStatus:(BOOL)success{
    NSLog(@"saveImage:%zd",success);
}


@end
