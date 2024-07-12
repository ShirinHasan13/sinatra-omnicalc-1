require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_i
  @the_result = @the_num.to_f ** 2
  erb(:square_results)
end

get ("/square_root/new") do
erb(:new_square_root_calc)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_i
  @the_result = @the_num.to_f ** 0.5
 erb(:squareroot_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get ("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @apr3 = @apr.to_fs(:percentage, { :delimiter => ".", :precision => 4} )
  @apr2 = @apr / 12/ 100
  @years = params.fetch("user_years").to_i 
  @years2 = @years * 12
  @pv = params.fetch("user_pv").to_f 
  @pv2 = @pv.to_fs(:currency, { :precision => 2 }) 
  @numerator = @pv * @apr2 * (1 + @apr2)** @years2
  @denominator = (1 + @apr2)**@years2 - 1
  @payment = @numerator / @denominator
  @payment2 = @payment.to_fs(:currency, { :precision => 2 }) 
  
 erb(:payment_results)
end

get ("/random/new") do
  erb(:new_random_calc)
  end

  get ("/random/results") do
    
  @Min= params.fetch("users_min").to_f
  
  @Max = params.fetch("users_max").to_f
  @random = rand(@Min..@Max)
    
   erb(:random_results)
  end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
