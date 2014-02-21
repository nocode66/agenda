class Person < ActiveRecord::Base
	validates  :telephone_number, format: { with: /\d{10}/, message: "Numarul de telefon telefon ar trebui sa contina doar 10 cifre" }
	validates  :telephone_number, uniqueness: true
	validates  :fax_number, format: { with: /\d{10}/, message: "Numarul de fax telefon ar trebui sa contina doar 10 cifre" }
	validates  :fax_number, uniqueness: true
	validates  :first_name, presence: true
	validates  :last_name, presence: true

	def full_name
		"#{first_name} #{last_name}"
	end
end
