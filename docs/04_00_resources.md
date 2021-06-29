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