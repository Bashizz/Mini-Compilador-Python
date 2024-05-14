parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

code : (stmt | func)* EOF;
stmt : (expr | query | atrib) '\n'*;
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
    | 'not' query
    ;

atrib : ID  '=' expr '\n';
func : ID '(' (ID',')*')' ':' (stmt 'return' expr '\n')';
