%pointer
%option noyywrap

 /* --- Definiciones ERX --- */
digitoHexa      [0-9a-fA-F]
digito          [0-9]
letra           [a-zA-Z_]
identificador   {letra}({letra}|{digito})*

%%

 /* --- Reglas --- */
 /* Regla ya dada como ejemplo */
0[xX]{digitoHexa}+ { printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext); }

 /* Regla para constante decimal usando {digito} */
[1-9]{digito}* { printf("constante decimal de longitud %d: %s\n", yyleng, yytext); }

 /* Regla para identificador usando {identificador} */
{identificador}    { printf("identificador de longitud %d: %s\n", yyleng, yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]            { }

 /* Comodín */
.                  { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}