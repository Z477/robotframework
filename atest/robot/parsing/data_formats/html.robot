*** Settings ***
Resource          formats_resource.robot

*** Test Cases ***
One HTML
    Run sample file and check tests    ${HTMLDIR}${/}sample.html

HTML With HTML Resource
    Previous Run Should Have Been Successful
    Check Test Case    Resource File

HTML Directory
    Run Suite Dir And Check Results    ${HTMLDIR}
    ${malformed} =    Normalize Path    ${DATADIR}/${HTMLDIR}/malformed.html
    Check Syslog Contains    Data source '${malformed}' has no tests or tasks.

Directory With HTML Init
    Previous Run Should Have Been Successful
    Check Suite With Init    ${SUITE.suites[1]}
