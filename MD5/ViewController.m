//
//  ViewController.m
//  MD5
//
//  Created by ctsd on 2020/12/29.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *md5 = [self md5EncryptStr:@"10810561609166044035V9RX33GMKQM23KPFYTQXKQP8B" bateNum:32 isLowercaseStr:NO];
    NSLog(@"===加密后===%@",md5);
    
}


- (NSString *)md5EncryptStr:(NSString *)str bateNum:(NSInteger)bateNum isLowercaseStr:(BOOL)isLowercaseStr {
    NSString *md5Str = nil;
    const char *input = [str UTF8String];//UTF8转码
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digestStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];//直接先获取32位md5字符串,16位是通过它演化而来
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digestStr appendFormat:isLowercaseStr ? @"%02x" : @"%02X", result[i]];//%02x即小写,%02X即大写
    }
    if (bateNum == 32) {
        md5Str = digestStr;
    } else {
        md5Str = [digestStr substringWithRange:NSMakeRange(8, 16)];
    }
    return md5Str;
}

@end
