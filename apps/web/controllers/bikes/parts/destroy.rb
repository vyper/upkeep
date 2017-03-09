module Web::Controllers::Bikes::Parts
  class Destroy
    include Web::Action

    before :authenticate!

    expose :part

    def call(params)
      @part = PartRepository.new.delete(params[:id])
    end
  end
end
