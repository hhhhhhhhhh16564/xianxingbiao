//
//  StaticList.h
//  线性表
//
//  Created by pro on 2018/3/26.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Error -1
#define OK   1
#define MaxSize 100
typedef int Status;

typedef int ElementType;
typedef struct {
    int cur;
    ElementType data;
}Compnent,StaticLinkList[MaxSize];

Status initStaticLinkList(StaticLinkList list);

int malloc_SLL(StaticLinkList list);

int ListLength(StaticLinkList list);

Status staticListInsert(StaticLinkList L, int i, ElementType e);
