##################### Grafana Configuration Defaults #####################
#
# Do not modify this file in grafana installs
#

# possible values : production, development
app_mode = production

# instance name, defaults to HOSTNAME environment variable value or hostname if HOSTNAME var is empty
instance_name = [HOSTNAME]

# force migration will run migrations that might cause dataloss
# Deprecated, use clean_upgrade option in [unified_alerting.upgrade] instead.
force_migration = false

#################################### Paths ###############################
[paths]
# Path to where grafana can store temp files, sessions, and the sqlite3 db (if that is used)
data = data

# Temporary files in `data` directory older than given duration will be removed
temp_data_lifetime = 24h

# Directory where grafana can store logs
logs = data/log

# Directory where grafana will automatically scan and look for plugins
plugins = data/plugins

# folder that contains provisioning config files that grafana will apply on startup and while running.
provisioning = conf/provisioning

#################################### Server ##############################
[server]
# Protocol (http, https, h2, socket)
protocol = http

# Minimum TLS version allowed. By default, this value is empty. Accepted values are: TLS1.2, TLS1.3. If nothing is set TLS1.2 would be taken
min_tls_version = ""

# The ip address to bind to, empty will bind to all interfaces
http_addr =

# The http port to use
http_port = 3000

# The public facing domain name used to access grafana from a browser
domain = localhost

# Redirect to correct domain if host header does not match domain
# Prevents DNS rebinding attacks
enforce_domain = false

# The full public facing url
root_url = %(protocol)s://%(domain)s:%(http_port)s/

# Serve Grafana from subpath specified in `root_url` setting. By default it is set to `false` for compatibility reasons.
serve_from_sub_path = false

# Log web requests
router_logging = false

# the path relative working path
static_root_path = public

# enable gzip
enable_gzip = false

# https certs & key file
cert_file =
cert_key =

# Unix socket gid
# Changing the gid of a file without privileges requires that the target group is in the group of the process and that the process is the file owner
# It is recommended to set the gid as http server user gid
# Not set when the value is -1
socket_gid = -1

# Unix socket mode
socket_mode = 0660

# Unix socket path
socket = /tmp/grafana.sock

# CDN Url
cdn_url =

# Sets the maximum time in minutes before timing out read of an incoming request and closing idle connections.
# `0` means there is no timeout for reading the request.
read_timeout = 0

# This setting enables you to specify additional headers that the server adds to HTTP(S) responses.
[server.custom_response_headers]
#exampleHeader1 = exampleValue1
#exampleHeader2 = exampleValue2

#################################### GRPC Server #########################
[grpc_server]
network = "tcp"
address = "127.0.0.1:10000"
use_tls = false
cert_file =
key_file =

#################################### Database ############################
[database]
# You can configure the database connection by specifying type, host, name, user and password
# as separate properties or as on string using the url property.

# Either "mysql", "postgres" or "sqlite3", it's your choice
type = sqlite3
host = 127.0.0.1:3306
name = grafana
user = root
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password =
# Use either URL or the previous fields to configure the database
# Example: mysql://user:secret@host:port/database
url =

# Max idle conn setting default is 2
max_idle_conn = 2

# Max conn setting default is 0 (mean not set)
max_open_conn =

# Connection Max Lifetime default is 14400 (means 14400 seconds or 4 hours)
conn_max_lifetime = 14400

# Set to true to log the sql calls and execution times.
log_queries =

# For "postgres", use either "disable", "require" or "verify-full"
# For "mysql", use either "true", "false", or "skip-verify".
ssl_mode = disable

# For "postregs", use either "1" to enable or "0" to disable SNI
ssl_sni =

# Database drivers may support different transaction isolation levels.
# Currently, only "mysql" driver supports isolation levels.
# If the value is empty - driver's default isolation level is applied.
# For "mysql" use "READ-UNCOMMITTED", "READ-COMMITTED", "REPEATABLE-READ" or "SERIALIZABLE".
isolation_level =

ca_cert_path =
client_key_path =
client_cert_path =
server_cert_name =

# For "sqlite3" only, path relative to data_path setting
path = grafana.db

# For "sqlite3" only. cache mode setting used for connecting to the database
cache_mode = private

# For "sqlite3" only. Enable/disable Write-Ahead Logging, https://sqlite.org/wal.html. Default is false.
wal = false

# For "mysql" only if migrationLocking feature toggle is set. How many seconds to wait before failing to lock the database for the migrations, default is 0.
locking_attempt_timeout_sec = 0

# For "sqlite" only. How many times to retry query in case of database is locked failures. Default is 0 (disabled).
query_retries = 0

# For "sqlite" only. How many times to retry transaction in case of database is locked failures. Default is 5.
transaction_retries = 5

# Set to true to add metrics and tracing for database queries.
instrument_queries = false

#################################### Cache server #############################
[remote_cache]
# Either "redis", "memcached" or "database" default is "database"
type = database

# cache connectionstring options
# database: will use Grafana primary database.
# redis: config like redis server e.g. `addr=127.0.0.1:6379,pool_size=100,db=0,ssl=false`. Only addr is required. ssl may be 'true', 'false', or 'insecure'.
# memcache: 127.0.0.1:11211
connstr =

# prefix prepended to all the keys in the remote cache
prefix =

# This enables encryption of values stored in the remote cache
encryption =

#################################### Data proxy ###########################
[dataproxy]

# This enables data proxy logging, default is false
logging = false

# How long the data proxy waits to read the headers of the response before timing out, default is 30 seconds.
# This setting also applies to core backend HTTP data sources where query requests use an HTTP client with timeout set.
timeout = 30

# How long the data proxy waits to establish a TCP connection before timing out, default is 10 seconds.
dialTimeout = 10

# How many seconds the data proxy waits before sending a keepalive request.
keep_alive_seconds = 30

# How many seconds the data proxy waits for a successful TLS Handshake before timing out.
tls_handshake_timeout_seconds = 10

# How many seconds the data proxy will wait for a server's first response headers after
# fully writing the request headers if the request has an "Expect: 100-continue"
# header. A value of 0 will result in the body being sent immediately, without
# waiting for the server to approve.
expect_continue_timeout_seconds = 1

# Optionally limits the total number of connections per host, including connections in the dialing,
# active, and idle states. On limit violation, dials will block.
# A value of zero (0) means no limit.
max_conns_per_host = 0

# The maximum number of idle connections that Grafana will keep alive.
max_idle_connections = 100

# How many seconds the data proxy keeps an idle connection open before timing out.
idle_conn_timeout_seconds = 90

# If enabled and user is not anonymous, data proxy will add X-Grafana-User header with username into the request.
send_user_header = false

# Limit the amount of bytes that will be read/accepted from responses of outgoing HTTP requests.
response_limit = 0

# Limits the number of rows that Grafana will process from SQL data sources.
row_limit = 1000000

# Sets a custom value for the `User-Agent` header for outgoing data proxy requests. If empty, the default value is `Grafana/<BuildVersion>` (for example `Grafana/9.0.0`).
user_agent =

#################################### Analytics ###########################
[analytics]
# Server reporting, sends usage counters to stats.grafana.org every 24 hours.
# No ip addresses are being tracked, only simple counters to track
# running instances, dashboard and error counts. It is very helpful to us.
# Change this option to false to disable reporting.
reporting_enabled = true

# The name of the distributor of the Grafana instance. Ex hosted-grafana, grafana-labs
reporting_distributor = grafana-labs

# Set to false to disable all checks to https://grafana.com
# for new versions of grafana. The check is used
# in some UI views to notify that a grafana update exists.
# This option does not cause any auto updates, nor send any information
# only a GET request to https://grafana.com/api/grafana/versions/stable to get the latest version.
check_for_updates = true

# Set to false to disable all checks to https://grafana.com
# for new versions of plugins. The check is used
# in some UI views to notify that a plugin update exists.
# This option does not cause any auto updates, nor send any information
# only a GET request to https://grafana.com to get the latest versions.
check_for_plugin_updates = true

# Google Analytics universal tracking code, only enabled if you specify an id here
google_analytics_ua_id =

# Google Analytics 4 tracking code, only enabled if you specify an id here
google_analytics_4_id =

# When Google Analytics 4 Enhanced event measurement is enabled, we will try to avoid sending duplicate events and let Google Analytics 4 detect navigation changes, etc.
google_analytics_4_send_manual_page_views = false

# Google Tag Manager ID, only enabled if you specify an id here
google_tag_manager_id =

# Rudderstack write key, enabled only if rudderstack_data_plane_url is also set
rudderstack_write_key =

# Rudderstack data plane url, enabled only if rudderstack_write_key is also set
rudderstack_data_plane_url =

# Rudderstack SDK url, optional, only valid if rudderstack_write_key and rudderstack_data_plane_url is also set
rudderstack_sdk_url =

# Rudderstack Config url, optional, used by Rudderstack SDK to fetch source config
rudderstack_config_url =

# Rudderstack Integrations URL, optional. Only valid if you pass the SDK version 1.1 or higher
rudderstack_integrations_url =

# Intercom secret, optional, used to hash user_id before passing to Intercom via Rudderstack
intercom_secret =

# Application Insights connection string. Specify an URL string to enable this feature.
application_insights_connection_string =

# Optional. Specifies an Application Insights endpoint URL where the endpoint string is wrapped in backticks ``.
application_insights_endpoint_url =

# Controls if the UI contains any links to user feedback forms
feedback_links_enabled = true

#################################### Security ############################
[security]
# disable creation of admin user on first start of grafana
disable_initial_admin_creation = false

# default admin user, created on startup
admin_user = [GRAFANA_USERNAME]

# default admin password, can be changed before first start of grafana, or in profile settings
admin_password = [GRAFANA_PASSWORD]

# default admin email, created on startup
admin_email = [GRAFANA_EMAIL]

# used for signing
secret_key = SW2YcwTIb9zpOOhoPsMm

# current key provider used for envelope encryption, default to static value specified by secret_key
encryption_provider = secretKey.v1

# list of configured key providers, space separated (Enterprise only): e.g., awskms.v1 azurekv.v1
available_encryption_providers =

# disable gravatar profile images
disable_gravatar = false

# data source proxy whitelist (ip_or_domain:port separated by spaces)
data_source_proxy_whitelist =

# disable protection against brute force login attempts
disable_brute_force_login_protection = false

# set to true if you host Grafana behind HTTPS. default is false.
cookie_secure = false

# set cookie SameSite attribute. defaults to `lax`. can be set to "lax", "strict", "none" and "disabled"
cookie_samesite = lax

# set to true if you want to allow browsers to render Grafana in a <frame>, <iframe>, <embed> or <object>. default is false.
allow_embedding = false

# Set to true if you want to enable http strict transport security (HSTS) response header.
# HSTS tells browsers that the site should only be accessed using HTTPS.
strict_transport_security = false

# Sets how long a browser should cache HSTS. Only applied if strict_transport_security is enabled.
strict_transport_security_max_age_seconds = 86400

# Set to true if to enable HSTS preloading option. Only applied if strict_transport_security is enabled.
strict_transport_security_preload = false

# Set to true if to enable the HSTS includeSubDomains option. Only applied if strict_transport_security is enabled.
strict_transport_security_subdomains = false

# Set to true to enable the X-Content-Type-Options response header.
# The X-Content-Type-Options response HTTP header is a marker used by the server to indicate that the MIME types advertised
# in the Content-Type headers should not be changed and be followed.
x_content_type_options = true

# Set to true to enable the X-XSS-Protection header, which tells browsers to stop pages from loading
# when they detect reflected cross-site scripting (XSS) attacks.
x_xss_protection = true

# Enable adding the Content-Security-Policy header to your requests.
# CSP allows to control resources the user agent is allowed to load and helps prevent XSS attacks.
content_security_policy = false

# Set Content Security Policy template used when adding the Content-Security-Policy header to your requests.
# $NONCE in the template includes a random nonce.
# $ROOT_PATH is server.root_url without the protocol.
content_security_policy_template = """script-src 'self' 'unsafe-eval' 'unsafe-inline' 'strict-dynamic' $NONCE;object-src 'none';font-src 'self';style-src 'self' 'unsafe-inline' blob:;img-src * data:;base-uri 'self';connect-src 'self' grafana.com ws://$ROOT_PATH wss://$ROOT_PATH;manifest-src 'self';media-src 'none';form-action 'self';"""

# Enable adding the Content-Security-Policy-Report-Only header to your requests.
# Allows you to monitor the effects of a policy without enforcing it.
content_security_policy_report_only = false

# Set Content Security Policy Report Only template used when adding the Content-Security-Policy-Report-Only header to your requests.
# $NONCE in the template includes a random nonce.
# $ROOT_PATH is server.root_url without the protocol.
content_security_policy_report_only_template = """script-src 'self' 'unsafe-eval' 'unsafe-inline' 'strict-dynamic' $NONCE;object-src 'none';font-src 'self';style-src 'self' 'unsafe-inline' blob:;img-src * data:;base-uri 'self';connect-src 'self' grafana.com ws://$ROOT_PATH wss://$ROOT_PATH;manifest-src 'self';media-src 'none';form-action 'self';"""

# Controls if old angular plugins are supported or not. This will be disabled by default in future release
angular_support_enabled = true

# The CSRF check will be executed even if the request has no login cookie.
csrf_always_check = false

# Comma-separated list of plugins ids that won't be loaded inside the frontend sandbox
disable_frontend_sandbox_for_plugins = grafana-incident-app

[security.encryption]
# Defines the time-to-live (TTL) for decrypted data encryption keys stored in memory (cache).
# Please note that small values may cause performance issues due to a high frequency decryption operations.
data_keys_cache_ttl = 15m

# Defines the frequency of data encryption keys cache cleanup interval.
# On every interval, decrypted data encryption keys that reached the TTL are removed from the cache.
data_keys_cache_cleanup_interval = 1m

#################################### Snapshots ###########################
[snapshots]
# set to false to remove snapshot functionality
enabled = true

# snapshot sharing options
external_enabled = true
external_snapshot_url = https://snapshots.raintank.io
external_snapshot_name = Publish to snapshots.raintank.io

# Set to true to enable this Grafana instance act as an external snapshot server and allow unauthenticated requests for
# creating and deleting snapshots.
public_mode = false

# remove expired snapshot
snapshot_remove_expired = true

#################################### Dashboards ##################

[dashboards]
# Number dashboard versions to keep (per dashboard). Default: 20, Minimum: 1
versions_to_keep = 20

# Minimum dashboard refresh interval. When set, this will restrict users to set the refresh interval of a dashboard lower than given interval. Per default this is 5 seconds.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
min_refresh_interval = 5s

# Path to the default home dashboard. If this value is empty, then Grafana uses StaticRootPath + "dashboards/home.json"
default_home_dashboard_path =

################################### Data sources #########################
[datasources]
# Upper limit of data sources that Grafana will return. This limit is a temporary configuration and it will be deprecated when pagination will be introduced on the list data sources API.
datasource_limit = 5000

# Number of queries to be executed concurrently. Only for the datasource supports concurrency.
# For now only Loki and InfluxDB (with influxql) are supporting concurrency behind the feature flags.
# Check datasource documentations for enabling concurrency.
concurrent_query_count = 10


################################### SQL Data Sources #####################
[sql_datasources]
# Default maximum number of open connections maintained in the connection pool
# when connecting to SQL based data sources
max_open_conns_default = 100

# Default maximum number of idle connections maintained in the connection pool
# when connecting to SQL based data sources
max_idle_conns_default = 100

# Default maximum connection lifetime used when connecting
# to SQL based data sources.
max_conn_lifetime_default = 14400

