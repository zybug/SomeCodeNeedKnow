
#import "UIWebView+JavaScriptAlert.h"

@interface UIWebView () <UIAlertViewDelegate>

@end

@implementation UIWebView (JavaScriptAlert)

static BOOL diagStat = NO;

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame {
    UIAlertView * alert  = [[UIAlertView alloc] initWithTitle:nil message:@"test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (BOOL)webView:(UIWebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame {
    UIAlertView * alert  = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    while (alert.hidden == NO && alert.superview != nil ) {
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01f]];
    }
    return diagStat;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        diagStat = NO;
    }
    else if (buttonIndex == 1)
    {
        diagStat = YES;
    }
}

@end
