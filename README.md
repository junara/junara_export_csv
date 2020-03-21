# JunaraExportCsv
Export array or active record to csv.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'junara_export_csv', git: 'git://github.com/junara/junara_export_csv.git'
```

And then execute:

    $ bundle install

## Usage

* output array with item

```irb
records = [['jungo', 'araki', 'usagi']]
header = ['first_name', 'last_name', 'animal']

JunaraExportCsv.run(records, header: header, filename: '2020_export.csv') do |record|
  [record[0], record[1], record[2]]
end
#=> '2020_export.csv'
# create '2020_export.csv'
# first_name,last_name,animal
# jungo,araki,usagi
```

* output active record

```irb
# User has "first_name, last_name, animal" attributes
users = User.all

JunaraExportCsv.run(users, header: header, filename: '2020_export.csv') do |user|
  [user.first_name, user.last_name, user.animal]
end
#=> '2020_export.csv'
```
