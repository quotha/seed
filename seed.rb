module Seed
  extend self
=begin
        h     hits
        ab    at bats
        bb    base on balls (walks)
        hbp   times hit by a pitch
        sf    sacrifice flies
        s     singles
        d     doubles
        t     triples
        hr    home runs
        tb    total bases
=end
  
  def batting_avg(h=0, ab=0)
    h.to_f/ab.to_f
  end
  
  def on_base_per(h=0, bb=0, hbp=0, ab=0, sf=0)
    (h+bb+hbp).to_f/(ab+bb+hbp+sf).to_f
  end
  
  def slugging_per(s=0, d=0, t=0, hr=0, ab=0)
    total_bases(s,d,t,hr).to_f/ab.to_f
  end
  
  def runs_created(h=0, bb=0, s=0, d=0, t=0, hr=0, ab=0)
    ((h+bb)*total_bases(s,d,t,hr)).to_f/(ab+bb).to_f
  end
  
  def production(s=0, d=0, t=0, hr=0, ab=0, h=0, bb=0, hbp=0, sf=0)
    slugging_per(s, d, t, hr, ab)+on_base_per(h, bb, hbp, ab, sf)
  end
  
  def total_bases(s=0, d=0, t=0, hr=0)
    s+(2*d)+(3*t)+(4*hr)
  end
  
end
    