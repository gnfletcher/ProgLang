#!/bin/bash

printf "%0.s:" {1..80}
printf "\n"
echo "Should be Acceptable:"
echo
cat ./test1A.txt
ruby jobs_ok.rb < ./test1A.txt
printf "%0.s:" {1..80}
printf "\n"
sleep 3

echo "Should be Not Acceptable:"
echo
cat ./test1A.txt
ruby jobs_ok.rb < ./test2NA.txt
printf "%0.s:" {1..80}
printf "\n"
sleep 3

echo "Should be Not Acceptable:"
echo
cat ./test1A.txt
ruby jobs_ok.rb < ./test3NA.txt
printf "%0.s:" {1..80}
printf "\n"
sleep 3

echo "Should be Not Acceptable:"
echo
cat ./test1A.txt
ruby jobs_ok.rb < ./test4NA.txt
printf "%0.s:" {1..80}
printf "\n"
sleep 3

echo "Should be Acceptable:"
echo
cat ./test1A.txt
ruby jobs_ok.rb < ./test1A.txt
printf "%0.s:" {1..80}
printf "\n"
