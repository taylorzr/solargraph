# frozen_string_literal: true

module Solargraph
  module Parser
    module Rubyvm
      module NodeProcessors
        class KwArgNode < Parser::NodeProcessor::Base
          def process
            locals.push Solargraph::Pin::Parameter.new(
              location: region.closure.location,
              closure: region.closure,
              comments: comments_for(node),
              name: node.children[0].children[0],
              assignment: node.children[0].children[1],
              presence: region.closure.location.range
            )
            node.children[1] && NodeProcessor.process(node.children[1], region, pins, locals)
          end
        end
      end
    end
  end
end
