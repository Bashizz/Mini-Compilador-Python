lexer grammar ExprLexer;

QUOTE: '"';
COMMA : ',' ;
SEMI : ';' ;
COLON : ':' ;
LPAREN : '(' ;
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;
BREAKLINE : '\n';
RETURN: 'return';
DEF: 'def';
SPACE: ' ';

TRUE: 'True';
FALSE: 'False';
NOT : 'not' ;

OP_BOOL: 'and' | 'or' | '&' | '|' ;
EQUAL: '=';
OP_ARIT: '+' | '-' | '/' | '*' | '**' | '//' | '%' ;
OP_RELA: '==' | '!=' | '>' | '>=' | '<' | '<=' ;
OP_ATRI: EQUAL | '+=' | '-=' | '*=' | '/=' ;

INT: [0-9]+ ;
FLOAT: INT '.' INT;
COMPLEX: FLOAT [+\-] FLOAT 'j';

NUMBER: INT
  | FLOAT
  | COMPLEX
  ;

IF : 'if' ;
ELSE : 'else' ;
ELIF : 'elif' ;

ID: [a-zA-Z_][a-zA-Z_0-9]* ;
WS: [ \t\r\f]+ -> skip ;
