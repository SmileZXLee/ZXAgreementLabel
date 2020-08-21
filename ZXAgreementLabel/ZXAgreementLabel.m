//
//  ZXAgreementLabel.m
//  ZXAgreementLabel
//
//  Created by 李兆祥 on 2020/8/20.
//  Copyright © 2020 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXAgreementLabel

#import "ZXAgreementLabel.h"

@interface ZXAgreementLabel()
@property (strong, nonatomic)NSMutableArray *zx_highlightRanges;
@property (strong, nonatomic)UIImage *currentSelectIconColor;
@property (strong, nonatomic)UIImage *currentSelectIconSelctedColor;
@property (copy, nonatomic)NSString *orgText;
@property (strong, nonatomic)UIColor *privateZXTextColor;
@property (strong, nonatomic)UIColor *privateZXChooseIconColor;
@property (strong, nonatomic)UIColor *privateZXChooseIconSelectedColor;
@property (strong, nonatomic)UIImage *privateZXCustomChooseIconImage;
@property (strong, nonatomic)UIImage *privateZXCustomChooseIconSelectedImage;
@end
@implementation ZXAgreementLabel

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.zx_spaceToChooseIcon = ZXDefaultSpaceToChooseIcon;
}

- (void)zx_setAgreementWithHighlightSubStrs:(NSArray *)highlightSubStrs highlightColor:(nullable UIColor *)highlightColor  allResponseToChooseIconTapAction:(BOOL)allResponseToChooseIconTapAction highlightTapAction:(nullable ZXHighlightTapAction)highlightTapAction{
    [self zx_setAgreementWithTextColor:self.zx_textColor highlightSubStrs:highlightSubStrs highlightColor:highlightColor highlightBackgroundColor:self.zx_highlightBackgroundColor chooseIconColor:self.zx_chooseIconColor chooseIconSelectedColor:self.zx_chooseIconSelectedColor customChooseIconImage:self.zx_customChooseIconImage customChooseIconSelectedImage:self.zx_customChooseIconSelectedImage spaceToChooseIcon:self.zx_spaceToChooseIcon allResponseToChooseIconTapAction:allResponseToChooseIconTapAction highlightTapAction:highlightTapAction chooseIconTapAction:self.zx_chooseIconTapAction];
}

- (void)zx_setAgreementWithTextColor:(nullable UIColor *)textColor highlightSubStrs:(NSArray *)highlightSubStrs highlightColor:(nullable UIColor *)highlightColor highlightBackgroundColor:(nullable UIColor *)highlightBackgroundColor chooseIconColor:(nullable UIColor *)chooseIconColor chooseIconSelectedColor:(nullable UIColor *)chooseIconSelectedColor customChooseIconImage:(nullable UIImage *)customChooseIconImage customChooseIconSelectedImage:(nullable UIImage *)customChooseIconSelectedImage spaceToChooseIcon:(float)spaceToChooseIcon allResponseToChooseIconTapAction:(BOOL)allResponseToChooseIconTapAction highlightTapAction:(nullable ZXHighlightTapAction)highlightTapAction chooseIconTapAction:(ZXChooseIconTapAction)chooseIconTapAction{
    self.zx_highlightSubStrs = [highlightSubStrs mutableCopy];
    NSMutableArray *highlightRanges = [self getHighlightRangesWithHighlightSubStrs:highlightSubStrs];
    [self zx_setAgreementWithTextColor:textColor highlightRanges:highlightRanges highlightColor:highlightColor highlightBackgroundColor:highlightBackgroundColor chooseIconColor:chooseIconColor chooseIconSelectedColor:chooseIconSelectedColor customChooseIconImage:customChooseIconImage customChooseIconSelectedImage:customChooseIconSelectedImage spaceToChooseIcon:spaceToChooseIcon allResponseToChooseIconTapAction:allResponseToChooseIconTapAction highlightTapAction:highlightTapAction chooseIconTapAction:chooseIconTapAction];
}

