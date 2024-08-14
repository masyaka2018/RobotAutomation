*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://reqres.in

*** Test Cases ***
TC_002 Validate Get requests with Parameters
    [Tags]  Smoke  Regression
    create session  Get_Param  ${base_url}
    &{param}=  create dictionary  page=2
    ${response}=  get on session  Get_Param  /api/users  params ${param}
    ${statuscode}=  convert to string  ${response.content}
    should be equal  ${statuscode}  200
    ${name_list}=  get value from json  ${response.json()}  data[0].first_name
    ${name}=  get from list  ${name_list}  0
