run:
	@flex -l test.l
	@bison -dv test.y 
	@gcc -o test test.tab.c lex.yy.c -lfl
	@./test
	make clean
	
clean:
	@rm -rf test *.output *.c *.h