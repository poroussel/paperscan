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

@implementation Scanner
- (id)initWithSANEDevice:(SANE_Device *)device
{
  if ((self = [super init])) {
    name = [[NSString alloc] initWithCString:device->name];
    vendor = [[NSString alloc] initWithCString:device->vendor];
    model = [[NSString alloc] initWithCString:device->model];
    type = [[NSString alloc] initWithCString:device->type];
  }
  return self;
}

- (NSString *)description
{
  return model;
}

- (void)dealloc
{
  RELEASE(name);
  RELEASE(vendor);
  RELEASE(model);
  RELEASE(type);
  [super dealloc];
}
@end

static NSLock *devarrayLock;
static NSMutableArray *devarray;

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
    devarrayLock = [NSLock new];
    devarray = [NSMutableArray new];
    [self availableScanner];
  }
  return self;
}

- (void)dealloc
{
  sane_exit();
  [devarray release];
  [devarrayLock release];
  [super dealloc];
}

- (void)thread:(id)argument
{
  SANE_Status status;
  const SANE_Device **device;
  Scanner *scan;
  
  status = sane_get_devices(&devices_list, SANE_TRUE);
  if (status != SANE_STATUS_GOOD) {
    NSLog(@"Error while getting list of devices");
  }
  device = devices_list;
  while (*device) {
    scan = [[Scanner alloc] initWithSANEDevice:(struct SANE_Device *)*device];
    NSLog(@"Found %@", [scan description]);
    [devarrayLock lock];
    [devarray addObject:scan];
    [devarrayLock unlock];
    [scan release];
    device++;
  }
}

- (void)buildDeviceList
{
  [NSThread detachNewThreadSelector:@selector(thread:) 
			   toTarget:self 
			 withObject:nil];
  /* FIXME : send a notification */
}

- (NSArray *)availableScanner
{
  NSArray *array;

  [devarrayLock lock];
  array = [NSArray arrayWithArray:devarray];
  [devarrayLock unlock];
  return array;
}

- (void)scanPage
{
}

@end
