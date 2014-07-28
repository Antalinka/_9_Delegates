//
//  GRBadDoctor.h
//  _9_Delegates
//
//  Created by Exo-terminal on 3/13/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRPatient.h"

@interface GRBadDoctor : NSObject <GRPatientDelegate>

@property(nonatomic)NSMutableArray* arrayPatient;

@end
