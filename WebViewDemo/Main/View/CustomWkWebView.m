//
//  CustomWkWebView.m
//  WebViewDemo
//
//  Created by 刘峰 on 2019/4/4.
//  Copyright © 2019年 Liufeng. All rights reserved.
//

#import "CustomWkWebView.h"
#import "WKScriptMessageHandler.h"

@interface CustomWkWebView () <WKScriptMessageHandler, WKScriptMessageHandlerDelegate>

@end

@implementation CustomWkWebView

/**
 初始化WKWebview
 @param whetherShowTabbar 是否展示底部工具栏
 */
- (instancetype)initWithFrame:(CGRect)frame andTabbarType:(ShowTabbarOrNot)whetherShowTabbar {
    if (self = [super initWithFrame:frame configuration:[self setConfiguration]]) {
        self.allowsBackForwardNavigationGestures = YES;
    }
    return self;
}


/**
 初始化WKWebview
 */
- (WKWebViewConfiguration *)setConfiguration {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.preferences = [self getPreferences];
    configuration.userContentController = [[WKScriptMessageHandler shareInstance] addScriptMessageHandler:self];
    return configuration;
}

/**
 设置preferences
 */
- (WKPreferences *)getPreferences {
    WKPreferences *preference = [[WKPreferences alloc] init];
    preference.javaScriptEnabled = YES;
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    return preference;
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [[WKScriptMessageHandler shareInstance] didReceiveScriptMessage:message];
}

#pragma mark - WKScriptMessageHandlerDeleagate
//第一个按钮点击事件
- (void)firstClick:(NSString *)str {
    if (self.navigationDelegate && [(id<CustomWkWebViewDelegate>)self.navigationDelegate respondsToSelector:@selector(firstClick:)]) {
        [(id<CustomWkWebViewDelegate>)self.navigationDelegate firstClick:str];
    }
}

//第二个按钮点击事件
- (void)secondClick:(NSString *)str {
    if (self.navigationDelegate && [(id<CustomWkWebViewDelegate>)self.navigationDelegate respondsToSelector:@selector(secondClick:)]) {
        [(id<CustomWkWebViewDelegate>)self.navigationDelegate secondClick:str];
    }
}

//第三个按钮点击事件
- (void)thirdClick:(NSString *)str {
    if (self.navigationDelegate && [(id<CustomWkWebViewDelegate>)self.navigationDelegate respondsToSelector:@selector(thirdClick:)]) {
        [(id<CustomWkWebViewDelegate>)self.navigationDelegate thirdClick:str];
    }
}

//第五个按钮点击事件，调用OC执行JS来调用JS的弹窗
- (void)callOCToCallJSClick:(NSString *)str1 str2:(NSString *)str2 {
    if (self.navigationDelegate && [(id<CustomWkWebViewDelegate>)self.navigationDelegate respondsToSelector:@selector(callOCToCallJSClick:str2:)]) {
        [(id<CustomWkWebViewDelegate>)self.navigationDelegate callOCToCallJSClick:str1 str2:str2];
    }
}

- (void)forthClick:(NSString *)str {
    if (self.navigationDelegate && [(id<CustomWkWebViewDelegate>)self.navigationDelegate respondsToSelector:@selector(forthClick:)]) {
        [(id<CustomWkWebViewDelegate>)self.navigationDelegate forthClick:str];
    }
}

@end
