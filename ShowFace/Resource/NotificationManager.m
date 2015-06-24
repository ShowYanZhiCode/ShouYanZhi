//
//  NotificationManager.m
//  ShowColorValue
//
//  Created by Tonglin.jia on 15/6/11.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "NotificationManager.h"

@interface NotificationManager()

@property (nonatomic,strong) AFHTTPRequestOperationManager *netManager;
@property (nonatomic,strong) MBProgressHUD *mb;

@end

@implementation NotificationManager

+(NSString *)enum2String:(Request)req{
    
    NSString *str = @"";
    
    switch (req) {
        case R_Login:
            str = @"Login";
            break;
        case R_BackLogin:
            str = @"BackLogin";
            break;
        case R_UserInfo:
            str = @"UserInfo";
            break;
        case R_BackUserInfo:
            str = @"BackUserInfo";
            break;
        case R_Regist:
            str = @"Regist";
            break;
        case R_BackRegist:
            str = @"BackRegist";
            break;
            
        default:
            break;
    }
    
    
    return str;
}

+(instancetype)shareInstance{
    
    static NotificationManager *notM;
    if (!notM) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            notM = [NotificationManager new];
        });
    }
    
    return notM;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.netManager = [AFHTTPRequestOperationManager new];
        self.mb = [MBProgressHUD new];
        [self.mb setRemoveFromSuperViewOnHide:true];
    }
    return self;
}

-(void)startNotification{
    
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveAllNetNotification:) name:Enum2String(R_Login) object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveAllNetNotification:) name:Enum2String(R_Regist) object:nil];
    
}

