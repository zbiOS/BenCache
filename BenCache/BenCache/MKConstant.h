//
//  MKConstant.h
//  BenCache
//
//  Created by BEN on 17/10/2019.
//  Copyright © 2019 BZ. All rights reserved.
//

#import <Foundation/Foundation.h>


extern id WMCValidatedObject(id Object);
extern NSString *WMCValidatedString(NSString *string);
extern NSArray *WMCValidatedArray(NSArray *array);
extern NSArray *WMCValidatedArrayNotNil(NSArray *array);
extern NSDictionary *WMCValidatedDictionaryNotNil(NSDictionary *dictionary);
extern NSDictionary *WMCValidatedDictionary(NSDictionary *dictionary);
/// 解决iOS8.0 cell.detailTextLabel.text空字符串会不显示
extern NSString *WMCValidatedCellDetailTextNotZero(NSString *string);
NS_ASSUME_NONNULL_BEGIN

@interface MKConstant : NSObject

@end

NS_ASSUME_NONNULL_END
