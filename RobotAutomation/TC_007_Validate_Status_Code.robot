*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  Resources/UserKeywords.robot


*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${StudentID}  10304554

*** Test Cases ***
TC_001_Fetch_Student_Details_by_id
    Fetch details and Validate Get Status Code  50 200
    ${response}=  Fetch and Return get respone  50
    log to console  ${response.content}
    ${response}=  Fetch and Return get respone  51
    log to console  ${response.content}