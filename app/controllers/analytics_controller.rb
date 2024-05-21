class AnalyticsController < ApplicationController
  before_action :authenticate_user!

  def index
      @customers_by_year = Customer.group_by_year(:created_at).count
      @customers_by_month = Customer.group_by_month(:created_at).count
      @years = @customers_by_year.keys.map { |date| date.strftime("%Y") }
      @year_counts = @customers_by_year.values
      @months = @customers_by_month.keys.map { |date| date.strftime("%B %Y") }
      @month_counts = @customers_by_month.values
      @unique_years = @years.uniq

      @orders_by_year = Order.group_by_year(:created_at).count
      @orders_by_month = Order.group_by_month(:created_at).count
      @years_o = @orders_by_year.keys.map { |date| date.strftime("%Y") }
      @year_counts_o = @orders_by_year.values
      @months_o = @orders_by_month.keys.map { |date| date.strftime("%B %Y") }
      @month_counts_o = @orders_by_month.values
      @unique_years_o = @years_o.uniq

      @orders_today = Order.created_today.count

      @orders_by_week = Order.group_by_week(:created_at).count
      @most_frequent_week = @orders_by_week.max_by { |week, count| count }
      @highest_order_in_a_day = @most_frequent_week.last

      @gender_demographics = User.group(:gender).count
      @orders_by_weekday = Order.group_by_day_of_week(:created_at, format: "%A").count
      @month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November','December']
      @users = User.all
      @customers = Customer.all

      @yearly_sales = Order.group_by_year(:created_at).sum(:total_amount)
      @monthly_sales = Order.group_by_month(:created_at).sum(:total_amount)

    end



end






