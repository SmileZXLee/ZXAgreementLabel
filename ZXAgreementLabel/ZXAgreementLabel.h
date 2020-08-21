//
//  ZXAgreementLabel.h
//  ZXAgreementLabel
//
//  Created by 李兆祥 on 2020/8/20.
//  Copyright © 2020 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXAgreementLabel

#import <UIKit/UIKit.h>
#import "YYLabel.h"
///默认选择图标未选中时的颜色(灰色)
#define ZXDefaultChooseIconColor [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1]
///默认高亮颜色(蓝色)
#define ZXDefaultHighlightColorColor [UIColor colorWithRed:0/255.0 green:142/255.0 blue:251/255.0 alpha:1]
///默认文字与选择图标的间距
#define ZXDefaultSpaceToChooseIcon 2
NS_ASSUME_NONNULL_BEGIN
typedef void(^ZXHighlightTapAction)(NSString *highlightStr, NSRange range);
typedef void(^ZXChooseIconTapAction)(BOOL selected,NSRange range);
@interface ZXAgreementLabel : YYLabel
///设置文字颜色
@property (strong, nonatomic, nullable)UIColor *zx_textColor;
///设置高亮部分的文字颜色
@property (strong, nonatomic, nullable)UIColor *zx_highlightColor;
///设置高亮部分的文字背景色
@property (strong, nonatomic, nullable)UIColor *zx_highlightBackgroundColor;
///设置选择图标未选中时的颜色，默认为灰色
@property (strong, nonatomic, nullable)UIColor *zx_chooseIconColor;
///设置选择图标选中时的颜色，默认与zx_highlightColor相同
@property (strong, nonatomic, nullable)UIColor *zx_chooseIconSelectedColor;
///设置自定义选择图标未选中时的图片，若不设置则使用默认的图片
@property (strong, nonatomic, nullable)UIImage *zx_customChooseIconImage;
///设置自定义选择图标选中时的图片，若不设置则使用默认的图片
@property (strong, nonatomic, nullable)UIImage *zx_customChooseIconSelectedImage;
///设置文字与选择图标的间距，默认为2
@property (assign, nonatomic)CGFloat zx_spaceToChooseIcon;
///是否允许点击高亮部分以外的区域都触发选中事件，默认为否(当点击选择按钮时才触发)
@property (assign, nonatomic)BOOL zx_allResponseToChooseIconTapAction;
///禁止渲染选择图标的颜色
@property (assign, nonatomic)BOOL zx_disableAutoRenderChooseIcon;
///点击高亮部分文字点击回调
@property (copy, nonatomic)ZXHighlightTapAction zx_highlightTapAction;
///点击选择图标回调
@property (copy, nonatomic)ZXChooseIconTapAction zx_chooseIconTapAction;
///当前选择图标的image对象
@property (strong, nonatomic, readonly)UIImage *zx_currentChooseImage;
///默认的选择图标image对象
@property (strong, nonatomic, readonly)UIImage *zx_defaultChooseImage;
///需要高亮的文字数组
@property (strong, nonatomic)NSArray *zx_highlightSubStrs;
///是否已选中，默认为NO，若需要默认选中，则在控制器加载时设置其为YES
@property (assign, nonatomic)BOOL zx_selected;


/// 设置AgreementLabel(简约版)
/// @param highlightSubStrs 需要高亮的文字数组
/// @param highlightColor 高亮的文字颜色和选择图标选中时的颜色
/// @param allResponseToChooseIconTapAction 是否允许点击高亮部分以外的区域都触发选中事件，默认为否(当点击选择按钮时才触发)
/// @param highlightTapAction 点击高亮部分文字回调
- (void)zx_setAgreementWithHighlightSubStrs:(NSArray *)highlightSubStrs highlightColor:(nullable UIColor *)highlightColor  allResponseToChooseIconTapAction:(BOOL)allResponseToChooseIconTapAction highlightTapAction:(nullable ZXHighlightTapAction)highlightTapAction;


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
- (void)zx_setAgreementWithTextColor:(nullable UIColor *)textColor highlightSubStrs:(NSArray *)highlightSubStrs highlightColor:(nullable UIColor *)highlightColor highlightBackgroundColor:(nullable UIColor *)highlightBackgroundColor chooseIconColor:(nullable UIColor *)chooseIconColor chooseIconSelectedColor:(nullable UIColor *)chooseIconSelectedColor customChooseIconImage:(nullable UIImage *)customChooseIconImage customChooseIconSelectedImage:(nullable UIImage *)customChooseIconSelectedImage spaceToChooseIcon:(float)spaceToChooseIcon allResponseToChooseIconTapAction:(BOOL)allResponseToChooseIconTapAction highlightTapAction:(nullable ZXHighlightTapAction)highlightTapAction chooseIconTapAction:(ZXChooseIconTapAction)chooseIconTapAction;

@end

NS_ASSUME_NONNULL_END
