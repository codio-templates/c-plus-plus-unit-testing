--------

## The Components
- The stack for this project has the [Google C++ unit testing suite](https://google.github.io/googletest/) and `libxml2-utils` installed on top of the Codio certified **C++ and C Stack**.
- The student code file `whattotest.cpp` is in the student workspace.
- A `main.cpp` file , also in the student workspace, provides the prototype for the function being tested and provides a way for the student to try out their code.
- The unit tests are in `.guides/secure/tests.cpp`.
- The library `libxml2-utils` provides the `xmllint` command used in the grading script.

## Setting up a unit test
Unit tests are set up using an **Advanced Code Test** from the [assessments](https://docs.codio.com/instructors/authoring/assessments/add-assessment.html) drop down menu.
- The grading script `.guides/secure/runtests.sh` is called from the Advanced Code Test **Execution** tab.
- Partial points are set for this test in the **Grading** tab. The total number of points is divided equally by the number of tests to determine the point value for each test.


|||

## The Grading Script
--------


![.guides/img/showexecution](.guides/img/showexecution.png)

### The grading script: `.guides/secure/runtests.sh`



```bash
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
```

|||


## What does the grading script do?
1. `cp whattotest.cpp .guides/secure`

    - Copies student file to the testing folder

2. `rm -f .guides/secure/secure/tests.exe`

    - Deletes old built files

3. `g++ .guides/secure/tests.cpp -o .guides/secure/tests.exe -lgtest -lgtest_main -lpthread`

    - Builds the unit tests

4. `./.guides/secure/tests.exe --gtest_output="xml"`

    - Runs the unit tests sending the results in XML format to a file called test_detail.xml

5. `FAILURES=$(xmllint --xpath 'string(/testsuites/@failures)' test_detail.xml)`

    - Parses the test_detail.xml to find the number of failed tests

6. `TOTALTESTS=$(xmllint --xpath 'string(/testsuites/@tests)' test_detail.xml)`

    - Parses the test_detail.xml to find the number of total tests

7. `POINTS=$(($TOTALTESTS-$FAILURES))`

    - Sets points to totals tests - failures

8. `curl -s "$CODIO_PARTIAL_POINTS_URL&points=${POINTS}" > /dev/null`

    - Sends points back to Codio

9. `echo "<h3><strong>Total Points: ${POINTS}/${TOTALTESTS}</strong></h3>"`

    - Reports to the student points out of possible points



## Student Try it button
{Compile and run | terminal}(make build && make run)

## The Code test

{Check It!|assessment}(test-3594055725)
