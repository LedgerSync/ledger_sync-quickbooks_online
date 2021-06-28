<a name="ledgersync::quickbooksonline" />

# LedgerSync::QuickBooksOnline

[![Build Status](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online.svg?branch=master)](https://travis-ci.org/LedgerSync/ledger_sync-quickbooks_online)
[![Gem Version](https://badge.fury.io/rb/ledger_sync-quickbooks_online.svg)](https://badge.fury.io/rb/ledger_sync-quickbooks_online)
[![Coverage Status](https://coveralls.io/repos/github/LedgerSync/ledger_sync-quickbooks_online/badge.svg?branch=master)](https://coveralls.io/github/LedgerSync/ledger_sync-quickbooks_online?branch=master)


<a name="joinTheConversation" />

## Join the Conversation

[Click here](https://join.slack.com/t/ledger-sync/shared_invite/zt-e5nbl8qc-eOA~5k7bg3p16_l3J7OS~Q) to join our public Slack group.

**Table of Content**
- [LedgerSync::QuickBooksOnline](#ledgersync::quickbooksonline)	- [Join the Conversation](#joinTheConversation)	- [Documentation](#documentation)	- [License](#license)	- [Maintainers](#maintainers)- [Getting Started](#gettingStarted)	- [Installation](#installation)		- [Gemfile](#gemfile)		- [Directly](#directly)	- [OAuth](#oauth)		- [Retrieve Access Token](#retrieveAccessToken)- [Errors](#errors)- [Resources](#resources)	- [LedgerSync::Ledgers::QuickBooksOnline::Account](#ledgersync::ledgers::quickbooksonline::account)		- [Attributes](#attributes01)		- [Operations](#operations01)			- [LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Find](#ledgersync::ledgers::quickbooksonline::account::operations::find)				- [Resource Validations](#resourceValidations01)			- [LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Create](#ledgersync::ledgers::quickbooksonline::account::operations::create)				- [Resource Validations](#resourceValidations01)			- [LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Update](#ledgersync::ledgers::quickbooksonline::account::operations::update)				- [Resource Validations](#resourceValidations02)	- [LedgerSync::Ledgers::QuickBooksOnline::Bill](#ledgersync::ledgers::quickbooksonline::bill)		- [Attributes](#attributes01)		- [Operations](#operations01)			- [LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Update](#ledgersync::ledgers::quickbooksonline::bill::operations::update)				- [Resource Validations](#resourceValidations03)			- [LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Create](#ledgersync::ledgers::quickbooksonline::bill::operations::create)				- [Resource Validations](#resourceValidations04)			- [LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Find](#ledgersync::ledgers::quickbooksonline::bill::operations::find)				- [Resource Validations](#resourceValidations05)	- [LedgerSync::Ledgers::QuickBooksOnline::BillLineItem](#ledgersync::ledgers::quickbooksonline::billlineitem)		- [Attributes](#attributes02)		- [Operations](#operations02)	- [LedgerSync::Ledgers::QuickBooksOnline::BillPayment](#ledgersync::ledgers::quickbooksonline::billpayment)		- [Attributes](#attributes03)		- [Operations](#operations03)			- [LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Find](#ledgersync::ledgers::quickbooksonline::billpayment::operations::find)				- [Resource Validations](#resourceValidations06)			- [LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Create](#ledgersync::ledgers::quickbooksonline::billpayment::operations::create)				- [Resource Validations](#resourceValidations07)			- [LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Update](#ledgersync::ledgers::quickbooksonline::billpayment::operations::update)				- [Resource Validations](#resourceValidations0801)	- [LedgerSync::Ledgers::QuickBooksOnline::Currency](#ledgersync::ledgers::quickbooksonline::currency)		- [Attributes](#attributes04)		- [Operations](#operations04)	- [LedgerSync::Ledgers::QuickBooksOnline::BillPaymentLineItem](#ledgersync::ledgers::quickbooksonline::billpaymentlineitem)		- [Attributes](#attributes05)		- [Operations](#operations05)	- [LedgerSync::Ledgers::QuickBooksOnline::Customer](#ledgersync::ledgers::quickbooksonline::customer)		- [Attributes](#attributes06)		- [Operations](#operations06)			- [LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Find](#ledgersync::ledgers::quickbooksonline::customer::operations::find)				- [Resource Validations](#resourceValidations0801)			- [LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Create](#ledgersync::ledgers::quickbooksonline::customer::operations::create)				- [Resource Validations](#resourceValidations0802)			- [LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Update](#ledgersync::ledgers::quickbooksonline::customer::operations::update)				- [Resource Validations](#resourceValidations0803)		- [LedgerSync::Ledgers::QuickBooksOnline::Department](#ledgersync::ledgers::quickbooksonline::department)		- [Attributes](#attributes07)		- [Operations](#operations07)			- [LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Find](#ledgersync::ledgers::quickbooksonline::department::operations::find)				- [Resource Validations](#resourceValidations0804)			- [LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Create](#ledgersync::ledgers::quickbooksonline::department::operations::create)				- [Resource Validations](#resourceValidations0805)			- [LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Update](#ledgersync::ledgers::quickbooksonline::department::operations::update)				- [Resource Validations](#resourceValidations0806)	- [LedgerSync::Ledgers::QuickBooksOnline::Deposit](#ledgersync::ledgers::quickbooksonline::deposit)		- [Attributes](#attributes0801)		- [Operations](#operations0801)			- [LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Update](#ledgersync::ledgers::quickbooksonline::deposit::operations::update)				- [Resource Validations](#resourceValidations0807)			- [LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Create](#ledgersync::ledgers::quickbooksonline::deposit::operations::create)				- [Resource Validations](#resourceValidations080801)			- [LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Find](#ledgersync::ledgers::quickbooksonline::deposit::operations::find)				- [Resource Validations](#resourceValidations080801)	- [LedgerSync::Ledgers::QuickBooksOnline::DepositLineItem](#ledgersync::ledgers::quickbooksonline::depositlineitem)		- [Attributes](#attributes0801)		- [Operations](#operations0801)	- [LedgerSync::Ledgers::QuickBooksOnline::Expense](#ledgersync::ledgers::quickbooksonline::expense)		- [Attributes](#attributes0802)		- [Operations](#operations0802)			- [LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Update](#ledgersync::ledgers::quickbooksonline::expense::operations::update)				- [Resource Validations](#resourceValidations080802)			- [LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Find](#ledgersync::ledgers::quickbooksonline::expense::operations::find)				- [Resource Validations](#resourceValidations080803)			- [LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Create](#ledgersync::ledgers::quickbooksonline::expense::operations::create)				- [Resource Validations](#resourceValidations080804)	- [LedgerSync::Ledgers::QuickBooksOnline::ExpenseLineItem](#ledgersync::ledgers::quickbooksonline::expenselineitem)		- [Attributes](#attributes0803)		- [Operations](#operations0803)	- [LedgerSync::Ledgers::QuickBooksOnline::Invoice](#ledgersync::ledgers::quickbooksonline::invoice)		- [Attributes](#attributes0804)		- [Operations](#operations0804)			- [LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Find](#ledgersync::ledgers::quickbooksonline::invoice::operations::find)				- [Resource Validations](#resourceValidations080805)			- [LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Create](#ledgersync::ledgers::quickbooksonline::invoice::operations::create)				- [Resource Validations](#resourceValidations080806)			- [LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Update](#ledgersync::ledgers::quickbooksonline::invoice::operations::update)				- [Resource Validations](#resourceValidations080807)	- [LedgerSync::Ledgers::QuickBooksOnline::InvoiceSalesLineItem](#ledgersync::ledgers::quickbooksonline::invoicesaleslineitem)		- [Attributes](#attributes0805)		- [Operations](#operations0805)		- [LedgerSync::Ledgers::QuickBooksOnline::Item](#ledgersync::ledgers::quickbooksonline::item)		- [Attributes](#attributes0806)		- [Operations](#operations0806)	- [LedgerSync::Ledgers::QuickBooksOnline::JournalEntry](#ledgersync::ledgers::quickbooksonline::journalentry)		- [Attributes](#attributes0807)		- [Operations](#operations0807)			- [LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Update](#ledgersync::ledgers::quickbooksonline::journalentry::operations::update)				- [Resource Validations](#resourceValidations08080801)			- [LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Find](#ledgersync::ledgers::quickbooksonline::journalentry::operations::find)				- [Resource Validations](#resourceValidations08080801)			- [LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Create](#ledgersync::ledgers::quickbooksonline::journalentry::operations::create)				- [Resource Validations](#resourceValidations08080802)	- [LedgerSync::Ledgers::QuickBooksOnline::JournalEntryLineItem](#ledgersync::ledgers::quickbooksonline::journalentrylineitem)		- [Attributes](#attributes080801)		- [Operations](#operations080801)	- [LedgerSync::Ledgers::QuickBooksOnline::LedgerClass](#ledgersync::ledgers::quickbooksonline::ledgerclass)		- [Attributes](#attributes080801)		- [Operations](#operations080801)			- [LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Create](#ledgersync::ledgers::quickbooksonline::ledgerclass::operations::create)				- [Resource Validations](#resourceValidations08080803)			- [LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Find](#ledgersync::ledgers::quickbooksonline::ledgerclass::operations::find)				- [Resource Validations](#resourceValidations08080804)			- [LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Update](#ledgersync::ledgers::quickbooksonline::ledgerclass::operations::update)				- [Resource Validations](#resourceValidations08080805)	- [LedgerSync::Ledgers::QuickBooksOnline::Payment](#ledgersync::ledgers::quickbooksonline::payment)		- [Attributes](#attributes080802)		- [Operations](#operations080802)			- [LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Find](#ledgersync::ledgers::quickbooksonline::payment::operations::find)				- [Resource Validations](#resourceValidations08080806)			- [LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Create](#ledgersync::ledgers::quickbooksonline::payment::operations::create)				- [Resource Validations](#resourceValidations08080807)			- [LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Update](#ledgersync::ledgers::quickbooksonline::payment::operations::update)				- [Resource Validations](#resourceValidations0808080801)	- [LedgerSync::Ledgers::QuickBooksOnline::PaymentLineItem](#ledgersync::ledgers::quickbooksonline::paymentlineitem)		- [Attributes](#attributes080803)		- [Operations](#operations080803)	- [LedgerSync::Ledgers::QuickBooksOnline::Preferences](#ledgersync::ledgers::quickbooksonline::preferences)		- [Attributes](#attributes080804)		- [Operations](#operations080804)			- [LedgerSync::Ledgers::QuickBooksOnline::Preferences::Operations::Find](#ledgersync::ledgers::quickbooksonline::preferences::operations::find)				- [Resource Validations](#resourceValidations0808080801)		- [LedgerSync::Ledgers::QuickBooksOnline::PrimaryEmailAddr](#ledgersync::ledgers::quickbooksonline::primaryemailaddr)		- [Attributes](#attributes080805)		- [Operations](#operations080805)		- [LedgerSync::Ledgers::QuickBooksOnline::PrimaryPhone](#ledgersync::ledgers::quickbooksonline::primaryphone)		- [Attributes](#attributes080806)		- [Operations](#operations080806)	- [LedgerSync::Ledgers::QuickBooksOnline::Resource](#ledgersync::ledgers::quickbooksonline::resource)		- [Attributes](#attributes080807)		- [Operations](#operations080807)	- [LedgerSync::Ledgers::QuickBooksOnline::Subsidiary](#ledgersync::ledgers::quickbooksonline::subsidiary)		- [Attributes](#attributes08080801)		- [Operations](#operations08080801)	- [LedgerSync::Ledgers::QuickBooksOnline::Transfer](#ledgersync::ledgers::quickbooksonline::transfer)		- [Attributes](#attributes08080801)		- [Operations](#operations08080801)			- [LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Find](#ledgersync::ledgers::quickbooksonline::transfer::operations::find)				- [Resource Validations](#resourceValidations0808080802)			- [LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Create](#ledgersync::ledgers::quickbooksonline::transfer::operations::create)				- [Resource Validations](#resourceValidations0808080803)			- [LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Update](#ledgersync::ledgers::quickbooksonline::transfer::operations::update)				- [Resource Validations](#resourceValidations0808080804)	- [LedgerSync::Ledgers::QuickBooksOnline::Vendor](#ledgersync::ledgers::quickbooksonline::vendor)		- [Attributes](#attributes08080802)		- [Operations](#operations08080802)			- [LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Create](#ledgersync::ledgers::quickbooksonline::vendor::operations::create)				- [Resource Validations](#resourceValidations0808080805)			- [LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Update](#ledgersync::ledgers::quickbooksonline::vendor::operations::update)				- [Resource Validations](#resourceValidations0808080806)			- [LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Find](#ledgersync::ledgers::quickbooksonline::vendor::operations::find)				- [Resource Validations](#resourceValidations0808080807)


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


<a name="ledgersync::ledgers::quickbooksonline::account" />

## LedgerSync::Ledgers::QuickBooksOnline::Account

<a name="attributes" />

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


<a name="operations" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::account::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Find

<a name="resourceValidations" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::account::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Create

<a name="resourceValidations01" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::account::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Account::Operations::Update

<a name="resourceValidations02" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::bill" />

## LedgerSync::Ledgers::QuickBooksOnline::Bill

<a name="attributes01" />

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


<a name="operations01" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::bill::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Update

<a name="resourceValidations03" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::bill::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Create

<a name="resourceValidations04" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::bill::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Bill::Operations::Find

<a name="resourceValidations05" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::billlineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::BillLineItem

<a name="attributes02" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |


<a name="operations02" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::billpayment" />

## LedgerSync::Ledgers::QuickBooksOnline::BillPayment

<a name="attributes03" />

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


<a name="operations03" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::billpayment::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Find

<a name="resourceValidations06" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::billpayment::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Create

<a name="resourceValidations07" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::billpayment::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::BillPayment::Operations::Update

<a name="resourceValidations08" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::currency" />

## LedgerSync::Ledgers::QuickBooksOnline::Currency

<a name="attributes04" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| exchange_rate | LedgerSync::Type::Float |
| name | LedgerSync::Type::String |
| symbol | LedgerSync::Type::String |


<a name="operations04" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::billpaymentlineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::BillPaymentLineItem

<a name="attributes05" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| ledger_transactions | LedgerSync::Type::ReferenceMany |


<a name="operations05" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::customer" />

## LedgerSync::Ledgers::QuickBooksOnline::Customer

<a name="attributes06" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| DisplayName | LedgerSync::Type::String |
| PrimaryPhone | LedgerSync::Type::ReferenceOne |
| PrimaryEmailAddr | LedgerSync::Type::ReferenceOne |
| subsidiary | LedgerSync::Type::ReferenceOne |


<a name="operations06" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::customer::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Find

<a name="resourceValidations0801" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::customer::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Create

<a name="resourceValidations0802" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::customer::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Customer::Operations::Update

<a name="resourceValidations0803" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::department" />

### LedgerSync::Ledgers::QuickBooksOnline::Department

<a name="attributes07" />

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


<a name="operations07" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::department::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Find

<a name="resourceValidations0804" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::department::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Create

<a name="resourceValidations0805" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::department::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Department::Operations::Update

<a name="resourceValidations0806" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::deposit" />

## LedgerSync::Ledgers::QuickBooksOnline::Deposit

<a name="attributes08" />

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


<a name="operations08" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::deposit::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Update

<a name="resourceValidations0807" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::deposit::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Create

<a name="resourceValidations0808" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::deposit::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Deposit::Operations::Find

<a name="resourceValidations080801" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::depositlineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::DepositLineItem

<a name="attributes0801" />

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


<a name="operations0801" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::expense" />

## LedgerSync::Ledgers::QuickBooksOnline::Expense

<a name="attributes0802" />

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


<a name="operations0802" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::expense::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Update

<a name="resourceValidations080802" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::expense::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Find

<a name="resourceValidations080803" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::expense::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Expense::Operations::Create

<a name="resourceValidations080804" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::expenselineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::ExpenseLineItem

<a name="attributes0803" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| account | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |


<a name="operations0803" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::invoice" />

## LedgerSync::Ledgers::QuickBooksOnline::Invoice

<a name="attributes0804" />

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


<a name="operations0804" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::invoice::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Find

<a name="resourceValidations080805" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::invoice::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Create

<a name="resourceValidations080806" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::invoice::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Invoice::Operations::Update

<a name="resourceValidations080807" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::invoicesaleslineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::InvoiceSalesLineItem

<a name="attributes0805" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| item | LedgerSync::Type::ReferenceOne |
| ledger_class | LedgerSync::Type::ReferenceOne |
| amount | LedgerSync::Type::Integer |
| description | LedgerSync::Type::String |


<a name="operations0805" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::item" />

### LedgerSync::Ledgers::QuickBooksOnline::Item

<a name="attributes0806" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |


<a name="operations0806" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::journalentry" />

## LedgerSync::Ledgers::QuickBooksOnline::JournalEntry

<a name="attributes0807" />

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


<a name="operations0807" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::journalentry::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Update

<a name="resourceValidations080808" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::journalentry::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Find

<a name="resourceValidations08080801" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::journalentry::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::JournalEntry::Operations::Create

<a name="resourceValidations08080802" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::journalentrylineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::JournalEntryLineItem

<a name="attributes0808" />

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


<a name="operations0808" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::ledgerclass" />

## LedgerSync::Ledgers::QuickBooksOnline::LedgerClass

<a name="attributes080801" />

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


<a name="operations080801" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::ledgerclass::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Create

<a name="resourceValidations08080803" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::ledgerclass::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Find

<a name="resourceValidations08080804" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::ledgerclass::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::LedgerClass::Operations::Update

<a name="resourceValidations08080805" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::payment" />

## LedgerSync::Ledgers::QuickBooksOnline::Payment

<a name="attributes080802" />

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


<a name="operations080802" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::payment::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Find

<a name="resourceValidations08080806" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::payment::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Create

<a name="resourceValidations08080807" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::payment::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Payment::Operations::Update

<a name="resourceValidations08080808" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::paymentlineitem" />

## LedgerSync::Ledgers::QuickBooksOnline::PaymentLineItem

<a name="attributes080803" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| ledger_transactions | LedgerSync::Type::ReferenceMany |


<a name="operations080803" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::preferences" />

## LedgerSync::Ledgers::QuickBooksOnline::Preferences

<a name="attributes080804" />

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


<a name="operations080804" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::preferences::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Preferences::Operations::Find

<a name="resourceValidations0808080801" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::primaryemailaddr" />

### LedgerSync::Ledgers::QuickBooksOnline::PrimaryEmailAddr

<a name="attributes080805" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| Address | LedgerSync::Type::String |


<a name="operations080805" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::primaryphone" />

### LedgerSync::Ledgers::QuickBooksOnline::PrimaryPhone

<a name="attributes080806" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| FreeFormNumber | LedgerSync::Type::String |


<a name="operations080806" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::resource" />

## LedgerSync::Ledgers::QuickBooksOnline::Resource

<a name="attributes080807" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |


<a name="operations080807" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::subsidiary" />

## LedgerSync::Ledgers::QuickBooksOnline::Subsidiary

<a name="attributes080808" />

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| name | LedgerSync::Type::String |
| state | LedgerSync::Type::String |


<a name="operations080808" />

### Operations




<a name="ledgersync::ledgers::quickbooksonline::transfer" />

## LedgerSync::Ledgers::QuickBooksOnline::Transfer

<a name="attributes08080801" />

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


<a name="operations08080801" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::transfer::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Find

<a name="resourceValidations0808080802" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::transfer::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Create

<a name="resourceValidations0808080803" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::transfer::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Transfer::Operations::Update

<a name="resourceValidations0808080804" />

##### Resource Validations

| Name | Type |
| ---- | ---- |



<a name="ledgersync::ledgers::quickbooksonline::vendor" />

## LedgerSync::Ledgers::QuickBooksOnline::Vendor

<a name="attributes08080802" />

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


<a name="operations08080802" />

### Operations

<a name="ledgersync::ledgers::quickbooksonline::vendor::operations::create" />

#### LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Create

<a name="resourceValidations0808080805" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::vendor::operations::update" />

#### LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Update

<a name="resourceValidations0808080806" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
<a name="ledgersync::ledgers::quickbooksonline::vendor::operations::find" />

#### LedgerSync::Ledgers::QuickBooksOnline::Vendor::Operations::Find

<a name="resourceValidations0808080807" />

##### Resource Validations

| Name | Type |
| ---- | ---- |
