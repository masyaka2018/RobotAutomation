*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}=  https://thetestingworldapi.com/
${StudentID}  10304575

*** Test Cases ***
TC_004_Update Students data
    create session  UpdateData  ${base_url}
    &{body}=  create dictionary  id=10304575 first_name=Testing last_name=Last middle_name=K date_of_birth=12/02/1999
    &{header}=  create dictionary  Content-Type=application/json
        ${response}=  put on session  UpdateData  api/studentsDetails/${StudentID}  data=${body} headers=${header}
        ${code}=  convert to string  ${response.status_code}
        should be equal  ${code}  201
