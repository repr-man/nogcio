module nogcio;

import core.stdc.wchar_ : fwprintf;
import core.stdc.stdio : stdout, fprintf;

//
//  MAKE SURE TO SET YOUR LOCALE!  IT WILL SCREW UP OTHERWISE!
//  setlocale(LC_CTYPE, "");    generally works.
//
//  Is it idiomatic?  Probably not.
//  Does it work?  As far as I know.

//Implements the basic printing functionality
void print(T...)(T input) @nogc
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            printInternal(" ");
        else
            first = false;
        printInternal(x);
    }
}

//Just like "print", but appends a newline
void println(T...)(T input) @nogc
{
    pragma(inline, true) print(input);
    printInternal("\n");
}

//Wrapper for printing to stdout
pragma(inline, true)
private void printInternal(string s) @nogc
{
    fprintf(stdout, "%s", s.ptr);
}

//Char support
pragma(inline, true)
private void printInternal(char c) @nogc
{
    fprintf(stdout, "%c", c);
}

//Wchar support
pragma(inline, true)
private void printInternal(wchar c) @nogc
{
    printInternal(cast(char) c);
}

//Dchar support
pragma(inline, true)
private void printInternal(dchar c) @nogc
{
    printInternal(cast(char) c);
}

//Bool support
pragma(inline, true)
private void printInternal(bool b) @nogc
{
    if(b)
        fprintf(stdout, "true");
    else
        fprintf(stdout, "false");
}

//Int support
pragma(inline, true)
private void printInternal(int i) @nogc
{
    fprintf(stdout, "%d", i);
}

//Float/Double support
pragma(inline, true)
private void printInternal(double d) @nogc
{
    fprintf(stdout, "%f", d);
}

//Pointer support
pragma(inline, true)
private void printInternal(void* p) @nogc
{
    fprintf(stdout, "%p", p);
}





//It's "print" with dstring support
void wprint(T...)(T input) @nogc
{
    //The loop prints each argument, separating them with a space
    bool first = true;
    foreach (x; input)
    {
        if(!first)
            wprintInternal(" ");
        else
            first = false;
        wprintInternal(x);
    }
}

//Just like "wprint", but appends a newline
void wprintln(T...)(T input) @nogc
{
    pragma(inline, true) wprint(input);
    wprintInternal("\n");
}

//Wrapper for printing to stdout
pragma(inline, true)
private void wprintInternal(dstring s) @nogc
{
    fwprintf(stdout, "%ls", s.ptr);
}

//Dchar support
pragma(inline, true)
private void wprintInternal(dchar c) @nogc
{
    fwprintf(stdout, "%c", c);
}

//Char support
pragma(inline, true)
private void wprintInternal(char c) @nogc
{
    wprintInternal(cast(dchar) c);
}

//Wchar support
pragma(inline, true)
private void wprintInternal(wchar c) @nogc
{
    wprintInternal(cast(dchar) c);
}

//Bool support
pragma(inline, true)
private void wprintInternal(bool b) @nogc
{
    if(b)
        fwprintf(stdout, "true");
    else
        fwprintf(stdout, "false");
}

//Int support
pragma(inline, true)
private void wprintInternal(int i) @nogc
{
    fwprintf(stdout, "%d", i);
}

//Float/Double support
pragma(inline, true)
private void wprintInternal(double d) @nogc
{
    fwprintf(stdout, "%f", d);
}

//Pointer support
pragma(inline, true)
private void wprintInternal(void* p) @nogc
{
    fwprintf(stdout, "%p", p);
}
