parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

code : stmt* EOF;
stmt : (expr | query) '\n'*;
expr : ID
    | INT
    | NUMBER
    | expr OP_ARIT expr
    | '(' expr')'
    ;
    
query : 'True' 
    | 'False'
    | '('query')'
    | query OP_BOOL query
    ! 'not' query
    ;

stmt:(query|expr|atrib)"\n"
atrib : ID  '=' expr "\n"
func : ID '(' expr (',' expr)* ')' ;
code : (stmt|func)*EOF;
