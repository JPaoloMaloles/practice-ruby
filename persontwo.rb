students = []
while true
  puts "Enter student's name: 'type 'nothing' if there are no more students'"
  student = gets.chomp
  if student == "nothing"
    break
  else
    students << student
  end
end
p students.length

while students.length >= 2
  #puts "cat"
  student1 = students[rand(0...students.length)]
  students.delete(student1)
  student2 = students[rand(0...students.length)]
  students.delete(student2)
  if students.length == 1
    student3 = students[0]
    students.delete(student3)
    puts "Group: #{student1} #{student2} #{student3}"
  else
    puts "Group: #{student1} #{student2}"
  end
  #puts "hello"
  p students
end
