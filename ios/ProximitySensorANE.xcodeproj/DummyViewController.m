//
//  DummyViewController.m
//  ProximitySensorANE
//
//  Created by Richard Olsson on 2011-10-31.
//  Copyright 2011 Richard Olsson Web Development AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FlashRuntimeExtensions.h"
#import "DummyViewController.h"


@implementation DummyViewController

- (id)initWithContext: (FREContext) ctx
{
    self = [super init];
    if (self) {
        context = ctx;
    }
    
    return self;
}


- (void)startListening
{
    NSLog(@"enabling proximity sensor");
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    NSLog(@"Enabled!");
    
    NSLog(@"has display link?");
    if (displayLink == Nil) {
        NSLog(@"No, creating!");
        displayLink = [[UIScreen mainScreen] 
                       displayLinkWithTarget:self selector:@selector(update)];
        
        NSLog(@"Retaining link");
        [displayLink retain];
        
        NSLog(@"Setting interval");
        [displayLink setFrameInterval:4];
    }
    
    NSLog(@"Adding to run loop");
    [displayLink addToRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    NSLog(@"Added!");
}


- (void)stopListening
{
    NSLog(@"Disabling proximity sensor");
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    NSLog(@"Disabled! Now removing from loop.");
    [displayLink removeFromRunLoop: [NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    NSLog(@"Removed!");
}

- (void)update
{
    BOOL curState = [UIDevice currentDevice].proximityState;
    
    if (inProximity != curState) {
        if (curState) {
            NSLog(@"Nearby");
            FREDispatchStatusEventAsync(context, (const uint8_t*)"CHANGE", (const uint8_t*)"1");
        }
        else {
            NSLog(@"Far away");
            FREDispatchStatusEventAsync(context, (const uint8_t*)"CHANGE", (const uint8_t*)"0");
        }
    }
    
    inProximity = curState;
}
                        

- (void)dealloc
{
    [super dealloc];
}
@end
