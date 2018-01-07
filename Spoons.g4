grammar Spoons;

options {
    language=Python3;
}

/*
    Parser Rules
 */

program: code EOF;
code: line+;
line: statement | COMMENT;

statement: print_stmt;
print_stmt: STRT_STMT 'print' (string | integer | boolean) END_STMT;

string: STRT_STMT 'str' STRING END_STMT;
integer: STRT_STMT 'int' NUMBER END_STMT;
boolean: STRT_STMT 'bool' BOOLEAN END_STMT;

/*
    Lexer Rules
 */

STRT_STMT: '(';
END_STMT: ')';

COMMENT: '#' ~[\r\n]* -> skip;
SPACE: [ \t\r\n] -> skip;

STRING: ["] ~["\r\n]* ["];

LETTER: ([a-z] | [A-Z])+;
NUMBER: [0-9]+;
BOOLEAN: 'true' | 'false';
ID: [a-z]+;

WS: [ \t\r\n\f]+ -> skip;