-(void)stopNotification{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//显示登录界面
-(void)showLoginView{
    
    //    UIViewController *currentV = [UIApplication sharedApplication].keyWindow.currentViewController;
    //    if (currentV) {
    //        if ([currentV isKindOfClass:[LoginViewController class]]) {
    //            return;
    //        }
    //
    //        LoginViewController *loginVC = [currentV.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
    //        [currentV presentViewController:loginVC animated:true completion:nil];
    //
    //    }
    
}

//显示网络等待提示
-(void)showLoading{
    
    //    UIViewController *currentV = [UIApplication sharedApplication].keyWindow.currentViewController;
    //    if (currentV) {
    //        for (UIView *view in currentV.view.subviews) {
    //            if ([view isKindOfClass:[MBProgressHUD class]]) {
    //                return;
    //            }
    //        }
    //
    //        [currentV.view addSubview:self.mb];
    
    self.mb.labelText = @"";
    self.mb.mode = MBProgressHUDModeIndeterminate;
    [self.mb show:true];
    
    //    }
    
}

//隐藏提示
-(void)hideLoading{
    
    [self.mb hide:true];
    
}

-(void)showErrorMessage:(id)data{
    
    //    NSString *str = NET_ERROR_MSG;
    //    NSInteger errorCode = [[data numberValueForKey:@"error"] integerValue];
    //    switch (errorCode) {
    //        case 4000:
    //            str = @"未登录";
    //            [self showLoginView];
    //            break;
    //        case 4001:
    //            str = @"服务器错误";
    //            break;
    //        case 4002:
    //            str = @"参数无效";
    //            break;
    //        case 4444:
    //            str = [data objectForKey:@"message"];
    //            break;
    //        default:
    //            break;
    //    }
    //
    //    self.mb.mode = MBProgressHUDModeText;
    //    self.mb.labelText = str;
    //    [self.mb hide:true afterDelay:2.0f];
    
}

//接受所有Request通知事件，在这里集中处理
-(void)receiveAllNetNotification:(NSNotification *)not{
    
    //显示等待
    [self showLoading];
    
    //    if (not.name == Enum2String(R_Login)) {
    //        [self doSomeRequest:not];
    //        return;
    //    }
    //    if (not.name == Enum2String(R_VerificatCode)) {
    //        [self doSomeRequest:not];
    //        return;
    //    }
    //
    //    //判断是否已经登陆
    //    if (self.isLogin) {
    //        [self doSomeRequest:not];
    //    }else{
    //        NSDictionary *user = [USER_DEFAULT objectForKey:@"User"];
    //        if (user) {
    //            [self.netManager POST:MergeString(BASE_URL, LOGIN_API) parameters:user success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //                if ([[responseObject objectForKey:@"success"] boolValue]) {
    //                    self.isLogin = true;
    //                    [self doSomeRequest:not];
    //                }else{
    //                    [self hideLoading];
    //                }
    //            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //                [self showErrorMessage:nil];
    //            }];
    //        }else{
    //            [self hideLoading];
    //            [self showLoginView];
    //        }
    //    }
    //}
    //
    //-(void)doSomeRequest:(NSNotification *)not{
    //
    //    NSString *name = not.name;
    //
    //    if ([name isEqualToString:Enum2String(R_Login)]) {
    //        [self login:not];
    //        return;
    //    }
    //    if ([name isEqualToString:Enum2String(R_Regist)]) {
    //        [self regist:not];
    //        return;
    //    }
    //
    //}
    
    /**
     *  登陆
     *  POST
     *  mobile,password,type(int)
     */
    //-(void)login:(NSNotification *)not{
    //
    //    BackInfo *backInfo = [BackInfo new];
    //    NSDictionary *dic = not.object;
    //
    //    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {
    //        return;
    //    }
    //
    //    NSMutableDictionary *requestData = [NSMutableDictionary dictionaryWithDictionary:dic];
    //    [requestData setValue:[NSNumber numberWithInt:TYPE] forKey:@"type"];
    //
    //    [self.netManager POST:MergeString(BASE_URL, LOGIN_API) parameters:requestData success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //
    //        backInfo.data = responseObject;
    //        if ([[responseObject objectForKey:@"success"] boolValue]) {
    //            self.isLogin = true;
    //            [USER_DEFAULT setObject:requestData forKey:@"User"];
    //            USER_DEFAULT_SAVE;
    //            [self hideLoading];
    //        }else{
    //            [self showErrorMessage:responseObject];
    //            NSError *error = [NSError errorWithDomain:[responseObject stringValueForKey:@"message"] code:[[responseObject numberValueForKey:@"error"] integerValue] userInfo:nil];
    //            backInfo.error = error;
    //        }
    //        [[NSNotificationCenter defaultCenter] postNotificationName:Enum2String(R_BackLogin) object:backInfo];
    //
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        backInfo.error = error;
    //        [self showErrorMessage:nil];
    //        [[NSNotificationCenter defaultCenter] postNotificationName:Enum2String(R_BackLogin) object:backInfo];
    //    }];
    //}
    //
    //
    ///**
    // *  注册
    // *  GET
    // */
    //-(void)regist:(NSNotification *)not{
    //
    //    BackInfo *backInfo = [BackInfo new];
    //
    //    [self.netManager GET:MergeString(BASE_URL, REGIST_API) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //
    //        backInfo.data = responseObject;
    //        if ([[responseObject objectForKey:@"success"] boolValue]) {
    //            [self hideLoading];
    //        }else{
    //            [self showErrorMessage:responseObject];
    //            NSError *error = [NSError errorWithDomain:[responseObject stringValueForKey:@"message"] code:[[responseObject numberValueForKey:@"error"] integerValue] userInfo:nil];
    //            backInfo.error = error;
    //        }
    //        [[NSNotificationCenter defaultCenter] postNotificationName:Enum2String(R_BackRegist) object:backInfo];
    //        
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        backInfo.error = error;
    //        [self showErrorMessage:nil];
    //        [[NSNotificationCenter defaultCenter] postNotificationName:Enum2String(R_BackRegist) object:backInfo];
    //    }];
    //}
    
}
@end
