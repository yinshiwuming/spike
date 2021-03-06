//
//  AppDelegate.m
//  spike
//
//  Created by 泽联教育 on 2018/3/22.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "AppDelegate.h"
 #import <KSGuaidViewManager.h>
#import <UMCommon/UMCommon.h>
#import <UMShare/UMShare.h>
#import "XHPayKit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _mRootViewController = [[ViewController alloc] init];
    //2.创建导航视图控制器，被管理对象为mRootViewController
    _mUINavigationController = [[UINavigationController alloc] initWithRootViewController:_mRootViewController];
    //3.为window指定根视图控制器对象为mNavigationController
    self.window.rootViewController = _mUINavigationController;
    
    
    KSGuaidManager.images = @[[UIImage imageNamed:@"guid01"],
                              [UIImage imageNamed:@"guid02"],
                              [UIImage imageNamed:@"guid03"],
                              [UIImage imageNamed:@"guid04"]];
    
    KSGuaidManager.shouldDismissWhenDragging = YES;
    [KSGuaidManager begin];
   
    
    [UMConfigure initWithAppkey:@"5b09028aa40fa370be000031" channel:@"App Store"];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    BOOL result = [[XHPayKit defaultManager] handleOpenURL:url];
    if (!result) {//这里处理其他SDK(例如QQ登录,微博登录等)
        return [[UMSocialManager defaultManager] handleOpenURL:url];
    }
    return result;
    //return [[UMSocialManager defaultManager] handleOpenURL:url];
}

@end
