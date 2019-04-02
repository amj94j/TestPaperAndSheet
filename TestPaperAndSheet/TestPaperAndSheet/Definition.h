//
//  Definition.h
//  TestPaper
//
//

#ifndef Definition_h
#define Definition_h
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define HEXCOLOR(hexColor)  [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define kHomeColor HEXCOLOR(0xebebeb)


//  圆角
#define ViewBorderRadius(view,radius)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];
//  圆角和边框
#define ViewBorderRadiusColor(view,radius,width,color)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];\
[view.layer setBorderWidth:(width)];\
[view.layer setBorderColor:[color CGColor]];

//定义UIImage对象
#define ImageNamed(A) [UIImage imageNamed:A]

#define NONullString(key)       [key length] > 0 ? key : @""

#define IPHONE_X (@available(iOS 11.0, *)?([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0):NO)
#define SafeAreaTopHeight (IPHONE_X ? 88 : 64)
#define SafeAreaBottomHeight (IPHONE_X ? [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom : 0)
//iPhone X or XS
#define iPhoneX     (DEVICE_WIDTH == 375.f && DEVICE_HEIGHT == 812.f)
//iPhone XR or XS Max
#define iPhoneXR    (DEVICE_WIDTH == 414.f && DEVICE_HEIGHT == 896.f)
#define iPhoneMaxScreen (DEVICE_WIDTH >= 375.f && DEVICE_HEIGHT >= 812.f)
//底部虚拟home键高度 一般用于最底部view到底部的距离
#define VirtualHomeHeight (iPhoneMaxScreen ? 34.f : 0.f)
//顶部适配的话 系统有参数可以直接获取到
#define STATUS_BAR_FRAME [[UIApplication sharedApplication] statusBarFrame]


#endif /* Definition_h */
