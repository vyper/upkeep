module Web::Controllers::Bikes::Parts
  class Destroy
    include Web::Action

    expose :part

    def call(params)
      @part = PartRepository.new.delete(params[:id])
    end
  end
end
