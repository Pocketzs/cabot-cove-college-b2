require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe 'instance methods' do
    describe '#resident_count' do
      before :each do
        @course_1 = Course.create!(name: 'Crime Scenes 101')
        @course_2 = Course.create!(name: 'Fingerprinting')
        @course_3 = Course.create!(name: 'Self Defense')
  
        @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
        @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
        @res_3 = Resident.create!(name: 'Jackson Pollock', age: 22, occupation: 'Painter')
        @res_4 = Resident.create!(name: 'Dean Winchester', age: 34, occupation: 'Hunter')
        @res_5 = Resident.create!(name: 'Wednesday Addams', age: 17, occupation: 'Student')
        @res_6 = Resident.create!(name: 'Carey Fisher', age: 54, occupation: 'Actor')
        @res_7 = Resident.create!(name: 'Christopher Waltz', age: 32, occupation: 'Librarian')
        @res_8 = Resident.create!(name: 'Mary Shelley', age: 60, occupation: 'Barista')
  
        @course_2.residents.push(@res_8, @res_3)
        @course_1.residents.push(@res_1, @res_2, @res_3, @res_4, @res_5, @res_6, @res_7, @res_8)
      end
      
      it 'returns the number of residents for a course' do
        expect(@course_1.resident_count).to eq(8)
        expect(@course_2.resident_count).to eq(2)
        expect(@course_3.resident_count).to eq(0)
      end
    end
  end
end
