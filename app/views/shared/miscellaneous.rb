<p>
  <strong> Bookings:</strong>
</p>


<table>
<thead>
  <tr>
    <th>Dog Renter</th>
    <th>Booking Start</th>
    <th>Booking End</th>
    <th colspan="3"></th>
  </tr>
</thead>

<tbody>
  <% @dog.bookings.each do |booking| %>
    <tr>
      <td><%= booking.user.email %></td>
      <td><%= booking.start_date %></td>
      <td><%= booking.end_date %></td>
      <td><%= link_to 'Show', user_booking_path(current_user, booking) %> </td>
      <td>
        <% if policy(booking).destroy? %>
          <%= link_to 'Cancel this booking', booking_path(booking), method: :delete, data: { confirm: 'Are you sure you want to cancel your fun date with doggo?' } %>
        <% end %>
      </td>
    </tr>
  <% end %>
</tbody>
</table>
