require 'rails_helper'

describe User do
  describe '#create' do

    it "nameがないと場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがないと場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがないと場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "start_weightがないと場合は登録できないこと" do
      user = build(:user, start_weight: "")
      user.valid?
      expect(user.errors[:start_weight]).to include("を入力してください")
    end

    it "target_weightがないと場合は登録できないこと" do
      user = build(:user, target_weight: "")
      user.valid?
      expect(user.errors[:target_weight]).to include("を入力してください")
    end
    
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "start_weightが４桁以上の数字だと登録できないこと" do
      user = create(:user)
      user = build(:user, start_weight: 1234)
      user.valid?
      expect(user.errors[:start_weight]).to include("は999以下の値にしてください")
    end

    it "target_weightが４桁以上の数字だと登録できないこと" do
      user = create(:user)
      user = build(:user, target_weight: 9876)
      user.valid?
      expect(user.errors[:target_weight]).to include("は999以下の値にしてください")
    end

    it "start_weightが数字以外だと登録できないこと" do
      user = create(:user)
      user = build(:user, start_weight: "hello")
      user.valid?
      expect(user.errors[:start_weight]).to include("は数値で入力してください")
    end

  end
end