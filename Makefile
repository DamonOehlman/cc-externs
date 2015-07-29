deps: tools/compiler.jar node_modules

clean:
	rm -rf node_modules/
	rm -rf tools/

tools/compiler.jar:
	mkdir -p tools
	wget http://dl.google.com/closure-compiler/compiler-latest.zip
	unzip -x compiler-latest.zip -d tools/
	rm compiler-latest.zip

node_modules:
	npm install

