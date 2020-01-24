class ApplicationController < ActionController::API
  include HasScopeGenerator, SendgridEmail
end
