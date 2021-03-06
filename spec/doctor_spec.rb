require 'spec_helper'

describe Doctor do
  describe '#initialize' do
    it 'makes a doctor of the Doctor class' do
      test_doc = Doctor.new({:name => "Doctor Doolittle", :specialty_id => 2})
      test_doc.should be_an_instance_of Doctor
    end
    it 'initialzes a doctor with name and specialty_id' do
      test_doc = Doctor.new({:name => "Doctor Doolittle", :specialty_id => 2})
      test_doc.name.should eq 'Doctor Doolittle'
    end
  end

  describe '.all' do
    it 'starts as an empty array' do
      Doctor.all.should eq []
    end
  end

  describe '#save' do
    it 'saves the new doctor to the database' do
      test_doc = Doctor.new({:name => "Doctor Ruth", :specialty_id => 3})
      test_doc.save
      Doctor.all.should eq [test_doc]
    end
  end

  describe '#==' do
    it 'compares two doctors based on their name, specialty_id, id' do
      test_doc = Doctor.new({:name => "Dr. Dre", :specialty_id => 3, :id => 5})
      test_doc2  = Doctor.new({:name => "Dr. Dre", :specialty_id => 3, :id => 5})
      test_doc.should eq test_doc2
    end
  end

  describe '#add_patient' do
    it 'creates an instance of Patient' do
      test_doc = Doctor.new({:name => "Dr. Spock", :specialty_id => 7})
      test_doc.save
      test_doc.add_patient({:name => "Baby Boy", :birthdate => '1940-01-01'})
      Patient.all[0].should be_an_instance_of Patient
    end
    it 'adds the patient the the doctors patients array' do
      test_doc = Doctor.new({:name => "Dr. Spock", :specialty_id => 7})
      test_doc.save
      test_patient = test_doc.add_patient({:name => "Baby Boy", :birthdate => '1940-01-01'})
      test_doc.patients.should eq [test_patient]
    end
  end
  describe '#delete_patient' do
    it 'removes a patient from the patients array' do
      test_doc = Doctor.new({:name => "Dr. Spock", :specialty_id => 7})
      test_doc.save
      test_patient = test_doc.add_patient({:name => "Baby Boy", :birthdate => '1940-01-01'})
      test_patient2 = test_doc.add_patient({:name => "Baby Girl", :birthdate => '1940-02-01'})
      test_doc.delete_patient(test_patient2)
      test_doc.patients.should eq [test_patient]
    end
  end
end
