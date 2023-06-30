F="`echo $1 | tr '/ ' '__' `"
cat assm/lib.ss assm/asm.ss ` cat proj` $1 | tr '[]' 'LR' > ../target/scheme/~$F.fware.ss
mzscheme -f ../target/scheme/~$F.fware.ss | tee ../target/hex/$F.hex
