<a name="ledger-sync--quick-books-online" />

# LedgerSync::QuickBooksOnline

[![Build Status](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online.svg?branch=master)](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online)
[![Gem Version](https://badge.fury.io/rb/ledger_sync-quickbooks_online.svg)](https://badge.fury.io/rb/ledger_sync-quickbooks_online)
[![Coverage Status](https://coveralls.io/repos/github/LedgerSync/ledger_sync-quickbooks_online/badge.svg?branch=master)](https://coveralls.io/github/LedgerSync/ledger_sync-quickbooks_online?branch=master)


<a name="ledger-sync--quick-books-online--join-the-conversation" />

## Join the Conversation

[Click here](https://join.slack.com/t/ledger-sync/shared_invite/zt-e5nbl8qc-eOA~5k7bg3p16_l3J7OS~Q) to join our public Slack group.

**Table of Content**
- [LedgerSync::QuickBooksOnline](#ledger-sync--quick-books-online)
    - [Join the Conversation](#ledger-sync--quick-books-online--join-the-conversation)
    - [Documentation](#ledger-sync--quick-books-online--documentation)
    - [License](#ledger-sync--quick-books-online--license)
    - [Maintainers](#ledger-sync--quick-books-online--maintainers)
- [Getting Started](#getting-started)
    - [Installation](#getting-started--installation)
        - [Gemfile](#getting-started--installation--gemfile)
        - [Directly](#getting-started--installation--directly)
    - [OAuth](#getting-started--oauth)
        - [Retrieve Access Token](#getting-started--oauth--retrieveAccessToken)
        - [Ledger Helper Methods](#getting-started--oauth--ledger-helper-methods)
- [Error](#errors)
- [Resources](#resources)
- [Architecture](#architecture)

<a name="ledger-sync--quick-books-online--documentation" />

## Documentation

The most up-to-date documentation can be found at [www.ledgersync.dev](http://www.ledgersync.dev)

<a name="ledger-sync--quick-books-online--license" />

## License

The gem is available as open source under the terms of the licenses detailed in `LICENSE.txt`.

<a name="ledger-sync--quick-books-online--maintainers" />

## Maintainers

A big thank you to our maintainers:

- [@ryanwjackson](https://github.com/ryanwjackson)
- [@jozefvaclavik](https://github.com/jozefvaclavik)
- [@SeanBolt](https://github.com/SeanBolt)
- And the whole [Modern Treasury](https://www.moderntreasury.com) team


<a name="getting-started" />

# Getting Started

<a name="getting-started--installation" />

## Installation

<a name="getting-started--installation--gemfile" />

### Gemfile
Add this line to your application’s Gemfile:
```
gem 'ledger_sync'
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
gem install ledger_sync
gem install ledger_sync-quickbooks_online
```


<a name="getting-started--oauth" />

## OAuth

QuickBooks Online utilizes OAuth 2.0, which requires frequent refreshing of the access token.  The client will handle this automatically, attempting a single token refresh on any single request authentication failure.  Depending on how you use the library, every client has implements a class method `ledger_attributes_to_save`, which is an array of attributes that may change as the client is used.  You can also call the instance method `ledger_attributes_to_save` which will be a hash of these values.  It is a good practice to always store these attributes if you are saving access tokens in your database.

<a name="getting-started--oauth--retrieveAccessToken" />

### Retrieve Access Token

The library contains a lightweight script that is helpful in retrieving and refreshing access tokens.  To use, do the following:

1. Create a `.env` file in the library root.
2. Add values for `QUICKBOOKS_ONLINE_CLIENT_ID` and `QUICKBOOKS_ONLINE_CLIENT_SECRET` (you can copy `.env.test`).
3. Ensure your developer application in [the QuickBooks Online developer portal](https://developer.intuit.com) contains this redirect URI: `http://localhost:5678` (note: no trailing slash and port configurable with `PORT` environment variable)
4. Run `ruby bin/quickbooks_online_oauth_server.rb` from the library root (note: it must run from the root in order to update `.env`).
5. Visit the URL output in the terminal.
6. Upon redirect back to your `localhost`, the new values will be printed to the console and saved back to your `.env`

<a name="getting-started--oauth--ledger-helper-methods" />

### Ledger Helper Methods

The client also implements some helper methods for getting tokens.  For example, you can set up an client using the following:

```ruby
# Retrieve the following values from Intuit app settings
client_id     = 'ID'
client_secret = 'SECRET'
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

**Note: If you have a `.env` file storing your secrets, the client will automatically update the variables and record previous values whenever values change*


<a name="errors" />

# Errors

While LedgerSync tries to catch and translate errors, not all errors will be caught.  In these cases, you can resque a generic `LedgerSync::OperationError` and determine what to do based on the response body.

[QuickBooks Online Error Documentation](https://developer.intuit.com/app/developer/qbo/docs/develop/troubleshooting/error-codes)


<a name="resources" />

# Resources

To see all the available attributes / methods of a resource you can check out the `resource_attributes` method.

```ruby
# Retrieve the following values from Intuit app settings
client_id     = 'ID'
client_secret = 'SECRET'
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

<a name="architecture" />

# Architecture
To know more about the Architecture and usage visit [Ledger Sync](https://github.com/LedgerSync/ledger_sync/documentation#architecture).
