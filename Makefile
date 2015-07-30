# get a list of the defined externs that we want to test
# ... stripping the file extension so make doesn't assume that it's already done
externs = $(patsubst %.js,%,$(wildcard *.js))

$(externs):
	@echo $@
	@./runtests.sh $@

test: node_modules $(externs)

clean:
	rm -rf node_modules/

node_modules:
	npm install

