//
//  WKScriptMessageHandler.h
//  WebViewDemo
//
//  Created by 刘峰 on 2019/4/4.
//  Copyright © 2019年 Liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WKScriptMessageHandlerDelegate <NSObject>

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

@interface WKScriptMessageHandler : NSObject

@property (nonatomic, weak) id<WKScriptMessageHandlerDelegate> delegate;

+ (id)shareInstance;

- (WKUserContentController *)addScriptMessageHandler:(id)observer;

- (void)didReceiveScriptMessage:(WKScriptMessage *)message;

@end

NS_ASSUME_NONNULL_END
