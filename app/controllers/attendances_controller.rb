class AttendancesController < ApplicationController
  def create
    @user=User.find(params[:user_id])
    @attendance = @user.attendances.find_by(worked_on: Date.today)
    if @attendance.started_at.nil?
      @attendance.update_attributes(started_at: current_time)
      flash[:info]="おはようございます。"
    elsif @attendance.finished_at.nil?
      @attendance.update_attributes(finished_at: current_time)
      flash[:info]="お疲れ様でした。"
    else
      flash[:danger]="トラブルがあり、登録できませんでした。"
    end
    redirect_to @user
  end
  
  def edit
    @user=User.find(params[:id])
    @first_day=first_day(params[:date])
    @last_day=@first_day.end_of_month
    @dates=user_attendances_month_date
  end
  
  def update
    @user=User.find(params[:id])
    if attendances_invalid?
      attendance_params.each do |id, item|
        attendance=Attendance.find(id)
        attendance.update_attributes(item)
      end
      flash[:success]="勤怠情報を更新しました。"
      redirect_to user_url(@user, params:{first_day: params[:date]})
    else
      flash[:danger] = "不正な時間入力がありました。再入力してください。"
      redirect_to edit_attendances_path(@user, params[:date])

    end
  end

  def edit_overtime
    @user=User.find(params[:id])
    @overtime = @user.attendances.find_by(worked_on: params[:worked_on])
    @youbi= params[:youbi]
    @user_id=params[:id]
    #debugger
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  
  
  def update_overtime

    respond_to do |format|
      #このアクション内のparams[:id]は　attendanceテーブルのidのこと
      @user=User.find(params[:user_id])
      @overtime = @user.attendances.find(params[:id])
      
      #debugger
      if @overtime.update_attributes(overtime_params)
        format.html
        format.js
      else
        format.js{render :show}
        
      end
    end
  end
  
  
  private
    def attendance_params
      params.permit(attendances:[:started_at, :finished_at, :note])[:attendances]
    end

    def overtime_params
      params.require(:attendance).permit(:worked_on, :scheduled_end_time, :next_day, :processing_content, :instructor_confirm_overtime)
    end

end
