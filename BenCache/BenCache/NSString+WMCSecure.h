//
//  NSString+WMCSecure.h
//  mobile
//
//  Created by Dido on 16/3/16.
//  Copyright © 2016年 Wal-Mart China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WMCSecure)

- (NSString *)stringByAppendingStringSecure:(NSString *)aString;
- (NSString *)stringByReplacingOccurrencesOfStringSecure:(NSString *)target
                                              withString:(NSString *)replacement;
- (NSString *)stringByReplacingCharactersInRangeSecure:(NSRange)range
                                            withString:(NSString *)replacement;
- (NSRange)rangeOfStringSecure:(NSString *)searchString;
- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
                         range:(NSRange)searchRange;
- (BOOL)containsStringSecure:(NSString *)str;
- (unichar)characterAtIndexSecure:(NSUInteger)index;
- (NSString *)substringFromIndexSecure:(NSUInteger)from;
- (NSString *)substringToIndexSecure:(NSUInteger)to;
- (NSString *)substringWithRangeSecure:(NSRange)range;
- (NSRange)rangeOfCharacterFromSetSecure:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;

@end
