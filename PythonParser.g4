parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

code : (stat | condicional | func | func_call)* EOF;
stat : (expr | query | atrib) '\n'*;
expr : ID
    | INT
    | NUMBER
    | expr OP_ARIT expr
    | expr OP_RELA expr
    | expr OP_ATRI expr
    | '(' expr')'
    ;
    
query : 'True' 
    | 'False'
    | '('query')'
    | query OP_BOOL query
    | 'not' query
    ;

condicional : 

atrib : ID  '=' expr ';';
func : 'def' ID '(' (ID ',' ID)*')' ':' '\n' stat* 'return' expr '\n';
