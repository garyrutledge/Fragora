require 'rails_helper'

RSpec.describe AwardsController, :type => :controller do

    valid_attributes = {user_id: 1, award_type_id: 1}

  describe "GET index" do
    it "assigns all awards as @awards" do
      award = Award.create! valid_attributes
      get :index, {}
      expect(assigns(:awards)).to eq([award])
    end
  end

  describe "GET show" do
    it "assigns the requested award as @award" do
      award = Award.create! valid_attributes
      get :show, {:id => award.to_param}
      expect(assigns(:award)).to eq(award)
    end
  end

  describe "GET new" do
    it "assigns a new award as @award" do
      get :new, {}
      expect(assigns(:award)).to be_a_new(Award)
    end
  end

  describe "GET edit" do
    it "assigns the requested award as @award" do
      award = Award.create! valid_attributes
      get :edit, {:id => award.to_param}
      expect(assigns(:award)).to eq(award)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Award" do
        expect {
          post :create, {:award => valid_attributes}
        }.to change(Award, :count).by(1)
      end

      it "assigns a newly created award as @award" do
        post :create, {:award => valid_attributes}
        expect(assigns(:award)).to be_a(Award)
        expect(assigns(:award)).to be_persisted
      end

      it "redirects to the created award" do
        post :create, {:award => valid_attributes}
        expect(response).to redirect_to(Award.last)
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      new_attributes = {award_type_id: 2}


      it "updates the requested award" do
        award = Award.create! valid_attributes
        put :update, {:id => award.to_param, :award => new_attributes}
        award.reload
        award.award_type_id.should == 2
      end

      it "assigns the requested award as @award" do
        award = Award.create! valid_attributes
        put :update, {:id => award.to_param, :award => valid_attributes}
        expect(assigns(:award)).to eq(award)
      end

      it "redirects to the award" do
        award = Award.create! valid_attributes
        put :update, {:id => award.to_param, :award => valid_attributes}
        expect(response).to redirect_to(award)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested award" do
      award = Award.create! valid_attributes
      expect {
        delete :destroy, {:id => award.to_param}
      }.to change(Award, :count).by(-1)
    end

    it "redirects to the awards list" do
      award = Award.create! valid_attributes
      delete :destroy, {:id => award.to_param}
      expect(response).to redirect_to(awards_url)
    end
  end

end
