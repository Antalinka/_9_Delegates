//
//  GRPatient.h
//  _9_Delegates
//
//  Created by Exo-terminal on 3/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol GRPatientDelegate;

typedef enum{
    hurtLeg = 0,
    hurtHand = 1,
    hurtHead = 2
}GRHurt;

@interface GRPatient : NSObject
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) CGFloat temperature;
@property(assign, nonatomic)BOOL caught;
@property(assign, nonatomic) GRHurt *hurt;
@property(assign, nonatomic)BOOL doctorGoodOrBad;
@property(weak, nonatomic) id<GRPatientDelegate> delegate;

@property(strong, nonatomic) NSMutableDictionary* dictionaryPatient;

-(BOOL) areYouOk;

-(void) makeShot;
-(NSMutableDictionary*) putGypsum;
-(void) takePyretic;

-(void) drinkWhiskeyWithLemon;
-(NSDictionary*) amputate;
-(void) drinkIceTee;
-(void) takeSedative;
@end

@protocol GRPatientDelegate <NSObject>
-(void) patientFeelsBad: (GRPatient*) patient;
-(void)report;
@end