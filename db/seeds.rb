# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

start_time = Time.now

json = File.read(Rails.root.join('lib', 'assets', 'qdaily.json'))
entries = JSON.parse(json)

admin = User.create!(
  name: 'billow',
  email: 'codepunk@qq.com',
  password: 'h3110w021d',
  admin: true
)

# 记录创建的记录数量
entries_count = 0

tag = Tag.create!(title: "好奇心", description: "来自好奇心日报")

entries.each do |item|
  entry = Entry.create(
    title: item['title'],
    content: item['content'],
    status: 1,
    user: admin
  )
  entry.tags << tag

  if entry.save
    entries_count += 1
  end
end

end_time = Time.now
elapsed_time = end_time - start_time

puts "Created #{entries_count} records."
puts "Time elapsed: #{elapsed_time} seconds."