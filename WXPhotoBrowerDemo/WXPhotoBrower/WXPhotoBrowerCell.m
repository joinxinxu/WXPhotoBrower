//
//  WXPhotoBrowerCell.m
//  WXPhotoBrowerDemo
//
//  Created by wangxinxu on 2017/6/13.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#import "WXPhotoBrowerCell.h"
#import "WXPhotoBrowerImageView.h"

@implementation WXPhotoBrowerCell{
    WXPhotoBrowerImageView *_photoBrowerImageView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView{
    __weak typeof(self) weakSelf = self;
    WXPhotoBrowerImageView *photoBrowerView = [[WXPhotoBrowerImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    photoBrowerView.singleTapBlock = ^(){
        if(weakSelf.singleTap){
            weakSelf.singleTap();
        }
    };
    
    photoBrowerView.longPressBlock = ^(){
        if(weakSelf.longPress){
            weakSelf.longPress();
        }
    };
    
    _photoBrowerImageView = photoBrowerView;
    [self.contentView addSubview:photoBrowerView];
}

- (void)sd_ImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeHolder{
    [_photoBrowerImageView sd_ImageWithUrl:[NSURL URLWithString:url] placeHolder:placeHolder];
}

- (void)prepareForReuse{
    [_photoBrowerImageView.scrollView setZoomScale:1.f animated:NO];
}


@end
