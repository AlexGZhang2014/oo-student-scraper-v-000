class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  describe "#new" do
    it "takes in an argument of a hash and sets that new student's attributes using the key/value pairs of that hash." do 
      expect{Student.new({:name => "Sophie DeBenedetto", :location => "Brooklyn, NY"})}.to_not raise_error
      expect(student.name).to eq("Alex Patriquin")
      expect(student.location).to eq("New York, NY")
    end 

    it "adds that new student to the Student class' collection of all existing students, stored in the `@@all` class variable." do 
      expect(Student.class_variable_get(:@@all).first.name).to eq("Alex Patriquin")
    end
  end

  def initialize(student_hash)
    
    @@all << self
  end

  describe ".create_from_collection" do 
    it "uses the Scraper class to create new students with the correct name and location." do 
      Student.class_variable_set(:@@all, [])
      Student.create_from_collection(student_index_array)
      expect(Student.class_variable_get(:@@all).first.name).to eq("Alex Patriquin")
    end
  end

  def self.create_from_collection(students_array)
    students_array.each do |student_hash|
      self.new(student_hash)
    end
  end

  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    @@all
  end
end

