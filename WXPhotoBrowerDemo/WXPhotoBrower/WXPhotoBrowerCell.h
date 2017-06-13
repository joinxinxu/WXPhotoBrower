//
//  WXPhotoBrowerCell.h
//  WXPhotoBrowerDemo
//
//  Created by wangxinxu on 2017/6/13.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SingleTap)();
typedef void(^LongPress)();
@interface WXPhotoBrowerCell : UICollectionViewCell

- (void)sd_ImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeHolder;

@property (nonatomic, copy  ) SingleTap singleTap;
@property (nonatomic, copy  ) LongPress longPress;

@end
