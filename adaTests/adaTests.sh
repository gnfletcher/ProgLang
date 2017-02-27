#! /bin/csh -f

echo "Should be A: "
./work < ./adaTests/test1A.txt

echo "Should be N: "
./work < ./adaTests/test2N.txt

echo "Should be A: "
./work < ./adaTests/test3A.txt

echo "Should be N: "
./work < ./adaTests/test4N.txt

echo "Should be N: "
./work < ./adaTests/test5N.txt

echo "Should be N: "
./work < ./adaTests/test6N.txt
