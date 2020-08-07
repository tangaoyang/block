//
//  main.m
//  block
//
//  Created by cinderella on 2020/4/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyObject;

typedef int (^Block)(int, int);

@interface MyObject : NSObject

// 定义一个block然后使用
@property (nonatomic, strong) int (^aBlock)(int a);
@property (nonatomic, assign) int result;

// block作为参数
- (int)doBlock: (Block)blk;
// block作为返回值
- (Block)returnBlock;
//block作为出参的应用
- (MyObject *(^)(int param))doContinueBlock;

@end

@implementation MyObject

- (id)init {
    self = [super init];
    
//    __block id tmp = self;
    _aBlock = ^int(int a) {
        return a;
    };
    
    return self;
}

- (int)doBlock:(Block)blk {
    return blk(1, 2);
}

- (Block)returnBlock {
    return ^(int a, int b) {
        return a + b;
    };
}

- (void)useBlock {
    int num = _aBlock(1);
    NSLog(@"useBlock -- %d", num);
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (MyObject *(^)(int param))doContinueBlock {
    return ^MyObject *(int p){
        self->_result *= p;
        return self;
    };
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //block类型
        /*
        int a = 0;
        
        void (^blk_on_stack)(void) = ^{
            NSLog(@"Block %d", a);
        };
        
        void (^blk_on_heap)(void) = [blk_on_stack copy];
        
        NSLog(@"[blk_on_stack class] == %@", [blk_on_stack class]);
        NSLog(@"[blk_on_heap class] == %@", [blk_on_heap class]);
         */
        //block作为函数返回
        /*
        Block blk = useBlk();
        
        blk();
        NSLog(@"%@", [blk class]);
         */
        
        //将__block赋值给 __strong指针
//        int a = 0;
//        void (^blk)(void) = ^{
//            NSLog(@"Block %d", a);
//        };
//        blk();
//        NSLog(@"%@", [blk class]);
        
        MyObject *o = [[MyObject alloc] init];
        [o useBlock];
//        o.aBlock = ^int(int a) {
//            return a + 10;
//        };
        NSLog(@"aBlock(3) -- %d", o.aBlock(3));
        
        NSLog(@"doBlock -- %d", [o doBlock:^int(int a, int b) {
            return a + b;
        }]);
        
        int (^blk)(int a, int b) = [o returnBlock];
        NSLog(@"returnBlock -- %d", blk(1, 5));
        
        //block出参应用
        o.result = 1;
        o.doContinueBlock(1).doContinueBlock(2).doContinueBlock(3);
        NSLog(@"result:%d",o.result);
        
        
    }
    return 0;
}
