//
//  RSAUtils.h
//  RSADemo
//
//  Created by coder on 2018/1/29.
//  Copyright © 2018年 WBL. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    KeyTypePublic = 0,
    KeyTypePrivate
}KeyType;

@interface RSAUtils : NSObject

- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

    //签名 Sha1 + RSA
- (NSString *)signString:(NSString *)string;
    //签名 md5 + RSA
- (NSString *)signMD5String:(NSString *)string;

//验证签名 Sha1 + RSA
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;
//验证签名 md5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;

//RSA加密
- (NSString *) encryptWithPublicKey:(NSString*)content;
//RSA解密
- (NSString *) decryptWithPrivatecKey:(NSString*)content;

@end
