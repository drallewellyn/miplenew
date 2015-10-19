class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, : registrable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
