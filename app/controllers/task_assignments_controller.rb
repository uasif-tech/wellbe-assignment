# frozen_string_literal: true

class TaskAssignmentsController < ApplicationController
  before_action :set_patient
  before_action :set_task_assignment, only: %i[show edit update destroy]

  def index
    @task_assignments = @patient.task_assignments.all
  end

  def show; end

  def new
    @all_tasks = Task.includes(:task_items).all
    @task_assignment = @patient.task_assignments.new
  end

  def edit; end

  def create
    params.dig(:task_assignment, :task_item_ids)
          .reject(&:empty?)
          .each do |item_id|
            @patient.task_assignments.new(
                task_assignment_params.merge({task_item_id: item_id.to_i})
            )
          end

    if @patient.save
      return redirect_to patients_path,
                         notice: t('.index.messages.success_create')
    end

    @all_tasks = Task.includes(:task_items).all
    render :new, status: :unprocessable_entity
  end

  def update
    if @task_assignment.update(task_assignment_params)
      return redirect_to patient_task_assignments_path(@patient),
                         notice: t('.index.messages.success_update')
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @task_assignment.destroy
    redirect_to task_assignments_path,
                notice: t('.index.messages.success_destroy')
  end

  private

  def set_patient
    @patient = Patient.find_by_id(params[:patient_id])
  end

  def set_task_assignment
    @task_assignment = TaskAssignment.find(params[:id])
  end

  def task_assignment_params
    params.require(:task_assignment).permit(:patient_id, :task_id, :due_date, :is_completed)
  end
end
