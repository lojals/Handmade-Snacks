//
//  Interesting.h
//  skipers
//
//  Created by Jorge Raul Ovalle Zuleta on 3/23/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interesting : NSObject{
    int idInteresting;
    NSString *namInteresting;
    NSString *contentInteresting;
}

//GETS
-(int)getIdInteresting;
-(NSString*)getNamInteresting;
-(NSString*)getContentInteresting;
//SETS
-(void)setIdInteresting:(int)idInterestingN;
-(void)setNamInteresting:(NSString*)namInterestingN;
-(void)setContentInteresting:(NSString*)contentInterestingN;

@end
