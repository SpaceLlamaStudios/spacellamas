//
//  SLDefines.h
//  SpaceLlamas
//
//  Created by Elsie Ng on 2014-05-10.
//  Copyright (c) 2014 Space Llama Studios. All rights reserved.
//

#ifndef SpaceLlamas_SLDefines_h
#define SpaceLlamas_SLDefines_h

#define IS_IPHONE5() ([UIScreen mainScreen].bounds.size.height == 568)
#define IS_IPAD() ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_RETINA() ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
#define kPointFactor (IS_IPAD() ? 2.0 : 1.0)

#endif
