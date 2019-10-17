//
//  NSArray+WMCSecure.m
//  mobile
//
//  Created by Vary Fan on 16/3/16.
//  Copyright © 2016年 Wal-Mart China. All rights reserved.
//

#import "NSArray+WMCSecure.h"

@implementation NSArray (WMCSecure)

- (id)objectAtIndexSecure:(NSUInteger)index {
    
    NSAssert2(index < [self count], @"WMC: index %ld beyond bounds [0 .. %ld]", index, self.count - 1);

    if(index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if(value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

@end
