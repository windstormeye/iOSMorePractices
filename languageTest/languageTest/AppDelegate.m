//
//  AppDelegate.m
//  languageTest
//
//  Created by PJ on 2018/4/10.
//  Copyright © 2018年 PJ. All rights reserved.
//

#import "AppDelegate.h"
#import "navOneViewController.h"
#import "navTwoViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *rootTabBar;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // App第一次启动跟随系统语言设置
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSArray *allLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *preferredLanguage = allLanguages[0];
        if([preferredLanguage rangeOfString:@"zh-Hans"].location != NSNotFound) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:AppLanguage];
        } else {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:AppLanguage];
        }
    }

    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.rootTabBar = [[UITabBarController alloc]init];
    self.rootTabBar.delegate = (id)self;
    self.window.rootViewController = self.rootTabBar;
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    navOneViewController *navOneController = [navOneViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:navOneController];
    nav1.title = PJLocalString(@"home");
    
    navTwoViewController *navTwoController = [navTwoViewController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:navTwoController];
    nav2.title = PJLocalString(@"discover");
    
    self.rootTabBar.viewControllers = @[nav1, nav2];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"changeLanguage" object:nil];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)changeLanguage:(NSNotification *)notify {
    self.rootTabBar.viewControllers[0].tabBarItem.title = PJLocalString(@"home");
    self.rootTabBar.viewControllers[1].tabBarItem.title = PJLocalString(@"discover");
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


@end
