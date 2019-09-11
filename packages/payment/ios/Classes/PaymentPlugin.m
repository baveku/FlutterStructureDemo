#import "PaymentPlugin.h"
#import <payment/payment-Swift.h>

@implementation PaymentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPaymentPlugin registerWithRegistrar:registrar];
}
@end
