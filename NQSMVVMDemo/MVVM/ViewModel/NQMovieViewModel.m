//
//  NQMovieViewModel.m
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//

#import "NQMovieViewModel.h"

#import <Motis/Motis.h>
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>

//豆瓣电影API
#define url @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&start=0&count=100&client=&udid="


@interface NQMovieViewModel ()
//command处理实际事务  网络请求
@property (nonatomic,strong)RACCommand *command;
@end



@implementation NQMovieViewModel

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self inintViewModel];
    }
    
    return self;
}



/**
 初始化命令
 */
- (void)inintViewModel{
    @weakify(self);
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self);
            [self getDoubanList:^(NSArray<NQMovieViewModel *> *array) {
                [subscriber sendNext:array];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}



- (void)getDoubanList:(void(^)(NSArray<MovieModel*> *array))succeedBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *array = [NSMutableArray array];
        MoviewModelList *base = [[MoviewModelList alloc] init];
        [base mts_setValuesForKeysWithDictionary:responseObject];
        
        //遍历数组取出 存入数组并回调出去
        [base.subjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MovieModel *model = [[MovieModel alloc] init];
            [model mts_setValuesForKeysWithDictionary:obj];
            [array addObject:model];
        }];
        if (succeedBlock) {
            succeedBlock(array);
        }
    } failure:nil];
    
}



@end
