<a name="ledger-sync--quick-books-online" />

# LedgerSync for QuickBooksOnline

[![Build Status](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online.svg?branch=master)](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online)
[![Gem Version](https://badge.fury.io/rb/ledger_sync-quickbooks_online.svg)](https://badge.fury.io/rb/ledger_sync-quickbooks_online)
[![Coverage Status](https://coveralls.io/repos/github/LedgerSync/ledger_sync-quickbooks_online/badge.svg?branch=master)](https://coveralls.io/github/LedgerSync/ledger_sync-quickbooks_online?branch=master)


<a name="ledger-sync--quick-books-online--join-the-conversation" />

## Join the Conversation

[Click here](https://join.slack.com/t/ledger-sync/shared_invite/zt-e5nbl8qc-eOA~5k7bg3p16_l3J7OS~Q) to join our public Slack group.


<a name="architecture" />

## Architecture

This gem is built on top of the core [LedgerSync](https://github.com/LedgerSync/ledger_sync) gem. If you are unfamiliar with the LedgerSync architecture, it is recommended to first read through the [LedgerSync documentation](https://github.com/LedgerSync/ledger_sync).

<a name="getting-started" />

## Installation

<a name="getting-started--installation--gemfile" />

### Gemfile

Add this line to your application’s Gemfile:

```
gem 'ledger_sync-quickbooks_online'
```

And then execute:
```
bundle
```

<a name="getting-started--installation--directly" />

### Directly

Or install it yourself as:

```
gem install ledger_sync-quickbooks_online
```

<a name="getting-started--oauth" />

## OAuth

QuickBooks Online utilizes OAuth 2.0, which requires frequent refreshing of the access and refresh token. The client will handle this automatically, attempting a single token refresh on any single request authentication failure due to an expired access token.

The `LedgerSync::QuickBooksOnline::Client` implements a `ledger_attributes_to_save` class method, which is an array of attributes that may change as the client is used (e.g. `access_token`).  You can also call the instance method `ledger_attributes_to_save` which will be a hash of these current values. It is a best practice to always store these attributes
if you are saving access tokens in your database.

Should you fail to save the current `refresh_token`, you will have to ask your user to reconnect to QuickBooks Online again.

<a name="getting-started--oauth--retrieveAccessToken" />

### Retrieve Access Token

The library contains a lightweight script that is helpful in retrieving and refreshing access tokens. It is particularly useful during development, when you do not have an application to handle the redirects and OAuth code exchange. To use, do the following:

1. Create a `.env.local` file in the library root.
2. Add values for `QUICKBOOKS_ONLINE_CLIENT_ID` and `QUICKBOOKS_ONLINE_CLIENT_SECRET` (you can copy `.env.test` as a template).
3. Ensure your developer application in [the QuickBooks Online developer portal](https://developer.intuit.com) contains this redirect URI: `http://localhost:5678` (note: no trailing slash and port configurable with `PORT` environment variable)
4. Run `ruby bin/quickbooks_online_oauth_server.rb` from the library root (note: it must run from the root in order to update `.env.local`).
5. Visit the URL output in the terminal.
6. Upon redirect back to `http://localhost:5678`, the new values will be printed to the console and saved back to your `.env.local`

<a name="getting-started--oauth--ledger-helper-methods" />

### Ledger Helper Methods

The client also implements some helper methods for getting tokens.  For example, you can set up a client using the following:

```ruby
# Retrieve the following values from Intuit app settings
client_id     = ENV['QUICKBOOKS_ONLINE_CLIENT_ID']
client_secret = ENV['QUICKBOOKS_ONLINE_CLIENT_SECRET']
redirect_uri  = 'http://localhost:3000'

oauth_client = LedgerSync::QuickBooksOnline::OAuthClientHelper.new(
  client_id: client_id,
  client_secret: client_secret
)

puts oauth_client.authorization_url(redirect_uri: redirect_uri)

# Visit on the output URL and authorize a company.
# You will be redirected back to the redirect_uri.
# Copy the full url from your browser:

uri = 'https://localhost:3000/?code=FOO&state=BAR&realm_id=BAZ'

client = LedgerSync::QuickBooksOnline::Client.new_from_oauth_client_uri(
  oauth_client: oauth_client,
  uri: uri
)

# You can test that the auth works:

client.refresh!
```

**Note: If you have a `.env.local` file storing your secrets, the client will automatically update the variables and record previous values whenever values change*

<a name="client" />

# Client

You can instantiate a client like so:

```ruby
client = LedgerSync::Ledgers::QuickBooksOnline::Client.new(
  access_token: access_token, # assuming this is defined
  client_id: ENV['QUICKBOOKS_ONLINE_CLIENT_ID'],
  client_secret: ENV['QUICKBOOKS_ONLINE_CLIENT_SECRET'],
  realm_id: ENV['QUICKBOOKS_ONLINE_REALM_ID'],
  refresh_token: refresh_token, # assuming this is defined
  update_dotenv: true # Optional: defaults to true
)
```

## `update_dotenv`

When `update_dotenv` is `true`, the library will automatically update your `.env.local` (or otherwise configured `.env` file).

When `update_dotenv` is `false`, you will need to manually save the refreshed attributes after each operation call. The `result` is the output of calling `operation.perform` and gives you access to the updated `client`. You can access the new values by doing the following:

```ruby
result.operation.client.ledger_attributes_to_save.each do |key, value|
  # save values
end
```

<a name="resources" />

# Resources

To see all the available resources, you can call `LedgerSync::QuickBooksOnline::Client.resources`, which will give you a hash of keys and resource classes.

## Resource Attributes


To see all the available attributes of a resource you can call the `resource_attributes` class method. For example, you can call `LedgerSync::QuickBooksOnline::Customer.resource_attributes`, which will return a `LedgerSync::ResourceAttributeSet`. This object allows you to see the attributes and the type of each attribute. For example, you can see the attribute `DisplayName` and its type by typing the following:

```bash
> LedgerSync::QuickBooksOnline::Customer.resource_attributes.attributes[:DisplayName]
=> #<LedgerSync::ResourceAttribute:0x00007fef3dafe568 @name=:DisplayName, @resource_class=LedgerSync::QuickBooksOnline::Customer, @type=#<LedgerSync::Type::String:0x00007fef3dafe540 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>
```
## Resource Operations


To see all the available operations for a given resource you can call the `operations` class method. For example, you can call `LedgerSync::QuickBooksOnline::Customer.operations`, which will return a hash of keys mapped to operation classes. For example, you can try the following:

```bash
> LedgerSync::QuickBooksOnline::Customer.operations
=> {:find=>LedgerSync::QuickBooksOnline::Customer::Operations::Find, :create=>LedgerSync::QuickBooksOnline::Customer::Operations::Create, :update=>LedgerSync::QuickBooksOnline::Customer::Operations::Update}
```

<a name="examples" />

# Examples

## Create a Customer

```ruby
client = LedgerSync::Ledgers::QuickBooksOnline::Client.new(
  access_token: access_token, # assuming this is defined
  client_id: ENV['QUICKBOOKS_ONLINE_CLIENT_ID'],
  client_secret: ENV['QUICKBOOKS_ONLINE_CLIENT_SECRET'],
  realm_id: ENV['QUICKBOOKS_ONLINE_REALM_ID'],
  refresh_token: refresh_token # assuming this is defined
)

resource = LedgerSync::Ledgers::QuickBooksOnline::Customer.new(
  DisplayName: 'Sample Customer',
  external_id: customer_external_id # A unique ID from your platform
)

operation = LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Create.new(
  client: client,
  resource: resource
)

result = operation.perform # Returns a LedgerSync::OperationResult

if result.success?
  resource = result.operation.resource
  # Do something with resource
else # result.failure?
  raise result.error
end

```

<a name="errors" />

# Errors

While LedgerSync tries to catch and translate errors, not all errors will be caught (e.g. new errors from the QuickBooks Online API).  In these cases, you can rescue a generic `LedgerSync::OperationError` and determine what to do based on the response body.

[QuickBooks Online Error Documentation](https://developer.intuit.com/app/developer/qbo/docs/develop/troubleshooting/error-codes)



<a name="ledger-sync--quick-books-online--license" />

## License

This gem and all code contained in the repository is licensed under the same license as the core [LedgerSync](https://github.com/LedgerSync/ledger_sync) license. You can view all license details in the [LedgerSync](https://github.com/LedgerSync/ledger_sync) repo.