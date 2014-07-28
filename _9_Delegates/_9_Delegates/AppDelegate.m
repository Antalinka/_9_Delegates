//
//  AppDelegate.m
//  _9_Delegates
//
//  Created by Exo-terminal on 3/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRPatient.h"
#import "GRDoctor.h"
#import "GRBadDoctor.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    GRPatient *patient1 = [[GRPatient alloc]init];
    patient1.name = @"Olga";
    patient1.temperature = 37.5f;
    
    GRPatient *patient2 = [[GRPatient alloc]init];
    patient2.name = @"Igor";
    patient2.temperature = 39.0f;
    
    GRPatient *patient3 = [[GRPatient alloc]init];
    patient3.name = @"Aleksandr";
    patient3.temperature = 40.0f;
    
    GRPatient *patient4 = [[GRPatient alloc]init];
    patient4.name = @"Dima";
    patient4.temperature = 36.6f;
    
    GRPatient *patient5 = [[GRPatient alloc]init];
    patient5.name = @"Artem";
    patient5.temperature = 38.5f;
    
    GRPatient *patient6 = [[GRPatient alloc]init];
    patient6.name = @"Anton";
    patient6.temperature = 36.5f;
    
    GRPatient *patient7 = [[GRPatient alloc]init];
    patient7.name = @"Tolya";
    patient7.temperature = 39.0f;
    
    GRPatient *patient8 = [[GRPatient alloc]init];
    patient8.name = @"Semen";
    patient8.temperature = 40.0f;
    
    GRDoctor* doctor = [[GRDoctor alloc]init];
    GRBadDoctor* badDoctor = [[GRBadDoctor alloc]init];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    
    patient5.delegate = badDoctor;
    patient6.delegate = badDoctor;
    patient7.delegate = badDoctor;
    patient8.delegate = badDoctor;

    
    NSArray* arrayPatient = [[NSArray alloc]initWithObjects:patient1,patient2,patient3,patient4,patient5,patient6,patient7,patient8,nil];
    
    [self day:arrayPatient];
    [doctor report];
    NSLog(@"\n");
    [badDoctor report];
    NSLog(@"\n");
    
    for (GRPatient* patient in arrayPatient){
        if(![patient doctorGoodOrBad]){
            NSLog(@"My name is %@.My doctor is bad!",patient.name);
            if (patient.delegate == doctor) {
                patient.delegate = badDoctor;
            }else{
                patient.delegate = doctor;
                 }
        }else{
            NSLog(@"My name is %@.My doctor is good!",patient.name);
        }
    }
  [self day:arrayPatient];
  return YES;
}
-(void)day:(NSArray*) arrayPatient{
    NSLog(@"-------------------------------New day-------------------------------");
    for (GRPatient* patient in arrayPatient){
        NSLog(@"I am %@.Good morning, %@!Are you ok?",patient.delegate, patient.name);
        if (![patient areYouOk]) {
            NSLog(@"No, doctor.I got sick");
            [patient.delegate patientFeelsBad: patient];
        }else{
            NSLog(@"Yes, thank you.");
        }
        NSLog(@"\n");
    }
  }

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
