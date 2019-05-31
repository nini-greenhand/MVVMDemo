//
//  NQMoveCell.m
//  NQSMVVMDemo
//
//  Created by CQKJ on 2019/5/30.
//  Copyright © 2019 CQKJ. All rights reserved.
//

#import "NQMoveCell.h"
#import "MovieModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NQMoveCell ()

@property (nonatomic, copy)   selectCell selectBlock;

@end
@implementation NQMoveCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}

-(instancetype)init{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"NQMoveCell" owner:nil options:nil][0];
    }
    return self;
}

//cell标识
+ (NSString *)cellReuseIdentifier{
    return NSStringFromClass(self.class);
}


//模型渲染
- (void)renderWithModel:(id)model {

    if ([model isKindOfClass:[MovieModel  class]]) {
        MovieModel *movie = model;
        [self.coverImage sd_setImageWithURL:[NSURL URLWithString:movie.images[@"large"]?:nil]];
        NSLog(@"%@",_titleL);
        _titleL.text = [NSString stringWithFormat:@"%@",movie.rating[@"average"]?:@(0)];;
    }
}


- (IBAction)BtnClick:(UIButton *)sender {
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
