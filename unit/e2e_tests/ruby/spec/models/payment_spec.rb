require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OpenapiClient::Payment
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
RSpec.describe 'Payment' do
  before do
    configure_tests
  end

  describe 'test an instance of Payment' do
    let(:api_instance) { OpenapiClient::CreateAPaymentApi.new(OpenapiClient::ApiClient.new(configuration)) }

    it 'should create an instance of BookPayment' do
      request = { data: OpenapiClient::CreateBookPayment.new(type: 'bookPayment', attributes:
        OpenapiClient::CreateBookPaymentAttributes.new(amount: 1000, description: 'test payment', tags: { "test": 'test-tag' }),
                                                             relationships: OpenapiClient::CreateBookPaymentRelationships.new(account: { "data": { "type": 'depositAccount', "id": '27573' } }, counterparty_account: { "data": { "type": 'depositAccount', "id": '36981' } }).to_hash).to_hash }
      response = api_instance.execute(request)
      expect(response.data.type).to eq('bookPayment')
    end

    it 'should create an instance of AchPayment' do
      request = { data: OpenapiClient::CreateAchPayment.new(type: 'achPayment', attributes:
        OpenapiClient::CreateAchPaymentAttributes.new(amount: 1000, direction: 'Credit', counterparty: OpenapiClient::Counterparty.new(name: 'Jane Doe', routing_number: '812345678', account_number: '27573', account_type: 'Checking'), description: 'test payment'),
                                                            relationships: OpenapiClient::CreateAchPaymentRelationships.new(account: { "data": { "type": 'account', "id": '27573' } }).to_hash).to_hash }
      response = api_instance.execute(request)
      expect(response.data.type).to eq('achPayment')
    end

    it 'should create an instance of AchPayment with plaid token' do
      request = { data: OpenapiClient::CreateAchPaymentPlaid.new(type: 'achPayment', attributes:
        OpenapiClient::CreateAchPaymentPlaidAttributes.new(amount: 1000, direction: 'Credit', description: 'test payment', plaid_processor_token: 'processor-sandbox-1424a3b1-2b56-4d46-9e11-1fdc70fd3724'),
                                                                 relationships: OpenapiClient::CreateAchPaymentRelationships.new(account: { "data": { "type": 'depositAccount', "id": '27573' } }).to_hash).to_hash }
      response = api_instance.execute(request)
      expect(response.data.type).to eq('achPayment')
    end
  end
end