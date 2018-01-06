grammar Spoons;

options {
    language=Python3;
}

/*
    Parser Rules
 */

program: code EOF;
code: line+;
line: comment; //statement | comment;

comment: STRT_STMT COMMENT END_STMT;
//statement:;

/*
    Lexer Rules
 */

STRT_STMT: '(';
END_STMT: ')';

COMMENT: 'comment ' ~[\r\n]* -> skip;
SPACE: [ \t\r\n] -> skip;

STRING: ["] ~["\r\n]* ["];

LETTERS: ([a-z] | [A-Z])+;
NUMBERS: [0-9]+;
BOOLEAN: 'TRUE' | 'FALSE';
ID: [a-z]+;

WS: [ \t\r\n\f]+ -> skip;
