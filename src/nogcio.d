module nogcio;

import core.stdc.wchar_ : fwprintf;
import core.stdc.stdio; // : stdout, fprintf;

//
//  MAKE SURE TO SET YOUR LOCALE!  IT WILL SCREW UP OTHERWISE!
//  setlocale(LC_CTYPE, "");    generally works.
//

//Implements the basic printing functionality
void print(T...)(T input) @nogc
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            printInternal(stdout, " ");
        else
            first = false;
        printInternal(stdout, x);
    }
}

//Just like "print", but prints to the specified file
void fprint(T...)(FILE* file, T input)
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            printInternal(file, " ");
        else
            first = false;
        printInternal(file, x);
    }
}

//Just like "print", but appends a newline
void println(T...)(T input) @nogc
{
    pragma(inline, true) print(input);
    printInternal(stdout, "\n");
}

//Just like "println", but prints to the specified file
void fprintln(T...)(FILE* file, T input) @nogc
{
    pragma(inline, true) fprint(file, input);
    printInternal(file, "\n");
}

//Wrapper for printing to a file
pragma(inline, true)
private void printInternal(FILE* file, string s) @nogc
{
    fprintf(file, "%s", s.ptr);
}

//Char support
pragma(inline, true)
private void printInternal(FILE* file, char c) @nogc
{
    fprintf(file, "%c", c);
}

//Wchar support
pragma(inline, true)
private void printInternal(FILE* file, wchar c) @nogc
{
    printInternal(file, cast(char) c);
}

//Dchar support
pragma(inline, true)
private void printInternal(FILE* file, dchar c) @nogc
{
    printInternal(file, cast(char) c);
}

//Bool support
pragma(inline, true)
private void printInternal(FILE* file, bool b) @nogc
{
    if(b)
        fprintf(file, "true");
    else
        fprintf(file, "false");
}

//Int support
pragma(inline, true)
private void printInternal(FILE* file, int i) @nogc
{
    fprintf(file, "%d", i);
}

//Float/Double support
pragma(inline, true)
private void printInternal(FILE* file, double d) @nogc
{
    fprintf(file, "%f", d);
}

//Pointer support
pragma(inline, true)
private void printInternal(FILE* file, void* p) @nogc
{
    fprintf(file, "%p", p);
}





//It's "print" with dstring support
void wprint(T...)(T input) @nogc
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            wprintInternal(stdout, " ");
        else
            first = false;
        wprintInternal(stdout, x);
    }
}

//Just like "wprint", but prints to the specified file
void fwprint(T...)(FILE* file, T input)
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            wprintInternal(file, " ");
        else
            first = false;
        wprintInternal(file, x);
    }
}

//Just like "wprint", but appends a newline
void wprintln(T...)(T input) @nogc
{
    pragma(inline, true) wprint(input);
    wprintInternal(stdout, "\n");
}

//Just like "wprintln", but prints to the specified file
void fwprintln(T...)(FILE* file, T input) @nogc
{
    pragma(inline, true) fwprint(file, input);
    wprintInternal(file, "\n");
}

//Wrapper for printing to a file
pragma(inline, true)
private void wprintInternal(FILE* file, dstring s) @nogc
{
    fwprintf(file, "%ls", s.ptr);
}

//Dchar support
pragma(inline, true)
private void wprintInternal(FILE* file, dchar c) @nogc
{
    fwprintf(file, "%c", c);
}

//Char support
pragma(inline, true)
private void wprintInternal(FILE* file, char c) @nogc
{
    wprintInternal(file, cast(dchar) c);
}

//Wchar support
pragma(inline, true)
private void wprintInternal(FILE* file, wchar c) @nogc
{
    wprintInternal(file, cast(dchar) c);
}

//Bool support
pragma(inline, true)
private void wprintInternal(FILE* file, bool b) @nogc
{
    if(b)
        fwprintf(file, "true");
    else
        fwprintf(file, "false");
}

//Int support
pragma(inline, true)
private void wprintInternal(FILE* file, int i) @nogc
{
    fwprintf(file, "%d", i);
}

//Float/Double support
pragma(inline, true)
private void wprintInternal(FILE* file, double d) @nogc
{
    fwprintf(file, "%f", d);
}

//Pointer support
pragma(inline, true)
private void wprintInternal(FILE* file, void* p) @nogc
{
    fwprintf(file, "%p", p);
}
