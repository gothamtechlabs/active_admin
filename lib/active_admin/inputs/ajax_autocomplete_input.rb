module ActiveAdmin
  module Inputs
    class AjaxAutocompleteInput < ::Formtastic::Inputs::StringInput
      def input_html_options
        options = super
        options[:class] = [options[:class], "ajax-autocomplete"].compact.join(' ')
        options[:value] = ""
        options[:placeholder] = "Type to search..."
        options["data-collection"] = collection_as_json
        options["data-provide"] = "autocomplete-collection"
        options
      end
      def collection_as_json
        collection = @object.send("#{association_primary_key || method}") || []
        reflection = reflection_for(method)
        # collection.map{|o| { id: o.id, name: o.name }}.to_json
        reflection.klass.find(collection).map{|o| { id: o.id, name: o.name }}.to_json
      end

      def method
        super.to_s.sub(/_id$/,'').to_sym
      end

      # def collection
      #   super.unshift(["",""])
      # end
    end
  end
end
