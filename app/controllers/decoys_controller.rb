class DecoysController < ApplicationController
  def index
    # TODO Fetch from googleDoc
    @decoys = [
        {
            id: 1,
            name: "Leroy"
        },
        {
            id: 2,
            name: "Troy"
        }
    ]
  end
end