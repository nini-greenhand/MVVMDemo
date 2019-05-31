//
//  BaseModel.h
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^SuccessBlick)(id data);
typedef void(^FailBlick)(id data);

@interface BaseModel : NSObject
{
    @public
    NSString *name;
}

@property (nonatomic,copy) SuccessBlick successBlock;

@property (nonatomic,copy) FailBlick failBlick;

- (void)inintWithBlick:(SuccessBlick)successBlick fail:(FailBlick)failBlick;

@end

NS_ASSUME_NONNULL_END
