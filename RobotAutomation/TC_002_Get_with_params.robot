*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  https://reqres.in

*** Test Cases ***
TC_002 Validate Get requests with Parameters
    create session  Get_Param  ${base_url}
    &{param}=  create dictionary  page=2 name=abs
    ${response}=  get request  Get_Param /api/users params &{param}
    ${statuscode}=  convert to string  ${response.content}
    should be equal  ${statuscode}  200
    ${jsonresponse}=  to json  ${response.json()}
    ${name_list}=  get value from json  ${jsonresponse}  data[0].first_name
    ${name}=  get from list  ${name_list} 0
