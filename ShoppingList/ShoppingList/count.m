//
//  count.m
//  ShoppingList
//
//  Created by XinMob on 15/4/6.
//  Copyright (c) 2015年 xb. All rights reserved.
//

#import "count.h"

@implementation count

@synthesize counts;

-(count *)init
{
    self=[super init];
    if (self) {
        self.counts = @"0";
            }
    return self;
}
- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        
        self.counts = [coder decodeObjectForKey:@"counts"];
        
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder
{
    
    [coder encodeObject:counts forKey:@"counts"];
    
    
}
-(void)save
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *udObject = [NSKeyedArchiver archivedDataWithRootObject:self];
    [ud setObject:udObject forKey:@"count"];
}

@end
