module TestRails8
  module Version
    module_function

    def app_name
      "test-rails8"
    end

    def source_base_url
      "https://github.com/zunda/#{app_name}"
    end

    def source_tag
      nil
    end

    def source_tag_short
      nil
    end

    def source_url
      if source_tag
        "#{source_base_url}/tree/#{source_tag}"
      else
        source_base_url
      end
    end

    def ruby_description
      RUBY_DESCRIPTION
    end

    def to_s
      app_name + (source_tag_short ? " at #{source_tag_short}" : "")
    end
  end
end
