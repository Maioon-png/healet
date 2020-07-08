require 'rails_helper'

describe WeightsController do

  xdescribe 'GET #new' do
    before do
      user = create(:user)
      login_user user
    end

    it "new.html.erbに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  xdescribe 'GET #edit' do
    before do
      user = create(:user)
      login_user user
    end
    it "@weightに正しい値が入っていること" do
      weight = create(:weight)
      get :edit, params: { id: weight }
      expect(assigns(:weight)).to eq weight
    end

    it "edit.html.erbに遷移すること" do
      weight = create(:weight)
      get :edit, params: { id: weight }
      expect(response).to render_template :edit
    end
  end
  
  xdescribe 'GET #index' do
    it "@weightsに正しい値が入っていること" do 
      weights = create_list(:weight, 5)
      user = weights.first.user
      login_user user
      user_weights = user.weights.pluck(:weight)
      get :index
      expect(assigns(:weights)).to match(user_weights.sort{ |a, b| b.recorded_date <=> a.recorded_date })
    end

    it "index.html.erbに遷移すること" do
      weights = create_list(:weight, 5)
      user = weights.first.user
      login_user user
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'Post #create' do
    let(:params) { { user_id: @user.id, weight: attributes_for(:weight) } }

    context 'ログインしている場合' do
      before do
        @user = create(:user)
        login_user @user
      end

      context "保存に成功した時" do
        subject {
          post :create,
          params: params
        }

        it "weightが保存されること" do
          expect{ subject }.to change(Weight, :count).by(1)
        end
    
        it "正しいビューに変遷する" do
          subject
          expect(response).to redirect_to(weights_path)
        end
    
      end
    
      context "保存に失敗した時" do
        let(:invalid_params) { { user_id: @user.id, weight: attributes_for(:weight, weight: nil, recorded_date: nil) } }
        subject {
          post :create,
          params: invalid_params
        }

        it "weightが保存されない" do
          expect{ subject }.not_to change(Weight, :count)
        end
    
        it "正しいビューに変遷する" do
          subject
          expect(response).to render_template :new
        end
    
      end
    end

    context 'ログインしていない場合' do
      it 'root_pathにリダイレクトすること' do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

  end


end