module Seed
  extend self
  
=begin
        BATTING

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
        
        PITCHING
        
        era   earned runs allowed
        ip    innings pitched - formats can be x, x.1 or x.333, x.2 or x.666
        bb    walks allowed
        h     hits allowd
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
  
  def on_base_plus_slugging(s=0, d=0, t=0, hr=0, ab=0, h=0, bb=0, hbp=0, sf=0)
    slugging_per(s, d, t, hr, ab)+on_base_per(h, bb, hbp, ab, sf)
  end
  
  def total_bases(s=0, d=0, t=0, hr=0)
    s+(2*d)+(3*t)+(4*hr)
  end
  
  def earned_run_avg(era=0, ip=0)
    9*(era.to_f/format_ip(ip))
  end
  
  def whip(bb=0, h=0, ip=0)
    (bb+h).to_f/format_ip(ip)
  end
  
  def format_ip(ip)
    if ip.to_s[-2,2] == '.1'
      ip+0.233
    elsif ip.to_s[-2,2] == '.2'
      ip+0.466
    else
      ip.to_f
    end
  end
end
    