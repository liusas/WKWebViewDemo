//
//  WKScriptMessageHandler.m
//  WebViewDemo
//
//  Created by 刘峰 on 2019/4/4.
//  Copyright © 2019年 Liufeng. All rights reserved.
//

#import "WKScriptMessageHandler.h"
#import "UserDefaultManager.h"
#import <objc/Message.h>

@implementation WKScriptMessageHandler

+ (id)shareInstance {
    static WKScriptMessageHandler *scriptHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scriptHandler = [[WKScriptMessageHandler alloc] init];
    });
    return scriptHandler;
}

- (WKUserContentController *)addScriptMessageHandler:(id)observer {
    return [self scriptHandlerWithObserver:observer];
}

- (WKUserContentController *)scriptHandlerWithObserver:(id)observer {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ScriptHandlerList" ofType:@"plist"];
    NSArray *scriptHandlerList = [NSArray arrayWithContentsOfFile:path];
    
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    for (NSString *key in scriptHandlerList) {
        [userContentController addScriptMessageHandler:observer name:key];
    }
    
    self.delegate = observer;
    return userContentController;
}

- (void)didReceiveScriptMessage:(WKScriptMessage *)message {
    //H5方面给的登录的回调内容,名字需要和H5方面约定,然后写到ScriptHandlerList中
    NSLog(@"message.body解析：%@",message.body);
    NSDictionary *dic = message.body;
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@:", dic[@"action"]]);
    objc_msgSend(self, sel, dic[@"token"]);
}

#pragma mark - private
//第一个按钮点击事件
- (void)firstClick:(NSString *)str {
    if (self.delegate && [self.delegate respondsToSelector:@selector(firstClick:)]) {
        [self.delegate firstClick:str];
    }
}

//第二个按钮点击事件
- (void)secondClick:(NSString *)str {
    if (self.delegate && [self.delegate respondsToSelector:@selector(secondClick:)]) {
        [self.delegate secondClick:str];
    }
}

//第三个按钮点击事件
- (void)thirdClick:(NSString *)str {
    if (self.delegate && [self.delegate respondsToSelector:@selector(thirdClick:)]) {
        [self.delegate thirdClick:str];
    }
}

//第四个按钮点击事件，调用系统相册
- (void)forthClick:(NSString *)str {
    if (self.delegate && [self.delegate respondsToSelector:@selector(forthClick:)]) {
        [self.delegate forthClick:str];
    }
}

//第五个按钮点击事件，调用OC执行JS来调用JS的弹窗
- (void)callOCToCallJSClick:(NSString *)str {
    NSString *str1 = @"OC调用JS连接两个字符串";
    NSString *str2 = @"试试好不好用";
    if (self.delegate && [self.delegate respondsToSelector:@selector(callOCToCallJSClick:str2:)]) {
        [self.delegate callOCToCallJSClick:str1 str2:str2];
    }
}

@end
