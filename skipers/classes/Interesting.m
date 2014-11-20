//
//  Interesting.m
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/23/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import "Interesting.h"

@implementation Interesting

-(id)init{
    self = [super init];
    if (self) {
        idInteresting = 0;
        namInteresting = @"";
        contentInteresting = @"";
    }
    return self;
}

//GETS
-(int)getIdInteresting{
    return idInteresting;
}
-(NSString*)getNamInteresting{
    return namInteresting;
}
-(NSString*)getContentInteresting{
    return contentInteresting;
}
//SETS
-(void)setIdInteresting:(int)idInterestingN{
    idInteresting = idInterestingN;
}
-(void)setNamInteresting:(NSString*)namInterestingN{
    namInteresting = namInterestingN;
}
-(void)setContentInteresting:(NSString*)contentInterestingN{
    contentInteresting = contentInterestingN;
}

@end
