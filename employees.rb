class Employee
  attr_accessor :full_name
  attr_accessor :id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end

  def surname
    @full_name.split(' ', 2).last
  end

  def name
    @full_name.split(' ', 2).first
   #first= s.match(" ").pre_match
  end
end

class Hash
  def delete_value(value)
  delete_if { |k,v| v == value }
  end
end

#	h = {'apple' => 'green', 'potato' => 'red', 'sun' => 'yellow',
#	     'katydid' => 'green' }
#	h.delete_value('green')
#	h

class Programmer < Employee
  attr_accessor :languages

  def initialize(full_name, id, languages)
    super(full_name, id)
    @languages = languages
  end
end

class OfficeManager < Employee
  attr_accessor :office

  def initialize(full_name, id, office)
    super(full_name, id)
    @office = office
  end
end

class EmployeeRegular < Employee
  def initialize(full_name, id)
    super(full_name, id)
  end
end


def add_employee(employees)
  puts '[Add an employee]'
  print '[e]mployee, [p]rogrammer or [o]ffice manager?'
  role = gets.chomp
  
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp
  
  case role
    when 'p'
      languages = []
      print 'Programming languages?'
      lang = gets.chomp
      while !lang.empty?
        languages << lang
        lang = gets.chomp
      end
      employee = Programmer.new(full_name, id, languages)
       
    when 'o'
      print 'Office?'
      office=gets.chomp
      employee = OfficeManager.new(full_name, id, office)
    when 'e' 
      employee = Employee.new(full_name, id)
  end
  employees << employee
end

def view_employees(employees)
  sorted_employees(employees).each do |employee|
    print "#{employee.full_name}, #{employee.id}"
    case employee
      when Programmer then puts ", #{employee.languages}" 
      when OfficeManager then puts ", #{employee.office}"
      else puts " "
    end
  end
end


def edit_employee(employees)  ####################### needs fixing
  puts '[Edit an employee]'
  print 'ID of the employee you want to edit: '
  oldID=gets.chomp

  employees.each do |employee|
    next if employee.id!=oldID
      
    puts "old name: #{employee.full_name}"
    print "new name: "
    newName = gets.chomp
    employee.full_name=newName
    puts "old ID: #{employee.id}"
    print "new id: "
    newID = gets.chomp
    employee.id = newID

    case employee
      when Programmer then
        puts "old languages: #{employee.languages}"
        languagesNEW =[]
        print 'Programming languages?'
        langNEW = gets.chomp
        while !langNEW.empty?
          languagesNEW << langNEW
          langNEW = gets.chomp
        end
        employee.languages = languagesNEW
      when OfficeManager then
        puts "old office: #{employee.office}"
        print 'Office?'
        officeNEW = gets.chomp
        employee.office = officeNEW
    end
  end
end

 

def sorted_employees(employees)
  print 'Do you want to sort the employees by [f]irst or [l]ast name '
  sorting=gets.chomp
  case sorting
    when 'f' then
      employees.sort_by do |employee|
        employee.name
      end
    when 'l' then
      employees.sort_by do |employee|
        employee.surname
      end
  end
end 


def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following:'
  puts 'a - to add a new employee'
  puts 'v - to view existing employees'
  puts 'e - to edit an employee'
  puts 'q - to quit the program'
end


def get_action
   gets.downcase[0]
end


#main
puts 'Employee-o-matic 4000'

employees = []

loop do
  print 'What do you want to do? '
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'v' then view_employees(employees)
  when 'e' then edit_employee(employees)
  when 'q' then quit
  else
    print_help
  end
end
