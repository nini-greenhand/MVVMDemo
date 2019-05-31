//
//  ViewController.m
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//
#import <SVProgressHUD/SVProgressHUD.h>
#import "ViewController.h"
#import "NQMoveCell.h"
#import "NQMovieViewModel.h"

static NSString *const reuserId = @"reuserId";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NQMovieViewModel *viewModel;

//@property (nonatomic, strong) NQDataSouce *dataSource;

@property (nonatomic,strong) UITableView *tableView;

//列表数据
@property (nonatomic,strong) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //viewModel的数据绑定
    
    [self bindViewModel];

    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}



/**
 数据绑定
 */
- (void)bindViewModel{
    
    @weakify(self);
    //将命令执行后的数据交给Controller
    [self.viewModel.command.executionSignals.switchToLatest subscribeNext:^(NSArray<MovieModel *> *array) {
        @strongify(self);
        
        [SVProgressHUD showSuccessWithStatus:@"加载成功"];
        self.listArray = array;
        [self.tableView reloadData];
        [SVProgressHUD dismissWithDelay:1.5];
        
    }];
    
    
    //执行command
    [self.viewModel.command execute:nil];
    [SVProgressHUD showWithStatus:@"加载中..."];
    
}



#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     return self.listArray.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NQMoveCell<MovieModelProtocol> * cell;
//    id<MovieModelProtocol> cell = nil;
    
    Class cellClass = [NQMoveCell class];
   
    if (cellClass) {
       
        cell =  [tableView dequeueReusableCellWithIdentifier:reuserId forIndexPath:indexPath];
        
        cell = [NQMoveCell<MovieModelProtocol> new];
        
        if ([cell respondsToSelector:@selector(renderWithModel:)]) {
            [cell renderWithModel:self.listArray[indexPath.row]];
        }
    }

    return (NQMoveCell *)cell;
   
}



#pragma mark lazy

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.rowHeight = 106;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[NQMoveCell class] forCellReuseIdentifier:reuserId];
        
    }
    return _tableView;
}



- (NQMovieViewModel*)viewModel {
    if (!_viewModel) {
        _viewModel = [[NQMovieViewModel alloc] init];
    }
    return _viewModel;
}


@end
