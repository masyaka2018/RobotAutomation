*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}=  http://thetestingworldapi.com/

*** Test Cases ***
TC_004_Create New Student
    create session  AddData  ${base_url}
    &{body}=  create dictionary  first_name=Testing last_name=Last middle_name=K date_of_birth=12/02/1999
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post on session  AddData  api/studentsDetails  data=${body} headers=${header}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201

