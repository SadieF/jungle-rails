require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.create(name: "category name")
    @product = Product.create(name: "product name",
                                          description: "product description",
                                          quantity: 4,
                                          category: @category,
                                          price: 987.65
                                          )
  end

    describe "Validations" do

      it "should be a valid product" do
        @product.name = nil
        @product.description = nil
        @product.quantity = nil
        @product.price_cents = nil
        @product.category = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Price cents is not a number", "Price is not a number", "Price can't be blank", "Name can't be blank", "Description can't be blank", "Quantity can't be blank", "Category can't be blank"
      end

      it "should have a name" do
        @product.name = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end

      it "should have a description" do
        @product.description = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end

      it "should have a quantity" do
        @product.quantity = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end

      it "should have a price" do
        @product.price_cents = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Price cents is not a number", "Price is not a number", "Price can't be blank"
      end

      it "should have a category" do
        @product.category = nil
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end

  end

end

