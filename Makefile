# get a list of the defined externs that we want to test
# ... stripping the file extension so make doesn't assume that it's already done
externs = $(patsubst %.js,%,$(wildcard *.js))

$(externs):
	@echo $@

test: $(externs)

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

