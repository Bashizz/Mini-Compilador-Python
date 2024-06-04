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
    | expr '(' expr ')'
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
    : 'if' query ':' '\n' INDENT code DEDENT
    ;

ifElseStat
    : 'if' query ':' '\n' INDENT code DEDENT
      'else' ':' '\n' INDENT code DEDENT
    ;

ifElifElseStat
    : 'if' query ':' '\n' INDENT code DEDENT
      elifPart+
      'else' ':' '\n' INDENT code DEDENT
    ;

elifPart
    : 'elif' query ':' '\n' INDENT code DEDENT
    ;

atrib : ID '=' expr ;

func : 'def' ID '(' (ID (',' ID)*)? ')' ':' '\n' stat* 'return' expr '\n';

func_call : ID '(' (expr (',' expr)*)? ')' ';';
