require "rails_helper"

RSpec.describe "ApplicationRoutes", type: :routing do
  context "root" do
    it "get / success" do
      expect(get: '/').to route_to 'home#index'
    end
  end

  context "signup" do
    it "get /signup success" do
      expect(get: '/signup').to route_to 'accounts#new'
    end

    it "post /signup success" do
      expect(post: '/signup').to route_to 'accounts#create'
    end
  end

  context "signin" do
    it "get /signin success" do
      expect(get: '/signin').to route_to 'sessions#new'
    end

    it "post /signin success" do 
      expect(post: '/signin').to route_to 'sessions#create'
    end
  end

  context 'signout' do
    it "delete /signout success" do 
      expect(delete: '/signout').to route_to 'sessions#destroy'
    end
  end

  context "users" do
    it "get /users/new fail" do
      expect(get: '/users/new').not_to be_routable
    end

    it "post /users fail" do
      expect(post: '/users').not_to be_routable
    end

    it "get /users fail" do
      expect(get: '/users').not_to be_routable
    end

    it "get /users/1 fail" do
      expect(get: '/users/1').not_to be_routable
    end

    it "get /1 fail" do
      expect(get: '/1').not_to be_routable
    end
  end

  describe "accounts active" do 
    context "/accounts/activations/:id/edit is routable when id is valid " do 
      it "get /accounts/activations/hijinhu/edit" do 
        expect(get: '/accounts/activations/hijinhu/edit').to route_to 'accounts/activations#edit', id: 'hijinhu'
      end

      it "get /accounts/activations/tetabtab/edit" do 
        expect(get: '/accounts/activations/tetabtab/edit').to route_to 'accounts/activations#edit', id: 'tetabtab'
      end

      it "get /accounts/activations/55brab-br/edit" do 
        expect(get: '/accounts/activations/55brab-br/edit').to route_to 'accounts/activations#edit', id: '55brab-br'
      end

      it "get /accounts/activations/bab42526b/edit" do 
        expect(get: '/accounts/activations/bab42526b/edit').to route_to 'accounts/activations#edit', id: 'bab42526b'
      end
    end

    context "/accounts/activations/:id/edit not routable when id is too short (minimum 6 chars)" do 
      it "get /accounts/activations/edit" do 
        expect(get: '/accounts/activations/edit').not_to be_routable
      end

      it "get /accounts/activations/a/edit" do 
        expect(get: '/accounts/activations/a/edit').not_to be_routable
      end

      it "get /accounts/activations/bab_/edit" do 
        expect(get: '/accounts/activations/bab_/edit').not_to be_routable
      end

      it "get /accounts/activations/bab-0/edit" do 
        expect(get: '/accounts/activations/bab-0/edit').not_to be_routable
      end
    end

    context "/accounts/activations/:id/edit not routable when id is invalid " do 
      it "get /accounts/activations/ba^brab/edit" do 
        expect(get: '/accounts/activations/ba^brab/edit').not_to be_routable
      end

      it "get /accounts/activations/ba@brab/edit" do 
        expect(get: '/accounts/activations/ba@brab/edit').not_to be_routable
      end

      it "get /accounts/activations/-tst1%1/edit" do 
        expect(get: '/accounts/activations/-tst1%1/edit').not_to be_routable
      end
    end

    context "/accounts/activations/new is routable " do 
      it "get /accounts/activations/new" do 
        expect(get: '/accounts/activations/new').to route_to 'accounts/activations#new'
      end
    end
  end

  describe "reset password" do 
    it "get accounts/passwords/forgot is routable" do 
      expect(get: 'accounts/passwords/forgot').to route_to 'accounts/passwords#new'
    end

    it "post accounts/password/forgot is routable" do 
      expect(post: 'accounts/passwords/forgot').to route_to 'accounts/passwords#create'
    end

    context "get /accounts/passwords/:id/edit" do
      it "get /accounts/passwords/edit isn't routable" do
        expect(get: '/accounts/passwords/edit').not_to be_routable
      end

      it "get /accounts/passwords/brae/edit isn't routable" do
        expect(get: '/accounts/passwords/brae/edit').not_to be_routable
      end

      it "get /accounts/passwords/@rbeb/edit isn't routable" do
        expect(get: '/accounts/passwords/@rbeb/edit').not_to be_routable
      end

      it "get /accounts/passwords/hijinhu/edit isn't routable" do
        expect(get: '/accounts/passwords/hijinhu/edit').to route_to 'accounts/passwords#edit', id: 'hijinhu'
      end
    end

    context "patch /accounts/passwords/:id" do 
      it "patch /accounts/passwords/hijinhu is routable" do 
        expect(patch: '/accounts/passwords/hijinhu').to route_to 'accounts/passwords#update', id: 'hijinhu'
      end

      it "patch /accounts/passwords/tewtab_b is routable" do
        expect(patch: '/accounts/passwords/tewtab_b').to route_to 'accounts/passwords#update', id: 'tewtab_b'
      end

      it "patch /accounts/passwords/bbe isn't routable" do 
        expect(patch: '/accounts/passwords/bbe').not_to be_routable 
      end
    end
  end

  context "account edit" do 
    it "get /account/edit  is routable" do 
      expect(get: '/account/edit').to route_to "accounts#edit"
    end

    it "patch /account/edit is routable" do
      expect(patch: '/account/edit').to route_to "accounts#update"
    end
  end

  describe "user" do
    it "get /hijinhu/aboutme is routable" do 
      expect(get: '/hijinhu/aboutme').to route_to 'users#aboutme', id: 'hijinhu'
    end
  end

  describe "articles" do
    it "get /hijinhu/articles" do
      expect(get: '/hijinhu/articles').to route_to 'articles#index', user_id: 'hijinhu'
    end

    it "post /hijinhu/articles" do
      expect(post: '/hijinhu/articles').to route_to 'articles#create', user_id: 'hijinhu'
    end

    it "get /hijinhu/articles/new" do
      expect(get: '/hijinhu/articles/new').to route_to 'articles#new', user_id: 'hijinhu'
    end

    it "get /hijinhu/articles/1" do
      expect(get: '/hijinhu/articles/1').to route_to 'articles#show', user_id: 'hijinhu', id: '1'
    end

    it "get /hijinhu/articles/1/edit" do
      expect(get: '/hijinhu/articles/1/edit').to route_to 'articles#edit', user_id: 'hijinhu', id: '1'
    end

    it "patch /hijinhu/articles/1" do
      expect(patch: '/hijinhu/articles/1').to route_to 'articles#update', user_id: 'hijinhu', id: '1'
    end

    it "delete /hijinhu/articles/1" do
      expect(delete: '/hijinhu/articles/1').to route_to 'articles#destroy', user_id: 'hijinhu', id: '1'
    end
  end
end