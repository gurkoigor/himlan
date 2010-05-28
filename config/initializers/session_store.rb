# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_src_session',
  :secret      => 'e4f05c6c1a03611e9600d98c6426f97f2d96ed5230d6a7044efefcdbf433dac00cb1b1cb77ba4dbc2393286d9cadc34da2535883da4ecfa3d08c4c917554d366'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
