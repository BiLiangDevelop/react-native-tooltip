#import "ToolTipMenu.h"
#import "RCTToolTipText.h"
#if __has_include(<React/RCTUIManager.h>)
#import <React/RCTUIManager.h>
#import <React/RCTBridge.h>
#else
#import "RCTUIManager.h"
#import "RCTBridge.h"
#endif

@implementation ToolTipMenu

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(show:(nonnull NSNumber *)reactTag
                  items: (NSArray *)items)
{
    UIView *view = [self.bridge.uiManager viewForReactTag:reactTag];
    NSArray *buttons = items;
    NSMutableArray *menuItems = [NSMutableArray array];
    for (NSString *buttonText in buttons) {
        NSString *sel = [NSString stringWithFormat:@"magic_%@", buttonText];
        [menuItems addObject:[[UIMenuItem alloc]
                              initWithTitle:buttonText
                              action:NSSelectorFromString(sel)]];
    }
    [view becomeFirstResponder];
    UIMenuController *menuCont = [UIMenuController sharedMenuController];
    [menuCont setTargetRect:view.frame inView:view.superview];
    menuCont.arrowDirection = UIMenuControllerArrowDown;
    menuCont.menuItems = menuItems;
    [menuCont setMenuVisible:YES animated:YES];
}

@end
