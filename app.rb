require "google/cloud/bigquery"

creds = Google::Cloud::Bigquery::Credentials.new './Project-b3644e033c8f.json'

bigquery = Google::Cloud::Bigquery.new(
  project_id: 'your_project_id',
  credentials: creds
)

dataset = bigquery.create_dataset 'big_dataset',
                                  name: "Ruby Big tbl ds",
                                  description: 'My ruby big tbl ds'

table = dataset.create_table 'hello_big_tbl' do |schema|
 schema.string 'greetings', mode: :required
end

row = { greetings: 'Hello World!, Hello Cloud Bigtable!, Hello Ruby!' }

table.insert row

table.data.all { |row| puts row[:greetings] }

puts "Deleting table #{table.name}"
table.delete
