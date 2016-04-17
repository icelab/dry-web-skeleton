require "que"
require "main/container"

module Main
  class Enqueue
    class Job < Que::Job
      def run(identifier, *args)
        Container["core.que.connection"].transaction do
          operation = Container[identifier]
          operation.call_from_queue(*args)
          destroy
        end
      end
    end

    def call(identifier, *args)
      operation = Container[identifier]
      Job.enqueue(identifier, *operation.to_queue(*args))
    end
  end
end
