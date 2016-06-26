//
//  AppDelegate+System.m
//  TRProject
//
//  Created by jiyingxin on 16/2/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate+System.h"
#import <MLTransition.h>
#import "YXAllListViewController.h"
#import "YXRecommendViewController.h"
#import "YXGameListViewController.h"
#import "YXMyPageViewController.h"
@implementation AppDelegate (System)

#pragma mark - 方法
- (void)setupGlobalConfig{
    /*==================== 电池条显示菊花,监测网络活动 =======================*/
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    /** ============================== 网络状态监测 ================================ */
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    /*================ 自定义左上角返回按钮, 导致右划返回失效 ===============*/
    
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
    
    /* ================ DDLog支持 =================  */
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [self window];
}

#pragma mark - 懒加载
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:[YXRecommendViewController new]];
        UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:[YXAllListViewController new]];
        UINavigationController *navi3 = [[UINavigationController alloc]initWithRootViewController:[YXGameListViewController new]];
        UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:[YXMyPageViewController new]];
        [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        [UINavigationBar appearance].translucent = NO;
        [UINavigationBar appearance].barTintColor = kRGBColor(251, 51, 41, 1.0);
        UITabBarController *tableBar = [UITabBarController new];
        tableBar.viewControllers = @[navi1, navi2, navi3, navi4];
        [UITabBar appearance].translucent = NO;
        [UITabBar appearance].backgroundColor = kRGBColor(240, 239, 237, 1.0);
        
        _window.rootViewController = tableBar;
        _window.tintColor = [UIColor redColor];
    }
    return _window;
}
- (AFNetworkReachabilityStatus)netReachStatus{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

- (BOOL)isOnLine{
    return self.netReachStatus == AFNetworkReachabilityStatusReachableViaWWAN || self.netReachStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

#pragma mark - 生命周期

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}
@end
