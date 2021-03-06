/* 
 * Project: PaperScan
 *
 * Author: Philippe Roussel <p.o.roussel@free.fr>
 *
 * Created: 2012-05-10 23:40:08 +0200 by philou
 * 
 * Application Controller
 */
 
#ifndef _PCAPPPROJ_APPCONTROLLER_H
#define _PCAPPPROJ_APPCONTROLLER_H

#import "ScannerController.h"

@interface AppController : NSObject
{
  IBOutlet NSPopUpButton *pubScanner;
  IBOutlet NSImage *image;
  IBOutlet NSButton *btScan;

  ScannerController *sctrl;
}

- (void)showPrefPanel:(id)sender;
- (void)scanPage:(id)sender;
- (void)setScanner:(id)sender;
- (void)setResolution:(id)sender;

@end

#endif
