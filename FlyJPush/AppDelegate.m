//
//  AppDelegate.m
//  FlyJPush
//
//  Created by 李飞翔 on 15/7/29.
//  Copyright (c) 2015年 Fly. All rights reserved.
//

#import "AppDelegate.h"
#import "APService.h"
@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [APService setupWithOption:launchOptions];
    [APService registerForRemoteNotificationTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
    
    
    return YES;
}

//接受推送信息
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [APService registerDeviceToken:deviceToken];
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"接收到的消息--%@",userInfo);
    UIAlertView*alv=[[UIAlertView alloc]initWithTitle:nil message:userInfo[@"aps"][@"alert"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"立即玩",@"不了", nil];
    alv.delegate=self;
    alv.tintColor=[UIColor colorWithWhite:0.8 alpha:0.6];
    [alv show];
}

#pragma marks -- UIAlertViewDelegate

#pragma mark - AlertView即将显示时
-(void)willPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"AlertView即将显示时");
}
#pragma mark - AlertView已经显示时的事件
-(void)didPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"AlertView已经显示时的事件");
}

#pragma mark - 根据被点击按钮的索引处理点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"根据被点击按钮的索引处理点击事件 :%d",buttonIndex);
}
#pragma mark - AlertView的取消按钮的事件
//这个方法不会被触发，cancel键的buttonIndex为0
-(void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"AlertView的取消按钮的事件aaaaaaaaaaaaaaaaaa");
}
#pragma mark - ALertView即将消失时的事件
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"ALertView即将消失时的事件");
}
#pragma mark - AlertView已经消失时执行的事件
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"AlertView已经消失时执行的事件");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
