#import "RCTToolTipTextManager.h"
#import "RCTToolTipText.h"
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#else
#import "RCTBridge.h"
#endif

@implementation RCTToolTipTextManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[RCTToolTipText alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

@end
