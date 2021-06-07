require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'pry'
require 'rspec'
require 'aws-sdk-secretsmanager'
require 'base64'
require 'json'
require 'report_builder'
require 'securerandom'
require_relative 'helpers/secret_manager'

## Definiçoes de Ambiente
# escolhido em cucumber.yml
# prod, dev, qa
SELECTED_ENV = ENV['ENV']
if SELECTED_ENV.blank?
  raise "Constante ENV está vazia.\nPor favor, especificar Ambiente: (prod, dev, qa).\nEx.:\n  $ cucumber ENV=dev\n    ou\n  $ cucumber -p dev\n\n"
  RSpec.configure do |config|
    config.filter_run_excluding type: :feature
  end
end

ENVIRONMENT = ENV['ENV']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/environments.yml")[ENVIRONMENT]

