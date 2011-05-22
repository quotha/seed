module Seed
  def on_base(h=0, bb=0, hbp=0, ab=0, sf=0)
    obp = (h+bb+hbp).to_f/(ab+bb+hbp+sf).to_f
  end
end
    