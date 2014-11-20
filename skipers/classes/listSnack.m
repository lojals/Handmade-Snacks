//
//  listSnack.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/1/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "listSnack.h"

@implementation listSnack

-(id)init{
    self = [super init];
    if (self) {
        idRecipe = 0;
        ing1 = @"";
        ing2 = @"";
        ing3 = @"";
        idIng1 = 0;
        idIng2 = 0;
        idIng3 = 0;
    }
    return self;
}

//GETS
-(int) getIdRecipe{
    return idRecipe;
}
-(NSString*) getIng1{
    return ing1;
}
-(NSString*) getIng2{
    return ing2;
}
-(NSString*) getIng3{
    return ing3;
}

-(int) getIdIng1{
    return idIng1;
}
-(int) getIdIng2{
    return idIng2;
}
-(int) getIdIng3{
    return idIng3;
}

//SETS
-(void) setIdRecipe:(int)idRecipeN{
    idRecipe = idRecipeN;
}
-(void) setIng1:(NSString*)ing1N{
    ing1 = ing1N;
}
-(void) setIng2:(NSString*)ing2N{
    ing2 = ing2N;
}
-(void) setIng3:(NSString*)ing3N{
    ing3 = ing3N;
}
-(void) setIdIng1:(int)idIng1N{
    idIng1 = idIng1N;
}
-(void) setIdIng2:(int)idIng2N{
    idIng2 = idIng2N;
}
-(void) setIdIng3:(int)idIng3N{
    idIng3 = idIng3N;
}


@end
