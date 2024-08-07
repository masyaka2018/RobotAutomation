*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeywords.robot

*** Variables ***
${base_url}=  http://thetestingworldapi.com/

*** Test Cases ***
TC_004_Create New Student
    create session  AddData  ${base_url}
    &{header}=  create dictionary  Content-Type=application/json
    ${json_content}=  Fetch Request Content
    log to console  ${json_content}
    ${response}=  post on session  AddData  api/studentsDetails  headers=${header}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201