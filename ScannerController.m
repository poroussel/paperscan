/* 
 * Project: PaperScan
 *
 * Author: Philippe Roussel <p.o.roussel@free.fr>
 *
 * Created: 2012-05-10 23:40:08 +0200 by philou
 *  
 */

#import <Foundation/Foundation.h>
#import "ScannerController.h"

@implementation ScannerController

- (id)init
{
  SANE_Int version;
  SANE_Status status;

  if ((self = [super init])) {
    status = sane_init(&version, NULL);
    if (status != SANE_STATUS_GOOD) {
      NSLog(@"Unable to initialize sane");
      DESTROY(self);
      return nil;
    }
    NSLog(@"Sane version %d", version);
  }
  return self;
}

- (void)dealloc
{
  sane_exit();
  [super dealloc];
}

- (NSArray *)availableScanner
{
  SANE_Status status;
  
  status = sane_get_devices(&devices_list, SANE_TRUE);
  if (status != SANE_STATUS_GOOD) {
    NSLog(@"Error while getting list of devices");
  }
  return nil;
}

- (void)scanPage
{
}

@end
