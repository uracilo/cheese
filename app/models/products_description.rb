class ProductsDescription < ApplicationRecord
  belongs_to :user

  def create
	redirect_to post_path
end

def destroy
	redirect_to post_path
	
end

end