- (void)zx_setAgreementWithTextColor:(UIColor *)textColor highlightRanges:(NSMutableArray *)highlightRanges highlightColor:(nullable UIColor *)highlightColor highlightBackgroundColor:(nullable UIColor *)highlightBackgroundColor chooseIconColor:(nullable UIColor *)chooseIconColor chooseIconSelectedColor:(nullable UIColor *)chooseIconSelectedColor customChooseIconImage:(nullable UIImage *)customChooseIconImage customChooseIconSelectedImage:(nullable UIImage *)customChooseIconSelectedImage spaceToChooseIcon:(float)spaceToChooseIcon allResponseToChooseIconTapAction:(BOOL)allResponseToChooseIconTapAction highlightTapAction:(nullable ZXHighlightTapAction)highlightTapAction chooseIconTapAction:(ZXChooseIconTapAction)chooseIconTapAction{
    if(!highlightColor){
        highlightColor = ZXDefaultHighlightColorColor;
    }
    if(!highlightBackgroundColor){
        highlightBackgroundColor = [UIColor clearColor];
    }
    if(textColor != self.zx_textColor){
       self.zx_textColor = textColor;
    }
    self.zx_highlightRanges = highlightRanges;
    if(highlightColor != self.zx_highlightColor){
        self.zx_highlightColor = highlightColor;
    }
    if(highlightBackgroundColor != self.zx_highlightBackgroundColor){
        self.zx_highlightBackgroundColor = highlightBackgroundColor;
    }
    if(chooseIconColor != self.zx_chooseIconColor){
        self.zx_chooseIconColor = chooseIconColor;
    }
    if(chooseIconSelectedColor != self.zx_chooseIconSelectedColor && self.zx_chooseIconSelectedColor != self.zx_highlightColor){
        self.zx_chooseIconSelectedColor = chooseIconSelectedColor;
    }
    if(customChooseIconImage != self.zx_customChooseIconImage){
        self.zx_customChooseIconImage = customChooseIconImage;
    }
    if(customChooseIconSelectedImage != self.zx_customChooseIconSelectedImage){
        self.zx_customChooseIconSelectedImage = customChooseIconSelectedImage;
    }
    if(spaceToChooseIcon != self.zx_spaceToChooseIcon){
        self.zx_spaceToChooseIcon = spaceToChooseIcon;
    }
    if(allResponseToChooseIconTapAction != self.zx_allResponseToChooseIconTapAction){
        self.zx_allResponseToChooseIconTapAction = allResponseToChooseIconTapAction;
    }
    self.zx_highlightTapAction = highlightTapAction;
    self.zx_chooseIconTapAction = chooseIconTapAction;
    
    self.userInteractionEnabled = YES;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.orgText];
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, self.orgText.length)];
    UIImage *chooseImage = self.zx_currentChooseImage;
    chooseImage = [self resizeImage:chooseImage toSize:CGSizeMake(self.font.lineHeight, self.font.lineHeight)];
    NSMutableAttributedString *attachment = [NSMutableAttributedString yy_attachmentStringWithContent:chooseImage contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(self.font.lineHeight, self.font.lineHeight) alignToFont:self.font alignment:(YYTextVerticalAlignment)YYTextVerticalAlignmentCenter];
    [attachment appendAttributedString:[[NSAttributedString alloc]initWithString:@" "]];
    [attachment addAttribute:NSKernAttributeName value:@(spaceToChooseIcon - [self getSpaceWidth]) range:NSMakeRange(0, attachment.length)];
    [attributedString insertAttributedString:attachment atIndex:0];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attributedString.length)];
    for(NSValue *highlightRangeValue in highlightRanges){
        NSRange highlightRange = [highlightRangeValue rangeValue];
        [attributedString yy_setTextHighlightRange:highlightRange color:highlightColor backgroundColor:highlightBackgroundColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            highlightTapAction([text.string substringWithRange:range],range);
        }];
    }
    
    NSMutableArray *chooseIconResponseRanges;
    
    if(allResponseToChooseIconTapAction){
        chooseIconResponseRanges = [self excludeRanges:highlightRanges inStringLength:attributedString.length];
    }else{
        chooseIconResponseRanges = [@[[NSValue valueWithRange:NSMakeRange(0, 2)]] mutableCopy];
    }
    __weak typeof(self) weakSelf = self;
    for(NSValue *chooseIconRangeValue in chooseIconResponseRanges){
        [attributedString yy_setTextHighlightRange:[chooseIconRangeValue rangeValue] color:self.zx_textColor backgroundColor:self.backgroundColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            weakSelf.zx_selected = !weakSelf.zx_selected;
            [weakSelf updateAgreementLabel];
            if(chooseIconTapAction){
                chooseIconTapAction(weakSelf.zx_selected,range);
            }
        }];
    }
    
    self.attributedText = attributedString;
}

- (void)updateAgreementLabel{
    [self zx_setAgreementWithTextColor:self.zx_textColor highlightRanges:self.zx_highlightRanges highlightColor:self.zx_highlightColor highlightBackgroundColor:self.zx_highlightBackgroundColor chooseIconColor:self.zx_chooseIconColor chooseIconSelectedColor:self.zx_chooseIconSelectedColor customChooseIconImage:self.zx_customChooseIconImage customChooseIconSelectedImage:self.zx_customChooseIconSelectedImage spaceToChooseIcon:self.zx_spaceToChooseIcon allResponseToChooseIconTapAction:self.zx_allResponseToChooseIconTapAction highlightTapAction:self.zx_highlightTapAction chooseIconTapAction:self.zx_chooseIconTapAction];
}

