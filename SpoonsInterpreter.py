import antlr4

from SpoonsLexer import SpoonsLexer
from SpoonsListener import SpoonsListener
from SpoonsParser import SpoonsParser


class SpoonsInterpreter(SpoonsListener):
    def __init__(self):
        pass


if __name__ == "__main__":
    lexer = SpoonsLexer(antlr4.FileStream("example.spn"))
    stream = antlr4.CommonTokenStream(lexer)
    parser = SpoonsParser(stream)
    tree = parser.program()

    interpret = SpoonsInterpreter()
    walker = antlr4.ParseTreeWalker()
    walker.walk(interpret, tree)