//
//  CustomWkWebView.h
//  WebViewDemo
//
//  Created by 刘峰 on 2019/4/4.
//  Copyright © 2019年 Liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "EnumHeader.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CustomWkWebViewDelegate <WKNavigationDelegate>

//第一个按钮点击事件
- (void)firstClick:(NSString *)str;

//第二个按钮点击事件
- (void)secondClick:(NSString *)str;

//第三个按钮点击事件
- (void)thirdClick:(NSString *)str;

//第四个按钮点击事件，调用系统相册
- (void)forthClick:(NSString *)str;

//第五个按钮点击事件，调用OC执行JS来调用JS的弹窗
- (void)callOCToCallJSClick:(NSString *)str1 str2:(NSString *)str2;
@end

@interface CustomWkWebView : WKWebView

/**
 初始化WKWebview
 @param whetherShowTabbar 是否展示底部工具栏
 */
- (instancetype)initWithFrame:(CGRect)frame andTabbarType:(ShowTabbarOrNot)whetherShowTabbar;

@end

NS_ASSUME_NONNULL_END
