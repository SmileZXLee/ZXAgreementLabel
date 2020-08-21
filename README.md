# ZXAgreementLabel
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/SmileZXLee/ZXAgreementLabel/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/ZXAgreementLabel.svg?style=flat)](http://cocoapods.org/?q=ZXNavigationBar)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/ZXAgreementLabel.svg?style=flat)](http://cocoapods.org/?q=ZXNavigationBar)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208.0%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
## 基于[YYText](https://github.com/ibireme/YYText)
## 安装
### 通过CocoaPods安装
```ruby
pod 'ZXAgreementLabel'
```
### 或手动导入
* 将ZXAgreementLabel拖入项目中。

### 导入头文件
```objective-c
#import "ZXAgreementLabel.h"
```

## 效果预览
![](http://www.zxlee.cn/github/ZXAgreementLabel/ZXAgreementLabelDemo1.gif)

## 开始使用
### 将Label/View继承于`ZXAgreementLabel`
### 设置ZXAgreementLabel(简约版)
```objective-c
/// 设置AgreementLabel(简约版)
/// @param highlightSubStrs 需要高亮的文字数组
/// @param highlightColor 高亮的文字颜色和选择图标选中时的颜色
/// @param allResponseToChooseIconTapAction 是否允许点击高亮部分以外的区域都触发选中事件，默认为否(当点击选择按钮时才触发)
/// @param highlightTapAction 点击高亮部分文字回调
```
```objective-c
self.agreementLabel.text = @"我已同意《用户协议》和《隐私协议》并承诺遵守平台规范";
//如果希望默认选中，请添加这一行
self.agreementLabel.zx_selected = YES;
[self.agreementLabel zx_setAgreementWithHighlightSubStrs:@[@"《用户协议》",@"《隐私协议》"] highlightColor:nil allResponseToChooseIconTapAction:NO highlightTapAction:^(NSString * _Nonnull highlightStr, NSRange range) {
    NSLog(@"点击了高亮文字--%@",highlightStr);
}];
```

### 设置ZXAgreementLabel(完整版)
```objective-c
/// 设置AgreementLabel(完整版)
/// @param textColor 文字颜色
/// @param highlightSubStrs 需要高亮的文字数组
/// @param highlightColor 高亮的文字颜色
/// @param highlightBackgroundColor 高亮的文字背景颜色
/// @param chooseIconColor 选择图标未选中时的颜色
/// @param chooseIconSelectedColor 选择图标选中时的颜色
/// @param customChooseIconImage 自定义选择图标未选中时的图片，若不设置则使用默认的图片
/// @param customChooseIconSelectedImage 自定义选择图标选中时的图片，若不设置则使用默认的图片
/// @param spaceToChooseIcon 文字与选择图标的间距
/// @param allResponseToChooseIconTapAction 是否允许点击高亮部分以外的区域都触发选中事件
/// @param highlightTapAction 高亮部分文字点击回调
/// @param chooseIconTapAction 选择图标回调
```
```objective-c
self.agreementLabel.text = @"我已同意《用户协议》和《隐私协议》并承诺遵守平台规范";
[self.agreementLabel zx_setAgreementWithTextColor:[UIColor blackColor] highlightSubStrs:@[@"《用户协议》",@"《隐私协议》"] highlightColor:[UIColor redColor] highlightBackgroundColor:nil chooseIconColor:nil chooseIconSelectedColor:nil customChooseIconImage:nil customChooseIconSelectedImage:nil spaceToChooseIcon:2 allResponseToChooseIconTapAction:YES highlightTapAction:^(NSString * _Nonnull highlightStr, NSRange range) {
    NSLog(@"点击了高亮文字--%@",highlightStr);
} chooseIconTapAction:^(BOOL selected, NSRange range) {
    NSLog(@"点击了选择图标--%d",selected);
}];
```

## ZXAgreementLabel属性设置(非必须)
### 设置文字颜色
```objective-c
self.agreementLabel.textColor = [UIColor lightGrayColor];
```

### 设置字体大小
```objective-c
self.agreementLabel.font = [UIFont systemFontOfSize:17];
```

### 设置高亮文字和选择图标颜色
```objective-c
self.agreementLabel.zx_highlightColor = [UIColor redColor]];
```

### 设置高亮文字背景色
```objective-c
self.agreementLabel.zx_highlightBackgroundColor = [UIColor greenColor]];
```

### 设置文字与选择图标间距，默认为2
```objective-c
self.agreementLabel.zx_spaceToChooseIcon = 15;
```
### 设置选择图标未选中时的颜色，默认为灰色
```objective-c
self.agreementLabel.zx_chooseIconColor = [UIColor grayColor];
```

### 设置选择图标选中时的颜色，默认与`zx_highlightColor`相同
```objective-c
self.agreementLabel.zx_chooseIconSelectedColor = [UIColor purpleColor];
```

### 设置选择图标图片，若不设置则使用默认的图片
```objective-c
//设置选择图标未选中时的图片
self.agreementLabel.zx_customChooseIconImage = [UIImage imageNamed:@"heart_icon"];
//设置选择图标选中时的图片
self.agreementLabel.zx_customChooseIconSelectedImage = [UIImage imageNamed:@"heart_icon"];
```

### 设置点击高亮以外的区域都触发选中事件，默认为NO(当点击选择按钮时才触发)
```objective-c
self.agreementLabel.zx_allResponseToChooseIconTapAction = YES;
```

### 设置需要高亮的文字数组
```objective-c
self.agreementLabel.zx_highlightSubStrs = @[@"《用户协议》",@"《隐私协议》"];
```

### 设置或获取选中状态
```objective-c
////如果希望默认选中，请在控制器加载时将`zx_selected`设置为YES
self.agreementLabel.zx_selected = YES;
```

***

## 版本记录，请查阅[Release](https://github.com/SmileZXLee/ZXNavigationBar/releases)

***

## 更多示例，可下载Demo查阅，若有任何问题，可随时在issue中提出