#################################### Users ###############################
[users]
# disable user signup / registration
allow_sign_up = false

# Allow non admin users to create organizations
allow_org_create = false

# Set to true to automatically assign new users to the default organization (id 1)
auto_assign_org = true

# Set this value to automatically add new users to the provided organization (if auto_assign_org above is set to true)
auto_assign_org_id = 1

# Default role new users will be automatically assigned
auto_assign_org_role = Viewer

# Require email validation before sign up completes
verify_email_enabled = false

# Background text for the user field on the login page
login_hint = email or username
password_hint = password

# Default UI theme ("dark" or "light" or "system")
default_theme = dark

# Default UI language (supported IETF language tag, such as en-US)
default_language = en-US

# Path to a custom home page. Users are only redirected to this if the default home dashboard is used. It should match a frontend route and contain a leading slash.
home_page =

# External user management
external_manage_link_url =
external_manage_link_name =
external_manage_info =

# Viewers can edit/inspect dashboard settings in the browser. But not save the dashboard.
viewers_can_edit = false

# Editors can administrate dashboard, folders and teams they create
editors_can_admin = false

# The duration in time a user invitation remains valid before expiring. This setting should be expressed as a duration. Examples: 6h (hours), 2d (days), 1w (week). Default is 24h (24 hours). The minimum supported duration is 15m (15 minutes).
user_invite_max_lifetime_duration = 24h

# Enter a comma-separated list of usernames to hide them in the Grafana UI. These users are shown to Grafana admins and to themselves.
hidden_users =

[secretscan]
# Enable secretscan feature
enabled = false

# Interval to check for token leaks
interval = 5m

# base URL of the grafana token leak check service
base_url = https://secret-scanning.grafana.net

# URL to send outgoing webhooks to in case of detection
oncall_url =

# Whether to revoke the token if a leak is detected or just send a notification
revoke = true

[service_accounts]
# When set, Grafana will not allow the creation of tokens with expiry greater than this setting.
token_expiration_day_limit =

[auth]
# Login cookie name
login_cookie_name = grafana_session

# Disable usage of Grafana build-in login solution.
disable_login = false

# The maximum lifetime (duration) an authenticated user can be inactive before being required to login at next visit. Default is 7 days (7d). This setting should be expressed as a duration, e.g. 5m (minutes), 6h (hours), 10d (days), 2w (weeks), 1M (month). The lifetime resets at each successful token rotation (token_rotation_interval_minutes).
login_maximum_inactive_lifetime_duration =

# The maximum lifetime (duration) an authenticated user can be logged in since login time before being required to login. Default is 30 days (30d). This setting should be expressed as a duration, e.g. 5m (minutes), 6h (hours), 10d (days), 2w (weeks), 1M (month).
login_maximum_lifetime_duration =

# How often should auth tokens be rotated for authenticated users when being active. The default is each 10 minutes.
token_rotation_interval_minutes = 10

# Set to true to disable (hide) the login form, useful if you use OAuth
disable_login_form = false

# Set to true to disable the sign out link in the side menu. Useful if you use auth.proxy or auth.jwt.
disable_signout_menu = false

# URL to redirect the user to after sign out
signout_redirect_url =

# Set to true to attempt login with OAuth automatically, skipping the login screen.
# This setting is ignored if multiple OAuth providers are configured.
# Deprecated, use auto_login option for specific provider instead.
oauth_auto_login = false

# OAuth state max age cookie duration in seconds. Defaults to 600 seconds.
oauth_state_cookie_max_age = 600

# Skip forced assignment of OrgID 1 or 'auto_assign_org_id' for social logins
# Deprecated, use skip_org_role_sync option for specific provider instead.
oauth_skip_org_role_update_sync = false

# limit of api_key seconds to live before expiration
api_key_max_seconds_to_live = -1

# Set to true to enable SigV4 authentication option for HTTP-based datasources
sigv4_auth_enabled = false

# Set to true to enable verbose logging of SigV4 request signing
sigv4_verbose_logging = false

# Set to true to enable Azure authentication option for HTTP-based datasources
azure_auth_enabled = false

# Use email lookup in addition to the unique ID provided by the IdP
oauth_allow_insecure_email_lookup = false

# Set to true to include id of identity as a response header
id_response_header_enabled = false

# Prefix used for the id response header, X-Grafana-Identity-Id
id_response_header_prefix = X-Grafana

# List of identity namespaces to add id response headers for, separated by space.
# Available namespaces are user, api-key and service-account.
# The header value will encode the namespace ("user:<id>", "api-key:<id>", "service-account:<id>")
id_response_header_namespaces = user api-key service-account

#################################### SSO Settings ###########################
[sso_settings]
# interval for reloading the SSO Settings from the database
# useful in high availability setups running multiple Grafana instances
# set to 0 to disable this feature
reload_interval = 1m

# List of providers that can be configured through the SSO Settings API and UI.
configurable_providers = github gitlab google generic_oauth azuread okta

#################################### Anonymous Auth ######################
[auth.anonymous]
# enable anonymous access
enabled = false

# specify organization name that should be used for unauthenticated users
org_name = Main Org.

# specify role for unauthenticated users
org_role = Viewer

# mask the Grafana version number for unauthenticated users
hide_version = false

# number of devices in total
device_limit =

#################################### GitHub Auth #########################
[auth.github]
name = GitHub
icon = github
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email,read:org
auth_url = https://github.com/login/oauth/authorize
token_url = https://github.com/login/oauth/access_token
api_url = https://api.github.com/user
signout_redirect_url =
allowed_domains =
team_ids =
allowed_organizations =
role_attribute_path =
role_attribute_strict = false
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
# GitHub OAuth apps does not provide refresh tokens and the access tokens never expires.
use_refresh_token = false

#################################### GitLab Auth #########################
[auth.gitlab]
name = GitLab
icon = gitlab
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = openid email profile
auth_url = https://gitlab.com/oauth/authorize
token_url = https://gitlab.com/oauth/token
api_url = https://gitlab.com/api/v4
signout_redirect_url =
allowed_domains =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = true

#################################### Google Auth #########################
[auth.google]
name = Google
icon = google
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_client_id
client_secret =
scopes = openid email profile
auth_url = https://accounts.google.com/o/oauth2/v2/auth
token_url = https://oauth2.googleapis.com/token
api_url = https://openidconnect.googleapis.com/v1/userinfo
signout_redirect_url =
allowed_domains =
validate_hd = false
hosted_domain =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
allow_assign_grafana_admin = false
skip_org_role_sync = true
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = true

#################################### Grafana.com Auth ####################
# legacy key names (so they work in env variables)
[auth.grafananet]
enabled = false
allow_sign_up = true
client_id = some_id
client_secret =
scopes = user:email
allowed_organizations =
use_refresh_token = false

[auth.grafana_com]
name = Grafana.com
icon = grafana
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email
allowed_organizations =
skip_org_role_sync = false
use_refresh_token = false

#################################### Azure AD OAuth #######################
[auth.azuread]
name = Microsoft
icon = microsoft
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_client_id
client_secret =
scopes = openid email profile
auth_url = https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/authorize
token_url = https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/token
signout_redirect_url =
allowed_domains =
allowed_groups =
allowed_organizations =
role_attribute_strict = false
allow_assign_grafana_admin = false
force_use_graph_api = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
skip_org_role_sync = false
use_refresh_token = true

#################################### Okta OAuth #######################
[auth.okta]
name = Okta
icon = okta
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = openid profile email groups
auth_url = https://<tenant-id>.okta.com/oauth2/v1/authorize
token_url = https://<tenant-id>.okta.com/oauth2/v1/token
api_url = https://<tenant-id>.okta.com/oauth2/v1/userinfo
signout_redirect_url =
allowed_domains =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = false

#################################### Generic OAuth #######################
[auth.generic_oauth]
name = OAuth
icon = signin
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email
empty_scopes = false
email_attribute_name = email:primary
email_attribute_path =
login_attribute_path =
name_attribute_path =
role_attribute_path =
role_attribute_strict = false
groups_attribute_path =
id_token_attribute_name =
team_ids_attribute_path =
auth_url =
token_url =
api_url =
signout_redirect_url =
teams_url =
allowed_domains =
allowed_groups =
team_ids =
allowed_organizations =
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = false
auth_style =
allow_assign_grafana_admin = false
skip_org_role_sync = false
use_refresh_token = false

#################################### Basic Auth ##########################
[auth.basic]
enabled = true
# This setting will enable a stronger password policy for user's password under basic auth.
# The password will need to comply with the following password policy
# 1. Have a minimum of 12 characters
# 2. Composed by at least 1 uppercase character
# 3. Composed by at least 1 lowercase character
# 4. Composed by at least 1 digit character
# 5. Composed by at least 1 symbol character
password_policy = false

#################################### Auth Proxy ##########################
[auth.proxy]
enabled = false
header_name = X-WEBAUTH-USER
header_property = username
auto_sign_up = true
sync_ttl = 60
whitelist =
headers =
headers_encoded = false
enable_login_token = false

#################################### Auth JWT ##########################
[auth.jwt]
enabled = false
enable_login_token = false
header_name =
email_claim =
username_claim =
jwk_set_url =
jwk_set_file =
cache_ttl = 60m
expect_claims = {}
key_file =
key_id =
role_attribute_path =
role_attribute_strict = false
groups_attribute_path =
auto_sign_up = false
url_login = false
allow_assign_grafana_admin = false
skip_org_role_sync = false
signout_redirect_url =

#################################### Auth LDAP ###########################
[auth.ldap]
enabled = false
config_file = /etc/grafana/ldap.toml
allow_sign_up = true
skip_org_role_sync = false

# LDAP background sync (Enterprise only)
# At 1 am every day
sync_cron = "0 1 * * *"
active_sync_enabled = true

#################################### AWS #####################################
[aws]
# Enter a comma-separated list of allowed AWS authentication providers.
# Options are: default (AWS SDK Default), keys (Access && secret key), credentials (Credentials field), ec2_iam_role (EC2 IAM Role)
allowed_auth_providers = default,keys,credentials

# Allow AWS users to assume a role using temporary security credentials.
# If true, assume role will be enabled for all AWS authentication providers that are specified in aws_auth_providers
assume_role_enabled = true

# Specify max no of pages to be returned by the ListMetricPages API
list_metrics_page_limit = 500

# Experimental, for use in Grafana Cloud only. Please do not set.
external_id =

# Sets the expiry duration of an assumed role.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
session_duration = "15m"

# Set the plugins that will receive AWS settings for each request (via plugin context)
# By default this will include all Grafana Labs owned AWS plugins, or those that make use of AWS settings (ElasticSearch, Prometheus).
forward_settings_to_plugins = cloudwatch, grafana-athena-datasource, grafana-redshift-datasource, grafana-x-ray-datasource, grafana-timestream-datasource, grafana-iot-sitewise-datasource, grafana-iot-twinmaker-app, grafana-opensearch-datasource, aws-datasource-provisioner, elasticsearch, prometheus

#################################### Azure ###############################
[azure]
# Azure cloud environment where Grafana is hosted
# Possible values are AzureCloud, AzureChinaCloud, AzureUSGovernment and AzureGermanCloud
# Default value is AzureCloud (i.e. public cloud)
cloud = AzureCloud

# Specifies whether Grafana hosted in Azure service with Managed Identity configured (e.g. Azure Virtual Machines instance)
# If enabled, the managed identity can be used for authentication of Grafana in Azure services
# Disabled by default, needs to be explicitly enabled
managed_identity_enabled = false

# Client ID to use for user-assigned managed identity
# Should be set for user-assigned identity and should be empty for system-assigned identity
managed_identity_client_id =

# Specifies whether Azure AD Workload Identity authentication should be enabled in datasources that support it
# For more documentation on Azure AD Workload Identity, review this documentation:
# https://azure.github.io/azure-workload-identity/docs/
# Disabled by default, needs to be explicitly enabled
workload_identity_enabled = false

# Tenant ID of the Azure AD Workload Identity
# Allows to override default tenant ID of the Azure AD identity associated with the Kubernetes service account
workload_identity_tenant_id =

# Client ID of the Azure AD Workload Identity
# Allows to override default client ID of the Azure AD identity associated with the Kubernetes service account
workload_identity_client_id =

# Custom path to token file for the Azure AD Workload Identity
# Allows to set a custom path to the projected service account token file
workload_identity_token_file =

# Specifies whether user identity authentication (on behalf of currently signed-in user) should be enabled in datasources
# that support it (requires AAD authentication)
# Disabled by default, needs to be explicitly enabled
user_identity_enabled = false

# Override token URL for Azure Active Directory
# By default is the same as token URL configured for AAD authentication settings
user_identity_token_url =

# Override ADD application ID which would be used to exchange users token to an access token for the datasource
# By default is the same as used in AAD authentication or can be set to another application (for OBO flow)
user_identity_client_id =

# Override the AAD application client secret
# By default is the same as used in AAD authentication or can be set to another application (for OBO flow)
user_identity_client_secret =

# Set the plugins that will receive Azure settings for each request (via plugin context)
# By default this will include all Grafana Labs owned Azure plugins, or those that make use of Azure settings (Azure Monitor, Azure Data Explorer, Prometheus, MSSQL).
forward_settings_to_plugins = grafana-azure-monitor-datasource, prometheus, grafana-azure-data-explorer-datasource, mssql

#################################### Role-based Access Control ###########
[rbac]
# If enabled, cache permissions in a in memory cache
permission_cache = true

# Reset basic roles permissions on boot
# Warning left to true, basic roles permissions will be reset on every boot
reset_basic_roles = false

# Validate permissions' action and scope on role creation and update
permission_validation_enabled = true

#################################### SMTP / Emailing #####################
[smtp]
enabled = false
host = localhost:25
user =
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password =
cert_file =
key_file =
skip_verify = false
from_address = admin@grafana.localhost
from_name = Grafana
ehlo_identity =
startTLS_policy =
enable_tracing = false

[smtp.static_headers]
# Include custom static headers in all outgoing emails

