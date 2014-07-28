//
//  GRBadDoctor.m
//  _9_Delegates
//
//  Created by Exo-terminal on 3/13/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRBadDoctor.h"

@implementation GRBadDoctor
-(NSString*)description{
    return @"Bad Doctor";
}
-(void)report{
    NSLog(@"Report by BadDoctor:");
    NSMutableArray* patientWithLeg = [[NSMutableArray alloc]init];
    NSMutableArray* patientWithHand = [[NSMutableArray alloc]init];
    NSMutableArray* patientWithHead = [[NSMutableArray alloc]init];
    
    for (NSDictionary* obj in self.arrayPatient){
        if ([obj objectForKey:@"leg"]) {
            [patientWithLeg addObject:[obj objectForKey:@"leg"]];
        }else if ([obj objectForKey:@"hand"]){
            [patientWithHand addObject:[obj objectForKey:@"hand"]];
        }else if([obj objectForKey:@"head"]){
            [patientWithHead addObject:[obj objectForKey:@"head"]];
        }
    }
    BOOL doesHurt = NO;
    if([patientWithLeg count]){
        NSLog(@"Patient with hurt leg:");
        for (NSInteger i=0; i<=[patientWithLeg count]-1; i++) {
            NSLog(@"%@",patientWithLeg[i]);
        }
        doesHurt = YES;
    }
    if([patientWithHand count]){
        NSLog(@"Patient with hurt hand:");
        for (NSInteger i=0; i<=[patientWithHand count]-1; i++) {
            NSLog(@"%@",patientWithHand[i]);
        }
        doesHurt = YES;
    }
    if ([patientWithHead count]){
        NSLog(@"Patient with hurt head:");
        for (NSInteger i=0; i<=[patientWithHead count]-1; i++) {
            NSLog(@"%@",patientWithHead[i]);
        }
        doesHurt = YES;
    }
    if (!doesHurt) {
        NSLog(@"There are no sick patients");
    }
}

#pragma mark - GRPatient

-(void) patientFeelsBad: (GRPatient*) patient{
    if (!self.arrayPatient) {
        self.arrayPatient = [NSMutableArray new];
    }
    
    BOOL caught = arc4random()%2;
    NSLog(@"Has %@ caught?-%@", patient.name,caught? @"YES": @"NO");
    
    if (caught) {
              [patient drinkWhiskeyWithLemon];
    }
    
//    BOOL hurt = YES;
    BOOL hurt = arc4random()%2;
    
    NSLog(@"Has %@ hurt in legs,hand or head?-%@", patient.name,hurt? @"YES": @"NO");
    
    if (hurt) {
        [self.arrayPatient addObject:[patient amputate]];
    }
    
    NSLog(@"Has %@ temperature?Temperature is %2.1f", patient.name,patient.temperature);
    
    if (patient.temperature>=37){
        [patient takeSedative];
    }
    else if(patient.temperature<37||!caught ||!hurt){
        [patient drinkIceTee];
    }
}

@end
