//
//  BenCache.h
//  BenCache
//
//  Created by BEN on 18/09/2019.
//  Copyright © 2019 BZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kWMCDictfileName @"dict"

#define kWMCCategoryManagerFileName           @"category.archive"
#define kWMCProvincesFileName  @"provinces.archive"
#define kWMCCitiesFileName     @"cities.archive"
#define kWMCStoresFileName     @"stores.archive"
#define kWMCThirdCitiesFileName     @"thirdCities.archive"

#define kWMCProvincesFileName_Togo  @"provinces_togo.archive"
#define kWMCCitiesFileName_Togo     @"cities_togo.archive"
#define kWMCStoresFileName_Togo     @"stores_togo.archive"

#define kWMCProvincesFileName_FtzPickup  @"provinces_ftzpickup.archive"
#define kWMCCitiesFileName_FtzPickup     @"cities_ftzpickup.archive"
#define kWMCStoresFileName_FtzPickup     @"stores_ftzpickup.archive"

#define kHomeCachesName     @"homecache.archive"
#define kHomeFtzCachesName     @"homeftzcache.archive"

#define kWMCShoppingListsPath      @"ShoppingLists"
#define kWMCShoppingListsFileName  @"ShoppingLists/Lists"
#define kWMCShoppingListNamesFileName      @"ShoppingLists/ListNames"

#define kWMCSystemResourceFileName  @"wmcsystemresource.archive"

#define WMC_GP_FILE_VERSION_KEY @"WMCGPFileVersion"
#define kFileNameCalcMinJs @"calc.min.js"
#define kFileNameDataJs @"data.js"

#define kFileDir                @"map"
#define kFTZCartFileName        @"ftzCart"
#define kTogoCartFileName       @"togoCart"
#define kFTZOptionDelivery      @"ftzOptionDelivery"
#define kFTZPickupStore         @"ftzPickUpStore"
#define kUserInfo               @"userInfo"
#define kdefaultOptionDelivery  @"defaultOptionDelivery"
#define kisThirdPartyAccount    @"isThirdPartyAccount"
#define kFtzStore               @"ftzStore"
#define kStore                  @"store"
#define kPreviousVersion        @"previousVersion"
#define kHistoryHomeDeliveryStore   @"historyHomeDeliveryStore"
#define kHistoryInStorePickUpStore  @"historyInStorePickUpStore"
#define kSelectStoreInCityDic       @"selectStoreInCityDic"

#define kTimeIntervalOfClickedUpdateLater    @"timeIntervalOfClickedUpdateLater"
NS_ASSUME_NONNULL_BEGIN

@interface BenCache : NSObject
+ (BOOL)isFileExist: (NSString *)filePath;

+ (BOOL)isFileExist: (NSString *)filePath isDirectory:( BOOL *)isDirectory;

+ (BOOL)createFileDir: (NSString *)fileDir;

+ (BOOL)save: (NSString *)filePath contentArray:(NSMutableArray *)arr;

+ (id)read: (NSString *)filePath;

//+ (NSString *)saveFileToDocuments:(NSString *)url;

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path;

+ (id)unarchiveObjectWithFile:(NSString *)path;

+ (void)removeArchiveFile:(NSString*)path;

+ (NSData*)dataForArchiveFile:(NSString*)path;

+ (BenCache *)standardUserDefaults;

- (id)objectForKey:(NSString *)defaultName;

- (void)setObject:(id)value forKey:(NSString *)defaultName;

- (void)removeObjectForKey:(NSString *)defaultName;

- (BOOL)synchronize;

- (NSDictionary *)dictionary;

+ (void)clean;
@end

NS_ASSUME_NONNULL_END
