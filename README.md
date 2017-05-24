# Family Friday Demo

This repo builds a responsive email template to solicit feedback from teammates after Family Friday meals. Since information collected from the email can offer actionable insights, the email posts all relevant information to a database. As such, the email is realized with Rails app with a PostgreSQL database.

![Email](app/assets/images/template.png)

## Class structure

To streamline the persistence of data captured, information is divided into primary tables:
- `Restaurant`, which holds basic information of the Family Friday restaurant: logo, name, and yelp_link
- `User` (e.g., "A-Lister" or "member"), which captures vital information such as email (how do teammates receive the email without an email address?), name, and team
- `Lunch`, which represents the Family Friday event itself. The lunch is tied to a restaurant_id as well as a unique name
- `Review`, originally designed to be a join-table for User and Lunch, but grew to store the rating as well

Models for these tables include relevant associations. For example, since the `Review` table holds a foreign key (`lunch_id`) that corresponds to a column in the `Lunch` table (no pun intended), a given review must belong to a lunch. Reversing this relationship, a lunch may have many reviews. A snippet of the `Lunch` model:

```ruby
# == Schema Information
#
# Table name: lunches
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Lunch < ApplicationRecord
  belongs_to :restaurant

  has_many :reviews

  has_many :users,
    through: :reviews,
    source: :user

  validates :name, :restaurant_id, presence: true
  validates :name, uniqueness: true

  def average
    sum = 0
    self.reviews.each { |review| sum += review.rating }
    (sum.to_f/(self.reviews.count)).round(2)
  end
end
```

Additional features of the class structure are validations for non-null values for `restaurant_id`, as well as a custom methods to aid in calculations of persisted data.

## Email function

As emails are opened in in diverse environments (mobile, tablet, desktop, Outlook, Gmail, etc.), the HTML email itself should be responsive. Formatting of the HTML email is constructed with the MJML framework.

To store teammates' feedback in a database, each numbered button represents an HTML form. A `POST` request is sent upon submission, with hidden fields capturing the `rating`, `user_id`, and `lunch_id`.

```html
<form action="<%= reviews_url %>" method="POST">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <input type="hidden" name="review[user_id]" value="1">
  <input type="hidden" name="review[lunch_id]" value="1">
  <input type="hidden" name="review[rating]" value="5">
  <input src="http://res.cloudinary.com/instagramme/image/upload/v1495519201/imageedit_2_9784742962_dme227.png"
    type="image"
    style="border:none;border-radius:0px;display:block;outline:none;text-decoration:none;width:100%;height:auto;"
    width="80" />
</form>
```

## Analytics

Each lunch's `show` page offers information as to its feedback. Leveraging the aforementioned associations between the four classes, we are able to view insights for that lunch, including its average score and current number of reviews.

![Analytics](app/assets/images/analytics.png)

## Potential future release
* [ ] Deeper analytics: reviews to be viewable in table-format, with additional information per review (user name, details about the user, etc.)
* [ ] Additional database information: which teammate dined with which teammate?
* [ ] Availability of further comments for low scores -- discover why a certain Family Friday may not have been a pleasant experience
* [ ] Tests
