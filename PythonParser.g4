parser grammar ExprParser;
options { tokenVocab=ExprLexer; }

code : stmt* EOF;
stmt : expr "\n"
expr : ID
    |INT
    |expr DIV expr
    |expr MUL expr
    |expr SUB expr
    |expr ADD expr
    |"(" expr")"
    ;
    
stmt : (query|expr) "\n"
query : "True" | "False"
    |query TRUE query
    |query FALSE query
    !"not" query
    |"("query")";

stmt:(query|expr|atrib)"\n"
atrib : ID  '=' expr "\n"
func : ID '(' expr (',' expr)* ')' ;
code : (stmt|func)*EOF;
