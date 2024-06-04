parser grammar ExprParser;

options { tokenVocab=ExprLexer; }

code : (stat | condicional | func)* EOF;

stat : (expr | query | atrib) '\n'*;

expr :func_call 
    |ID
    | INT
    | NUMBER
    | expr OP_ARIT expr
    | expr OP_RELA expr
    | expr OP_ATRI expr
    | '(' expr ')'
    | expr '(''"' expr '"'')'
    ;

query : 'True' 
    | 'False'
    | '(' query ')'
    | query OP_BOOL query
    | 'not' query
    ;

condicional
    : ifStat
    | ifElseStat
    | ifElifElseStat
    ;

ifStat
    : 'if' ' ' query ':' '\n' code 
    ;

ifElseStat
    : 'if' ' ' query ':' '\n'  code 
      'else' ' '? ':' '\n'  code 
    ;

ifElifElseStat
    : 'if' ' ' query ':' '\n'  code 
      elifPart+
      'else' ' '? ':' '\n'  code 
    ;

elifPart
    : 'elif' ' ' query ':' '\n'  code 
    ;

atrib : ID ' ' '=' ' ' expr ;

func : 'def' ID '(' (ID (',' ID)*)? ')' ':' '\n' stat* 'return' expr '\n';

func_call : ID '(' (expr (',' expr)*)? ')' ;
