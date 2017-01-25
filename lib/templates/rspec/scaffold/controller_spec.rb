require 'rails_helper'

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller, type: :controller do
  let!(:<%= ns_file_name %>) { create :<%= ns_file_name %> }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_<%= ns_file_name %>_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_<%= ns_file_name %>_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

<% unless options[:singleton] -%>
    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:<%= table_name %>)).to eq [<%= ns_file_name %>] }
    end
  
<% end -%>
    describe "GET show" do
      subject { get :show, id: <%= ns_file_name %>.to_param }
      before { subject }

      it { expect(assigns :<%= ns_file_name %>).to eq <%= ns_file_name %> }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :<%= ns_file_name %>).to be_a_new(<%= class_name %>) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: <%= ns_file_name %>.to_param }
      before { subject }

      it { expect(assigns :<%= ns_file_name %>).to eq <%= ns_file_name %> }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, <%= ns_file_name %>: <%= ns_file_name %>_params }

      describe "with valid params" do
        let(:<%= ns_file_name %>_params) { valid_<%= ns_file_name %>_params }

        it { expect { subject }.to change(<%= class_name %>, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :<%= ns_file_name %>).to be_a <%= class_name %> }
          it { expect(assigns :<%= ns_file_name %>).to be_persisted }
          it { expect(response).to redirect_to <%= class_name %>.last }
        end
      end
  
      describe "with invalid params" do
        let(:<%= ns_file_name %>_params) { invalid_<%= ns_file_name %>_params }
        before { subject }

        it { expect(assigns(:<%= ns_file_name %>)).to be_a_new <%= class_name %> }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: <%= ns_file_name %>.to_param, <%= ns_file_name %>: <%= ns_file_name %>_params }

      describe "with valid params" do
        let(:<%= ns_file_name %>_params) { valid_<%= ns_file_name %>_params }

        it "updates the requested <%= ns_file_name %>" do
          allow(<%= class_name %>).to receive(:find).and_return(<%= ns_file_name %>)
          expect(<%= ns_file_name %>).to receive(:update).with(<%= ns_file_name %>_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :<%= ns_file_name %>).to eq <%= ns_file_name %> }
          it { expect(response).to redirect_to <%= ns_file_name %> }
        end
      end

      describe "with invalid params" do
        let(:<%= ns_file_name %>_params) { invalid_<%= ns_file_name %>_params }
        before { subject }

        it { expect(assigns :<%= ns_file_name %>).to eq <%= ns_file_name %> }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: <%= ns_file_name %>.to_param }

      it { expect { subject }.to change(<%= class_name %>, :count).by(-1) }
      it { subject ; expect(response).to redirect_to <%= index_helper %>_url }
    end
  end
end
<% end -%>
