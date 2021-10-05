#!/bin/bash

#copy student code to secure folder
cp whattotest.cpp .guides/secure
#delete old built file
rm -f .guides/secure/secure/tests.exe
g++ .guides/secure/tests.cpp -o .guides/secure/tests.exe -lgtest -lgtest_main -lpthread
./.guides/secure/tests.exe --gtest_output="xml"
FAILURES=$(xmllint --xpath 'string(/testsuites/@failures)' test_detail.xml)
TOTALTESTS=$(xmllint --xpath 'string(/testsuites/@tests)' test_detail.xml)
POINTS=$(($TOTALTESTS-$FAILURES))
curl -s "$CODIO_PARTIAL_POINTS_URL&points=${POINTS}" > /dev/null
echo "<h3><strong>Total Points: ${POINTS}/${TOTALTESTS}</strong></h3>"