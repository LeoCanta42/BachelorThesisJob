import os

# Define the list of HTTP methods
http_methods = [
    "GET",
    "POST",
    "PUT",
    "DELETE",
    "HEAD",
    "OPTIONS",
    "CONNECT",
    "TRACE",
    "PATCH"
]

# Define the list of common HTTP headers
http_headers = [
    "Accept",
    "Accept-Charset",
    "Accept-Encoding",
    "Accept-Language",
    "Authorization",
    "Cache-Control",
    "Connection",
    "Content-Length",
    "Content-Type",
    "Cookie",
    "Date",
    "Host",
    "If-Modified-Since",
    "Origin",
    "Referer",
    "User-Agent",
    "Via",
    "Upgrade",
    "Warning",
    "TE",
    "Trailer",
    "Transfer-Encoding"
]

# Function to create a file with the given name and content
def create_file(file_name):
    with open(file_name, "w") as f:
        f.write(file_name)
    print(f"Created file: {file_name}")

# Create files for HTTP methods
for method in http_methods:
    create_file(method)

# Create files for HTTP headers
for header in http_headers:
    create_file(header)
