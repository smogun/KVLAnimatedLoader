//
//  KVLGlobalDefines.h
//  KVLHelpers
//
//  Created by Misha Koval on 9/27/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

#ifndef KVLGlobalDefines_h
#define KVLGlobalDefines_h

#define GetCodeLocation [NSString stringWithFormat:@"%s:%d",__PRETTY_FUNCTION__,__LINE__]

#define RandomColor [UIColor RGBA:(random() % 255) g:(random() % 255) b:(random() % 255) a: 0.7]
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define ClearColor [UIColor clearColor]

#endif /* KVLGlobalDefines_h */
