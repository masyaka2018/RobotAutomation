*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com/
${StudentID}  10304554

*** Test Cases ***
TC_003_Delete_data
    create session  DeleteData  ${base_url}
    ${response}=  delete request  DeleteData  api/studentsDetails/${StudentID}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200



