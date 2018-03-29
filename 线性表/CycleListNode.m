//
//  CycleListNode.m
//  线性表
//
//  Created by yanbo on 2018/3/28.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "CycleListNode.h"

//获得第i个元素的值
Status GetCycleElement(LinkList L, int i, ElementType *e){
    
    if (i < 1) {
        return errno;
    }
    
    Node *node = L;
    for (int j = 0; j < i; j++) {
        
        node = node->next;
        
        if (!node || node == L) {
            return errno;
        }
    }
    *e = node->data;
    return OK;
    
}

// 插入一个元素
Status CycleListInsert(LinkList L, int i , ElementType e){
    int length = cycleListGetLenth(L);

    if (i < 1 || i > length + 1) {
        return errno;
    }

    Node *node = L;

    for (int j = 1; j < i; j++) {
        node = node->next;
    }

    Node *inserNode = (Node *)malloc(sizeof(Node));
    inserNode->data = e;
    inserNode->next = node->next;



    node->next = inserNode;



    return OK;
    
}

// 获得循环链表的长度
int cycleListGetLenth(LinkList L){
    
    Node *node = L;
    
    if (L->next == L) {
        return 0;
    }
 
    
    int length = 0;
    
    while (node->next != L) {
        
        node = node->next;
        
        length++;
    }
    return length;
 
}

//删除元素
LinkList CyclelistDeleteElement(LinkList L, Node *deleteNode){
    int length = cycleListGetLenth(L);
    
    Node *tempNode = L;
 
    for (int i = 0 ; i < length; i++) {
        
        if (tempNode->next == deleteNode) {
            break;
        }
        tempNode = tempNode->next;
    }
  
    tempNode->next = deleteNode->next;
    
    free(deleteNode);
    
    return tempNode;
    
}

//创建单链表
LinkList CreateCycleListTail(LinkList  * p){

    Node *headNode = (Node *)malloc(sizeof(Node));
    headNode->next = headNode;
    headNode->data = 1111;
    *p = headNode;
    return headNode;
 
}

 

void LogCycleListNode(LinkList p){
    
    int length = cycleListGetLenth(p);
    
    Node *node = p;
    for (int i = 0; i < length; i++) {
        node = node->next;
        printf("--%d--", node->data);
        
    }

     printf("---  \n");
    
    
}

