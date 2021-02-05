# strange `if-else` parser using Bison

This is a simple parser which can parse expressions in a strange way. The syntax for this language is very similar to `if-else` of C++. Inside curly braces or round braces, you can enter numbers or similar expressions.

## Tokens used
```
digit       [0-9]+
if          "if"
else        "else"
cleft       "{"
cright      "}"
rleft       "("
rright      ")"
```
## Grammar used
 - rL = round left = `(`
 - cL = curly left =  `{`
```
prog:
	prog atom
|	prog SEMICOLON
|
atom:
	IF rL atom rR cL atom cR ELSE cL atom cR
|	IF rL atom rR cL atom cR
|	DIGIT
```

## Sample inputs
```
if(1){33}
else{55};
```
```
if(1){
    if(1){33}
    else{55}
}
else{
    if(1){33}
    else{55}
};
```


## How to run?
 - `make`
 - Enter inputs as mentioned above.