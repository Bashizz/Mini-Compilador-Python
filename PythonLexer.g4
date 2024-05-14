lexer grammar ExprLexer;

EQ : '=' ;
COMMA : ',' ;
SEMI : ';' ;
LPAREN : '(' ;
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;

TRUE: 'True'
FALSE: 'False'
NOT : 'not' ;

OP_BOOL: 'and' | 'or' | '&' | '|' ;

OP_ARIT: '+' | '-' | '/' | '*' | '**' | '//' | '%' ;

INT : [0-9]+ ;
ID: [a-zA-Z_][a-zA-Z_0-9]* ;
WS: [ \t\n\r\f]+ -> skip ;
