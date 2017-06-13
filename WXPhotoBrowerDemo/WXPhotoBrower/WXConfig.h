//
//  WXConfig.h
//  WXPhotoBrowerDemo
//
//  Created by wangxinxu on 2017/6/12.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#ifndef WXConfig_h
#define WXConfig_h

#ifndef ScreenWidth
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef ScreenHeight
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

#define PhotoBrowerBackgroundAlpha 1.f
#define PhotoBrowerBrowerTime      .3f
#define PhotoBrowerMargin          20.f

// 图片的最大放大倍数
#define PhotoBrowerImageMaxScale   2.f
// 图片的最小缩小倍数
#define PhotoBrowerImageMinScale   1.f

#define PhotoSaveImageSuccessMessage  @"^_^ 保存成功!!"
#define PhotoSaveImageFailureMessage @"/(ㄒoㄒ)/~~ 保存失败!!"
#define PhotoSaveImageMessageTime    2
#define PhotoSaveImageFailureReason  @"图片需要下载完成"
#define PhotoShowPlaceHolderImageColor [UIColor blackColor]

#endif /* WXConfig_h */
