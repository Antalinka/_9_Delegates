//
//  GRPatient.m
//  _9_Delegates
//
//  Created by Exo-terminal on 3/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRPatient.h"

@implementation GRPatient

-(BOOL) areYouOk{
    BOOL iFeelsGood = arc4random()%2;
    return iFeelsGood;
}
-(BOOL) doctorGoodOrBad{
    BOOL isDoctorGood = arc4random()%2;
    return isDoctorGood;
}

-(void) makeShot{
    return NSLog(@"%@ makes a shot", self.name);
}
-(NSDictionary*) putGypsum{
    
    GRHurt hurt = arc4random()%3;

    NSMutableDictionary* localDictionary = [[NSMutableDictionary alloc]init];
    
    switch (hurt) {
        case hurtLeg:
            NSLog(@"%@ puts gypsum on leg",self.name);
           [localDictionary setObject:self.name forKey:@"leg"];
                break;
        case hurtHand:
            NSLog(@"%@ puts gypsum on hand",self.name);
            [localDictionary setObject:self.name forKey:@"hand"];

            break;
        case hurtHead:
            NSLog(@"%@ puts gypsum on head",self.name);
            [localDictionary setObject:self.name forKey:@"head"];
            break;
            
        default:
            NSLog(@"%@ puts gypsum",self.name);
            break;
     }
    return localDictionary;
}
-(void) takePyretic{
    return NSLog(@"%@ takes a pyretic", self.name);

}
-(void) drinkWhiskeyWithLemon{
    NSLog(@"%@ do you like whiskey with lemon?Maybe, it help you.",self.name);
}
-(NSDictionary*)amputate{
    
    GRHurt hurt = arc4random()%3;
    
    NSMutableDictionary* localDictionary = [[NSMutableDictionary alloc]init];
    
    switch (hurt) {
        case hurtLeg:
            NSLog(@"We can amputate a left leg.You can choose a rigth leg.");
            [localDictionary setObject:self.name forKey:@"leg"];
            break;
        case hurtHand:
            NSLog(@"We can amputate a hand.Left or right,it does not matter.");
            [localDictionary setObject:self.name forKey:@"hand"];
            break;
        case hurtHead:
            NSLog(@"We can amputate a head.No problem");
            [localDictionary setObject:self.name forKey:@"head"];
            break;
            
        default:
            NSLog(@"We can amputate");
            break;
    }
    return localDictionary;
}
-(void)drinkIceTee{
    NSLog(@"Drink more ice Tee and return to me");
}
-(void) takeSedative{
    NSLog(@"%@ takes Sedative",self.name);
}

@end
