lexer grammar ExprLexer;

QUOTE: '"';
DOT : '.';
COMMA : ',' ;
SEMI : ';' ;
COLON : ':' ;
LPAREN : '(' ;
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;
NEWLINE : '\n';
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

STRING : '"' ( ~["\\] | '\\"' )* '"';

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

PRINT : 'print';
FORMAT : 'format';
FOR : 'for';
IN : 'in';
RANGE : 'range';

ID: [a-zA-Z_][a-zA-Z_0-9]* ;
WS: [\t\r\f]+ -> skip ;
