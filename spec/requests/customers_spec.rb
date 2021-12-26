require 'rails_helper'
RSpec.describe "CustomersControllers", type: :request do
  describe "get customers_path" do
    it "renders the index view" do
      #create_list(name, amount, *traits_and_overrides, &block) ⇒ Array
      FactoryBot.create_list(:customer, 10)
      get customers_path
      expect(response).to render_template(:index)
    end
  end
  describe "get customer_path" do
    it "renders the :show template" do
      customer = FactoryBot.create(:customer)
      # byebug
      get customer_path(id: customer.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the customer id is invalid" do
      get customer_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to customers_path
    end
  end
  describe "get new_customer_path" do
      it "renders the :new template" do
        get new_customer_path
        expect(response).to render_template(:new)
      end
    end

  describe "get edit_customer_path" do
    it "renders the :edit template" do 
      customer = FactoryBot.create(:customer)
      get edit_customer_path(id: customer.id)
      expect(response).to render_template(:edit)
    end
  end

  describe "post customers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      expect { post customers_path, params: {customer: customer_attributes}
    }.to change(Customer, :count)
      expect(response).to redirect_to customer_path(id: Customer.last.id)
    end
  end


  describe "post customers_path with invalid data" do
    it "does not save a new entry or redirect" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      customer_attributes.delete(:first_name)
      expect { post customers_path, params: {customer: customer_attributes}
    }.to_not change(Customer, :count)
      expect(response).to render_template(:new)
    end
  end


  describe "put customer_path with valid data" do
    it "updates an entry and redirects to the show path for the customer" do
      # get the customer 
      customer = FactoryBot.create(:customer)
      # set new parameters 
      params = { customer: { first_name: 'Michael Getachew' } }
      put customer_path(customer.id), params: params

      # copying the values from the databse to the object in memory
      customer.reload    

      # check if it redirects to updated customer
      expect( customer.first_name ).to eq('Michael Getachew')
      expect( Customer.find(customer.id).first_name ).to eq('Michael Getachew')

    end
  end


  describe "put customer_path with invalid data" do
    it "does not update the customer record or redirect" do
      # create a new customer
      customer = FactoryBot.create(:customer)
      # add invalid parameters
      customer_attributes = FactoryBot.attributes_for(:customer)
      customer_attributes.delete(:first_name)    
      # check if this is accepted 
      expect { put customer_path(customer.id), 
            params: { customer: customer_attributes } }
                .to_not change(Customer, :count)
    end
  end


  describe "delete a customer record" do
    it "deletes a customer record" do 
      # create a customer
      customer = FactoryBot.create(:customer)
      
      # delete record
      customer.delete()  
      # check if deleting record raises the not found error

      # binding.pry

      expect( Customer.find_by( first_name: customer[:first_name] ).nil? ).to be true
      
    end 
  end
end
