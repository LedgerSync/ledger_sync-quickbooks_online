<a name="ledgersync::quickbooksonline" />

# LedgerSync::QuickBooksOnline

[![Build Status](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online.svg?branch=master)](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online)
[![Gem Version](https://badge.fury.io/rb/ledger_sync-quickbooks_online.svg)](https://badge.fury.io/rb/ledger_sync-quickbooks_online)
[![Coverage Status](https://coveralls.io/repos/github/LedgerSync/ledger_sync-quickbooks_online/badge.svg?branch=master)](https://coveralls.io/github/LedgerSync/ledger_sync-quickbooks_online?branch=master)


<a name="joinTheConversation" />

## Join the Conversation

[Click here](https://join.slack.com/t/ledger-sync/shared_invite/zt-e5nbl8qc-eOA~5k7bg3p16_l3J7OS~Q) to join our public Slack group.

**Table of Content**
- [LedgerSync::QuickBooksOnline](#ledgersync::quickbooksonline)	- [Join the Conversation](#joinTheConversation)	- [Documentation](#documentation)	- [License](#license)	- [Maintainers](#maintainers)- [Getting Started](#gettingStarted)	- [Installation](#installation)		- [Gemfile](#gemfile)		- [Directly](#directly)	- [OAuth](#oauth)		- [Retrieve Access Token](#retrieveAccessToken)- [Errors](#errors)- [Resources](#resources)


<a name="documentation" />

## Documentation

The most up-to-date documentation can be found at [www.ledgersync.dev](http://www.ledgersync.dev)

<a name="license" />

## License

The gem is available as open source under the terms of the licenses detailed in `LICENSE.txt`.

<a name="maintainers" />

## Maintainers

A big thank you to our maintainers:

- [@ryanwjackson](https://github.com/ryanwjackson)
- [@jozefvaclavik](https://github.com/jozefvaclavik)
- [@SeanBolt](https://github.com/SeanBolt)
- And the whole [Modern Treasury](https://www.moderntreasury.com) team


<a name="gettingStarted" />

# Getting Started



<a name="installation" />

## Installation
<a name="gemfile" />

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

<a name="directly" />

### Directly
Or install it yourself as:
```
gem install ledger_sync
gem install ledger_sync-quickbooks_online
```


<a name="oauth" />

## OAuth

QuickBooks Online utilizes OAuth 2.0, which requires frequent refreshing of the access token.  The client will handle this automatically, attempting a single token refresh on any single request authentication failure.  Depending on how you use the library, every client has implements a class method `ledger_attributes_to_save`, which is an array of attributes that may change as the client is used.  You can also call the instance method `ledger_attributes_to_save` which will be a hash of these values.  It is a good practice to always store these attributes if you are saving access tokens in your database.

<a name="retrieveAccessToken" />

### Retrieve Access Token

The library contains a lightweight script that is helpful in retrieving and refreshing access tokens.  To use, do the following:

1. Create a `.env` file in the library root.
2. Add values for `QUICKBOOKS_ONLINE_CLIENT_ID` and `QUICKBOOKS_ONLINE_CLIENT_SECRET` (you can copy `.env.test`).
3. Ensure your developer application in [the QuickBooks Online developer portal](https://developer.intuit.com) contains this redirect URI: `http://localhost:5678` (note: no trailing slash and port configurable with `PORT` environment variable)
4. Run `ruby bin/quickbooks_online_oauth_server.rb` from the library root (note: it must run from the root in order to update `.env`).
5. Visit the URL output in the terminal.
6. Upon redirect back to your `localhost`, the new values will be printed to the console and saved back to your `.env`

### Ledger Helper Methods

The client also implements some helper methods for getting tokens.  For example, you can set up an client using the following:

```ruby
# Retrieve the following values from Intuit app settings
client_id     = 'ID'
client_secret = 'SECRET'
redirect_uri  = 'http://localhost:3000'

oauth_client = LedgerSync::Ledgers::QuickBooksOnline::OAuthClientHelper.new(
  client_id: client_id,
  client_secret: client_secret
)

puts oauth_client.authorization_url(redirect_uri: redirect_uri)

# Visit on the output URL and authorize a company.
# You will be redirected back to the redirect_uri.
# Copy the full url from your browser:

uri = 'https://localhost:3000/?code=FOO&state=BAR&realm_id=BAZ'

client = LedgerSync::Ledgers::QuickBooksOnline::Client.new_from_oauth_client_uri(
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

[QuickBooks Online Error Documentation](https://developer.intuit.com/app/developer/qbo/docs/develop/troubleshooting/error-codes


<a name="resources" />

# Resources

> To see all the available attributes / methods of a resource you can check out the `resource_attributes` method.
> ```ruby
>    LedgerSync::QuickBooksOnline::Account.resource_attributes
>    # <LedgerSync::ResourceAttributeSet:0x00005618d06fb050 @attributes={:external_id=>#<LedgerSync::ResourceAttribute:0x00005618cfcda9b8 @name=:external_id, @resource_class=LedgerSync::Resource,
>    # @type=#<LedgerSync::Type::ID:0x00005618cfcda940 @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :ledger_id=>#<LedgerSync::ResourceAttribute:0x00005618cfc95188 @name=:ledger_id, @resource_class=LedgerSync::Resource, 
>    # @type=#<LedgerSync::Type::ID:0x00005618cfc95110 @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :Name=>#<LedgerSync::ResourceAttribute:0x00005618d0ad3470 @name=:Name, @resource_class=LedgerSync::QuickBooksOnline::Account, 
>    # @type=#<LedgerSync::Type::String:0x00005618d0ad3448 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :Classification=>#<LedgerSync::ResourceAttribute:0x00005618d0ad1148 @name=:Classification, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::String:0x00005618d0ad1120 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :AccountType=>#<LedgerSync::ResourceAttribute:0x00005618d073e0d0 @name=:AccountType, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::StringFromSet:0x00005618d073e350 @values=["bank", "other_current_assets", "fixed_asset", "other_asset", "accounts_receivable", "equity", "expense", "other_expense", "cost_of_goods_sold", 
>    # "accounts_payable", "credit_card", "long_term_liability", "other_current_liability", "income", "other_income"], @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :AccountSubType=>#<LedgerSync::ResourceAttribute:0x00005618d0ae2cb8 @name=:AccountSubType, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::String:0x00005618d0ae2c90 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :AcctNum=>#<LedgerSync::ResourceAttribute:0x00005618d0ae07d8 @name=:AcctNum, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::String:0x00005618d0ae07b0 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :Description=>#<LedgerSync::ResourceAttribute:0x00005618d0af3478 @name=:Description, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::String:0x00005618d0af3450 @true="t", @false="f", @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :Active=>#<LedgerSync::ResourceAttribute:0x00005618d0af0f98 @name=:Active, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::Boolean:0x00005618d0af0f70 @precision=nil, @scale=nil, @limit=nil>, @value=nil>, :Currency=>#<LedgerSync::ResourceAttribute::Reference::One:0x00005618d0aff868 @name=:Currency, 
>    # @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::ReferenceOne:0x00005618d0aff778 @resource_class=LedgerSync::QuickBooksOnline::Currency, @precision=nil, @scale=nil, @limit=nil>, @value=nil>}, 
>    # @references=[#<LedgerSync::ResourceAttribute::Reference::One:0x00005618d0aff868 @name=:Currency, @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::ReferenceOne:0x00005618d0aff778 @resource_class=LedgerSync::QuickBooksOnline::Currency, 
>    # @precision=nil, @scale=nil, @limit=nil>, @value=nil>], @references_one=[#<LedgerSync::ResourceAttribute::Reference::One:0x00005618d0aff868 @name=:Currency, @resource_class=LedgerSync::QuickBooksOnline::Account, @type=#<LedgerSync::Type::ReferenceOne:0x00005618d0aff778 
>    # @resource_class=LedgerSync::QuickBooksOnline::Currency, @precision=nil, @scale=nil, @limit=nil>, @value=nil>], @references_many=[], @resource=LedgerSync::QuickBooksOnline::Account>
> #
> ```


## LedgerSync::QuickBooksOnline::Account

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |
| classification | LedgerSync::Type::String |
| account_type | LedgerSync::Type::StringFromSet |
| account_sub_type | LedgerSync::Type::String |
| number | LedgerSync::Type::String |
| description | LedgerSync::Type::String |
| active | LedgerSync::Type::Boolean |
| currency | LedgerSync::Type::ReferenceOne |




## LedgerSync::QuickBooksOnline::Bill

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| due_date | LedgerSync::Type::Date |
| reference_number | LedgerSync::Type::String |
| vendor | LedgerSync::Type::ReferenceOne |
| account | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::BillLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::BillPayment

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| reference_number | LedgerSync::Type::String |
| payment_type | LedgerSync::Type::StringFromSet |
| account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| vendor | LedgerSync::Type::ReferenceOne |
| bank_account | LedgerSync::Type::ReferenceOne |
| credit_card_account | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::Currency

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| exchange_rate | LedgerSync::Type::Float |
| name | LedgerSync::Type::String |
| symbol | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::BillPaymentLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| ledger_transactions | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::Customer

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| DisplayName | LedgerSync::Type::String |
| PrimaryPhone | LedgerSync::Type::ReferenceOne |
| PrimaryEmailAddr | LedgerSync::Type::ReferenceOne |
| subsidiary | LedgerSync::Type::ReferenceOne |



### LedgerSync::QuickBooksOnline::Department

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |
| fully_qualified_name | LedgerSync::Type::String |
| active | LedgerSync::Type::Boolean |
| sub_department | LedgerSync::Type::Boolean |
| parent | LedgerSync::Type::ReferenceOne |



## LedgerSync::QuickBooksOnline::Deposit

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| account | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::DepositLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |
| entity | LedgerSync::Type::ReferenceOne |



## LedgerSync::QuickBooksOnline::Expense

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| payment_type | LedgerSync::Type::StringFromSet |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| reference_number | LedgerSync::Type::String |
| entity | LedgerSync::Type::ReferenceOne |
| account | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::ExpenseLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::Invoice

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| deposit | LedgerSync::Type::Integer |
| customer | LedgerSync::Type::ReferenceOne |
| account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::InvoiceSalesLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| item | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |



### LedgerSync::QuickBooksOnline::Item

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::JournalEntry

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| reference_number | LedgerSync::Type::String |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::JournalEntryLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |
| entry_type | LedgerSync::Type::StringFromSet |



## LedgerSync::QuickBooksOnline::LedgerClass

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |
| fully_qualified_name | LedgerSync::Type::String |
| active | LedgerSync::Type::Boolean |
| sub_class | LedgerSync::Type::Boolean |
| parent | LedgerSync::Type::ReferenceOne |



## LedgerSync::QuickBooksOnline::Payment

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| reference_number | LedgerSync::Type::String |
| customer | LedgerSync::Type::ReferenceOne |
| deposit_account | LedgerSync::Type::ReferenceOne |
| account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::PaymentLineItem

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| ledger_transactions | LedgerSync::Type::ReferenceMany |



## LedgerSync::QuickBooksOnline::Preferences

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| accounting_info | LedgerSync::Type::Hash |
| product_and_services | LedgerSync::Type::Hash |
| sales_forms | LedgerSync::Type::Hash |
| email_messages | LedgerSync::Type::Hash |
| vendor_and_purchases | LedgerSync::Type::Hash |
| time_tracking | LedgerSync::Type::Hash |
| tax | LedgerSync::Type::Hash |
| currency | LedgerSync::Type::Hash |
| report | LedgerSync::Type::Hash |
| other | LedgerSync::Type::Hash |



### LedgerSync::QuickBooksOnline::PrimaryEmailAddr

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| Address | LedgerSync::Type::String |



### LedgerSync::QuickBooksOnline::PrimaryPhone

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| FreeFormNumber | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::Resource

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |



## LedgerSync::QuickBooksOnline::Subsidiary

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |
| state | LedgerSync::Type::String |



## LedgerSync::QuickBooksOnline::Transfer

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| from_account | LedgerSync::Type::ReferenceOne |
| to_account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |



## LedgerSync::QuickBooksOnline::Vendor

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| company_name | LedgerSync::Type::String |
| email | LedgerSync::Type::String |
| display_name | LedgerSync::Type::String |
| first_name | LedgerSync::Type::String |
| last_name | LedgerSync::Type::String |
| phone_number | LedgerSync::Type::String |
| subsidiary | LedgerSync::Type::ReferenceOne |
