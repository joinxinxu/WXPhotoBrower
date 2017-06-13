//
//  WXPhotoBrowerNumView.h
//  WXPhotoBrowerDemo
//
//  Created by wangxinxu on 2017/6/13.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXPhotoBrowerNumView : UILabel

- (void)setCurrentNum:(NSInteger)currentNum totalNum:(NSInteger)totalNum;

@property (nonatomic, assign) NSInteger currentNum;
@property (nonatomic, assign) NSInteger totalNum;

@end