#pragma mark - Getter&Seter
- (void)setText:(NSString *)text{
    [super setText:text];
    self.orgText = text;
    [self updateAgreementLabel];
}

- (void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    [self updateAgreementLabel];
}

- (void)setZx_textColor:(UIColor *)zx_textColor{
    self.privateZXTextColor = zx_textColor;
    [self updateAgreementLabel];
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    [self updateAgreementLabel];
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    
}

- (void)setZx_highlightColor:(UIColor *)zx_highlightColor{
    _zx_highlightColor = zx_highlightColor;
    [self updateAgreementLabel];
}


- (void)setZx_highlightBackgroundColor:(UIColor *)zx_highlightBackgroundColor{
    _zx_highlightBackgroundColor = zx_highlightBackgroundColor;
    [self updateAgreementLabel];
}

- (void)setZx_chooseIconSelectedColor:(UIColor *)zx_chooseIconSelectedColor{
    self.privateZXChooseIconSelectedColor = zx_chooseIconSelectedColor;
    [self updateAgreementLabel];
}

- (void)setZx_chooseIconColor:(UIColor *)zx_chooseIconColor{
    self.privateZXChooseIconColor = zx_chooseIconColor;
    [self updateAgreementLabel];
}

- (void)setZx_customChooseIconImage:(UIImage *)zx_customChooseIconImage{
    self.privateZXCustomChooseIconImage = zx_customChooseIconImage;
    [self updateAgreementLabel];
}

- (void)setZx_customChooseIconSelectedImage:(UIImage *)zx_customChooseIconSelectedImage{
    self.privateZXCustomChooseIconSelectedImage = zx_customChooseIconSelectedImage;
    [self updateAgreementLabel];
}

- (void)setZx_spaceToChooseIcon:(CGFloat)zx_spaceToChooseIcon{
    _zx_spaceToChooseIcon = zx_spaceToChooseIcon;
    [self updateAgreementLabel];
}

- (void)setZx_allResponseToChooseIconTapAction:(BOOL)zx_allResponseToChooseIconTapAction{
    _zx_allResponseToChooseIconTapAction = zx_allResponseToChooseIconTapAction;
    [self updateAgreementLabel];
}

- (void)setZx_disableAutoRenderChooseIcon:(BOOL)zx_disableAutoRenderChooseIcon{
    _zx_disableAutoRenderChooseIcon = zx_disableAutoRenderChooseIcon;
    [self updateAgreementLabel];
}

- (void)setZx_highlightSubStrs:(NSArray *)zx_highlightSubStrs{
    _zx_highlightSubStrs = zx_highlightSubStrs;
    self.zx_highlightRanges = [self getHighlightRangesWithHighlightSubStrs:zx_highlightSubStrs];
    [self updateAgreementLabel];
}

- (void)setZx_selected:(BOOL)zx_selected{
    _zx_selected = zx_selected;
    [self updateAgreementLabel];
}

- (UIColor *)zx_textColor{
    UIColor *textColor = self.privateZXTextColor;
    if(!textColor){
        return self.textColor;
    }
    return textColor;
}

- (UIColor *)zx_chooseIconColor{
    if(!self.privateZXChooseIconColor){
        return ZXDefaultChooseIconColor;
    }
    return self.privateZXChooseIconColor;
}

- (UIColor *)zx_chooseIconSelectedColor{
    if(!self.privateZXChooseIconSelectedColor){
        return self.zx_highlightColor;
    }
    return self.privateZXChooseIconSelectedColor;
}

- (UIImage *)zx_customChooseIconImage{
    if(!self.privateZXCustomChooseIconImage){
        return self.zx_defaultChooseImage;
    }
    return self.privateZXCustomChooseIconImage;
}

- (UIImage *)zx_customChooseIconSelectedImage{
    if(!self.privateZXCustomChooseIconSelectedImage){
        return self.zx_defaultChooseImage;
    }
    return self.privateZXCustomChooseIconSelectedImage;
}

- (NSString *)orgText{
    if(!_orgText){
        _orgText = self.text;
    }
    return _orgText;
}

#pragma mark - Private
#pragma mark 获取空格的宽度
- (CGFloat)getSpaceWidth{
    CGRect rect = [@" " boundingRectWithSize:CGSizeMake(MAXFLOAT, 20)
       options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.font.pointSize]}
       context:nil];
    return rect.size.width;
}

