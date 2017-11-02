# rotten-potatoes

rails generate model NAME [field[:type][:index] field[:type][:index]] [options]


<!-- User.first.ratings.where(rateable_type: "Movie") do |rating| puts rating end -->


    <div class="new-review-form ">
      <%= form_with scope: :review, url: review_path, local: true do |form| %>
        <p>
          <%= form.label :Review %><br>
          <%= form.review_field :description %>
        </p>

        <p>
          <%= form.submit %>
        </p>
      <% end %>
    </div>
