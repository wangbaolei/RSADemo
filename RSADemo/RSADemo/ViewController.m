//
//  ViewController.m
//  RSADemo
//
//  Created by coder on 2018/1/29.
//  Copyright © 2018年 WBL. All rights reserved.
//

#import "ViewController.h"
#import "RSAUtils.h"


#define RSA_Public_key         @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxuWhp6EgQfrrSBtxlBwbU35lhjC67X0Y1KrhqolIfYo3/yWV1eryYVUhk5xeHsbKg9RHD9TpIZRUWIW5a8MrMBcgr1A/dgIHi2EM28drH4JRTmkTLVHReggFbb046k0ISpLW3XVW0jHB3/z3S1c/NT9V63SQK6WJ65/YP5xISNQIDAQAB"
//私钥
#define RSA_Privite_key        @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALG5aGnoSBB+utIG3GUHBtTfmWGMLrtfRjUquGqiUh9ijf/JZXV6vJhVSGTnF4exsqD1EcP1OkhlFRYhblrwyswFyCvUD92AgeLYQzbx2sfglFOaRMtUdF6CAVtvTjqTQhKktbddVbSMcHf/PdLVz81P1XrdJArpYnrn9g/nEhI1AgMBAAECgYBEbsMAvLs69sFS6+djU1BTGYIC6Kp55ZawFDIMhVIf2aAZ1N+nW8pQ0c3dZIpP6qGAjrz3em6lv55d9iN7Cura/g57Rk4S3SRo5u4hWUd16NeIVP+HfreKIgZ6jwKQTfXt2KzDuIAHudvwT2UJBePgIIDQoKMEq4khtFiRGS1UgQJBAN/KpSOiRiGup8h/Iqespwfxyrqn5/4iyw1tpJCWzHddP7nJGpYmOL+ELWs/pReYclAOqH9ZIzOT2K8ZLt6yBOECQQDLTXZowK8wFgMudAE5TStC/zl3TAKMu/Gu5wlXSMoa+nwSy/FSIQZyypGeHR2X8QhbZ1Qz+uBCJm7gEGOWMWPVAkEAp5ajsFm3V0XqE/VRSGu88fAaN0nCK8h2cunm0Ph8ye6k6EY3iLW6zYD4WlZhFZhuEpHHkQZ5nAhdvlKHjPGXQQJAYOtF1rx9B/SGgb/F0ZZrWF4p/ChdUtBKcHIt7tGBoAjn22IkYl3iIBlYAEOrFwNOU5zX9IvWG1MNKn5Fq5VSHQJBAJG5xSY0IKzXWDsGnPIa9XlSTv1zl7RCGNDo7O1zh+5J/kjDpU9M2fIXEtzvGYHiOffz9FBh5ka69JJNFWoWAiw="


@interface ViewController ()
{
     RSAUtils* _handler;
}

@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIButton *enBtn;
@property (weak, nonatomic) IBOutlet UIButton *deBtn;
@property (weak, nonatomic) IBOutlet UIButton *sigBtn;
@property (weak, nonatomic) IBOutlet UILabel *result1;

@property (weak, nonatomic) IBOutlet UILabel *result2;
@property (weak, nonatomic) IBOutlet UIButton *verifyBtn;

@end

@implementation ViewController

-(void)viewDidLoad
{
    self.navigationItem.title = @"RSA加密/验证";
    self.view.backgroundColor = [UIColor yellowColor];
    
//    NSString *publicKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_public_key.pem" ofType:nil];
//
//    NSString *privateKeyFilePath = [[NSBundle mainBundle] pathForResource:@"rsa_private_key.pem" ofType:nil];
    
    RSAUtils* handler = [RSAUtils new];
    // [handler importKeyWithType:KeyTypePublic andPath:publicKeyFilePath];
    //[handler importKeyWithType:KeyTypePrivate andPath:privateKeyFilePath];
    [handler importKeyWithType:KeyTypePrivate andkeyString:RSA_Privite_key];
    [handler importKeyWithType:KeyTypePublic andkeyString:RSA_Public_key];
    _handler = handler;
    
    
}

- (IBAction)enClick:(id)sender {
    if(self.input.text.length > 0 ){
        NSString* result = [_handler encryptWithPublicKey:self.input.text];
        self.result1.text = result;
    }
}
- (IBAction)signClick:(id)sender {
    if(self.input.text.length > 0 ){
        //sha1签名
//        NSString* result = [_handler signString:self.input.text];
//        self.result1.text = result;
        //MD5签名
        NSString* result = [_handler signMD5String:self.input.text];
        self.result1.text = result;
    }
}
- (IBAction)deClick:(id)sender {
    if(self.result1.text.length > 0 ){
        NSString* result = [_handler decryptWithPrivatecKey:self.result1.text];
        self.result2.text = result;
    }
}
- (IBAction)verifyClick:(id)sender {
    if(self.result1.text.length > 0  && self.input.text.length > 0){
//        //sha1验签
//        BOOL result = [_handler verifyString:self.input.text withSign:self.result1.text];
//        self.result2.text = [NSString stringWithFormat:@"验证签名结果(1成功，0失败)： %d",result];
        
        //MD5验签
        BOOL result = [_handler verifyMD5String:self.input.text withSign:self.result1.text];
        self.result2.text = [NSString stringWithFormat:@"验证签名结果(1成功，0失败)： %d",result];
    }
}
@end
