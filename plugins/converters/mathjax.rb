# place mathjax.rb in _plugins directory of your blog
require 'redcarpet'
class HTMLwithAlbino < Redcarpet::Render::HTML
  def block_code(code, language)
    if language == 'mathjax'
      "<script type=\"math/tex; mode=display\">
        #{code}
      </script>"
    else
      "<pre><code class=\"#{language}\">#{code}</code></pre>"
    end
  end
  
  def codespan(code)
    if code[0] == "$" && code[-1] == "$"
      code.gsub!(/^\$/,'')
      code.gsub!(/\$$/,'')
      "<script type=\"math/tex\">#{code}</script>"
    else
      "<code>#{code}</code>"
    end
  end
end

class Ruhoh
  module Converter
    module Markdown

      def self.extensions
        ['.md', '.markdown']
      end
      
      def self.convert(content)
        markdown = Redcarpet::Markdown.new(HTMLwithAlbino.new(:with_toc_data => true), 
        :autolink => true, 
        :fenced_code_blocks => true,
        :disable_indented_code_blocks => true,
        :hard_wrap => true
        )
        markdown.render(content)
      end
    end
  end
end