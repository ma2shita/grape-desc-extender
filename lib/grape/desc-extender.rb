#coding: utf-8
module GrapeDescExtender
  def self.config
    block_given? ? yield(Configuration) : Configuration
  end

  class Configuration
    SETTINGS = [:extend]
    class << self
      attr_accessor(*SETTINGS)

      def extend # TODO: Arrayでは無い値を代入された時の挙動
        @extend ||= []
      end
    end
  end
end

# Monkey-patch for code_examples attr in the route settings
module Grape
  module DSL
    module Configuration
      module_function
      def desc_container
        Module.new do
          include Grape::Util::StrictHashConfiguration.module(
            :description,
            :detail,
            :params,
            :entity,
            :http_codes,
            :named,
            :headers,
            *GrapeDescExtender.config.extend
          )

          def config_context.success(*args)
            entity(*args)
          end

          def config_context.failure(*args)
            http_codes(*args)
          end
        end
      end
    end
  end
end
