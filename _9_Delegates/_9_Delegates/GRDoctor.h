//
//  GRDoctor.h
//  _9_Delegates
//
//  Created by Exo-terminal on 3/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRPatient.h"

@interface GRDoctor : NSObject <GRPatientDelegate>

@property(nonatomic)NSMutableArray* arrayPatient;

@end
