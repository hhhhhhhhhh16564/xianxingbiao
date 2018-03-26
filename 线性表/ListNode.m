//
//  ListNode.m
//  线性表
//
//  Created by pro on 2018/3/25.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "ListNode.h"

//获得一个元素
Status GetElement(LinkList L, int i, ElementType *e){
  
    //指向第一个元素的值
    LinkList p = L->next;
    int j = 1;

    while (p && j < i) {
        p = p->next;
        j++;
    }
    
    if (!p || j > i) {
        return errno;
    }
    
    *e = p->data;
    return OK;
}

Status ListInsert(LinkList L, int i , ElementType e){

    LinkList p = L;
    
    for (int j = 1; j < i; j++) {
        p = p->next;
    }
    
    if (!p || i < 1) {
        return errno;
    }

    Node *node = (Node *)malloc(sizeof(Node));
    node->data = e;
    
    node->next = p->next;
    p->next = node;

    return OK;
};


//删除元素
Status listDeleteElement(LinkList L, int i, ElementType *e){
    LinkList p = L;
    for (int j = 1; j < i; j++) {
        p = p->next;
    }
    if (!p || !p->next || i < 1) {
        return errno;
    }
    Node *node = p->next;
    p->next = node->next;
    *e = node->data;
    free(node);
    return OK;
}

LinkList CreateListTail(LinkList p, int n){
    
    LinkList tempNode, L;
    
    
    p = (Node *)malloc(sizeof(Node));
    p->data = 9999;
    p->next = NULL;
    
    L = p;
    
    for (int i = 1; i <= n; i++) {
        tempNode = (Node *)malloc(sizeof(Node));
        tempNode->data = i;
        L->next = tempNode;
        
        L = tempNode;
    }
    
    L->next = NULL;
    
    return p;
}

void LogListNode(LinkList p){
    
    LinkList L = NULL;
    L = p->next;
    
    while (L) {
        printf("%d---",L->data);
        
        L = L->next;
        
    }
   
}

Status clearList(LinkList * L){
    
    LinkList p = (*L)->next;
    
    LinkList q = NULL;
    
    while (p) {
     q = p->next;
        free(p);
     p = q;
        
    }
 
    (*L)->next = NULL;
    
    return OK;
    
}






