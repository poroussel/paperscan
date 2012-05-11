/* 
 * Project: PaperScan
 *
 * Author: Philippe Roussel <p.o.roussel@free.fr>
 *
 * Created: 2012-05-10 23:40:08 +0200 by philou
 *  
 * Application Controller
 */

#import <AppKit/AppKit.h>
#import <Renaissance/Renaissance.h>
#import "AppController.h"

@implementation AppController

+ (void)initialize
{
  NSMutableDictionary *defaults = [NSMutableDictionary dictionary];

  /*
   * Register your app's defaults here by adding objects to the
   * dictionary, eg
   *
   * [defaults setObject:anObject forKey:keyForThatObject];
   *
   */
  
  [[NSUserDefaults standardUserDefaults] registerDefaults: defaults];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)init
{
  if ((self = [super init])) {
    sctrl = [ScannerController new];
    if (!sctrl)
      DESTROY(self);
  }
  return self;
}

- (void)dealloc
{
  [sctrl release];
  [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotif
{
  [NSBundle loadGSMarkupNamed: @"Main" owner: self];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(id)sender
{
  return NSTerminateNow;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)app
{
  return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotif
{
}

- (void)showPrefPanel:(id)sender
{
}

- (void)scanPage:(id)sender
{
}

@end
