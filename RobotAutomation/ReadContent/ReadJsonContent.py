import json

def read_request_content():
    file = open('C:\\Users\\Marina_my_folder\\testing_purpose\\AddNewStudent.json', 'r')
    json_request = json.loads(file.read())
    return json_request

x=read_request_content()
print(x)