require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

    valid_attributes = {user_id: 1, kill: 14, deaths: 53, shots_fired: 24, shots_hit: 23, headshots: 4, round: 1}


    describe "GET index" do
        it "assigns all games as @games" do
            
            game = Game.create! valid_attributes
            get :index, {}
            expect(assigns(:games)).to eq([game])
        end
    end

    describe "GET show" do
        it "assigns the requested game as @game" do
            
            game = Game.create! valid_attributes
            get :show, {:id => game.to_param}
            expect(assigns(:game)).to eq(game)
        end
    end

    describe "GET new" do
        it "assigns a new game as @game" do
            get :new, {}
            expect(assigns(:game)).to be_a_new(Game)
        end
    end

    describe "GET edit" do
        it "assigns the requested game as @game" do
            
            game = Game.create! valid_attributes
            get :edit, {:id => game.to_param}
            expect(assigns(:game)).to eq(game)
        end
    end

    describe "POST create" do
        describe "with valid params" do
            it "creates a new Game" do
                expect {
                    post :create, {:game => valid_attributes}
                }.to change(Game, :count).by(1)
            end

            it "assigns a newly created game as @game" do
                post :create, {:game => valid_attributes}
                expect(assigns(:game)).to be_a(Game)
                expect(assigns(:game)).to be_persisted
            end

            it "redirects to the created game" do
                post :create, {:game => valid_attributes}
                expect(response).to redirect_to(Game.last)
            end
        end

    end

    describe "PUT update" do
        describe "with valid params" do
            new_attributes = {deaths: 51}

            it "updates the requested game" do
                
                game = Game.create! valid_attributes
                put :update, {:id => game.to_param, :game => new_attributes}
                game.reload
                game.deaths.should == 51
            end

            it "assigns the requested game as @game" do
                
                game = Game.create! valid_attributes
                put :update, {:id => game.to_param, :game => valid_attributes}
                expect(assigns(:game)).to eq(game)
            end

            it "redirects to the game" do
                
                game = Game.create! valid_attributes
                put :update, {:id => game.to_param, :game => valid_attributes}
                expect(response).to redirect_to(game)
            end
        end

    end

    describe "DELETE destroy" do
        it "destroys the requested game" do
            
            game = Game.create! valid_attributes
            expect {
                delete :destroy, {:id => game.to_param}
            }.to change(Game, :count).by(-1)
        end

        it "redirects to the games list" do
            
            game = Game.create! valid_attributes
            delete :destroy, {:id => game.to_param}
            expect(response).to redirect_to(games_url)
        end
    end

end