[emails]
welcome_email_on_sign_up = false
templates_pattern = emails/*.html, emails/*.txt
content_types = text/html

#################################### Logging ##########################
[log]
# Either "console", "file", "syslog". Default is console and file
# Use space to separate multiple modes, e.g. "console file"
mode = console file

# Either "debug", "info", "warn", "error", "critical", default is "info"
level = info

# optional settings to set different levels for specific loggers. Ex filters = sqlstore:debug
filters =

# Set the default error message shown to users. This message is displayed instead of sensitive backend errors which should be obfuscated.
user_facing_default_error = "please inspect Grafana server log for details"

# For "console" mode only
[log.console]
level =

# log line format, valid options are text, console and json
format = console

# For "file" mode only
[log.file]
level =

# log line format, valid options are text, console and json
format = text

# This enables automated log rotate(switch of following options), default is true
log_rotate = true

# Max line number of single file, default is 1000000
max_lines = 1000000

# Max size shift of single file, default is 28 means 1 << 28, 256MB
max_size_shift = 28

# Segment log daily, default is true
daily_rotate = true

# Expired days of log file(delete after max days), default is 7
max_days = 7

[log.syslog]
level =

# log line format, valid options are text, console and json
format = text

# Syslog network type and address. This can be udp, tcp, or unix. If left blank, the default unix endpoints will be used.
network =
address =

# Syslog facility. user, daemon and local0 through local7 are valid.
facility =

# Syslog tag. By default, the process' argv[0] is used.
tag =

[log.frontend]
# Should Faro javascript agent be initialized
enabled = false

# Custom HTTP endpoint to send events to. Default will log the events to stdout.
custom_endpoint =

# Requests per second limit enforced per an extended period, for Grafana backend log ingestion endpoint (/log).
log_endpoint_requests_per_second_limit = 3

# Max requests accepted per short interval of time for Grafana backend log ingestion endpoint (/log)
log_endpoint_burst_limit = 15

# Should error instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_errors_enabled = true

# Should console instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_console_enabled = false

# Should webvitals instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_webvitals_enabled = false

# level of internal logging for debugging Grafana Javascript Agent.
# possible values are: 0 = OFF, 1 = ERROR, 2 = WARN, 3 = INFO, 4 = VERBOSE
# more details: https://github.com/grafana/faro-web-sdk/blob/v1.3.7/docs/sources/tutorials/quick-start-browser.md#how-to-activate-debugging
internal_logger_level = 0

# Api Key, only applies to Grafana Javascript Agent provider
api_key =

#################################### Usage Quotas ########################
[quota]
enabled = false

#### set quotas to -1 to make unlimited. ####
# limit number of users per Org.
org_user = 10

# limit number of dashboards per Org.
org_dashboard = 100

# limit number of data_sources per Org.
org_data_source = 10

# limit number of api_keys per Org.
org_api_key = 10

# limit number of alerts per Org.
org_alert_rule = 100

# limit number of orgs a user can create.
user_org = 10

# Global limit of users.
global_user = -1

# global limit of orgs.
global_org = -1

# global limit of dashboards
global_dashboard = -1

# global limit of api_keys
global_api_key = -1

# global limit on number of logged in users.
global_session = -1

# global limit of alerts
global_alert_rule = -1

# global limit of files uploaded to the SQL DB
global_file = 1000

# global limit of correlations
global_correlations = -1

# Limit of the number of alert rules per rule group.
# This is not strictly enforced yet, but will be enforced over time.
alerting_rule_group_rules = 100

#################################### Unified Alerting ####################
[unified_alerting]
# Enable the Unified Alerting sub-system and interface. When enabled we'll migrate all of your alert rules and notification channels to the new system. New alert rules will be created and your notification channels will be converted into an Alertmanager configuration. Previous data is preserved to enable backwards compatibility but new data is removed when switching. When this configuration section and flag are not defined, the state is defined at runtime. See the documentation for more details.
enabled =

# Comma-separated list of organization IDs for which to disable unified alerting. Only supported if unified alerting is enabled.
disabled_orgs =

# Specify the frequency of polling for admin config changes.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
admin_config_poll_interval = 60s

# Specify the frequency of polling for Alertmanager config changes.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
alertmanager_config_poll_interval = 60s

# The redis server address that should be connected to.
ha_redis_address =

# The username that should be used to authenticate with the redis server.
ha_redis_username =

# The password that should be used to authenticate with the redis server.
ha_redis_password =

# The redis database, by default it's 0.
ha_redis_db =

# A prefix that is used for every key or channel that is created on the redis server
# as part of HA for alerting.
ha_redis_prefix =

# The name of the cluster peer that will be used as identifier. If none is
# provided, a random one will be generated.
ha_redis_peer_name =

# The maximum number of simultaneous redis connections.
ha_redis_max_conns = 5

# Listen address/hostname and port to receive unified alerting messages for other Grafana instances. The port is used for both TCP and UDP. It is assumed other Grafana instances are also running on the same port.
ha_listen_address = "0.0.0.0:9094"

# Explicit address/hostname and port to advertise other Grafana instances. The port is used for both TCP and UDP.
ha_advertise_address = ""

# Comma-separated list of initial instances (in a format of host:port) that will form the HA cluster. Configuring this setting will enable High Availability mode for alerting.
ha_peers = ""

# Time to wait for an instance to send a notification via the Alertmanager. In HA, each Grafana instance will
# be assigned a position (e.g. 0, 1). We then multiply this position with the timeout to indicate how long should
# each instance wait before sending the notification to take into account replication lag.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_peer_timeout = 15s

# The label is an optional string to include on each packet and stream.
# It uniquely identifies the cluster and prevents cross-communication
# issues when sending gossip messages in an enviromenet with multiple clusters.
ha_label =

# The interval between sending gossip messages. By lowering this value (more frequent) gossip messages are propagated
# across cluster more quickly at the expense of increased bandwidth usage.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_gossip_interval = 200ms

# The interval between gossip full state syncs. Setting this interval lower (more frequent) will increase convergence speeds
# across larger clusters at the expense of increased bandwidth usage.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_push_pull_interval = 60s

# Enable or disable alerting rule execution. The alerting UI remains visible. This option has a legacy version in the `[alerting]` section that takes precedence.
execute_alerts = true

# Alert evaluation timeout when fetching data from the datasource. This option has a legacy version in the `[alerting]` section that takes precedence.
# The timeout string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
evaluation_timeout = 30s

# Number of times we'll attempt to evaluate an alert rule before giving up on that evaluation. The default value is 1.
max_attempts = 1

# Minimum interval to enforce between rule evaluations. Rules will be adjusted if they are less than this value or if they are not multiple of the scheduler interval (10s). Higher values can help with resource management as we'll schedule fewer evaluations over time. This option has a legacy version in the `[alerting]` section that takes precedence.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
min_interval = 10s

# This is an experimental option to add parallelization to saving alert states in the database.
# It configures the maximum number of concurrent queries per rule evaluated. The default value is 1
# (concurrent queries per rule disabled).
max_state_save_concurrency = 1

# If the feature flag 'alertingSaveStatePeriodic' is enabled, this is the interval that is used to persist the alerting instances to the database.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
state_periodic_save_interval = 5m

# Disables the smoothing of alert evaluations across their evaluation window.
# Rules will evaluate in sync.
disable_jitter = false

[unified_alerting.screenshots]
# Enable screenshots in notifications. You must have either installed the Grafana image rendering
# plugin, or set up Grafana to use a remote rendering service.
# For more information on configuration options, refer to [rendering].
capture = false

# The timeout for capturing screenshots. If a screenshot cannot be captured within the timeout then
# the notification is sent without a screenshot. The maximum duration is 30 seconds. This timeout
# should be less than the minimum Interval of all Evaluation Groups to avoid back pressure on alert
# rule evaluation.
capture_timeout = 10s

# The maximum number of screenshots that can be taken at the same time. This option is different from
# concurrent_render_request_limit as max_concurrent_screenshots sets the number of concurrent screenshots
# that can be taken at the same time for all firing alerts where as concurrent_render_request_limit sets
# the total number of concurrent screenshots across all Grafana services.
max_concurrent_screenshots = 5

# Uploads screenshots to the local Grafana server or remote storage such as Azure, S3 and GCS. Please
# see [external_image_storage] for further configuration options. If this option is false then
# screenshots will be persisted to disk for up to temp_data_lifetime.
upload_external_image_storage = false

[unified_alerting.reserved_labels]
# Comma-separated list of reserved labels added by the Grafana Alerting engine that should be disabled.
# For example: `disabled_labels=grafana_folder`
disabled_labels =

[unified_alerting.state_history]
# Enable the state history functionality in Unified Alerting. The previous states of alert rules will be visible in panels and in the UI.
enabled = true

# Select which pluggable state history backend to use. Either "annotations", "loki", or "multiple"
# "loki" writes state history to an external Loki instance. "multiple" allows history to be written to multiple backends at once.
# Defaults to "annotations".
backend =

# For "multiple" only.
# Indicates the main backend used to serve state history queries.
# Either "annotations" or "loki"
primary =

# For "multiple" only.
# Comma-separated list of additional backends to write state history data to.
secondaries =

# For "loki" only.
# URL of the external Loki instance.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_url =

# For "loki" only.
# URL of the external Loki's read path. To be used in configurations where Loki has separated read and write URLs.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_read_url =

# For "loki" only.
# URL of the external Loki's write path. To be used in configurations where Loki has separated read and write URLs.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_write_url =

# For "loki" only.
# Optional tenant ID to attach to requests sent to Loki.
loki_tenant_id =

# For "loki" only.
# Optional username for basic authentication on requests sent to Loki. Can be left blank to disable basic auth.
loki_basic_auth_username =

# For "loki" only.
# Optional password for basic authentication on requests sent to Loki. Can be left blank.
loki_basic_auth_password =

[unified_alerting.state_history.external_labels]
# Optional extra labels to attach to outbound state history records or log streams.
# Any number of label key-value-pairs can be provided.
#
# ex.
# mylabelkey = mylabelvalue

[unified_alerting.upgrade]
# If set to true when upgrading from legacy alerting to Unified Alerting, grafana will first delete all existing
# Unified Alerting resources, thus re-upgrading all organizations from scratch. If false or unset, organizations that
# have previously upgraded will not lose their existing Unified Alerting data when switching between legacy and
# Unified Alerting. Should be kept false when not needed as it may cause unintended data-loss if left enabled.
clean_upgrade = false

# NOTE: this configuration options are not used yet.
[remote.alertmanager]

# Enable the use of the configured remote Alertmanager and disable the internal one.
# The default value is `false`.
enabled = false

# URL of the remote Alertmanager that will replace the internal one.
# This URL should be the root path, Grafana will automatically append an "/alertmanager" suffix for certain HTTP calls.
# Required if `enabled` is set to `true`.
url =

# Tenant ID to use in requests to the Alertmanager.
# It will also be used for the basic auth username if a password is configured.
tenant =

# Optional password for basic authentication.
# If not present, the tenant ID will be set in the X-Scope-OrgID header.
password =

sync_interval = 5m

#################################### Alerting ############################
[alerting]
# Enable the legacy alerting sub-system and interface. If Unified Alerting is already enabled and you try to go back to legacy alerting, all data that is part of Unified Alerting will be deleted. When this configuration section and flag are not defined, the state is defined at runtime. See the documentation for more details.
enabled =

# Makes it possible to turn off alert execution but alerting UI is visible
execute_alerts = true

# Default setting for new alert rules. Defaults to categorize error and timeouts as alerting. (alerting, keep_state)
error_or_timeout = alerting

# Default setting for how Grafana handles nodata or null values in alerting. (alerting, no_data, keep_state, ok)
nodata_or_nullvalues = no_data

# Alert notifications can include images, but rendering many images at the same time can overload the server
# This limit will protect the server from render overloading and make sure notifications are sent out quickly
concurrent_render_limit = 5

# Default setting for alert calculation timeout. Default value is 30
evaluation_timeout_seconds = 30

# Default setting for alert notification timeout. Default value is 30
notification_timeout_seconds = 30

# Default setting for max attempts to sending alert notifications. Default value is 3
max_attempts = 3

# Makes it possible to enforce a minimal interval between evaluations, to reduce load on the backend
min_interval_seconds = 1

# Configures for how long alert annotations are stored. Default is 0, which keeps them forever.
# This setting should be expressed as an duration. Ex 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_annotation_age =

# Configures max number of alert annotations that Grafana stores. Default value is 0, which keeps all alert annotations.
max_annotations_to_keep =

#################################### Annotations #########################
[annotations]
# Configures the batch size for the annotation clean-up job. This setting is used for dashboard, API, and alert annotations.
cleanupjob_batchsize = 100

# Enforces the maximum allowed length of the tags for any newly introduced annotations. It can be between 500 and 4096 inclusive (which is the respective's column length). Default value is 500.
# Setting it to a higher value would impact performance therefore is not recommended.
tags_length = 500

[annotations.dashboard]
# Dashboard annotations means that annotations are associated with the dashboard they are created on.

# Configures how long dashboard annotations are stored. Default is 0, which keeps them forever.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_age =

# Configures max number of dashboard annotations that Grafana stores. Default value is 0, which keeps all dashboard annotations.
max_annotations_to_keep =

[annotations.api]
# API annotations means that the annotations have been created using the API without any
# association with a dashboard.

# Configures how long Grafana stores API annotations. Default is 0, which keeps them forever.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_age =

# Configures max number of API annotations that Grafana keeps. Default value is 0, which keeps all API annotations.
max_annotations_to_keep =

#################################### Explore #############################
[explore]
# Enable the Explore section
enabled = true

#################################### Help #############################
[help]
# Enable the Help section
enabled = true

#################################### Profile #############################
[profile]
# Enable the Profile section
enabled = true

#################################### News #############################
[news]
# Enable the news feed section
news_feed_enabled = true

#################################### Query #############################
[query]
# Set the number of data source queries that can be executed concurrently in mixed queries. Default is the number of CPUs.
concurrent_query_limit =

#################################### Query History #############################
[query_history]
# Enable the Query history
enabled = true

#################################### Internal Grafana Metrics ############
# Metrics available at HTTP URL /metrics and /metrics/plugins/:pluginId
[metrics]
enabled              = true
interval_seconds     = 10
# Disable total stats (stat_totals_*) metrics to be generated
disable_total_stats = false
# The interval at which the total stats collector will update the stats. Default is 1800 seconds.
total_stats_collector_interval_seconds = 1800

#If both are set, basic auth will be required for the metrics endpoints.
basic_auth_username =
basic_auth_password =

# Metrics environment info adds dimensions to the `grafana_environment_info` metric, which
# can expose more information about the Grafana instance.
[metrics.environment_info]
#exampleLabel1 = exampleValue1
#exampleLabel2 = exampleValue2

# Send internal Grafana metrics to graphite
[metrics.graphite]
# Enable by setting the address setting (ex localhost:2003)
address =
prefix = prod.grafana.%(instance_name)s.

#################################### Grafana.com integration  ##########################
[grafana_net]
url = https://grafana.com

[grafana_com]
url = https://grafana.com
api_url = https://grafana.com/api

#################################### Distributed tracing ############
# Opentracing is deprecated use opentelemetry instead
[tracing.jaeger]
# jaeger destination (ex localhost:6831)
address =
# tag that will always be included in when creating new spans. ex (tag1:value1,tag2:value2)
always_included_tag =
# Type specifies the type of the sampler: const, probabilistic, rateLimiting, or remote
sampler_type = const
# jaeger samplerconfig param
# for "const" sampler, 0 or 1 for always false/true respectively
# for "probabilistic" sampler, a probability between 0 and 1
# for "rateLimiting" sampler, the number of spans per second
# for "remote" sampler, param is the same as for "probabilistic"
# and indicates the initial sampling rate before the actual one
# is received from the mothership
sampler_param = 1
# sampling_server_url is the URL of a sampling manager providing a sampling strategy.
sampling_server_url =
# Whether or not to use Zipkin span propagation (x-b3- HTTP headers).
zipkin_propagation = false
# Setting this to true disables shared RPC spans.
# Not disabling is the most common setting when using Zipkin elsewhere in your infrastructure.
disable_shared_zipkin_spans = false

[tracing.opentelemetry]

# attributes that will always be included in when creating new spans. ex (key1:value1,key2:value2)
custom_attributes =
# Type specifies the type of the sampler: const, probabilistic, rateLimiting, or remote
sampler_type =
# Sampler configuration parameter
# for "const" sampler, 0 or 1 for always false/true respectively
# for "probabilistic" sampler, a probability between 0.0 and 1.0
# for "rateLimiting" sampler, the number of spans per second
# for "remote" sampler, param is the same as for "probabilistic"
#   and indicates the initial sampling rate before the actual one
#   is received from the sampling server (set at sampling_server_url)
sampler_param =
# specifies the URL of the sampling server when sampler_type is remote
sampling_server_url =

[tracing.opentelemetry.jaeger]
# jaeger destination (ex http://localhost:14268/api/traces)
address =
# Propagation specifies the text map propagation format: w3c, jaeger
propagation =

# This is a configuration for OTLP exporter with GRPC protocol
[tracing.opentelemetry.otlp]
# otlp destination (ex localhost:4317)
address =
# Propagation specifies the text map propagation format: w3c, jaeger
propagation =

#################################### External Image Storage ##############
[external_image_storage]
# Used for uploading images to public servers so they can be included in slack/email messages.
# You can choose between (s3, webdav, gcs, azure_blob, local)
provider =

[external_image_storage.s3]
endpoint =
path_style_access =
bucket_url =
bucket =
region =
path =
access_key =
secret_key =

[external_image_storage.webdav]
url =
username =
password =
public_url =

[external_image_storage.gcs]
key_file =
bucket =
path =
enable_signed_urls = false
signed_url_expiration =

[external_image_storage.azure_blob]
account_name =
account_key =
container_name =
sas_token_expiration_days =

[external_image_storage.local]
# does not require any configuration

[rendering]
# Options to configure a remote HTTP image rendering service, e.g. using https://github.com/grafana/grafana-image-renderer.
# URL to a remote HTTP image renderer service, e.g. http://localhost:8081/render, will enable Grafana to render panels and dashboards to PNG-images using HTTP requests to an external service.
server_url =
# If the remote HTTP image renderer service runs on a different server than the Grafana server you may have to configure this to a URL where Grafana is reachable, e.g. http://grafana.domain/.
callback_url =
# An auth token that will be sent to and verified by the renderer. The renderer will deny any request without an auth token matching the one configured on the renderer side.
renderer_token = -
# Concurrent render request limit affects when the /render HTTP endpoint is used. Rendering many images at the same time can overload the server,
# which this setting can help protect against by only allowing a certain amount of concurrent requests.
concurrent_render_request_limit = 30
# Determines the lifetime of the render key used by the image renderer to access and render Grafana.
# This setting should be expressed as a duration. Examples: 10s (seconds), 5m (minutes), 2h (hours).
# Default is 5m. This should be more than enough for most deployments.
# Change the value only if image rendering is failing and you see `Failed to get the render key from cache` in Grafana logs.
render_key_lifetime = 5m

[panels]
# here for to support old env variables, can remove after a few months
enable_alpha = false
disable_sanitize_html = false

[plugins]
enable_alpha = false
app_tls_skip_verify_insecure = false
# Enter a comma-separated list of plugin identifiers to identify plugins to load even if they are unsigned. Plugins with modified signatures are never loaded.
allow_loading_unsigned_plugins =
# Enable or disable installing / uninstalling / updating plugins directly from within Grafana.
plugin_admin_enabled = true
plugin_admin_external_manage_enabled = false
plugin_catalog_url = https://grafana.com/grafana/plugins/
# Enter a comma-separated list of plugin identifiers to hide in the plugin catalog.
plugin_catalog_hidden_plugins =
# Log all backend requests for core and external plugins.
log_backend_requests = false
# Disable download of the public key for verifying plugin signature.
public_key_retrieval_disabled = false
# Force download of the public key for verifying plugin signature on startup. If disabled, the public key will be retrieved every 10 days.
# Requires public_key_retrieval_disabled to be false to have any effect.
public_key_retrieval_on_startup = false
# Enter a comma-separated list of plugin identifiers to avoid loading (including core plugins). These plugins will be hidden in the catalog.
disable_plugins =
# Auth token for plugin installations and removal in managed instances
install_token =
# Comma separated list of plugin ids for which angular deprecation UI should be disabled
hide_angular_deprecation =
# Comma separated list of plugin ids for which environment variables should be forwarded. Used only when feature flag pluginsSkipHostEnvVars is enabled.
forward_host_env_vars =

#################################### Grafana Live ##########################################
[live]
# max_connections to Grafana Live WebSocket endpoint per Grafana server instance. See Grafana Live docs
# if you are planning to make it higher than default 100 since this can require some OS and infrastructure
# tuning. 0 disables Live, -1 means unlimited connections.
max_connections = 100

# allowed_origins is a comma-separated list of origins that can establish connection with Grafana Live.
# If not set then origin will be matched over root_url. Supports wildcard symbol "*".
allowed_origins =

# engine defines an HA (high availability) engine to use for Grafana Live. By default no engine used - in
# this case Live features work only on a single Grafana server.
# Available options: "redis".
# Setting ha_engine is an EXPERIMENTAL feature.
ha_engine =

# ha_engine_address sets a connection address for Live HA engine. Depending on engine type address format can differ.
# For now we only support Redis connection address in "host:port" format.
# This option is EXPERIMENTAL.
ha_engine_address = "127.0.0.1:6379"

# ha_engine_password allows setting an optional password to authenticate with the engine
ha_engine_password = ""

#################################### Grafana Image Renderer Plugin ##########################
[plugin.grafana-image-renderer]
# Instruct headless browser instance to use a default timezone when not provided by Grafana, e.g. when rendering panel image of alert.
# See ICU’s metaZones.txt (https://cs.chromium.org/chromium/src/third_party/icu/source/data/misc/metaZones.txt) for a list of supported
# timezone IDs. Fallbacks to TZ environment variable if not set.
rendering_timezone =

# Instruct headless browser instance to use a default language when not provided by Grafana, e.g. when rendering panel image of alert.
# Please refer to the HTTP header Accept-Language to understand how to format this value, e.g. 'fr-CH, fr;q=0.9, en;q=0.8, de;q=0.7, *;q=0.5'.
rendering_language =

# Instruct headless browser instance to use a default device scale factor when not provided by Grafana, e.g. when rendering panel image of alert.
# Default is 1. Using a higher value will produce more detailed images (higher DPI), but will require more disk space to store an image.
rendering_viewport_device_scale_factor =

# Instruct headless browser instance whether to ignore HTTPS errors during navigation. Per default HTTPS errors are not ignored. Due to
# the security risk it's not recommended to ignore HTTPS errors.
rendering_ignore_https_errors =

# Instruct headless browser instance whether to capture and log verbose information when rendering an image. Default is false and will
# only capture and log error messages. When enabled, debug messages are captured and logged as well.
# For the verbose information to be included in the Grafana server log you have to adjust the rendering log level to debug, configure
# [log].filter = rendering:debug.
rendering_verbose_logging =

# Instruct headless browser instance whether to output its debug and error messages into running process of remote rendering service.
# Default is false. This can be useful to enable (true) when troubleshooting.
rendering_dumpio =

# Instruct headless browser instance whether to register metrics for the duration of every rendering step. Default is false.
# This can be useful to enable (true) when optimizing the rendering mode settings to improve the plugin performance or when troubleshooting.
rendering_timing_metrics =

# Additional arguments to pass to the headless browser instance. Default is --no-sandbox. The list of Chromium flags can be found
# here (https://peter.sh/experiments/chromium-command-line-switches/). Multiple arguments is separated with comma-character.
rendering_args =

# You can configure the plugin to use a different browser binary instead of the pre-packaged version of Chromium.
# Please note that this is not recommended, since you may encounter problems if the installed version of Chrome/Chromium is not
# compatible with the plugin.
rendering_chrome_bin =

# Instruct how headless browser instances are created. Default is 'default' and will create a new browser instance on each request.
# Mode 'clustered' will make sure that only a maximum of browsers/incognito pages can execute concurrently.
# Mode 'reusable' will have one browser instance and will create a new incognito page on each request.
rendering_mode =

# When rendering_mode = clustered, you can instruct how many browsers or incognito pages can execute concurrently. Default is 'browser'
# and will cluster using browser instances.
# Mode 'context' will cluster using incognito pages.
rendering_clustering_mode =
# When rendering_mode = clustered, you can define the maximum number of browser instances/incognito pages that can execute concurrently. Default is '5'.
rendering_clustering_max_concurrency =
# When rendering_mode = clustered, you can specify the duration a rendering request can take before it will time out. Default is `30` seconds.
rendering_clustering_timeout =

# Limit the maximum viewport width, height and device scale factor that can be requested.
rendering_viewport_max_width =
rendering_viewport_max_height =
rendering_viewport_max_device_scale_factor =

# Change the listening host and port of the gRPC server. Default host is 127.0.0.1 and default port is 0 and will automatically assign
# a port not in use.
grpc_host =
grpc_port =

[enterprise]
license_path =

[feature_toggles]
# there are currently two ways to enable feature toggles in the `grafana.ini`.
# you can either pass an array of feature you want to enable to the `enable` field or
# configure each toggle by setting the name of the toggle to true/false. Toggles set to true/false
# will take precedence over toggles in the `enable` list.

# enable = feature1,feature2
enable =

# Some features are enabled by default, see:
# https://grafana.com/docs/grafana/next/setup-grafana/configure-grafana/feature-toggles/
# To enable features by default, set `Expression:  "true"` in:
# https://github.com/grafana/grafana/blob/main/pkg/services/featuremgmt/registry.go

# feature1 = true
# feature2 = false

[date_formats]
# For information on what formatting patterns that are supported https://momentjs.com/docs/#/displaying/

# Default system date format used in time range picker and other places where full time is displayed
full_date = YYYY-MM-DD HH:mm:ss

# Used by graph and other places where we only show small intervals
interval_second = HH:mm:ss
interval_minute = HH:mm
interval_hour = MM/DD HH:mm
interval_day = MM/DD
interval_month = YYYY-MM
interval_year = YYYY

# Experimental feature
use_browser_locale = false

# Default timezone for user preferences. Options are 'browser' for the browser local timezone or a timezone name from IANA Time Zone database, e.g. 'UTC' or 'Europe/Amsterdam' etc.
default_timezone = browser

[expressions]
# Enable or disable the expressions functionality.
enabled = true

[geomap]
# Set the JSON configuration for the default basemap
default_baselayer_config =

# Enable or disable loading other base map layers
enable_custom_baselayers = true

#################################### Support Bundles #####################################
[support_bundles]
# Enable support bundle creation (default: true)
enabled = true
# Only server admins can generate and view support bundles (default: true)
server_admin_only = true
# If set, bundles will be encrypted with the provided public keys separated by whitespace
public_keys = ""

#################################### Storage ################################################

[storage]
# Allow uploading SVG files without sanitization.
allow_unsanitized_svg_upload = false


#################################### Search ################################################

[search]
# Defines the number of dashboards loaded at once in a batch during a full reindex.
# This is a temporary settings that might be removed in the future.
dashboard_loading_batch_size = 200

# Defines the frequency of a full search reindex.
# This is a temporary settings that might be removed in the future.
full_reindex_interval = 5m

# Defines the frequency of partial index updates based on recent changes such as dashboard updates.
# This is a temporary settings that might be removed in the future.
index_update_interval = 10s


# Move an app plugin referenced by its id (including all its pages) to a specific navigation section
# Format: <Plugin ID> = <Section ID> <Sort Weight>
[navigation.app_sections]

# Move a specific app plugin page (referenced by its `path` field) to a specific navigation section
# Format: <Page URL> = <Section ID> <Sort Weight>
[navigation.app_standalone_pages]


#################################### Secure Socks5 Datasource Proxy #####################################
[secure_socks_datasource_proxy]
enabled = false
root_ca_cert =
client_key =
client_cert =
server_name =
# The address of the socks5 proxy datasources should connect to
proxy_address =
# Determines if the secure socks proxy should be shown on the datasources page, defaults to true if the feature is enabled
show_ui = true
# Disables TLS in the secure socks proxy
allow_insecure = false

################################## Feature Management ##############################################
# Options to configure the experimental Feature Toggle Admin Page feature, which is behind the `featureToggleAdminPage` feature toggle. Use at your own risk.
[feature_management]
# Allows editing of feature toggles in the feature management page
allow_editing = false

# Allow customization of URL for the controller that manages feature toggles
update_webhook =

# Allow configuring an auth token for feature management update requests
update_webhook_token =

# Hides specific feature toggles from the feature management page
hidden_toggles =

# Disables updating specific feature toggles in the feature management page
read_only_toggles =

#################################### Public Dashboards #####################################
[public_dashboards]
# Set to false to disable public dashboards
enabled = true



































##################### Grafana Configuration Defaults #####################
#
# Do not modify this file in grafana installs
#

# possible values : production, development
app_mode = production

# instance name, defaults to HOSTNAME environment variable value or hostname if HOSTNAME var is empty
instance_name = [HOSTNAME]

#################################### Paths ###############################
[paths]
# Path to where grafana can store temp files, sessions, and the sqlite3 db (if that is used)
data = data

# Temporary files in `data` directory older than given duration will be removed
temp_data_lifetime = 24h

# Directory where grafana can store logs
logs = data/log

# Directory where grafana will automatically scan and look for plugins
plugins = data/plugins

# folder that contains provisioning config files that grafana will apply on startup and while running.
provisioning = conf/provisioning

#################################### Server ##############################
[server]
# Protocol (http, https, h2, socket)
protocol = http

# Minimum TLS version allowed. By default, this value is empty. Accepted values are: TLS1.2, TLS1.3. If nothing is set TLS1.2 would be taken
min_tls_version = ""

# The ip address to bind to, empty will bind to all interfaces
http_addr =

# The http port to use
http_port = 3000

# The public facing domain name used to access grafana from a browser
domain = localhost

# Redirect to correct domain if host header does not match domain
# Prevents DNS rebinding attacks
enforce_domain = false

# The full public facing url
root_url = %(protocol)s://%(domain)s:%(http_port)s/

# Serve Grafana from subpath specified in `root_url` setting. By default it is set to `false` for compatibility reasons.
serve_from_sub_path = false

# Log web requests
router_logging = false

# the path relative working path
static_root_path = public

# enable gzip
enable_gzip = false

# https certs & key file
cert_file =
cert_key =
cert_pass =

# Certificates file watch interval
certs_watch_interval =

# Unix socket gid
# Changing the gid of a file without privileges requires that the target group is in the group of the process and that the process is the file owner
# It is recommended to set the gid as http server user gid
# Not set when the value is -1
socket_gid = -1

# Unix socket mode
socket_mode = 0660

# Unix socket path
socket = /tmp/grafana.sock

# CDN Url
cdn_url =

# Sets the maximum time in minutes before timing out read of an incoming request and closing idle connections.
# `0` means there is no timeout for reading the request.
read_timeout = 0

# This setting enables you to specify additional headers that the server adds to HTTP(S) responses.
[server.custom_response_headers]
#exampleHeader1 = exampleValue1
#exampleHeader2 = exampleValue2

[environment]
# Sets whether the local file system is available for Grafana to use. Default is true for backward compatibility.
local_file_system_available = true

#################################### GRPC Server #########################
[grpc_server]
network = "tcp"
address = "127.0.0.1:10000"
use_tls = false
cert_file =
key_file =
# this will log the request and response for each unary gRPC call
enable_logging = false

# Maximum size of a message that can be received in bytes. If not set, uses the gRPC default (4MiB).
max_recv_msg_size =

# Maximum size of a message that can be sent in bytes. If not set, uses the gRPC default (unlimited).
max_send_msg_size =

#################################### Database ############################
[database]
# You can configure the database connection by specifying type, host, name, user and password
# as separate properties or as on string using the url property.

# Either "mysql", "postgres" or "sqlite3", it's your choice
type = sqlite3
host = 127.0.0.1:3306
name = grafana
user = root
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password =
# Use either URL or the previous fields to configure the database
# Example: mysql://user:secret@host:port/database
url =

# Max idle conn setting default is 2
max_idle_conn = 2

# Max conn setting default is 0 (mean not set)
max_open_conn =

# Connection Max Lifetime default is 14400 (means 14400 seconds or 4 hours)
conn_max_lifetime = 14400

# Set to true to log the sql calls and execution times.
log_queries =

# For "postgres", use either "disable", "require" or "verify-full"
# For "mysql", use either "true", "false", or "skip-verify".
ssl_mode = disable

# For "postgres", use either "1" to enable or "0" to disable SNI
ssl_sni =

# Database drivers may support different transaction isolation levels.
# Currently, only "mysql" driver supports isolation levels.
# If the value is empty - driver's default isolation level is applied.
# For "mysql" use "READ-UNCOMMITTED", "READ-COMMITTED", "REPEATABLE-READ" or "SERIALIZABLE".
isolation_level =

ca_cert_path =
client_key_path =
client_cert_path =
server_cert_name =

# For "sqlite3" only, path relative to data_path setting
path = grafana.db

# For "sqlite3" only. cache mode setting used for connecting to the database
cache_mode = private

# For "sqlite3" only. Enable/disable Write-Ahead Logging, https://sqlite.org/wal.html. Default is false.
wal = false

# For "mysql" and "postgres". Lock the database for the migrations, default is true.
migration_locking = true

# For "mysql" and "postgres" only if migrationLocking is set. How many seconds to wait before failing to lock the database for the migrations, default is 0.
locking_attempt_timeout_sec = 0

# For "sqlite" only. How many times to retry query in case of database is locked failures. Default is 0 (disabled).
query_retries = 0

# For "sqlite" only. How many times to retry transaction in case of database is locked failures. Default is 5.
transaction_retries = 5

# Set to true to add metrics and tracing for database queries.
instrument_queries = false

#################################### Cache server #############################
[remote_cache]
# Either "redis", "memcached" or "database" default is "database"
type = database

# cache connectionstring options
# database: will use Grafana primary database.
# redis: config like redis server e.g. `addr=127.0.0.1:6379,pool_size=100,db=0,ssl=false`. Only addr is required. ssl may be 'true', 'false', or 'insecure'.
# memcache: 127.0.0.1:11211
connstr =

# prefix prepended to all the keys in the remote cache
prefix =

# This enables encryption of values stored in the remote cache
encryption =

#################################### Data proxy ###########################
[dataproxy]

# This enables data proxy logging, default is false
logging = false

# How long the data proxy waits to read the headers of the response before timing out, default is 30 seconds.
# This setting also applies to core backend HTTP data sources where query requests use an HTTP client with timeout set.
timeout = 30

# How long the data proxy waits to establish a TCP connection before timing out, default is 10 seconds.
dialTimeout = 10

# How many seconds the data proxy waits before sending a keepalive request.
keep_alive_seconds = 30

# How many seconds the data proxy waits for a successful TLS Handshake before timing out.
tls_handshake_timeout_seconds = 10

# How many seconds the data proxy will wait for a server's first response headers after
# fully writing the request headers if the request has an "Expect: 100-continue"
# header. A value of 0 will result in the body being sent immediately, without
# waiting for the server to approve.
expect_continue_timeout_seconds = 1

# Optionally limits the total number of connections per host, including connections in the dialing,
# active, and idle states. On limit violation, dials will block.
# A value of zero (0) means no limit.
max_conns_per_host = 0

# The maximum number of idle connections that Grafana will keep alive.
max_idle_connections = 100

# How many seconds the data proxy keeps an idle connection open before timing out.
idle_conn_timeout_seconds = 90

# If enabled and user is not anonymous, data proxy will add X-Grafana-User header with username into the request.
send_user_header = false

# Limit the amount of bytes that will be read/accepted from responses of outgoing HTTP requests.
response_limit = 0

# Limits the number of rows that Grafana will process from SQL data sources.
row_limit = 1000000

# Sets a custom value for the `User-Agent` header for outgoing data proxy requests. If empty, the default value is `Grafana/<BuildVersion>` (for example `Grafana/9.0.0`).
user_agent =

#################################### Analytics ###########################
[analytics]
# Server reporting, sends usage counters to stats.grafana.org every 24 hours.
# No ip addresses are being tracked, only simple counters to track
# running instances, dashboard and error counts. It is very helpful to us.
# Change this option to false to disable reporting.
reporting_enabled = true

# The name of the distributor of the Grafana instance. Ex hosted-grafana, grafana-labs
reporting_distributor = grafana-labs

# Set to false to disable all checks to https://grafana.com
# for new versions of grafana. The check is used
# in some UI views to notify that a grafana update exists.
# This option does not cause any auto updates, nor send any information
# only a GET request to https://grafana.com/api/grafana/versions/stable to get the latest version.
check_for_updates = true

# Set to false to disable all checks to https://grafana.com
# for new versions of plugins. The check is used
# in some UI views to notify that a plugin update exists.
# This option does not cause any auto updates, nor send any information
# only a GET request to https://grafana.com to get the latest versions.
check_for_plugin_updates = true

# Google Analytics universal tracking code, only enabled if you specify an id here
google_analytics_ua_id =

# Google Analytics 4 tracking code, only enabled if you specify an id here
google_analytics_4_id =

# When Google Analytics 4 Enhanced event measurement is enabled, we will try to avoid sending duplicate events and let Google Analytics 4 detect navigation changes, etc.
google_analytics_4_send_manual_page_views = false

# Google Tag Manager ID, only enabled if you specify an id here
google_tag_manager_id =

# Rudderstack write key, enabled only if rudderstack_data_plane_url is also set
rudderstack_write_key =

# Rudderstack data plane url, enabled only if rudderstack_write_key is also set
rudderstack_data_plane_url =

# Rudderstack SDK url, optional, only valid if rudderstack_write_key and rudderstack_data_plane_url is also set
rudderstack_sdk_url =

# Rudderstack Config url, optional, used by Rudderstack SDK to fetch source config
rudderstack_config_url =

# Rudderstack Integrations URL, optional. Only valid if you pass the SDK version 1.1 or higher
rudderstack_integrations_url =

# Intercom secret, optional, used to hash user_id before passing to Intercom via Rudderstack
intercom_secret =

# Application Insights connection string. Specify an URL string to enable this feature.
application_insights_connection_string =

# Optional. Specifies an Application Insights endpoint URL where the endpoint string is wrapped in backticks ``.
application_insights_endpoint_url =

# Controls if the UI contains any links to user feedback forms
feedback_links_enabled = true

# Static context that is being added to analytics events
reporting_static_context =

#################################### Security ############################
[security]
# disable creation of admin user on first start of grafana
disable_initial_admin_creation = false

# default admin user, created on startup
admin_user = [GRAFANA_USERNAME]

# default admin password, can be changed before first start of grafana, or in profile settings
admin_password = [GRAFANA_PASSWORD]

# default admin email, created on startup
admin_email = [GRAFANA_EMAIL]

# used for signing
secret_key = SW2YcwTIb9zpOOhoPsMm

# current key provider used for envelope encryption, default to static value specified by secret_key
encryption_provider = secretKey.v1

# list of configured key providers, space separated (Enterprise only): e.g., awskms.v1 azurekv.v1
available_encryption_providers =

# disable gravatar profile images
disable_gravatar = false

# data source proxy whitelist (ip_or_domain:port separated by spaces)
data_source_proxy_whitelist =

# disable protection against brute force login attempts
disable_brute_force_login_protection = false

# set to true if you host Grafana behind HTTPS. default is false.
cookie_secure = false

# set cookie SameSite attribute. defaults to `lax`. can be set to "lax", "strict", "none" and "disabled"
cookie_samesite = lax

# set to true if you want to allow browsers to render Grafana in a <frame>, <iframe>, <embed> or <object>. default is false.
allow_embedding = false

# Set to true if you want to enable http strict transport security (HSTS) response header.
# HSTS tells browsers that the site should only be accessed using HTTPS.
strict_transport_security = false

# Sets how long a browser should cache HSTS. Only applied if strict_transport_security is enabled.
strict_transport_security_max_age_seconds = 86400

# Set to true if to enable HSTS preloading option. Only applied if strict_transport_security is enabled.
strict_transport_security_preload = false

# Set to true if to enable the HSTS includeSubDomains option. Only applied if strict_transport_security is enabled.
strict_transport_security_subdomains = false

# Set to true to enable the X-Content-Type-Options response header.
# The X-Content-Type-Options response HTTP header is a marker used by the server to indicate that the MIME types advertised
# in the Content-Type headers should not be changed and be followed.
x_content_type_options = true

# Set to true to enable the X-XSS-Protection header, which tells browsers to stop pages from loading
# when they detect reflected cross-site scripting (XSS) attacks.
x_xss_protection = true

# Enable adding the Content-Security-Policy header to your requests.
# CSP allows to control resources the user agent is allowed to load and helps prevent XSS attacks.
content_security_policy = false

# Set Content Security Policy template used when adding the Content-Security-Policy header to your requests.
# $NONCE in the template includes a random nonce.
# $ROOT_PATH is server.root_url without the protocol.
content_security_policy_template = """script-src 'self' 'unsafe-eval' 'unsafe-inline' 'strict-dynamic' $NONCE;object-src 'none';font-src 'self';style-src 'self' 'unsafe-inline' blob:;img-src * data:;base-uri 'self';connect-src 'self' grafana.com ws://$ROOT_PATH wss://$ROOT_PATH;manifest-src 'self';media-src 'none';form-action 'self';"""

# Enable adding the Content-Security-Policy-Report-Only header to your requests.
# Allows you to monitor the effects of a policy without enforcing it.
content_security_policy_report_only = false

# Set Content Security Policy Report Only template used when adding the Content-Security-Policy-Report-Only header to your requests.
# $NONCE in the template includes a random nonce.
# $ROOT_PATH is server.root_url without the protocol.
content_security_policy_report_only_template = """script-src 'self' 'unsafe-eval' 'unsafe-inline' 'strict-dynamic' $NONCE;object-src 'none';font-src 'self';style-src 'self' 'unsafe-inline' blob:;img-src * data:;base-uri 'self';connect-src 'self' grafana.com ws://$ROOT_PATH wss://$ROOT_PATH;manifest-src 'self';media-src 'none';form-action 'self';"""

# Controls if old angular plugins are supported or not.
angular_support_enabled = false

# The CSRF check will be executed even if the request has no login cookie.
csrf_always_check = false

# Comma-separated list of plugins ids that won't be loaded inside the frontend sandbox
disable_frontend_sandbox_for_plugins = grafana-incident-app

# Comma-separated list of paths for POST/PUT URL in actions. Empty will allow anything that is not on the same origin
actions_allow_post_url =

[security.encryption]
# Defines the time-to-live (TTL) for decrypted data encryption keys stored in memory (cache).
# Please note that small values may cause performance issues due to a high frequency decryption operations.
data_keys_cache_ttl = 15m

# Defines the frequency of data encryption keys cache cleanup interval.
# On every interval, decrypted data encryption keys that reached the TTL are removed from the cache.
data_keys_cache_cleanup_interval = 1m

#################################### Snapshots ###########################
[snapshots]
# set to false to remove snapshot functionality
enabled = true

# snapshot sharing options
external_enabled = true
external_snapshot_url = https://snapshots.raintank.io
external_snapshot_name = Publish to snapshots.raintank.io

# Set to true to enable this Grafana instance act as an external snapshot server and allow unauthenticated requests for
# creating and deleting snapshots.
public_mode = false

#################################### Dashboards ##################

[dashboards]
# Number dashboard versions to keep (per dashboard). Default: 20, Minimum: 1
versions_to_keep = 20

# Minimum dashboard refresh interval. When set, this will restrict users to set the refresh interval of a dashboard lower than given interval. Per default this is 5 seconds.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
min_refresh_interval = 5s

# Path to the default home dashboard. If this value is empty, then Grafana uses StaticRootPath + "dashboards/home.json"
default_home_dashboard_path =

################################### Data sources #########################
[datasources]
# Upper limit of data sources that Grafana will return. This limit is a temporary configuration and it will be deprecated when pagination will be introduced on the list data sources API.
datasource_limit = 5000

# Number of queries to be executed concurrently. Only for the datasource supports concurrency.
# For now only Loki and InfluxDB (with influxql) are supporting concurrency behind the feature flags.
# Check datasource documentations for enabling concurrency.
concurrent_query_count = 10


################################### SQL Data Sources #####################
[sql_datasources]
# Default maximum number of open connections maintained in the connection pool
# when connecting to SQL based data sources
max_open_conns_default = 100

# Default maximum number of idle connections maintained in the connection pool
# when connecting to SQL based data sources
max_idle_conns_default = 100

# Default maximum connection lifetime used when connecting
# to SQL based data sources.
max_conn_lifetime_default = 14400

#################################### Users ###############################
[users]
# disable user signup / registration
allow_sign_up = false

# Allow non admin users to create organizations
allow_org_create = false

# Set to true to automatically assign new users to the default organization (id 1)
auto_assign_org = true

# Set this value to automatically add new users to the provided organization (if auto_assign_org above is set to true)
auto_assign_org_id = 1

# Default role new users will be automatically assigned
auto_assign_org_role = Viewer

# Require email validation before sign up completes
verify_email_enabled = false

# Redirect to default OrgId after login
login_default_org_id =

# Background text for the user field on the login page
login_hint =
password_hint =

# Default UI theme ("dark" or "light" or "system")
default_theme = dark

# Default UI language (supported IETF language tag, such as en-US)
default_language = en-US

# Path to a custom home page. Users are only redirected to this if the default home dashboard is used. It should match a frontend route and contain a leading slash.
home_page =

# External user management
external_manage_link_url =
external_manage_link_name =
external_manage_info =

# Viewers can edit/inspect dashboard settings in the browser. But not save the dashboard.
viewers_can_edit = false

# Editors can administrate dashboard, folders and teams they create
editors_can_admin = false

# The duration in time a user invitation remains valid before expiring. This setting should be expressed as a duration. Examples: 6h (hours), 2d (days), 1w (week). Default is 24h (24 hours). The minimum supported duration is 15m (15 minutes).
user_invite_max_lifetime_duration = 24h

# The duration in time a verification email, used to update the email address of a user, remains valid before expiring. This setting should be expressed as a duration. Examples: 6h (hours), 2d (days), 1w (week). Default is 1h (1 hour).
verification_email_max_lifetime_duration = 1h

# Frequency of updating a user's last seen time. The minimum supported duration is 5m (5 minutes). The maximum supported duration is 1h (1 hour)
last_seen_update_interval = 15m

# Enter a comma-separated list of usernames to hide them in the Grafana UI. These users are shown to Grafana admins and to themselves.
hidden_users =

[secretscan]
# Enable secretscan feature
enabled = false

# Interval to check for token leaks
interval = 5m

# base URL of the grafana token leak check service
base_url = https://secret-scanning.grafana.net

# URL to send outgoing webhooks to in case of detection
oncall_url =

# Whether to revoke the token if a leak is detected or just send a notification
revoke = true

[service_accounts]
# When set, Grafana will not allow the creation of tokens with expiry greater than this setting.
token_expiration_day_limit =

[auth]
# Login cookie name
login_cookie_name = grafana_session

# Disable usage of Grafana build-in login solution.
disable_login = false

# The maximum lifetime (duration) an authenticated user can be inactive before being required to login at next visit. Default is 7 days (7d). This setting should be expressed as a duration, e.g. 5m (minutes), 6h (hours), 10d (days), 2w (weeks), 1M (month). The lifetime resets at each successful token rotation (token_rotation_interval_minutes).
login_maximum_inactive_lifetime_duration =

# The maximum lifetime (duration) an authenticated user can be logged in since login time before being required to login. Default is 30 days (30d). This setting should be expressed as a duration, e.g. 5m (minutes), 6h (hours), 10d (days), 2w (weeks), 1M (month).
login_maximum_lifetime_duration =

# How often should auth tokens be rotated for authenticated users when being active. The default is each 10 minutes.
token_rotation_interval_minutes = 10

# Set to true to disable (hide) the login form, useful if you use OAuth
disable_login_form = false

# Set to true to disable the sign out link in the side menu. Useful if you use auth.proxy or auth.jwt.
disable_signout_menu = false

# URL to redirect the user to after sign out
signout_redirect_url =

# Set to true to attempt login with OAuth automatically, skipping the login screen.
# This setting is ignored if multiple OAuth providers are configured.
# Deprecated, use auto_login option for specific provider instead.
oauth_auto_login = false

# OAuth state max age cookie duration in seconds. Defaults to 600 seconds.
oauth_state_cookie_max_age = 600

# Sets a custom oAuth error message. This is useful if you need to point the users to a specific location for support.
oauth_login_error_message = oauth.login.error

# Minimum wait time in milliseconds for the server lock retry mechanism.
# The server lock retry mechanism is used to prevent multiple Grafana instances from
# simultaneously refreshing OAuth tokens. This mechanism waits at least this amount
# of time before retrying to acquire the server lock. There are 5 retries in total.
# The wait time between retries is calculated as random(n, n + 500)
oauth_refresh_token_server_lock_min_wait_ms = 1000

# limit of api_key seconds to live before expiration
api_key_max_seconds_to_live = -1

# Set to true to enable SigV4 authentication option for HTTP-based datasources
sigv4_auth_enabled = false

# Set to true to enable verbose logging of SigV4 request signing
sigv4_verbose_logging = false

# Set to true to enable Azure authentication option for HTTP-based datasources
azure_auth_enabled = false

# Use email lookup in addition to the unique ID provided by the IdP
oauth_allow_insecure_email_lookup = false

# Set to true to include id of identity as a response header
id_response_header_enabled = false

# Prefix used for the id response header, X-Grafana-Identity-Id
id_response_header_prefix = X-Grafana

# List of identity namespaces to add id response headers for, separated by space.
# Available namespaces are user, api-key and service-account.
# The header value will encode the namespace ("user:<id>", "api-key:<id>", "service-account:<id>")
id_response_header_namespaces = user api-key service-account

# Enables the use of managed service accounts for plugin authentication
# This feature currently **only supports single-organization deployments**
managed_service_accounts_enabled = false

#################################### SSO Settings ###########################
[sso_settings]
# interval for reloading the SSO Settings from the database
# useful in high availability setups running multiple Grafana instances
# set to 0 to disable this feature
reload_interval = 1m

# List of providers that can be configured through the SSO Settings API and UI.
configurable_providers = github gitlab google generic_oauth azuread okta

#################################### Anonymous Auth ######################
[auth.anonymous]
# enable anonymous access
enabled = false

# specify organization name that should be used for unauthenticated users
org_name = Main Org.

# specify role for unauthenticated users
org_role = Viewer

# mask the Grafana version number for unauthenticated users
hide_version = false

# number of devices in total
device_limit =

#################################### GitHub Auth #########################
[auth.github]
name = GitHub
icon = github
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email,read:org
auth_url = https://github.com/login/oauth/authorize
token_url = https://github.com/login/oauth/access_token
api_url = https://api.github.com/user
signout_redirect_url =
allowed_domains =
team_ids =
allowed_organizations =
role_attribute_path =
role_attribute_strict = false
org_mapping =
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
# GitHub OAuth apps does not provide refresh tokens and the access tokens never expires.
use_refresh_token = false

#################################### GitLab Auth #########################
[auth.gitlab]
name = GitLab
icon = gitlab
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = openid email profile
auth_url = https://gitlab.com/oauth/authorize
token_url = https://gitlab.com/oauth/token
api_url = https://gitlab.com/api/v4
signout_redirect_url =
allowed_domains =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
org_mapping =
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = true

#################################### Google Auth #########################
[auth.google]
name = Google
icon = google
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_client_id
client_secret =
scopes = openid email profile
auth_url = https://accounts.google.com/o/oauth2/v2/auth
token_url = https://oauth2.googleapis.com/token
api_url = https://openidconnect.googleapis.com/v1/userinfo
signout_redirect_url =
allowed_domains =
validate_hd = true
hosted_domain =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
org_mapping =
allow_assign_grafana_admin = false
skip_org_role_sync = true
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = true

#################################### Grafana.com Auth ####################
# legacy key names (so they work in env variables)
[auth.grafananet]
enabled = false
allow_sign_up = true
client_id = some_id
client_secret =
scopes = user:email
allowed_organizations =
use_refresh_token = false

[auth.grafana_com]
name = Grafana.com
icon = grafana
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email
allowed_organizations =
skip_org_role_sync = false
use_refresh_token = false

#################################### Azure AD OAuth #######################
[auth.azuread]
name = Microsoft
icon = microsoft
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_client_id
client_secret =
scopes = openid email profile
auth_url = https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/authorize
token_url = https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/token
signout_redirect_url =
allowed_domains =
allowed_groups =
allowed_organizations =
role_attribute_strict = false
org_mapping =
allow_assign_grafana_admin = false
force_use_graph_api = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
skip_org_role_sync = false
use_refresh_token = true

#################################### Okta OAuth #######################
[auth.okta]
name = Okta
icon = okta
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = openid profile email groups
auth_url = https://<tenant-id>.okta.com/oauth2/v1/authorize
token_url = https://<tenant-id>.okta.com/oauth2/v1/token
api_url = https://<tenant-id>.okta.com/oauth2/v1/userinfo
signout_redirect_url =
allowed_domains =
allowed_groups =
role_attribute_path =
role_attribute_strict = false
org_attribute_path =
org_mapping =
allow_assign_grafana_admin = false
skip_org_role_sync = false
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = true
use_refresh_token = false

#################################### Generic OAuth #######################
[auth.generic_oauth]
name = OAuth
icon = signin
enabled = false
allow_sign_up = true
auto_login = false
client_id = some_id
client_secret =
scopes = user:email
empty_scopes = false
email_attribute_name = email:primary
email_attribute_path =
login_attribute_path =
name_attribute_path =
role_attribute_path =
role_attribute_strict = false
org_attribute_path =
org_mapping =
groups_attribute_path =
id_token_attribute_name =
team_ids_attribute_path =
auth_url =
token_url =
api_url =
signout_redirect_url =
teams_url =
allowed_domains =
allowed_groups =
team_ids =
allowed_organizations =
tls_skip_verify_insecure = false
tls_client_cert =
tls_client_key =
tls_client_ca =
use_pkce = false
auth_style =
allow_assign_grafana_admin = false
skip_org_role_sync = false
use_refresh_token = false

#################################### Basic Auth ##########################
[auth.basic]
enabled = true
# This setting will enable a stronger password policy for user's password under basic auth.
# The password will need to comply with the following password policy
# 1. Have a minimum of 12 characters
# 2. Composed by at least 1 uppercase character
# 3. Composed by at least 1 lowercase character
# 4. Composed by at least 1 digit character
# 5. Composed by at least 1 symbol character
password_policy = false

#################################### Auth Proxy ##########################
[auth.proxy]
enabled = false
header_name = X-WEBAUTH-USER
header_property = username
auto_sign_up = true
sync_ttl = 15
whitelist =
headers =
headers_encoded = false
enable_login_token = false

#################################### Auth JWT ##########################
[auth.jwt]
enabled = false
enable_login_token = false
header_name =
email_claim =
username_claim =
email_attribute_path =
username_attribute_path =
jwk_set_url =
jwk_set_file =
cache_ttl = 60m
expect_claims = {}
key_file =
key_id =
role_attribute_path =
role_attribute_strict = false
groups_attribute_path =
auto_sign_up = false
url_login = false
allow_assign_grafana_admin = false
skip_org_role_sync = false

#################################### Auth LDAP ###########################
[auth.ldap]
enabled = false
config_file = /etc/grafana/ldap.toml
allow_sign_up = true
skip_org_role_sync = false

# LDAP background sync (Enterprise only)
# At 1 am every day
sync_cron = "0 1 * * *"
active_sync_enabled = true

#################################### AWS #####################################
[aws]
# Enter a comma-separated list of allowed AWS authentication providers.
# Options are: default (AWS SDK Default), keys (Access && secret key), credentials (Credentials field), ec2_iam_role (EC2 IAM Role)
allowed_auth_providers = default,keys,credentials

# Allow AWS users to assume a role using temporary security credentials.
# If true, assume role will be enabled for all AWS authentication providers that are specified in aws_auth_providers
assume_role_enabled = true

# Specify max no of pages to be returned by the ListMetricPages API
list_metrics_page_limit = 500

# Experimental, for use in Grafana Cloud only. Please do not set.
external_id =

# Sets the expiry duration of an assumed role.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
session_duration = "15m"

# Set the plugins that will receive AWS settings for each request (via plugin context)
# By default this will include all Grafana Labs owned AWS plugins, or those that make use of AWS settings (ElasticSearch, Prometheus).
forward_settings_to_plugins = cloudwatch, grafana-athena-datasource, grafana-redshift-datasource, grafana-x-ray-datasource, grafana-timestream-datasource, grafana-iot-sitewise-datasource, grafana-iot-twinmaker-app, grafana-opensearch-datasource, aws-datasource-provisioner, elasticsearch, prometheus

#################################### Azure ###############################
[azure]
# Azure cloud environment where Grafana is hosted
# Possible values are AzureCloud, AzureChinaCloud, AzureUSGovernment and AzureGermanCloud
# Default value is AzureCloud (i.e. public cloud)
cloud = AzureCloud

# A customized list of Azure cloud settings and properties, used by data sources which need this information when run in non-standard azure environments
# When specified, this list will replace the default cloud list of AzureCloud, AzureChinaCloud, AzureUSGovernment and AzureGermanCloud
clouds_config =

# Specifies whether Grafana hosted in Azure service with Managed Identity configured (e.g. Azure Virtual Machines instance)
# If enabled, the managed identity can be used for authentication of Grafana in Azure services
# Disabled by default, needs to be explicitly enabled
managed_identity_enabled = false

# Client ID to use for user-assigned managed identity
# Should be set for user-assigned identity and should be empty for system-assigned identity
managed_identity_client_id =

# Specifies whether Azure AD Workload Identity authentication should be enabled in datasources that support it
# For more documentation on Azure AD Workload Identity, review this documentation:
# https://azure.github.io/azure-workload-identity/docs/
# Disabled by default, needs to be explicitly enabled
workload_identity_enabled = false

# Tenant ID of the Azure AD Workload Identity
# Allows to override default tenant ID of the Azure AD identity associated with the Kubernetes service account
workload_identity_tenant_id =

# Client ID of the Azure AD Workload Identity
# Allows to override default client ID of the Azure AD identity associated with the Kubernetes service account
workload_identity_client_id =

# Custom path to token file for the Azure AD Workload Identity
# Allows to set a custom path to the projected service account token file
workload_identity_token_file =

# Specifies whether user identity authentication (on behalf of currently signed-in user) should be enabled in datasources
# that support it (requires AAD authentication)
# Disabled by default, needs to be explicitly enabled
user_identity_enabled = false

# Specifies whether user identity authentication fallback credentials should be enabled in data sources
# Enabling this allows data source creators to provide fallback credentials for backend initiated requests
# e.g. alerting, recorded queries etc.
# Enabled by default, needs to be explicitly disabled
# Will not have any effect if user identity is disabled above
user_identity_fallback_credentials_enabled = true

# Override token URL for Azure Active Directory
# By default is the same as token URL configured for AAD authentication settings
user_identity_token_url =

# Override ADD application ID which would be used to exchange users token to an access token for the datasource
# By default is the same as used in AAD authentication or can be set to another application (for OBO flow)
user_identity_client_id =

# Override the AAD application client secret
# By default is the same as used in AAD authentication or can be set to another application (for OBO flow)
user_identity_client_secret =

# Allows the usage of a custom token request assertion when Grafana is behind an authentication proxy
# In most cases this will not need to be used. To enable this set the value to "username"
# The default is empty and any other value will not enable this functionality
username_assertion =

# Set the plugins that will receive Azure settings for each request (via plugin context)
# By default this will include all Grafana Labs owned Azure plugins, or those that make use of Azure settings (Azure Monitor, Azure Data Explorer, Prometheus, MSSQL).
forward_settings_to_plugins = grafana-azure-monitor-datasource, prometheus, grafana-azure-data-explorer-datasource, mssql

# Specifies whether Entra password auth can be used for the MSSQL data source
# Disabled by default, needs to be explicitly enabled
azure_entra_password_credentials_enabled = false

#################################### Role-based Access Control ###########
[rbac]
# If enabled, cache permissions in a in memory cache
permission_cache = true

# Reset basic roles permissions on boot
# Warning left to true, basic roles permissions will be reset on every boot
reset_basic_roles = false

# Validate permissions' action and scope on role creation and update
permission_validation_enabled = true

#################################### SMTP / Emailing #####################
[smtp]
enabled = false
host = localhost:25
user =
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password =
cert_file =
key_file =
skip_verify = false
from_address = admin@grafana.localhost
from_name = Grafana
ehlo_identity =
startTLS_policy =
enable_tracing = false

[smtp.static_headers]
# Include custom static headers in all outgoing emails

[emails]
welcome_email_on_sign_up = false
templates_pattern = emails/*.html, emails/*.txt
content_types = text/html

#################################### Logging ##########################
[log]
# Either "console", "file", "syslog". Default is console and file
# Use space to separate multiple modes, e.g. "console file"
mode = console file

# Either "debug", "info", "warn", "error", "critical", default is "info"
level = info

# optional settings to set different levels for specific loggers. Ex filters = sqlstore:debug
filters =

# Set the default error message shown to users. This message is displayed instead of sensitive backend errors which should be obfuscated.
user_facing_default_error = "please inspect Grafana server log for details"

# For "console" mode only
[log.console]
level =

# log line format, valid options are text, console and json
format = console

# For "file" mode only
[log.file]
level =

# log line format, valid options are text, console and json
format = text

# This enables automated log rotate(switch of following options), default is true
log_rotate = true

# Max line number of single file, default is 1000000
max_lines = 1000000

# Max size shift of single file, default is 28 means 1 << 28, 256MB
max_size_shift = 28

# Segment log daily, default is true
daily_rotate = true

# Expired days of log file(delete after max days), default is 7
max_days = 7

[log.syslog]
level =

# log line format, valid options are text, console and json
format = text

# Syslog network type and address. This can be udp, tcp, or unix. If left blank, the default unix endpoints will be used.
network =
address =

# Syslog facility. user, daemon and local0 through local7 are valid.
facility =

# Syslog tag. By default, the process' argv[0] is used.
tag =

[log.frontend]
# Should Faro javascript agent be initialized
enabled = false

# Custom HTTP endpoint to send events to. Default will log the events to stdout.
custom_endpoint =

# Requests per second limit enforced per an extended period, for Grafana backend log ingestion endpoint (/log).
log_endpoint_requests_per_second_limit = 3

# Max requests accepted per short interval of time for Grafana backend log ingestion endpoint (/log)
log_endpoint_burst_limit = 15

# Should error instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_errors_enabled = true

# Should console instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_console_enabled = false

# Should webvitals instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_webvitals_enabled = false

# Should tracing instrumentation be enabled, only affects Grafana Javascript Agent
instrumentations_tracing_enabled = false

# level of internal logging for debugging Grafana Javascript Agent.
# possible values are: 0 = OFF, 1 = ERROR, 2 = WARN, 3 = INFO, 4 = VERBOSE
# more details: https://github.com/grafana/faro-web-sdk/blob/v1.3.7/docs/sources/tutorials/quick-start-browser.md#how-to-activate-debugging
internal_logger_level = 0

# Api Key, only applies to Grafana Javascript Agent provider
api_key =

#################################### Usage Quotas ########################
[quota]
enabled = false

#### set quotas to -1 to make unlimited. ####
# limit number of users per Org.
org_user = 10

# limit number of dashboards per Org.
org_dashboard = 100

# limit number of data_sources per Org.
org_data_source = 10

# limit number of api_keys per Org.
org_api_key = 10

# limit number of alerts per Org.
org_alert_rule = 100

# limit number of orgs a user can create.
user_org = 10

# Global limit of users.
global_user = -1

# global limit of orgs.
global_org = -1

# global limit of dashboards
global_dashboard = -1

# global limit of api_keys
global_api_key = -1

# global limit on number of logged in users.
global_session = -1

# global limit of alerts
global_alert_rule = -1

# global limit of files uploaded to the SQL DB
global_file = 1000

# global limit of correlations
global_correlations = -1

# Limit of the number of alert rules per rule group.
# This is not strictly enforced yet, but will be enforced over time.
alerting_rule_group_rules = 100

# Limit the number of query evaluation results per alert rule.
# If the condition query of an alert rule produces more results than this limit,
# the evaluation results in an error.
alerting_rule_evaluation_results = -1

#################################### Unified Alerting ####################
[unified_alerting]
# Enable the Alerting sub-system and interface.
enabled =

# Comma-separated list of organization IDs for which to disable unified alerting. Only supported if unified alerting is enabled.
disabled_orgs =

# Specify the frequency of polling for admin config changes.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
admin_config_poll_interval = 60s

# Specify the frequency of polling for Alertmanager config changes.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
alertmanager_config_poll_interval = 60s

# Maximum number of active and pending silences that a tenant can have at once. Default: 0 (no limit).
alertmanager_max_silences_count =

# Maximum silence size in bytes. Default: 0 (no limit).
alertmanager_max_silence_size_bytes =

# Set to true when using redis in cluster mode.
ha_redis_cluster_mode_enabled = false

# The redis server address(es) that should be connected to.
# Can either be a single address, or if using redis in cluster mode,
# the cluster configuration address or a comma-separated list of addresses.
ha_redis_address =

# The username that should be used to authenticate with the redis server.
ha_redis_username =

# The password that should be used to authenticate with the redis server.
ha_redis_password =

# The redis database, by default it's 0.
ha_redis_db =

# A prefix that is used for every key or channel that is created on the redis server
# as part of HA for alerting.
ha_redis_prefix =

# The name of the cluster peer that will be used as identifier. If none is
# provided, a random one will be generated.
ha_redis_peer_name =

# The maximum number of simultaneous redis connections.
ha_redis_max_conns = 5

# Enable TLS on the client used to communicate with the redis server. This should be set to true
# if using any of the other ha_redis_tls_* fields.
ha_redis_tls_enabled = false

# Path to the PEM-encoded TLS client certificate file used to authenticate with the redis server.
# Required if using Mutual TLS.
ha_redis_tls_cert_path =

# Path to the PEM-encoded TLS private key file. Also requires the client certificate to be configured.
# Required if using Mutual TLS.
ha_redis_tls_key_path =

# Path to the PEM-encoded CA certificates file. If not set, the host's root CA certificates are used.
ha_redis_tls_ca_path =

# Overrides the expected name of the redis server certificate.
ha_redis_tls_server_name =

# Skips validating the redis server certificate.
ha_redis_tls_insecure_skip_verify =

# Overrides the default TLS cipher suite list.
ha_redis_tls_cipher_suites =

# Overrides the default minimum TLS version.
# Allowed values: VersionTLS10, VersionTLS11, VersionTLS12, VersionTLS13
ha_redis_tls_min_version =

# Listen address/hostname and port to receive unified alerting messages for other Grafana instances. The port is used for both TCP and UDP. It is assumed other Grafana instances are also running on the same port.
ha_listen_address = "0.0.0.0:9094"

# Explicit address/hostname and port to advertise other Grafana instances. The port is used for both TCP and UDP.
ha_advertise_address = ""

# Comma-separated list of initial instances (in a format of host:port) that will form the HA cluster. Configuring this setting will enable High Availability mode for alerting.
ha_peers = ""

# Time to wait for an instance to send a notification via the Alertmanager. In HA, each Grafana instance will
# be assigned a position (e.g. 0, 1). We then multiply this position with the timeout to indicate how long should
# each instance wait before sending the notification to take into account replication lag.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_peer_timeout = 15s

# The label is an optional string to include on each packet and stream.
# It uniquely identifies the cluster and prevents cross-communication
# issues when sending gossip messages in an enviromenet with multiple clusters.
ha_label =

# The interval between sending gossip messages. By lowering this value (more frequent) gossip messages are propagated
# across cluster more quickly at the expense of increased bandwidth usage.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_gossip_interval = 200ms

# Length of time to attempt to reconnect to a lost peer. Recommended to be short (<15m) when Grafana is running in a Kubernetes cluster.
# The string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_reconnect_timeout = 6h

# The interval between gossip full state syncs. Setting this interval lower (more frequent) will increase convergence speeds
# across larger clusters at the expense of increased bandwidth usage.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
ha_push_pull_interval = 60s

# Enable or disable alerting rule execution. The alerting UI remains visible.
execute_alerts = true

# Alert evaluation timeout when fetching data from the datasource.
# The timeout string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
evaluation_timeout = 30s

# Number of times we'll attempt to evaluate an alert rule before giving up on that evaluation. The default value is 1.
max_attempts = 1

# Minimum interval to enforce between rule evaluations. Rules will be adjusted if they are less than this value or if they are not multiple of the scheduler interval (10s). Higher values can help with resource management as we'll schedule fewer evaluations over time.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
min_interval = 10s

# This is an experimental option to add parallelization to saving alert states in the database.
# It configures the maximum number of concurrent queries per rule evaluated. The default value is 1
# (concurrent queries per rule disabled).
max_state_save_concurrency = 1

# If the feature flag 'alertingSaveStatePeriodic' is enabled, this is the interval that is used to persist the alerting instances to the database.
# The interval string is a possibly signed sequence of decimal numbers, followed by a unit suffix (ms, s, m, h, d), e.g. 30s or 1m.
state_periodic_save_interval = 5m

# Disables the smoothing of alert evaluations across their evaluation window.
# Rules will evaluate in sync.
disable_jitter = false

# Retention period for Alertmanager notification log entries.
notification_log_retention = 5d

# Duration for which a resolved alert state transition will continue to be sent to the Alertmanager.
resolved_alert_retention = 15m

# Defines the limit of how many alert rule versions
# should be stored in the database for each alert rule in an organization including the current one.
# 0 value means no limit
rule_version_record_limit = 0

[unified_alerting.screenshots]
# Enable screenshots in notifications. You must have either installed the Grafana image rendering
# plugin, or set up Grafana to use a remote rendering service.
# For more information on configuration options, refer to [rendering].
capture = false

# The timeout for capturing screenshots. If a screenshot cannot be captured within the timeout then
# the notification is sent without a screenshot. The maximum duration is 30 seconds. This timeout
# should be less than the minimum Interval of all Evaluation Groups to avoid back pressure on alert
# rule evaluation.
capture_timeout = 10s

# The maximum number of screenshots that can be taken at the same time. This option is different from
# concurrent_render_request_limit as max_concurrent_screenshots sets the number of concurrent screenshots
# that can be taken at the same time for all firing alerts where as concurrent_render_request_limit sets
# the total number of concurrent screenshots across all Grafana services.
max_concurrent_screenshots = 5

# Uploads screenshots to the local Grafana server or remote storage such as Azure, S3 and GCS. Please
# see [external_image_storage] for further configuration options. If this option is false then
# screenshots will be persisted to disk for up to temp_data_lifetime.
upload_external_image_storage = false

[unified_alerting.reserved_labels]
# Comma-separated list of reserved labels added by the Grafana Alerting engine that should be disabled.
# For example: `disabled_labels=grafana_folder`
disabled_labels =

[unified_alerting.state_history]
# Enable the state history functionality in Unified Alerting. The previous states of alert rules will be visible in panels and in the UI.
enabled = true

# Select which pluggable state history backend to use. Either "annotations", "loki", or "multiple"
# "loki" writes state history to an external Loki instance. "multiple" allows history to be written to multiple backends at once.
# Defaults to "annotations".
backend =

# For "multiple" only.
# Indicates the main backend used to serve state history queries.
# Either "annotations" or "loki"
primary =

# For "multiple" only.
# Comma-separated list of additional backends to write state history data to.
secondaries =

# For "loki" only.
# URL of the external Loki instance.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_url =

# For "loki" only.
# URL of the external Loki's read path. To be used in configurations where Loki has separated read and write URLs.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_read_url =

# For "loki" only.
# URL of the external Loki's write path. To be used in configurations where Loki has separated read and write URLs.
# Either "loki_remote_url", or both of "loki_remote_read_url" and "loki_remote_write_url" is required for the "loki" backend.
loki_remote_write_url =

# For "loki" only.
# Optional tenant ID to attach to requests sent to Loki.
loki_tenant_id =

# For "loki" only.
# Optional username for basic authentication on requests sent to Loki. Can be left blank to disable basic auth.
loki_basic_auth_username =

# For "loki" only.
# Optional password for basic authentication on requests sent to Loki. Can be left blank.
loki_basic_auth_password =

# For "loki" only.
# Optional max query length for queries sent to Loki. Default is 721h which matches the default Loki value.
loki_max_query_length = 721h

# For "loki" only.
# Maximum size in bytes for queries sent to Loki. This limit is applied to user provided filters as well as system defined ones, e.g. applied by access control.
# If filter exceeds the limit, API returns error with code "alerting.state-history.loki.requestTooLong".
# Default is 64kb
loki_max_query_size = 65536

[unified_alerting.state_history.external_labels]
# Optional extra labels to attach to outbound state history records or log streams.
# Any number of label key-value-pairs can be provided.
#
# ex.
# mylabelkey = mylabelvalue

[unified_alerting.state_history.annotations]
# Controls retention of annotations automatically created while evaluating alert rules.
# Alert state history backend must be configured to be annotations (see setting [unified_alerting.state_history].backend).

# Configures how long alert annotations are stored for. Default is 0, which keeps them forever.
# This setting should be expressed as a duration. Ex 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_age =

# Configures max number of alert annotations that Grafana stores. Default value is 0, which keeps all alert annotations.
max_annotations_to_keep =

[recording_rules]
# Enable recording rules. You must provide write credentials below.
enabled = false

# Target URL (including write path) for recording rules.
url =

# Optional username for basic authentication on recording rule write requests. Can be left blank to disable basic auth
basic_auth_username =

# Optional assword for basic authentication on recording rule write requests. Can be left blank.
basic_auth_password =

# Request timeout for recording rule writes.
timeout = 10s

# Optional custom headers to include in recording rule write requests.
[recording_rules.custom_headers]
# exampleHeader = exampleValue

# NOTE: this configuration options are not used yet.
[remote.alertmanager]

# Enable the use of the configured remote Alertmanager and disable the internal one.
# The default value is `false`.
enabled = false

# URL of the remote Alertmanager that will replace the internal one.
# This URL should be the root path, Grafana will automatically append an "/alertmanager" suffix for certain HTTP calls.
# Required if `enabled` is set to `true`.
url =

# Tenant ID to use in requests to the Alertmanager.
# It will also be used for the basic auth username if a password is configured.
tenant =

# Optional password for basic authentication.
# If not present, the tenant ID will be set in the X-Scope-OrgID header.
password =

sync_interval = 5m

#################################### Annotations #########################
[annotations]
# Configures the batch size for the annotation clean-up job. This setting is used for dashboard, API, and alert annotations.
cleanupjob_batchsize = 100

# Enforces the maximum allowed length of the tags for any newly introduced annotations. It can be between 500 and 4096 inclusive (which is the respective's column length). Default value is 500.
# Setting it to a higher value would impact performance therefore is not recommended.
tags_length = 500

[annotations.dashboard]
# Dashboard annotations means that annotations are associated with the dashboard they are created on.

# Configures how long dashboard annotations are stored. Default is 0, which keeps them forever.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_age =

# Configures max number of dashboard annotations that Grafana stores. Default value is 0, which keeps all dashboard annotations.
max_annotations_to_keep =

[annotations.api]
# API annotations means that the annotations have been created using the API without any
# association with a dashboard.

# Configures how long Grafana stores API annotations. Default is 0, which keeps them forever.
# This setting should be expressed as a duration. Examples: 6h (hours), 10d (days), 2w (weeks), 1M (month).
max_age =

# Configures max number of API annotations that Grafana keeps. Default value is 0, which keeps all API annotations.
max_annotations_to_keep =

#################################### Explore #############################
[explore]
# Enable the Explore section
enabled = true

# set the default offset for the time picker
defaultTimeOffset = 1h

#################################### Help #############################
[help]
# Enable the Help section
enabled = true

#################################### Profile #############################
[profile]
# Enable the Profile section
enabled = true

#################################### News #############################
[news]
# Enable the news feed section
news_feed_enabled = true

#################################### Query #############################
[query]
# Set the number of data source queries that can be executed concurrently in mixed queries. Default is the number of CPUs.
concurrent_query_limit =

#################################### Query History #############################
[query_history]
# Enable the Query history
enabled = true

#################################### Short Links #############################
[short_links]
# Short links which are never accessed will be deleted as cleanup. Time is in days. Default is 7 days. Max is 365. 0 means they will be deleted approximately every 10 minutes.
expire_time = 7

#################################### Internal Grafana Metrics ############
# Metrics available at HTTP URL /metrics and /metrics/plugins/:pluginId
[metrics]
enabled = true
interval_seconds = 10
# Disable total stats (stat_totals_*) metrics to be generated
disable_total_stats = false
# The interval at which the total stats collector will update the stats. Default is 1800 seconds.
total_stats_collector_interval_seconds = 1800

#If both are set, basic auth will be required for the metrics endpoints.
basic_auth_username =
basic_auth_password =

# Metrics environment info adds dimensions to the `grafana_environment_info` metric, which
# can expose more information about the Grafana instance.
[metrics.environment_info]
#exampleLabel1 = exampleValue1
#exampleLabel2 = exampleValue2

# Send internal Grafana metrics to graphite
[metrics.graphite]
# Enable by setting the address setting (ex localhost:2003)
address =
prefix = prod.grafana.%(instance_name)s.

#################################### Grafana.com integration  ##########################
[grafana_net]
url = https://grafana.com

[grafana_com]
url = https://grafana.com
api_url = https://grafana.com/api
sso_api_token = ""

#################################### Distributed tracing ############
# Opentracing is deprecated use opentelemetry instead
[tracing.jaeger]
# jaeger destination (ex localhost:6831)
address =
# tag that will always be included in when creating new spans. ex (tag1:value1,tag2:value2)
always_included_tag =
# Type specifies the type of the sampler: const, probabilistic, rateLimiting, or remote
sampler_type = const
# jaeger samplerconfig param
# for "const" sampler, 0 or 1 for always false/true respectively
# for "probabilistic" sampler, a probability between 0 and 1
# for "rateLimiting" sampler, the number of spans per second
# for "remote" sampler, param is the same as for "probabilistic"
# and indicates the initial sampling rate before the actual one
# is received from the mothership
sampler_param = 1
# sampling_server_url is the URL of a sampling manager providing a sampling strategy.
sampling_server_url =
# Whether or not to use Zipkin span propagation (x-b3- HTTP headers).
zipkin_propagation = false
# Setting this to true disables shared RPC spans.
# Not disabling is the most common setting when using Zipkin elsewhere in your infrastructure.
disable_shared_zipkin_spans = false

[tracing.opentelemetry]

# attributes that will always be included in when creating new spans. ex (key1:value1,key2:value2)
custom_attributes =
# Type specifies the type of the sampler: const, probabilistic, rateLimiting, or remote
sampler_type =
# Sampler configuration parameter
# for "const" sampler, 0 or 1 for always false/true respectively
# for "probabilistic" sampler, a probability between 0.0 and 1.0
# for "rateLimiting" sampler, the number of spans per second
# for "remote" sampler, param is the same as for "probabilistic"
#   and indicates the initial sampling rate before the actual one
#   is received from the sampling server (set at sampling_server_url)
sampler_param =
# specifies the URL of the sampling server when sampler_type is remote
sampling_server_url =

[tracing.opentelemetry.jaeger]
# jaeger destination (ex http://localhost:14268/api/traces)
address =
# Propagation specifies the text map propagation format: w3c, jaeger
propagation =

# This is a configuration for OTLP exporter with GRPC protocol
[tracing.opentelemetry.otlp]
# otlp destination (ex localhost:4317)
address =
# Propagation specifies the text map propagation format: w3c, jaeger
propagation =

#################################### External Image Storage ##############
[external_image_storage]
# Used for uploading images to public servers so they can be included in slack/email messages.
# You can choose between (s3, webdav, gcs, azure_blob, local)
provider =

[external_image_storage.s3]
endpoint =
path_style_access =
bucket_url =
bucket =
region =
path =
access_key =
secret_key =

[external_image_storage.webdav]
url =
username =
password =
public_url =

[external_image_storage.gcs]
key_file =
bucket =
path =
enable_signed_urls = false
signed_url_expiration =

[external_image_storage.azure_blob]
account_name =
account_key =
container_name =
sas_token_expiration_days =

[external_image_storage.local]
# does not require any configuration

[rendering]
# Options to configure a remote HTTP image rendering service, e.g. using https://github.com/grafana/grafana-image-renderer.
# URL to a remote HTTP image renderer service, e.g. http://localhost:8081/render, will enable Grafana to render panels and dashboards to PNG-images using HTTP requests to an external service.
server_url =
# If the remote HTTP image renderer service runs on a different server than the Grafana server you may have to configure this to a URL where Grafana is reachable, e.g. http://grafana.domain/.
callback_url =
# An auth token that will be sent to and verified by the renderer. The renderer will deny any request without an auth token matching the one configured on the renderer side.
renderer_token = -
# Concurrent render request limit affects when the /render HTTP endpoint is used. Rendering many images at the same time can overload the server,
# which this setting can help protect against by only allowing a certain amount of concurrent requests.
concurrent_render_request_limit = 30
# Determines the lifetime of the render key used by the image renderer to access and render Grafana.
# This setting should be expressed as a duration. Examples: 10s (seconds), 5m (minutes), 2h (hours).
# Default is 5m. This should be more than enough for most deployments.
# Change the value only if image rendering is failing and you see `Failed to get the render key from cache` in Grafana logs.
render_key_lifetime = 5m
# Default width for panel screenshot
default_image_width = 1000
# Default height for panel screenshot
default_image_height = 500
# Default scale for panel screenshot
default_image_scale = 1

[panels]
# here for to support old env variables, can remove after a few months
enable_alpha = false
disable_sanitize_html = false

[plugins]
enable_alpha = false
app_tls_skip_verify_insecure = false
# Enter a comma-separated list of plugin identifiers to identify plugins to load even if they are unsigned. Plugins with modified signatures are never loaded.
allow_loading_unsigned_plugins =
# Enable or disable installing / uninstalling / updating plugins directly from within Grafana.
plugin_admin_enabled = true
plugin_admin_external_manage_enabled = false
plugin_catalog_url = https://grafana.com/grafana/plugins/
# Enter a comma-separated list of plugin identifiers to hide in the plugin catalog.
plugin_catalog_hidden_plugins =
# Log all backend requests for core and external plugins.
log_backend_requests = false
# Disable download of the public key for verifying plugin signature.
public_key_retrieval_disabled = false
# Force download of the public key for verifying plugin signature on startup. If disabled, the public key will be retrieved every 10 days.
# Requires public_key_retrieval_disabled to be false to have any effect.
public_key_retrieval_on_startup = false
# Enter a comma-separated list of plugin identifiers to avoid loading (including core plugins). These plugins will be hidden in the catalog.
disable_plugins =
# Auth token for plugin installations and removal in managed instances
install_token =
# Comma separated list of plugin ids for which angular deprecation UI should be disabled
hide_angular_deprecation =
# Comma separated list of plugin ids for which environment variables should be forwarded. Used only when feature flag pluginsSkipHostEnvVars is enabled.
forward_host_env_vars =
# Comma separated list of plugin ids to install as part of the startup process.
preinstall = grafana-lokiexplore-app
# Controls whether preinstall plugins asynchronously (in the background) or synchronously (blocking). Useful when preinstalled plugins are used with provisioning.
preinstall_async = true
# Disables preinstall feature. It has the same effect as setting preinstall to an empty list.
preinstall_disabled = false

#################################### Grafana Live ##########################################
[live]
# max_connections to Grafana Live WebSocket endpoint per Grafana server instance. See Grafana Live docs
# if you are planning to make it higher than default 100 since this can require some OS and infrastructure
# tuning. 0 disables Live, -1 means unlimited connections.
max_connections = 100

# allowed_origins is a comma-separated list of origins that can establish connection with Grafana Live.
# If not set then origin will be matched over root_url. Supports wildcard symbol "*".
allowed_origins =

# engine defines an HA (high availability) engine to use for Grafana Live. By default no engine used - in
# this case Live features work only on a single Grafana server.
# Available options: "redis".
# Setting ha_engine is an EXPERIMENTAL feature.
ha_engine =

# ha_engine_address sets a connection address for Live HA engine. Depending on engine type address format can differ.
# For now we only support Redis connection address in "host:port" format.
# This option is EXPERIMENTAL.
ha_engine_address = "127.0.0.1:6379"

# ha_engine_password allows setting an optional password to authenticate with the engine
ha_engine_password = ""

# ha_prefix is a prefix for keys in the HA engine. It's used to separate keys for different Grafana instances.
ha_prefix =

#################################### Grafana Image Renderer Plugin ##########################
[plugin.grafana-image-renderer]
# Instruct headless browser instance to use a default timezone when not provided by Grafana, e.g. when rendering panel image of alert.
# See ICU’s metaZones.txt (https://cs.chromium.org/chromium/src/third_party/icu/source/data/misc/metaZones.txt) for a list of supported
# timezone IDs. Fallbacks to TZ environment variable if not set.
rendering_timezone =

# Instruct headless browser instance to use a default language when not provided by Grafana, e.g. when rendering panel image of alert.
# Please refer to the HTTP header Accept-Language to understand how to format this value, e.g. 'fr-CH, fr;q=0.9, en;q=0.8, de;q=0.7, *;q=0.5'.
rendering_language =

# Instruct headless browser instance to use a default device scale factor when not provided by Grafana, e.g. when rendering panel image of alert.
# Default is 1. Using a higher value will produce more detailed images (higher DPI), but will require more disk space to store an image.
rendering_viewport_device_scale_factor =

# Instruct headless browser instance whether to ignore HTTPS errors during navigation. Per default HTTPS errors are not ignored. Due to
# the security risk it's not recommended to ignore HTTPS errors.
rendering_ignore_https_errors =

# Instruct headless browser instance whether to capture and log verbose information when rendering an image. Default is false and will
# only capture and log error messages. When enabled, debug messages are captured and logged as well.
# For the verbose information to be included in the Grafana server log you have to adjust the rendering log level to debug, configure
# [log].filter = rendering:debug.
rendering_verbose_logging =

# Instruct headless browser instance whether to output its debug and error messages into running process of remote rendering service.
# Default is false. This can be useful to enable (true) when troubleshooting.
rendering_dumpio =

# Instruct headless browser instance whether to register metrics for the duration of every rendering step. Default is false.
# This can be useful to enable (true) when optimizing the rendering mode settings to improve the plugin performance or when troubleshooting.
rendering_timing_metrics =

# Additional arguments to pass to the headless browser instance. Default is --no-sandbox. The list of Chromium flags can be found
# here (https://peter.sh/experiments/chromium-command-line-switches/). Multiple arguments is separated with comma-character.
rendering_args =

# You can configure the plugin to use a different browser binary instead of the pre-packaged version of Chromium.
# Please note that this is not recommended, since you may encounter problems if the installed version of Chrome/Chromium is not
# compatible with the plugin.
rendering_chrome_bin =

# Instruct how headless browser instances are created. Default is 'default' and will create a new browser instance on each request.
# Mode 'clustered' will make sure that only a maximum of browsers/incognito pages can execute concurrently.
# Mode 'reusable' will have one browser instance and will create a new incognito page on each request.
rendering_mode =

# When rendering_mode = clustered, you can instruct how many browsers or incognito pages can execute concurrently. Default is 'browser'
# and will cluster using browser instances.
# Mode 'context' will cluster using incognito pages.
rendering_clustering_mode =
# When rendering_mode = clustered, you can define the maximum number of browser instances/incognito pages that can execute concurrently. Default is '5'.
rendering_clustering_max_concurrency =
# When rendering_mode = clustered, you can specify the duration a rendering request can take before it will time out. Default is `30` seconds.
rendering_clustering_timeout =

# Limit the maximum viewport width, height and device scale factor that can be requested.
rendering_viewport_max_width =
rendering_viewport_max_height =
rendering_viewport_max_device_scale_factor =

# Change the listening host and port of the gRPC server. Default host is 127.0.0.1 and default port is 0 and will automatically assign
# a port not in use.
grpc_host =
grpc_port =

[enterprise]
license_path =

[feature_toggles]
# there are currently two ways to enable feature toggles in the `grafana.ini`.
# you can either pass an array of feature you want to enable to the `enable` field or
# configure each toggle by setting the name of the toggle to true/false. Toggles set to true/false
# will take precedence over toggles in the `enable` list.

# enable = feature1,feature2
enable =

# Some features are enabled by default, see:
# https://grafana.com/docs/grafana/next/setup-grafana/configure-grafana/feature-toggles/
# To enable features by default, set `Expression:  "true"` in:
# https://github.com/grafana/grafana/blob/main/pkg/services/featuremgmt/registry.go

# feature1 = true
# feature2 = false

[date_formats]
# For information on what formatting patterns that are supported https://momentjs.com/docs/#/displaying/

# Default system date format used in time range picker and other places where full time is displayed
full_date = YYYY-MM-DD HH:mm:ss

# Used by graph and other places where we only show small intervals
interval_second = HH:mm:ss
interval_minute = HH:mm
interval_hour = MM/DD HH:mm
interval_day = MM/DD
interval_month = YYYY-MM
interval_year = YYYY

# Experimental feature
use_browser_locale = false

# Default timezone for user preferences. Options are 'browser' for the browser local timezone or a timezone name from IANA Time Zone database, e.g. 'UTC' or 'Europe/Amsterdam' etc.
default_timezone = browser

[expressions]
# Enable or disable the expressions functionality.
enabled = true

[geomap]
# Set the JSON configuration for the default basemap
default_baselayer_config =

# Enable or disable loading other base map layers
enable_custom_baselayers = true

#################################### Support Bundles #####################################
[support_bundles]
# Enable support bundle creation (default: true)
enabled = true
# Only server admins can generate and view support bundles (default: true)
server_admin_only = true
# If set, bundles will be encrypted with the provided public keys separated by whitespace
public_keys = ""

#################################### Storage ################################################

[storage]
# Allow uploading SVG files without sanitization.
allow_unsanitized_svg_upload = false


#################################### Search ################################################

[search]
# Defines the number of dashboards loaded at once in a batch during a full reindex.
# This is a temporary settings that might be removed in the future.
dashboard_loading_batch_size = 200

# Defines the frequency of a full search reindex.
# This is a temporary settings that might be removed in the future.
full_reindex_interval = 5m

# Defines the frequency of partial index updates based on recent changes such as dashboard updates.
# This is a temporary settings that might be removed in the future.
index_update_interval = 10s


# Move an app plugin referenced by its id (including all its pages) to a specific navigation section
# Format: <Plugin ID> = <Section ID> <Sort Weight>
[navigation.app_sections]

# Move a specific app plugin page (referenced by its `path` field) to a specific navigation section
# Format: <Page URL> = <Section ID> <Sort Weight>
[navigation.app_standalone_pages]


#################################### Secure Socks5 Datasource Proxy #####################################
[secure_socks_datasource_proxy]
enabled = false
root_ca_cert =
client_key =
client_cert =
server_name =
# The address of the socks5 proxy datasources should connect to
proxy_address =
# Determines if the secure socks proxy should be shown on the datasources page, defaults to true if the feature is enabled
show_ui = true
# Disables TLS in the secure socks proxy
allow_insecure = false

################################## Feature Management ##############################################
# Options to configure the experimental Feature Toggle Admin Page feature, which is behind the `featureToggleAdminPage` feature toggle. Use at your own risk.
[feature_management]
# Allows editing of feature toggles in the feature management page
allow_editing = false

# Allow customization of URL for the controller that manages feature toggles
update_webhook =

# Allow configuring an auth token for feature management update requests
update_webhook_token =

# Hides specific feature toggles from the feature management page
hidden_toggles =

# Disables updating specific feature toggles in the feature management page
read_only_toggles =

#################################### Public Dashboards #####################################
[public_dashboards]
# Set to false to disable public dashboards
enabled = true

###################################### Cloud Migration ######################################
[cloud_migration]
# Set to true to enable target-side migration UI
is_target = false
# Token used to send requests to grafana com
gcom_api_token = ""
# How long to wait for a request sent to gms to start a snapshot to complete
start_snapshot_timeout = 5s
# How long to wait for a request sent to gms to validate a key to complete
validate_key_timeout = 5s
# How long to wait for a request sent to gms to get a snapshot status to complete
get_snapshot_status_timeout = 5s
# How long to wait for a request sent to gms to create a presigned upload url
create_upload_url_timeout = 5s
# How long to wait for a request sent to gms to report an event
report_event_timeout = 5s
# How long to wait for a request to fetch an instance to complete
fetch_instance_timeout = 5s
# How long to wait for a request to create an access policy to complete
create_access_policy_timeout = 5s
# How long to wait for a request to create to fetch an access policy to complete
fetch_access_policy_timeout = 5s
# How long to wait for a request to create to delete an access policy to complete
delete_access_policy_timeout = 5s
# The domain name used to access cms
domain = grafana.net
# Folder used to store snapshot files. Defaults to the home dir
snapshot_folder = ""
# Link to form to give feedback on the feature
feedback_url = https://docs.google.com/forms/d/e/1FAIpQLSeEE33vhbSpR8A8S1A1ocZ1ByVRRwiRl1GZr2FSrEer_tSa8w/viewform?usp=sf_link
# How frequently should the frontend UI poll for changes while resources are migrating
frontend_poll_interval = 2s

################################## Frontend development configuration ###################################
# Warning! Any settings placed in this section will be available on `process.env.frontend_dev_{foo}` within frontend code
# Any values placed here may be accessible to the UI. Do not place sensitive information here.
[frontend_dev]
# Should UI tests fail when console log/warn/erroring?
# Does not affect the result when running on CI - only for allowing devs to choose this behaviour locally
fail_tests_on_console = true
# Whether or not to enable the MSW mock API, which intercepts requests and returns mock data
# Should only be used for local development or demo purposes
mock_api = false
