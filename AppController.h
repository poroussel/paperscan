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

#import <AppKit/AppKit.h>
#import <Renaissance/Renaissance.h>

@interface AppController : NSObject
{
}

- (void)showPrefPanel:(id)sender;
- (void)scanPage:(id)sender;

@end

#endif
