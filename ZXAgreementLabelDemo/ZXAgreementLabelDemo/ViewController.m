//
//  ViewController.m
//  ZXAgreementLabelDemo
//
//  Created by 李兆祥 on 2020/8/20.
//  Copyright © 2020 ZXLee. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"
#import "ZXAgreementLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZXAgreementLabel *agreementLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.agreementLabel.text = @"我已同意《用户协议》和《隐私协议》并承诺遵守平台规范";
    self.agreementLabel.zx_selected = YES;
    
    [self.agreementLabel zx_setAgreementWithHighlightSubStrs:@[@"《用户协议》",@"《隐私协议》"] highlightColor:nil allResponseToChooseIconTapAction:NO highlightTapAction:^(NSString * _Nonnull highlightStr, NSRange range) {
        [self.view makeToast:[NSString stringWithFormat:@"点击了👉%@",highlightStr] duration:0.5 position:CSToastPositionCenter];
        NSLog(@"点击了--%@",highlightStr);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.agreementLabel.textAlignment = NSTextAlignmentCenter;
    });
    
}

#pragma mark 更改文字颜色为灰色
- (IBAction)setTextColorAction:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.textColor = [UIColor lightGrayColor];
    }else{
        self.agreementLabel.textColor = [UIColor blackColor];
    }
    
}

#pragma mark 更改字体大小为17
- (IBAction)setFontAction:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.font = [UIFont systemFontOfSize:17];
    }else{
        self.agreementLabel.font = [UIFont systemFontOfSize:12];
    }
}

#pragma mark 更改高亮文字和选择图标颜色为红色
- (IBAction)setHighlightColor:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_highlightColor = [UIColor redColor];
    }else{
        self.agreementLabel.zx_highlightColor = nil;
    }
}

#pragma mark 更改文字与选择图标间距为15
- (IBAction)setSpaceToChooseIcon:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_spaceToChooseIcon = 15;
    }else{
        self.agreementLabel.zx_spaceToChooseIcon = ZXDefaultSpaceToChooseIcon;
    }
}

#pragma mark 更改选择图标选中时的颜色为紫色
- (IBAction)setChooseIconSelectedColor:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_chooseIconSelectedColor = [UIColor purpleColor];
    }else{
        self.agreementLabel.zx_chooseIconSelectedColor = nil;
    }
}

#pragma mark 自定义选择图标图片
- (IBAction)setCustomChooseIconImage:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_customChooseIconImage = [UIImage imageNamed:@"heart_icon"];
        self.agreementLabel.zx_customChooseIconSelectedImage = [UIImage imageNamed:@"heart_icon"];
    }else{
        self.agreementLabel.zx_customChooseIconImage = nil;
        self.agreementLabel.zx_customChooseIconSelectedImage = nil;
    }
}

#pragma mark 设置点击高亮以外的区域都触发选中事件
- (IBAction)setAllResponseToChooseIconTapAction:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_allResponseToChooseIconTapAction = YES;
    }else{
        self.agreementLabel.zx_allResponseToChooseIconTapAction = NO;
    }
}

#pragma mark 更改高亮区域为“已同意”和“平台规范”
- (IBAction)setHighliSubStrs:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_highlightSubStrs = @[@"已同意",@"平台规范"];
    }else{
        self.agreementLabel.zx_highlightSubStrs = @[@"《用户协议》",@"《隐私协议》"];
    }
}
- (IBAction)setHideChooseImage:(UISwitch *)sender {
    if(sender.on){
        self.agreementLabel.zx_hideChooseImage = YES;
    }else{
        self.agreementLabel.zx_hideChooseImage = NO;
    }
}

@end
