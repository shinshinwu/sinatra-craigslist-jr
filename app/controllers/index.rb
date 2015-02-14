# show all the categories
get '/categories' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :"categories/index"
end

# where to use categories show erb view?

# list all articles belongs to the category
get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @articles = Article.where(category_id: params[:category_id])
  erb :"articles/index"
end

# use the secret link generated to edit the specific article
get '/categories/articles/:id/:value' do
  @article = Article.find(params[:id])
  erb :"articles/edit"
end

# create a new article belongs to a specific category
get '/categories/:category_id/articles/new' do
  @category = Category.find(params[:category_id])
  erb :"articles/new"
end

# displays a specific article belongs to a specific category
get '/categories/:category_id/articles/:id' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  erb :"articles/show"
end

# create a new article specific to the category
post '/categories/:category_id/articles' do
  @new_article = Article.create(params[:article])
  redirect "/categories/#{params[:category_id]}/articles/#{@new_article.id}"
end

# edit the found article and save the edits
put '/categories/:category_id/articles/:id/edit' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect "/categories/#{params[:category_id]}/articles/#{article.id}"
end





