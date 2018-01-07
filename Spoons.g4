grammar Spoons;

options {
    language=Python3;
}

/*
    Parser Rules
 */

program: code EOF;
code: line+;
line: statement | definition | COMMENT;

// Statements

statement: print_stmt |
           plus_stmt | minus_stmt | times_stmt | divide_stmt;

print_stmt: STRT_STMT 'print' definition END_STMT;

if_stmt: STRT_STMT 'if' (boolean) END_STMT;

plus_stmt: STRT_STMT 'add' int_list END_STMT;
minus_stmt: STRT_STMT 'sub' int_list END_STMT;
times_stmt: STRT_STMT 'mul' int_list END_STMT;
divide_stmt: STRT_STMT 'div' int_list END_STMT;

// Definitions

definition: string | integer | boolean | mix_list;
string: STRT_STMT 'str' STRING END_STMT;
integer: STRT_STMT 'int' NUMBER END_STMT;
boolean: STRT_STMT 'bool' BOOLEAN END_STMT;

str_list: STRT_STMT 'list' string+ END_STMT;
int_list: STRT_STMT 'list' integer+ END_STMT;
bool_list: STRT_STMT 'list' boolean+ END_STMT;
list_list: STRT_STMT 'list' mix_list+ END_STMT;
mix_list: STRT_STMT 'list' (string | integer | boolean | mix_list)+ END_STMT;

/*
    Lexer Rules
 */

STRT_STMT: '(';
END_STMT: ')';

COMMENT: '#' ~[\r\n]* -> skip;
SPACE: [ \t\r\n] -> skip;

STRING: ["] ~["\r\n]* ["];

COMMA: ',';

LETTER: ([a-z] | [A-Z])+;
NUMBER: [0-9]+;
BOOLEAN: 'true' | 'false';

ID: [a-z]+;

WS: [ \t\r\n\f]+ -> skip;
