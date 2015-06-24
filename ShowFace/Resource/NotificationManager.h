//
//  NotificationManager.h
//  ShowColorValue
//
//  Created by Tonglin.jia on 15/6/11.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Request) {
    
    R_Login=0,
    R_BackLogin,
    R_UserInfo,
    R_BackUserInfo,
    R_Regist,
    R_BackRegist,
    
};


@interface NotificationManager : NSObject

@property (nonatomic,assign) BOOL isLogin;

+(NSString *)enum2String:(Request)req;

+(instancetype)shareInstance;

-(void)showLoginView;

-(void)startNotification;
-(void)stopNotification;

@end
