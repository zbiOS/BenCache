//
//  MKConstant.m
//  BenCache
//
//  Created by BEN on 17/10/2019.
//  Copyright © 2019 BZ. All rights reserved.
//

#import "MKConstant.h"
id WMCValidatedObject(id Object)
{
    if ([Object isKindOfClass:[NSNull class]])
        return nil;
    
    return Object;
}

NSString *WMCValidatedString(NSString *string)
{
    if ([string isKindOfClass:[NSString class]])
        return string;
    else if ([string isKindOfClass:[NSNumber class]])
        return [(NSNumber *)string stringValue];
    else
        return @"";
}

NSArray *WMCValidatedArray(NSArray *array)
{
    if ([array isKindOfClass:[NSArray class]])
        return array;
    
    return nil;
}

NSArray *WMCValidatedArrayNotNil(NSArray *array)
{
    if ([array isKindOfClass:[NSArray class]])
        return array;
    
    return [[NSArray alloc] init];
}

NSDictionary *WMCValidatedDictionary(NSDictionary *dictionary)
{
    if ([dictionary isKindOfClass:[NSDictionary class]])
        return dictionary;
    
    return nil;
}

NSDictionary *WMCValidatedDictionaryNotNil(NSDictionary *dictionary)
{
    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]])
        return dictionary;
    
    return [[NSDictionary alloc] init];
}
NSString *WMCValidatedCellDetailTextNotZero(NSString *string){
    if (string.length == 0 || !string) {
        return @" ";
    }
    return string;
}
@implementation MKConstant

@end
