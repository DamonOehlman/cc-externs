# get a list of the defined externs that we want to test
# ... stripping the file extension so make doesn't assume that it's already done
externs = $(subst .js,,$(wildcard *.js))

test: node_modules $(externs)

$(externs):
	@./runtests.sh $@

clean:
	rm -rf node_modules/

node_modules:
	npm install

