require 'spec_helper'

describe GearsController do
  let(:default_params) { { format: :json } }
  let(:valid_attributes) { attributes_for(:gear) }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all gears as @gears" do
      gear = create(:gear)
      get :index, {}, valid_session
      assigns(:gears).should eq([gear])
    end
  end

  describe "GET show" do
    let(:gear) { create(:gear) }

    it "assigns the requested gear as @gear" do
      get :show, { :id => gear.to_param }, valid_session
      assigns(:gear).should eq(gear)
    end

    describe "json response" do
      render_views

      before do
        get :show, { :id => gear.to_param }, valid_session
        @json = JSON.parse(response.body).with_indifferent_access
      end

      specify { @json[:id].should == gear.id }
      it "should have all of the valid attributes" do
        valid_attributes.each do |attribute, value|
          @json[attribute.to_sym].should == value
        end
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gear" do
        expect {
          post :create, { :gear => valid_attributes }, valid_session
        }.to change(Gear, :count).by(1)
      end

      it "assigns a newly created gear as @gear" do
        post :create, { :gear => valid_attributes }, valid_session
        assigns(:gear).should be_a(Gear)
        assigns(:gear).should be_persisted
      end

      describe "json response" do
        render_views

        before do
          post :create, { :gear => valid_attributes }, valid_session
          @json = JSON.parse(response.body).with_indifferent_access
        end

        specify { @json[:id].should be > 0 }

        it "should have all of the valid attributes" do
          valid_attributes.each do |attribute, value|
            @json[attribute.to_sym].should == value
          end
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gear as @gear" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gear.any_instance.stub(:save).and_return(false)
        post :create, { :gear => { "teeth" => "invalid value" }}, valid_session
        assigns(:gear).should be_a_new(Gear)
      end

      describe "json response" do
        render_views

        before do
          post :create, { :gear => { "teeth" => "invalid value" }}, valid_session
          @json = JSON.parse(response.body).with_indifferent_access
        end

        specify { @json[:errors].should_not be_empty }
        specify { @json[:errors].first.should be_a String }
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:gear) { create(:gear) }

      it "updates the requested gear" do
        # Assuming there are no other gears in the database, this
        # specifies that the Gear created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Gear.any_instance.should_receive(:update).with({ "teeth" => 1 })
        put :update, { :id => gear.to_param, :gear => { "teeth" => 1 }}, valid_session
      end

      it "assigns the requested gear as @gear" do
        put :update, { :id => gear.to_param, :gear => gear.attributes }, valid_session
        assigns(:gear).should eq(gear)
      end

      describe "json response" do
        render_views

        before do
          put :update, { :id => gear.to_param, :gear => { "teeth" => 1 } }, valid_session
          @json = JSON.parse(response.body).with_indifferent_access
        end

        specify { @json[:teeth].should == 1 }
      end
    end

    describe "with invalid params" do
      let(:gear) { create(:gear) }

      it "assigns the gear as @gear" do
        # Trigger the behavior that occurs when invalid params are submitted
        Gear.any_instance.stub(:save).and_return(false)
        put :update, { :id => gear.to_param, :gear => { "teeth" => "invalid value" }}, valid_session
        assigns(:gear).should eq(gear)
      end

      describe "json response" do
        render_views

        before do
          put :update, { :id => gear.to_param, :gear => { "teeth" => "invalid value" }}, valid_session
          @json = JSON.parse(response.body).with_indifferent_access
        end

        specify { @json[:errors].should_not be_empty }
        specify { @json[:errors].first.should be_a String }
      end
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested gear" do
      gear = create(:gear)
      expect {
        delete :destroy, { :id => gear.to_param }, valid_session
      }.to change(Gear, :count).by(-1)
    end

    describe "json response" do
      render_views

      before do
        gear = create(:gear)
        delete :destroy, { :id => gear.to_param }, valid_session
        @json = JSON.parse(response.body).with_indifferent_access
      end

      specify { @json.should == {} }
      specify { response.status.should == 204 }
    end
  end

end
