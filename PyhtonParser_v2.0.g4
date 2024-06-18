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
|expr SPACE? OP_ARIT SPACE? expr // Operações aritméticas
|expr SPACE? OP_RELA SPACE? expr // Operações relacionais
|'('expr')' // Expressão agrupada
|func_call // Chamada de função
;

atrib : ID SPACE? '=' SPACE? expr;

// Definição de função com parâmetros opcionais
func : 'def' SPACE? ID '(' (ID (',' SPACE? ID)*)? ')' ':' NEWLINE SPACE* stat* SPACE* 'return' SPACE? expr '\n';

// Chamada de função com argumentos opcionais
func_call : ID '(' (expr (',' SPACE? expr)*)? ')';

query : 'True' 
    | 'False'
    | '(' SPACE? query SPACE? ')'
    | query SPACE? OP_BOOL SPACE? query
    | 'not' query
    ;

conditional: ifStat
|elifStat
|elseStat
;

// Uma declaração if com uma condição opcional e declarações elif ou else opcionais
ifStat : IF SPACE? '('? SPACE? expr SPACE? ')'? SPACE? ':' (NEWLINE)* SPACE* expr* (elifStat? elseStat?);
// Uma declaração elif com uma condição opcional
elifStat : ELIF SPACE? '('? SPACE? expr SPACE? ')'? SPACE? ':' (NEWLINE)* SPACE* expr*;
// Uma declaração else
elseStat : ELSE SPACE? ':' (NEWLINE)* SPACE* expr*;

// Uma declaração de "print" que inclui uma string e uma expressão formatada opcional
printStatement : PRINT SPACE? '(' SPACE? STRING (SPACE? formatExpr)? SPACE? ')';
//Uma declaração de "print" simples que inclui apenas uma string
simplePrintStatement : PRINT SPACE? '(' SPACE? STRING SPACE? ')';
// Uma expressão formatada que aplica um formato a uma expressão
formatExpr : DOT SPACE? FORMAT SPACE? '(' SPACE? expr SPACE? ')';
