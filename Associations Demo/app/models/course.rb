# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Course < ActiveRecord::Base
  belongs_to(
    :instructor,
    class_name: "User",
    foreign_key: :instructor_id,
    primary_key: :id
  )

  # belongs_to vs. has_one:
  #   belongs_to: foreign key lives in the current record (row)
  #   has_one: foreign key lives in some other record (row)

  belongs_to(
    :prerequisite,
    class_name: "Course",
    foreign_key: :prereq_id,
    primary_key: :id
  )

  # has_many(
  #   :postrequisites,
  #   class_name: "Course",
  #   foreign_key: :prereq_id,
  #   primary_key: :id
  # )

  has_many(
    :enrollments,
    class_name: "Enrollment",
    foreign_key: :course_id,
    primary_key: :id
  )

  has_many(
    :enrolled_students,
    through: :enrollments,
    source: :user
  )
end
