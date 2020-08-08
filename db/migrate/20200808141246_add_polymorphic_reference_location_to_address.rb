class AddPolymorphicReferenceLocationToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :location, polymorphic: true, index: true
  end
end
