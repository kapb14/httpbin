import multiprocessing
import os
## http://docs.gunicorn.org/en/stable/settings.html

bind = "0.0.0.0:{}".format(os.environ.get("HTTPBIN_PORT", 8080))

#workers = 2 * cpu_count() + 1
#workers = 2
# By default, the value of the WEB_CONCURRENCY environment variable.
# If it is not defined, the default is 1.

user = 'nobody'
#group = 'nogroup'

reload = True

preload_app = True

proxy_protocol = True

backlog = 1024

worker_connections = 500

keepalive = 2

worker_tmp_dir = os.environ.get("GUNICORN_TMPDIR", "/tmp")


