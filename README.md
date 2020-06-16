# nogcio
An @nogc alternative for std.stdio.  It uses C I/O functions, but gives functionality similar to writeln, etc.  Inspired by https://gist.github.com/krshock/9c24429c31663179d60dc52228ec80e8.

# Usage
setlocale(LC_CTYPE, "");                  //Makes sure the characters are printed correctly.

println("Hello world", 10, 3.14159);      //Prints "Hello world 10 3.14159" to stdout and appends a newline character.

wprintln("Goodbye world", 42, 2.71828);   //Prints "Goodbye world 42 2.71828" to stdout in dchar form and appends a newline character.
