*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com/

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
       [Return]  ${response}
