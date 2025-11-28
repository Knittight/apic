# apic

apic is so epic!!!

apic is A terminal-based HTTP client for GET, POST, PUT, PATCH, DELETE, HEAD requests with headers, JSON bodies, query parameters, file uploads, timeout support, and more.

## Commands / How to Use

```bash
apic <URL> [flags]
HTTP Method Flags
Flag	Method	Description
-g	GET	Make a GET request
-p	POST	Make a POST request
-pu	PUT	Make a PUT request
-pa	PATCH	Make a PATCH request
-d	DELETE	Make a DELETE request
-h	HEAD	Make a HEAD request

Headers and Body
Flag	Description
-H 'Key: Value'	Add custom header. Can be used multiple times
-B '<body>'	Request body (JSON or raw)
-F 'field=@file'	Upload a file

Other Options
Flag	Description
-q 'key=value&key2=value2'	Query parameters
-o <file>	Save response to file
-v	Verbose output
-t <seconds>	Request timeout (default 10s)
```

## Examples
```
GET request with query params:

apic https://api.example.com/items -g -q "page=2&limit=5"
```

```
POST request with JSON body and headers:

apic https://api.example.com/login -p -B '{"username":"user","password":"pass"}' -H "Authorization: Bearer TOKEN"
```
```
Upload a file with PUT:

apic https://api.example.com/upload -pu -F "file=@myfile.png"
```

```
Save response to a file:

apic https://api.example.com/data -g -o response.json
```

## Installation (Ubuntu/Debian)

- Download the .deb package from GitHub Releases:
```
wget https://github.com/galaxyg144/apic/releases/download/v1.0.0/apic.deb
```

- Install it:
```
sudo dpkg -i apic.deb
sudo apt-get install -f
```

- Run apic from anywhere:
```
apic https://example.com -g
```

## Notes

- Make sure python3 and python3-requests are installed.

- Flags can be combined as needed (-p -B '{"key":"value"}' -H "Auth: TOKEN").