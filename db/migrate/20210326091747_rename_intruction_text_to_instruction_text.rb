class RenameIntructionTextToInstructionText < ActiveRecord::Migration[6.0]
  def change
    rename_column :instructions, :intruction_text, :instruction_text
  end
end
