my $program = q:to/END/;
(print
    (string
        Hello, World!
    )

    (integer
        42
    )
)
END

grammar Grammar {
      rule TOP {
          <statement>*
      }

      rule statement {
          '(' <argument> (<argument> | <statement>)* ')'
      }

      token argument {
          (\w+ <punct>* | \d+)
      }
}

say Grammar.parse($program);
