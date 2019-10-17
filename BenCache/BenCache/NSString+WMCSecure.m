//
//  NSString+WMCSecure.m
//  mobile
//
//  Created by Dido on 16/3/16.
//  Copyright © 2016年 Wal-Mart China. All rights reserved.
//

#import "NSString+WMCSecure.h"

@implementation NSString (WMCSecure)

- (NSString *)stringByAppendingStringSecure:(NSString *)aString
{
    NSAssert(aString, @"stringByAppendingStringSecure");
    if (aString) {
        return [self stringByAppendingString:aString];
    } else {
        return self;
    }
}

- (NSString *)stringByReplacingOccurrencesOfStringSecure:(NSString *)target
                                              withString:(NSString *)replacement
{
    NSAssert(target && replacement, @"stringByReplacingOccurrencesOfStringSecure");
    if (target && replacement) {
        return [self stringByReplacingOccurrencesOfString:target withString:replacement];
    } else {
        return self;
    }
}

- (NSString *)stringByReplacingCharactersInRangeSecure:(NSRange)range
                                            withString:(NSString *)replacement
{
    BOOL isValidLength = range.location + range.length <= self.length;
    NSAssert(replacement && isValidLength, @"stringByReplacingCharactersInRangeSecure");
    if (replacement && isValidLength) {
        return [self stringByReplacingCharactersInRange:range withString:replacement];
    } else {
        return self;
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
{
    NSAssert(searchString, @"rangeOfStringSecure");
    if (searchString) {
        return [self rangeOfString:searchString];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
{
    NSAssert(searchString, @"rangeOfStringSecure");
    if (searchString) {
        return [self rangeOfString:searchString options:mask];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
                         range:(NSRange)searchRange
{
    BOOL isValidLength = searchRange.location + searchRange.length <= self.length;
    NSAssert(searchString && isValidLength, @"rangeOfStringSecure");
    if (searchString && isValidLength) {
        return [self rangeOfString:searchString options:mask range:searchRange];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (BOOL)containsStringSecure:(NSString *)str
{
    NSAssert(str, @"containsStringSecure");
    if (str) {
        return [self containsString:str];
    } else {
        return NO;
    }
}

- (unichar)characterAtIndexSecure:(NSUInteger)index
{
    BOOL isValidLength = index < self.length;
    NSAssert(isValidLength, @"characterAtIndexSecure");
    if (isValidLength) {
        return [self characterAtIndex:index];
    } else {
        return 0;
    }
}

- (NSString *)substringFromIndexSecure:(NSUInteger)from
{
    BOOL isValidLength = from <= self.length;
    NSAssert(isValidLength, @"substringFromIndexSecure");
    if (isValidLength) {
        return [self substringFromIndex:from];
    } else {
        return @"";
    }
}

- (NSString *)substringToIndexSecure:(NSUInteger)to
{
    BOOL isValidLength = to <= self.length;
    NSAssert(isValidLength, @"substringToIndexSecure");
    if (isValidLength) {
        return [self substringToIndex:to];
    } else {
        return @"";
    }
}

- (NSString *)substringWithRangeSecure:(NSRange)range
{
    BOOL isValidLength = range.location + range.length <= self.length;
    NSAssert(isValidLength, @"substringWithRangeSecure");
    if (isValidLength) {
        return [self substringWithRange:range];
    } else {
        return @"";
    }
}

- (NSRange)rangeOfCharacterFromSetSecure:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask
{
    NSAssert(searchSet, @"rangeOfCharacterFromSetSecure");
    if (searchSet) {
        return [self rangeOfCharacterFromSet:searchSet options:mask];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}
@end


