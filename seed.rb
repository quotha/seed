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
  
  def batting_avg(stats)
    stats['h'].to_f/stats['ab'].to_f
  end
  
  def on_base_per(stats)
    (stats['h']+stats['bb']+stats['hbp']).to_f/(stats['ab']+stats['bb']+stats['hbp']+stats['sf']).to_f
  end
  
  def slugging_per(stats)
    total_bases(stats).to_f/stats['ab'].to_f
  end
  
  def on_base_plus_slugging(stats)
    slugging_per(stats)+on_base_per(stats)
  end
  
  def runs_created(stats)
    ((stats['h']+stats['bb'])*total_bases(stats)).to_f/(stats['ab']+stats['bb']).to_f
  end
  
  def total_bases(stats)
    stats['s']+(2*stats['d'])+(3*stats['t'])+(4*stats['hr'])
  end
  
  def earned_run_avg(stats)
    9*(stats['era'].to_f/format_ip(stats['ip']))
  end
  
  def whip(stats)
    (stats['bb']+stats['h']).to_f/format_ip(stats['ip'])
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
    