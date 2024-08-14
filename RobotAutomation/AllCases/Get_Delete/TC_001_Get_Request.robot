*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeywords.robot

*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${StudentID}  10304554

*** Test Cases ***
TC_001_Fetch_Student_Details_by_id
    [Setup]  Welcome User
    [Tags]  Smoke  Sanity
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get on session  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
    ${json_res}=  ${Response.json()}


    @{first_name_list}=  get value from json  ${json_res}  data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}

     @{last_name_list}=  get value from json  ${json_res}  data.last_name
     ${last_name}=  get from list  ${last_name_list}  0
     log to console  ${last_name}









