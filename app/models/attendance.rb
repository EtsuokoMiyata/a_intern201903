class Attendance < ApplicationRecord
  belongs_to :user
  enum instructor_confirm_overtime: { "なし" => 1, "申請中" => 2, "承認" => 3, "否認" => 4 }
end
