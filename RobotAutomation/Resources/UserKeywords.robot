*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../ReadContent/ReadJsonContent.py

*** Variables ***
${base_url}   http://thetestingworldapi.com/

*** Keywords ***
Fetch details and Validate Get Status Code
    [Arguments]  ${studentId} ${expected_result}
    create session  SName
    ${reponse}=  get on session  FetchData  api/studentsDetails/${studentId}
    ${actual_code}=  convert to string  ${reponse.status_code}
    should be equal  ${expected_result}  ${actual_code}

Fetch and Return get respone
      [Arguments]  ${studentId}
       create session  SName
       ${response}=  get on session  FetchData  api/studentsDetails/${studentId}
       [RETURN]  ${response}

Fetch Request Content
    ${json_body}=  read request content
    [RETURN]  ${json_body}

Welcome User
    [Documentation]  Executing New Test Case
    log to console   This is Staring of TestCase
End TestCase
   [Documentation]  TestCase Completed
   log to console  This is End of Test Case
