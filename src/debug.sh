F="`echo $1 | tr '/ ' '__' `"
cat assm/lib.ss assm/debug.ss ` cat proj` $1 | tr '[]' 'LR' > ../target/scheme/$F.fware.ss
mzscheme -f ../taget/scheme/$F.fware.ss | tee ../target/hex/$F.hex
