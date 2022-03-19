# frozen_string_literal: true

json.array! @<%= plural_table_name %>, partial: '<%= singular_table_name %>', as: :<%= singular_table_name %>
