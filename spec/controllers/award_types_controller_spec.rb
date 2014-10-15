require 'rails_helper'

RSpec.describe AwardTypesController, :type => :controller do
    valid_attributes = {name: "achievement"}

    describe "GET index" do
    it "assigns all award_types as @award_types" do
      award_type = AwardType.create! valid_attributes
      get :index, {}
      expect(assigns(:award_types)).to eq([award_type])
    end
  end

  describe "GET show" do
    it "assigns the requested award_type as @award_type" do
      award_type = AwardType.create! valid_attributes
      get :show, {:id => award_type.to_param}
      expect(assigns(:award_type)).to eq(award_type)
    end
  end

  describe "GET new" do
    it "assigns a new award_type as @award_type" do
      get :new, {}
      expect(assigns(:award_type)).to be_a_new(AwardType)
    end
  end

  describe "GET edit" do
    it "assigns the requested award_type as @award_type" do
      award_type = AwardType.create! valid_attributes
      get :edit, {:id => award_type.to_param}
      expect(assigns(:award_type)).to eq(award_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AwardType" do
        expect {
          post :create, {:award_type => valid_attributes}
        }.to change(AwardType, :count).by(1)
      end

      it "assigns a newly created award_type as @award_type" do
        post :create, {:award_type => valid_attributes}
        expect(assigns(:award_type)).to be_a(AwardType)
        expect(assigns(:award_type)).to be_persisted
      end

      it "redirects to the created award_type" do
        post :create, {:award_type => valid_attributes}
        expect(response).to redirect_to(AwardType.last)
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      new_attributes = {name: "new achievement"}


      it "updates the requested award_type" do
        award_type = AwardType.create! valid_attributes
        put :update, {:id => award_type.to_param, :award_type => new_attributes}
        award_type.reload
        award_type.name.should == "new achievement"
      end

      it "assigns the requested award_type as @award_type" do
        award_type = AwardType.create! valid_attributes
        put :update, {:id => award_type.to_param, :award_type => valid_attributes}
        expect(assigns(:award_type)).to eq(award_type)
      end

      it "redirects to the award_type" do
        award_type = AwardType.create! valid_attributes
        put :update, {:id => award_type.to_param, :award_type => valid_attributes}
        expect(response).to redirect_to(award_type)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested award_type" do
      award_type = AwardType.create! valid_attributes
      expect {
        delete :destroy, {:id => award_type.to_param}
      }.to change(AwardType, :count).by(-1)
    end

    it "redirects to the award_types list" do
      award_type = AwardType.create! valid_attributes
      delete :destroy, {:id => award_type.to_param}
      expect(response).to redirect_to(award_types_url)
    end
  end

end
