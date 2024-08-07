*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}=  http://thetestingworldapi.com/
${original_first_name}=  Hello
${updated_first_name}=  Testing

*** Test Cases ***
TC_006_End_to_End_TestCase
    create session  E2E  ${base_url}
    &{body}=  create dictionary   first_name=${original_first_name}  last_name=Last  middle_name=K  date_of_birth=12/02/1999
    &{header}=  create dictionary  Content-Type=application/json
    ${post_response}=  post on session  E2E  api/studentsDetails  headers=${header}  data=${body}
    @{id_list}=  get value from json  ${post_response.json()}  id
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0

    &{body1}=  create dictionary   id=${id}  first_name=${updated_first_name}  last_name=Last  middle_name=K  date_of_birth=12/02/1999
    ${put_response}=  put on session  E2E  api/studentsDetails/${id}  headers=${header}  data=${body1}
    log to console  ${put_response.content}
    log to console  ${put_response.status_code}

    ${get_request}=  get on session  E2E api/studentsDetails/${id}
    @{lfirst_name}=  get value from json  ${get_request.json()}  data.first_name
    ${first_name}=  get from list  ${lfirst_name} 0
    should be equal  ${first_name} ${updated_first_name}

     ${delete_reposne}=  'delete on session'  E2E  api/studentsDetails/${id}
     ${code}=  convert to string  ${delete_reposne.status_code}
     should be equal  ${code}  200
