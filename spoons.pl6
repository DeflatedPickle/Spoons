my $program = q:to/END/;
(variable (name str) (string Hello, World!))
(variable (name int) (integer 42))

(print-line (string Printing a string!))
END

my %vars of Str;

# TODO: Implement the print-line function in Spoons
grammar Grammar {
    rule TOP {
            (<function-call> | <comment>)*
    }

    rule comment {
        ';' \N*
    }

    rule function-call {
        '(' <argument> (<argument> | <function-call>)* ')'
    }

    token argument {
        <[a..zA..Z0..9.,"'!?-]>+
    }
}

class Actions {
    method function-call($/) {
        given $<argument> {
            # Defines a variable
            when ("variable") {
                %vars{$0[0]<function-call>[0].Str} = $0[1]<function-call>[0].join;
            }

            # Prints a given value and a new line
            when ("print-line") {
                say $0[0]<function-call>[0].Str;
            }
        }
    }
}

Grammar.parse($program, actions => Actions.new);
# say "-----";
# say %vars;
