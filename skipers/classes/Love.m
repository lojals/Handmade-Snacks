//
//  Love.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 4/2/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Love.h"

@implementation Love

-(id)init{
    self = [super init];
    if (self) {
        contLove = @"";
        imgLove = @"";
    }
    return self;
}

//GETS
-(NSString *) getContLove{
    return contLove;
}
-(NSString *) getImgLove{
    return imgLove;
}
//SETS
-(void)setContLove:(NSString *)contLoveN{
    contLove = contLoveN;
}
-(void)setImgLove:(NSString *)imgLoveN{
    imgLove = imgLoveN;
}
//CUSTOM
-(bool)haveImg{
    if([imgLove isEqualToString:@"---"]){
        return false;
    }
    return  true;
}


@end
