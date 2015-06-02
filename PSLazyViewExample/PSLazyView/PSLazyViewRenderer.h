//
//  PSLazyViewRenderer.h
//  PSLazyViewExample
//
//  Created by Paweł Szymański on 11/6/13.
//  Copyright (c) 2013 Paweł Szymański. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PSLazyView;

@interface PSLazyViewRenderer : NSOperationQueue

+ (PSLazyViewRenderer*)sharedInstance;
- (void)renderView:(PSLazyView*)lazyView;

@end
