//
//  listSnack.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/1/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface listSnack : NSObject{
    int idRecipe;
    NSString* ing1;
    NSString* ing2;
    NSString* ing3;
    int idIng1;
    int idIng2;
    int idIng3;
}

//GETS
-(int) getIdRecipe;
-(NSString*) getIng1;
-(NSString*) getIng2;
-(NSString*) getIng3;
-(int) getIdIng1;
-(int) getIdIng2;
-(int) getIdIng3;

//SETS
-(void) setIdRecipe:(int)idRecipeN;
-(void) setIng1:(NSString*)ing1N;
-(void) setIng2:(NSString*)ing2N;
-(void) setIng3:(NSString*)ing3N;

-(void) setIdIng1:(int)idIng1N;
-(void) setIdIng2:(int)idIng2N;
-(void) setIdIng3:(int)idIng3N;


@end
