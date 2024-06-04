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
    | '(' expr ')'
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
    : 'if' '(' query ')' '{' code '}'
    ;

ifElseStat
    : 'if' '(' query ')' '{' code '}' 'else' '{' code '}'
    ;

ifElifElseStat
    : 'if' '(' query ')' '{' code '}'
      elifPart+
      'else' '{' code '}'
    ;

elifPart
    : 'elif' '(' query ')' '{' code '}'
    ;

atrib : ID '=' expr ';';

func : 'def' ID '(' (ID (',' ID)*)? ')' ':' '\n' stat* 'return' expr '\n';

func_call : ID '(' (expr (',' expr)*)? ')' ';';
