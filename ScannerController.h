/* 
 * Project: PaperScan
 *
 * Author: Philippe Roussel <p.o.roussel@free.fr>
 *
 * Created: 2012-05-10 23:40:08 +0200 by philou
 * 
 */
 
#ifndef _SCANNERCONTROLLER_H
#define _SCANNERCONTROLLER_H

#include <sane/sane.h>

@interface ScannerController : NSObject
{
  const SANE_Device **devices_list;
}

- (NSArray *)availableScanner;
- (void)scanPage;

@end

#endif
