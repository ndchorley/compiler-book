%top{
    #include <cstdio>
    #include <iostream>
    #include <string>
    using namespace std;

    enum class Token {
        LEFT_PAREN,
        RIGHT_PAREN,
        UNIDENTIFIED
    };

    ostream& operator<<(ostream& out, Token token) {
        switch (token) {
            case Token::LEFT_PAREN : out << "LEFT_PAREN"; break;
            case Token::RIGHT_PAREN : out << "RIGHT_PAREN"; break;
            case Token::UNIDENTIFIED : out << "UNIDENTIFIED"; break;
        }

        return out;
    }
}

%%
(" "|\t|\n) // Skip whitespace
\(      cout << Token::LEFT_PAREN << " ";
\)      cout << Token::RIGHT_PAREN << " ";
.       cout << Token::UNIDENTIFIED << " ";

%%

int main(int argc, char **argv) {
  FILE *fd = stdin;
  if (argc > 1 && (fd = fopen(argv[1], "r")) == NULL)
    exit(EXIT_FAILURE);

  Lexer lexer(fd);
  lexer.lex();

  if (fd != stdin)
    fclose(fd);
  return 0;
}
