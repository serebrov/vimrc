find . -name '*.php' > ./cscope.files
cscope -b
rm ./cscope.files
