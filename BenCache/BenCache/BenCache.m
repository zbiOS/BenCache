//
//  BenCache.m
//  BenCache
//
//  Created by BEN on 18/09/2019.
//  Copyright © 2019 BZ. All rights reserved.
//

#import "BenCache.h"

@interface BenCache ()
@property (strong, nonatomic) NSMutableDictionary *dict;
@end

@implementation BenCache
+ (NSString *)getFilePath: (NSString *)filePath {
    
    //指向文件目录
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    //NSString *fileDirectory = [documentDirectory stringByAppendingPathComponent:fileDir];
    //NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
    filePath = [documentDirectory stringByAppendingPathComponent:filePath];
    
    return filePath;
}

+ (BOOL)isFileExist: (NSString *)filePath isDirectory:( BOOL *)isDirectory{
    
    BOOL bFlag = false;
    
    filePath = [self getFilePath:filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:isDirectory];
    if ( existed == YES ) {
        bFlag = true;
    }
    
    return bFlag;
}

+ (BOOL)isFileExist: (NSString *)filePath{
    
    BOOL bFlag = false;
    
    filePath = [self getFilePath:filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL existed = [fileManager fileExistsAtPath:filePath];
    if ( existed == YES ) {
        bFlag = true;
    }
    
    return bFlag;
}


+ (BOOL)createFileDir: (NSString *)fileDir {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileDir = [self getFilePath:fileDir];
    BOOL isDir = NO;
    BOOL existed = [fileManager fileExistsAtPath:fileDir isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) ) {
        [fileManager createDirectoryAtPath:fileDir withIntermediateDirectories:YES attributes:nil error:nil];
        return true;
    }
    
    return false;
}

+ (BOOL)save: (NSString *)filePath contentArray:(NSMutableArray *)arr {
    filePath = [self getFilePath:filePath];
    return [NSKeyedArchiver archiveRootObject:arr toFile:filePath];
}

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path{
    return [NSKeyedArchiver archiveRootObject:rootObject toFile:[self getFilePath:path]];
}
+ (id)unarchiveObjectWithFile:(NSString *)path{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self getFilePath:path]];
}

+(void)removeArchiveFile:(NSString*)path {
    path = [self getFilePath:path];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
}

+(NSData*)dataForArchiveFile:(NSString*)path {
    path = [self getFilePath:path];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return [NSData dataWithContentsOfFile:path];
    }
    
    return nil;
}

+ (id)read: (NSString *)filePath {
    filePath = [self getFilePath:filePath];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

// TODO: delete v1.6
+ (NSString *)saveFileToDocuments:(NSString *)url {
    
    NSString *fileName = [url lastPathComponent];
    NSString *resultFilePath = @"";
    
    if (url.length > 7) {
        NSString *destFolderPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"map"];
        NSString *destFilePath = [destFolderPath stringByAppendingPathComponent:fileName];
        
        if (! [[NSFileManager defaultManager] fileExistsAtPath:destFolderPath]) { // check the directory exist or not
            [[NSFileManager defaultManager] createDirectoryAtPath:destFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:destFilePath]) { //check the file exist or not
            resultFilePath = destFilePath;
        } else {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            if ([imageData writeToFile:destFilePath atomically:YES]) {
                resultFilePath = destFilePath;
            } else {
                resultFilePath = destFilePath;
            }
        }
    }
    
    return resultFilePath;
}

+ (NSString*)UTF8_To_GB2312:(NSString*)utf8string
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* gb2312data = [utf8string dataUsingEncoding:encoding];
    
    return [[NSString alloc] initWithData:gb2312data encoding:encoding];
}
#pragma convert userdefault
+ (BenCache *)standardUserDefaults{
    static BenCache *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BenCache alloc] init];
    });
    return _sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary *dict = [BenCache unarchiveObjectWithFile:kWMCDictfileName];
        if (dict) {
            _dict = [dict mutableCopy];
        } else {
            _dict = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}
- (id)objectForKey:(NSString *)defaultName{
    id result = [self.dict objectForKey:defaultName];
    if (result) {
        return result;
    } else {
        id value = [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
        if (value) {
            [self.dict setObject:value forKey:defaultName];
            return value;
        }
    }
    return nil;
}
- (void)setObject:(id)value forKey:(NSString *)defaultName{
    if (value) {
        [self.dict setObject:value forKey:defaultName];
    }
}

- (void)removeObjectForKey:(NSString *)defaultName
{
    if ([self.dict objectForKey:defaultName]) {
        [self.dict removeObjectForKey:defaultName];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:defaultName]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)removeAllObject
{
    BOOL change = NO;
    for (NSString *key in self.dict.allKeys) {
        if (![key isEqualToString:kUserInfo]) {
            [self.dict removeObjectForKey:key];
            if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
                change = YES;
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            }
        }
    }
    [self synchronize];
    if (change) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (BOOL)synchronize
{
    return [BenCache archiveRootObject:self.dict toFile:kWMCDictfileName];
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    for (NSString *key in [self.dict allKeys]) {
        id obj = [self.dict objectForKey:key];
        if ([key isEqualToString:kUserInfo]) {
//            WMCUserProfile *userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:(NSData*)obj];
//            [result setObject:userInfo.dictionary forKey:key];
        } else {
            [result setObject:obj forKey:key];
        }
    }
    
    return result;
}

+ (void)clean
{
    [[BenCache standardUserDefaults] removeAllObject];
}
@end
