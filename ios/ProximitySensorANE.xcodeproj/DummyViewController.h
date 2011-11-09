//
//  DummyViewController.h
//  ProximitySensorANE
//
//  Created by Richard Olsson on 2011-10-31.
//  Copyright 2011 Richard Olsson Web Development AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions.h"

@interface DummyViewController : UIViewController {
    
    BOOL inProximity;
    FREContext context;
    CADisplayLink *displayLink;
}

- (id) initWithContext: (FREContext)ctx;
- (void) startListening;
- (void) stopListening;
- (void) update;

@end
