# Ruby Qualifying Task

Code in Ruby a locally run web server with a single web page for uploading images:
* on top of page there is a file upload form (a simple web form with a field for a single image file upload and a text comment)
* underneath there wil lbe a file display form, with a single input field "UUID" and utton "Get Image". It will show an image matching that UUID on the page.
* (optional) underneath there is a table with list of all uploaded files (first column: image; second column: text comment; third column: file UUID)

The server will have 2 endpoints "upload-picture" and "get-pictures", as below.

## API

Generally server responds as follows:

Response:
```json
{
    "status": <integer>,    # 0 = success, 1 = failure
    "httpCode": 200,        # HTTP code of the request
    "data": <JSON data>     # data from the API EP spec;
                            # empty if there's an API/server error
}
```

The following endpoints will be available:

### upload-picture

Request:
```json
{
    "fileName": <string>,   # user-supplied filename
    "file": <obj>,          # received file object
    "comment": <string>     # user comment
}
```

Response:
```json
{
    "id": <UUID>,           # id of the uploaded image
}
```

### get-pictures

Request:
```json
{
    "ids": [ <UUID>, ... ]  # list of file UUIDs
                            # if empty, provide all stored files
}
```

Response:
```json
{
    "files": [
        "id": <UUID>,           # file's UUID
        "fileName": <string>,   # user-supplied filename
        "fileUrl": <string>,    # URL to the file
        "comment": <string>     # user comment
    ],
    "count": <integer>          # number of retrieved files
}
```

## Versions

Assume the following software versions:
* Ruby: 2.3.x
* (optional; can be also MySQL) PostgreSQL: 9.x
* Assume running the code in *nix environment with standard shell environment
