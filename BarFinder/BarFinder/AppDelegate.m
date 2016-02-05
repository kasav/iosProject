//
//  AppDelegate.m
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "AppDelegate.h"
#import "Bar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"QVeEvh5WeLfc0CcPUkgqXxBk9Bb8uTrcBlAPo6us"
                  clientKey:@"2biEqJuZvolbAWqka9DLVv70q2a3PnL7DhSkC2Hj"];
    self.data = [[LocalData alloc] init];
    
    
    PFQuery* query = [PFQuery queryWithClassName: [Bar parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            for (Bar* b in objects){
                [self.data addBar:b];
            }
        }
        
    }];
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
//   NSMutableArray* bars = [NSMutableArray arrayWithObjects:
//                 [Bar BarWithName:@"Niagara" address:@"ul. Obikolna 15" phone:@"0888151515"textDescription: @"Svqstna picariq" andImageUrl:@"http://photos.mandarinoriental.com/is/image/MandarinOriental/excelsior-restaurant-dickens-bar?$DetailBannerHeight$"],
//                 [Bar BarWithName:@"Nazdrave" address:@"ul. Vasil Lewski 18" phone:@"0888222222"textDescription: @"Qk Bar" andImageUrl:@"http://e-barnyc.com/wp-content/uploads/2014/05/20140423_Es_bar-9571_ENF.tif.jpg"],
//                 [Bar BarWithName:@"Nedelq" address:@"ul. Shipchenski prohod 115" phone:@"0888333333"textDescription: @"Sladkarnica" andImageUrl:@"http://vignette1.wikia.nocookie.net/glee/images/e/eb/Sports_Bar_SNAP_April-16.jpg/revision/latest?cb=20130704082132"],
//                 nil];
    
//    [bars enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [self.data addBar:obj];
//    }];
    return YES;
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
