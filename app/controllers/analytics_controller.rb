class AnalyticsController < ApplicationController

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
  end

end