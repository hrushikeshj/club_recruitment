# frozen_string_literal: true

require 'rails/generators/erb'
require 'rails/generators/resource_helpers'

module Erb # :nodoc:
  module Generators # :nodoc:
    class ScaffoldGenerator < Base # :nodoc:
      include Rails::Generators::ResourceHelpers

      argument :attributes, type: :array, default: [], banner: 'field:type field:type'

      def create_root_folder
        empty_directory File.join('app/views', controller_file_path)
      end

      def copy_view_files
        ['html.erb', 'js.erb'].each do |format|
          available_views[format].each do |view|
            filename = filename_with_extensions(view, format)
            template filename, File.join('app/views', controller_file_path, filename)
          end
        end

        if controller_class_path.present?
          # Module::Model
          template '_sidebar.html.erb', File.join('app/views', controller_file_path, '_sidebar.html.erb')
          template '_module_navigation.html.erb', File.join('app/views', controller_class_path, '_module_navigation.html.erb')
        else
          # Model - Save the template _module_navigation as _sidebar
          template '_module_navigation.html.erb', File.join('app/views', controller_file_path, '_sidebar.html.erb')
        end
      end

      protected

      def json_attributes_names
        [:id] + attributes_names
      end

      def available_views
        {
          'html.erb' => %w[index edit show new _form _show _index],
          'json.jbuilder' => %w[index show],
          'js.erb' => %w[edit new show index]
        }
      end

      def filename_with_extensions(name, format)
        [name, format].join('.')
      end

      def attributes_list_with_timestamps
        json_attributes_list(json_attributes_names + %w[created_at updated_at])
      end

      def json_attributes_list(attributes = json_attributes_names)
        attributes.reject! { |attr| %w[password password_confirmation].include?(attr) }
        attributes.map { |a| ":#{a}" }.join(', ')
      end
    end
  end
end
