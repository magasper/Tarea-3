//
//  AppDelegate.h
//  Circle Black
//
//  Created by pegasus on 14/09/17.
//  Copyright © 2017 pegasus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

