/* 
 * Project: PaperScan
 *
 * Author: Philippe Roussel <p.o.roussel@free.fr>
 *
 * Created: 2012-05-10 23:40:08 +0200 by philou
 */

#import <AppKit/AppKit.h>
#import <Renaissance/Renaissance.h>
#import "AppController.h"

int main(int argc, const char *argv[])
{
  CREATE_AUTORELEASE_POOL(pool);
  [[NSApplication sharedApplication] setDelegate:[AppController new]];
  RELEASE(pool);
  return GSMarkupApplicationMain(argc, argv);
}

