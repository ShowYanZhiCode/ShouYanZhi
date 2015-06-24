//
//  CommonDefine.h
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/15.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#ifndef ShowFace_CommonDefine_h
#define ShowFace_CommonDefine_h

/*
 IOS开发中常用宏定义
 */

#define isEmptyOrNULL(string) (string== NULL|| string == nil|| [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] )

#define isNULL(object) (object== NULL||object==nil)
#define ChangeNULL2Empty(dic, key) isNULL([dic objectForKey:key])?@"":[dic objectForKey:key]
#define Change(object) isNULL(object)?@"":object

#define FilletImage(imageView,photoUrlString) {UIActivityIndicatorView *aiView = [UIActivityIndicatorView new];aiView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;aiView.center = CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height/2);aiView.color = [UIColor blackColor];[imageView addSubview:aiView];[aiView setHidesWhenStopped:YES];[aiView startAnimating];imageView.layer.masksToBounds = YES;imageView.layer.cornerRadius = imageView.frame.size.width/2;[imageView sd_setImageWithURL:[NSURL URLWithString:photoUrlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {[aiView stopAnimating];[aiView removeFromSuperview];if (error) {[imageView setImage:PlaceHolderImage];imageView.layer.borderWidth = 1.0;imageView.layer.borderColor = [SEGMENTATION_LINE_COLOR CGColor];}}];}

#define LoadImage(imageView,photoUrlString) {UIActivityIndicatorView *aiView = [UIActivityIndicatorView new];aiView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;aiView.center = CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height/2);aiView.color = [UIColor blackColor];[imageView addSubview:aiView];[aiView startAnimating];[imageView sd_setImageWithURL:[NSURL URLWithString:photoUrlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {[aiView stopAnimating];[aiView removeFromSuperview];if (error) {[imageView setImage:[UIImage imageNamed:@"ic_wait"]];}}];}

#define HeightForString(value,font,width) [value sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height


#pragma mark - 应用程序的名字
#define AppDisplayName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define USER_DEFAULT_SAVE [USER_DEFAULT synchronize]

#pragma mark - 判断设备的操作系统是不是ios7
#define IOS7   (  [[[UIDevice currentDevice].systemVersion doubleValue] >= 7.0] )

#pragma mark - 判断当前设备是不是iPhone5
#define kScreenIphone5    (([[UIScreen mainScreen] bounds].size.height)>=568)

#pragma mark - 判断当前设备是不是Retina屏
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - 获取当前屏幕的高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

#pragma mark - 获取当前屏幕的宽度
#define SCREEN_WIDTH  ([UIScreen mainScreen].applicationFrame.size.width)

#pragma mark - 获取状态栏高度
#define CGRect_rectStatus = [[UIApplication sharedApplication] statusBarFrame];

#pragma mark - 获取导航条高度
#define CGRect_rectNav = self.navigationController.navigationBar.frame;

#pragma mark - 获得RGB/RGBA颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#pragma mark - viewWithTag 通过tag值获得子视图
#define VIEWWITHTAG(_OBJECT,_TAG) [_OBJECT viewWithTag : _TAG]

#pragma mark ---- 文件路径
#define PATH_OF_APP_HOME NSHomeDirectory()
#define PATH_OF_TEMP NSTemporaryDirectory()
#define PATH_OF_DOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define KEYWINDOW [UIApplication sharedApplication].keyWindow



#endif
