//
//  NQMovieViewModel.h
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//

#import "BaseModel.h"
#import "MovieModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface NQMovieViewModel : BaseModel

//command处理实际事务  网络请求 
@property (nonatomic,strong,readonly)RACCommand *command;

@end

NS_ASSUME_NONNULL_END