#pragma mark 获取默认的选择图标
- (UIImage *)zx_defaultChooseImage{
    static UIImage *image = nil;
    if (!image) {
        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[ZXAgreementLabel class]] pathForResource:NSStringFromClass([self class]) ofType:@"bundle"]];
        image = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"choose_icon" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}

#pragma mark 获取当前状态下的选择图标
- (UIImage *)zx_currentChooseImage{
    UIImage *currentChooseImage = nil;
    if(self.zx_selected){
        currentChooseImage = self.zx_disableAutoRenderChooseIcon ? self.zx_customChooseIconSelectedImage : [self renderImage:self.zx_customChooseIconSelectedImage toColor:self.zx_chooseIconSelectedColor];
    }else{
        currentChooseImage = self.zx_disableAutoRenderChooseIcon ? self.zx_customChooseIconImage : [self renderImage:self.zx_customChooseIconImage toColor:self.zx_chooseIconColor];
    }
    return currentChooseImage;
}

#pragma mark 修改图片的size
- (UIImage*)resizeImage:(UIImage *)image toSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    scaledImage = [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return scaledImage;
}

#pragma mark 将图片渲染成指定颜色
- (UIImage *)renderImage:(UIImage *)image toColor:(UIColor *)color{
    image = [self resizeImage:image toSize:CGSizeMake(20, 20)];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *renderedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return renderedImage;
}

#pragma mark 排除目标ranges后的ranges
- (NSMutableArray *)excludeRanges:(NSArray *)ranges inStringLength:(long)inStringLength{
    NSMutableArray *resultRanges = [NSMutableArray array];
    for(int i = 0; i < ranges.count;i++){
        NSRange range = [ranges[i] rangeValue];
        if(range.location > 0 && i == 0){
            NSRange rRange = NSMakeRange(0, range.location);
            [resultRanges addObject:[NSValue valueWithRange:rRange]];
            if(ranges.count == 1){
                long rangeEnd = range.location + range.length;
                if(rangeEnd != inStringLength){
                    NSRange rRange = NSMakeRange(rangeEnd, inStringLength - rangeEnd);
                    [resultRanges addObject:[NSValue valueWithRange:rRange]];
                }
                
            }
        }
        if(!(i == 0 && ranges.count == 1)){
            NSRange nextRange;
            if(i + 1 < ranges.count){
                nextRange = [ranges[i + 1] rangeValue];
            }else{
                nextRange = NSMakeRange(inStringLength, 0);
            }
            long rangeEnd = range.location + range.length;
            NSRange rRange = NSMakeRange(rangeEnd, nextRange.location - rangeEnd);
            [resultRanges addObject:[NSValue valueWithRange:rRange]];
        }
    }
    return resultRanges;
}

#pragma mark 获取subStr在字符串中的ranges
- (NSMutableArray *)rangesOfSubString:(NSString*)subStr inString:(NSString*)inString {
    NSMutableArray *resultRanges = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, [inString length]);
    NSRange range;
    while ((range = [inString rangeOfString:subStr options:0 range:searchRange]).location != NSNotFound) {
        [resultRanges addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range), [inString length] - NSMaxRange(range));
    }
    return resultRanges;
}

#pragma mark 根据正则获取ranges
- (NSMutableArray *)rangesOfRegex:(NSString*)regexPattern inString:(NSString*)inString{
    NSMutableArray *resultRanges = [NSMutableArray array];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexPattern options:0 error:nil];
    NSArray *matches = [regex matchesInString:inString options:0 range:NSMakeRange(0,inString.length)];
    for(NSTextCheckingResult *result in [matches objectEnumerator]) {
        NSRange range = [result range];
        [resultRanges addObject: [NSValue valueWithRange:range]];
    }
    return resultRanges;
}

#pragma mark 删除数组中重复元素
- (NSMutableArray *)removeSameObjectInArray:(NSMutableArray *)inArr{
    return [NSMutableArray arrayWithArray:[[NSSet setWithArray:inArr] allObjects]];
}

#pragma mark 根据高亮的文字数组获取其所在的ranges
- (NSMutableArray *)getHighlightRangesWithHighlightSubStrs:(NSArray *)highlightSubStrs{
    highlightSubStrs = [self removeSameObjectInArray:[NSMutableArray arrayWithArray:highlightSubStrs]];
    NSString *inString = [@"  " stringByAppendingString:self.orgText];
    NSMutableArray *highlightRanges = [NSMutableArray array];
    for(NSString *subStr in highlightSubStrs){
        NSMutableArray *subHighlightRanges = [self rangesOfSubString:subStr inString:inString];
        [highlightRanges addObjectsFromArray:subHighlightRanges];
    }
    return highlightRanges;
}

@end
