// 
// Copyright 2021 The Matrix.org Foundation C.I.C
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "MXVirtualRoomInfo.h"

NSString* const kRoomIsVirtualJSONKey = @"im.vector.is_virtual_room";
NSString* const kRoomNativeRoomIdJSONKey = @"native_room";

@interface MXVirtualRoomInfo ()

@property (nonatomic, readwrite, nullable) NSString *nativeRoomId;

@end

@implementation MXVirtualRoomInfo

+ (id)modelFromJSON:(NSDictionary *)jsonDictionary
{
    MXVirtualRoomInfo *info = [MXVirtualRoomInfo new];
    if (info)
    {
        MXJSONModelSetDictionary(info.nativeRoomId, jsonDictionary[kRoomNativeRoomIdJSONKey]);
    }
    
    return info;
}

- (NSDictionary *)JSONDictionary
{
    NSMutableDictionary *jsonDictionary = [NSMutableDictionary dictionary];
    
    if (self.nativeRoomId)
    {
        jsonDictionary[kRoomNativeRoomIdJSONKey] = self.nativeRoomId;
    }
    
    return jsonDictionary;
}

- (BOOL)isVirtual
{
    return self.nativeRoomId != nil;
}

@end
