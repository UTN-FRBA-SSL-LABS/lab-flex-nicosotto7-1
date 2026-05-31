%pointer
%option noyywrap

%%

 /* --- Reglas ya implementadas ------------------------ */

 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]* { printf("constante octal: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]          { }

 /* 1. Regla para constante decimal (ej: 123, 456) */
[1-9][0-9]*|0    { printf("constante decimal: %s\n", yytext); }

 /* 2. Regla para constante hexadecimal (ej: 0x1A, 0xFF) */
0[xX][0-9a-fA-F]+ { printf("constante hexadecimal: %s\n", yytext); }

 /* 3. Regla para identificador (empieza con letra o _, seguido de letras, _ o números) */
[a-zA-Z_][a-zA-Z0-9_]* { printf("identificador: %s\n", yytext); }

 /* 4. Regla comodín para caracteres no reconocidos (siempre va al final) */
.                { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
