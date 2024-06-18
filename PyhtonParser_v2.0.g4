parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

code : (stat|conditional|func|func_call)* EOF;

stat : (expr|atrib|query) '\n'*;

expr : ID
|INT
|FLOAT
|printStatement
|simplePrintStatement
|formatExpr
|expr SPACE? OP_ARIT SPACE? expr //Operações aritméticas
|expr SPACE? OP_RELA SPACE? expr //Operações aritméticas
|OP_ARIT OP_ARIT
|DOT OP_ARIT
|'('expr*')'
|func_call
;

atrib : ID SPACE? '=' SPACE? expr;

func : 'def' SPACE? ID '(' (ID (',' SPACE? ID)*)? ')' ':' NEWLINE SPACE* stat* SPACE* 'return'? SPACE? expr '\n';

func_call : ID '(' (expr (',' SPACE? expr)*)? ')';

query : 'True' 
    | 'False'
    | '(' SPACE? query SPACE? ')'
    | query SPACE? OP_BOOL SPACE? query
    | 'not' SPACE? query
    | '('SPACE? query SPACE?')'
    | expr
    ;

conditional: ifStat
|elifStat
|elseStat
;

ifStat : IF SPACE? '('? SPACE? (expr|query) SPACE? ')'? SPACE? ':' (NEWLINE)* SPACE* expr* (elifStat? elseStat?) '\n''return'? SPACE? expr*;
elifStat : ELIF SPACE? '('? SPACE? (expr|query) SPACE? ')'? SPACE? ':' (NEWLINE)* SPACE* expr*;
elseStat : ELSE SPACE? ':' (NEWLINE)* SPACE* (expr|query)*;

printStatement : PRINT SPACE? '(' SPACE? STRING (SPACE? formatExpr)? SPACE? ')';
simplePrintStatement : PRINT SPACE? '(' SPACE? STRING SPACE? ')';
formatExpr : DOT SPACE? FORMAT SPACE? '(' SPACE? expr SPACE? ')';
