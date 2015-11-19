require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do 
    @post = Post.new(title: 'My Title', content: 'My content') 
  end


  let(:valid_attributes) { { } }
  let(:valid_session) { { } }

  context '#new' do
    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to  be_a_new(Post)
    end  

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end


  context '#index' do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}, valid_session
      assigns(:posts).should eq([post])
    end

    it "renders the index template"  do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end

    it "renders the posts/index template"  do
      get :index
      expect(response).to  render_template("posts/index")
      expect(response.body).to eq ""
    end
  end


  context '#create' do
    it "creates a new post and assign it as @post" do
      expect { 
        post :create, 
        {:post => valid_attributes}, valid_session 
      }.to change(Post, :count).by(1)
      post :create, {:post => valid_attributes}, valid_session
      expect(assigns(:post)).to be_a(Post)
    end

    it "redirects to the created post" do
      post :create, {:post => valid_attributes}, valid_session
      expect(response).to redirect_to(Post.last)
    end
  end

  context '#destroy' do
    before :each do
      @post = Post.create!
    end
    
    it 'deletes the post' do
      expect{ 
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end
  end
   
		
end
