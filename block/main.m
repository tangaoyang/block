//
//  main.m
//  block
//
//  Created by cinderella on 2020/4/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Block)(void);

@interface Person : NSObject

@property (nonatomic, assign) int age;

@end

@implementation Person



@end


/*
@class MyObject;



typedef int (^OneType)(int);

OneType func(int t) {
    return ^(int a) {
        return a + t;
    };
}



@interface MyObject : NSObject
*/
// 定义一个block然后使用
//@property (nonatomic, strong) int (^aBlock)(int a);
//@property (nonatomic, assign) int result;

// block作为参数
//- (int)doBlock: (Block)blk;
// block作为返回值
//- (Block)returnBlock;
//block作为出参的应用
//- (MyObject *(^)(int param))doContinueBlock;
/*
@end

@implementation MyObject
*/
//- (id)init {
//    self = [super init];

//    __block id tmp = self;
//    _aBlock = ^int(int a) {
//        return a;
//    };
    
//    return self;
//}

//- (int)doBlock:(Block)blk {
//    return blk(1, 2);
//}

//- (Block)returnBlock {
//    return ^(int a, int b) {
//        return a + b;
//    };
//}
/*
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
*/
//@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // block无参无返回值
        /*
        __block int a = 0;    // block类型对象并且在block里使用+打印
        static int b = 1;     // 全局变量并且在block里使用+打印
        static int c = 2;     // 全局变量并且在block里使用
        static int d = 3;     // 全局变量并且没在block里使用
        __block int e = 4;    // block类型对象并且没在block里使用
        
        void (^blk)(void) = ^{
            a++;
            b++;
            c++;
            NSLog(@"%d %d", a, b);
        };
        
        blk();
        */
        
        // block有参无返回值
        /*
        int a = 0;
        void (^blk)(int) = ^(int t) {
            NSLog(@"%d", t);
        };
        blk(2);
        blk(a);
        */
        
        // block无参有返回值
        /*
        int b = 0;
        int (^blk)(void) = ^{
            return b;
        };
        
        int a = blk();
        NSLog(@"%d", a);
        */
        
        // block有参有返回值
        /*
        int b = 0;
        int c = 2;
        int (^blk)(int) = ^(int a) {
            return b + a;
        };
        
        int t = blk(1);
        int h = blk(c);
        NSLog(@"%d %d", t, h);
        */
        
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
        
        
        
        
        // block使用
       
//        MyObject *o = [[MyObject alloc] init];
//        [o useBlock];
////        o.aBlock = ^int(int a) {
////            return a + 10;
////        };
//        NSLog(@"aBlock(3) -- %d", o.aBlock(3));
//
//        NSLog(@"doBlock -- %d", [o doBlock:^int(int a, int b) {
//            return a + b;
//        }]);
        
//        int (^blk)(int a, int b) = [o returnBlock];
//        NSLog(@"returnBlock -- %d", blk(1, 5));
        
        //block出参应用
//        o.result = 1;
//        o.doContinueBlock(1).doContinueBlock(2).doContinueBlock(3);
//        NSLog(@"result:%d",o.result);
        
        Block block;
        {
            Person *person = [[Person alloc] init];
            person.age = 10;
            block = ^{
                NSLog(@"%d", person.age);
            };
        }
        block();
        NSLog(@"1111111");
    }
    return 0;
}
