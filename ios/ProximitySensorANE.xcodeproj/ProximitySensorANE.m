//
//  ProximitySensorANE.m
//  ProximitySensorANE
//
//  Created by Richard Olsson on 2011-10-31.
//  Copyright 2011 Richard Olsson Web Development AB. All rights reserved.
//

#include <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

//#import "ProximitySensorANE.h"
#import "DummyViewController.h"
#import "FlashRuntimeExtensions.h"


DummyViewController *dummyController;


FREObject ext_init(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    dummyController = [[[DummyViewController alloc] retain] initWithContext:ctx];
    
    return NULL;
}

FREObject ext_startListening(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [dummyController startListening];
    
    //TODO: Return something
    return NULL;
}

FREObject ext_stopListening(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    [dummyController stopListening];
    
    //TODO: Return something
    return NULL;
}

void initializeContext(void* extData, const uint8_t* ctxType, FREContext ctx,
                       uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet)
{
    *numFunctionsToSet = 3;
    FRENamedFunction* funcs = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * 3);
    
    funcs[0].name = (const uint8_t*)"init";
    funcs[0].functionData = NULL;
    funcs[0].function = &ext_init;
    
    funcs[1].name = (const uint8_t*)"start";
    funcs[1].functionData = NULL;
    funcs[1].function = &ext_startListening;
    
    funcs[2].name = (const uint8_t*)"stop";
    funcs[2].functionData = NULL;
    funcs[2].function = &ext_stopListening;
    
    *functionsToSet = funcs;
}


void finalizeContext(FREContext ctx)
{
    if (dummyController) {
        [dummyController stopListening];
        [dummyController dealloc];
    }
}

void ANEInitializer(void **extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet) 
{
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &initializeContext;
    *ctxFinalizerToSet = &finalizeContext;
}

void ANEFinalizer(void* extData) 
{
    // TODO: Clean up
}
