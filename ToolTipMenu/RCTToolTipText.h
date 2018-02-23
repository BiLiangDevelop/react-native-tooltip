#import <UIKit/UIKit.h>
#if __has_include(<React/RCTView.h>)
#import <React/RCTView.h>
#else
#import "RCTView.h"
#endif

@class RCTEventDispatcher;

@interface RCTToolTipText : RCTView

- (void)tappedMenuItem:(NSString *)text;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
