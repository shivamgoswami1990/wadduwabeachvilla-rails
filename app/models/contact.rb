class Contact < ApplicationRecord
  # Use scope function from ./app/models/concerns
  include ScopeGenerator
  Contact.new.createScope(Contact)
end
