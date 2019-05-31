//
//  ModelBase.h
//  MVVM_Demo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved

#import <Foundation/Foundation.h>

@interface ModelBase : NSObject


//返回数量
@property (nonatomic,assign) NSInteger count;
//分页量
@property (nonatomic,assign) NSInteger start;
//数据库总数量
@property (nonatomic,assign) NSInteger total;
//返回数据相关信息
@property (nonatomic,copy)   NSString *title;
@end
