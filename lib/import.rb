# Encoding: UTF-8

class Import < Struct.new(:category_name, :words)

  def self.import
    DATA.each do |category_name, words|
      new(category_name, words).import
    end
  end

  def import
    parse(words).each do |attributes|
      save_pair attributes
    end
  end

  def category
    @_category ||= Category.where(title: category_name).first_or_create
  end

  def parse(words)
    words.lines.map do |line|
      matches = line.match(/(?<words>[^(]+)(?:\((?<comment>[^)]+)\))?/)
      words = matches[:words].strip
      { words: words, comment: matches[:comment] }
    end
  end

  def save_pair(attributes)
    return unless attributes[:words].present?

    pair = KimballPair.where(words: attributes[:words]).first_or_create
    pair.comments = attributes[:comment]
    pair.category = category

    pair.save
  end


  DATA = {
    'Class A' => %q{
      age old
      all over
      any cop
      back drop
      Backhoe (Hoback river in WY)
      back out
      backtalk
      bar fly
      beat up
      bid out
      boat house
      bonefish
      bookcase
      boys choir
      break dance
      breakfast
      breaking ground
      buck saw
      butternut
      butthead
      cake pan
      cat house
      channel fishing
      cheese head
      Chip Wood (a guy Zoë met)
      Chocolate milk
      choir boys
      close up  (Mark Wessels)
      come in
      desktop computer
      coattail
      cover slip
      cut short
      dance break
      Day labor
      dish soap
      down wind
      downplay
      downturn
      drop back
      do-over
      elsewhere
      end up
      engine fire
      Fairtrade
      fast break
      fire house
      fire engine
      firefox
      food baby
      footlight
      fortepiano, pianoforte (george)
      fly bar
      game ball
      guest house
      going out
      going on
      ground breaking
      hand in
      hand off
      handover
      hangover
      Hard Rock (Mark)
      headbutt
      head cheese
      hold on  (Mark)
      horse farm
      horse race
      house boat
      house cat
      house fire
      house guest
      house white  (wine)
      housework
      hung over
      huntsman
      income
      inhere
      input
      in love
      in tune
      juggling ball
      juggling club
      Karamazov Brothers
      killer weed
      Lady Bird  (lady bug)
      lamp oil
      layover
      layout
      let out
      lightfoot
      lighthouse
      light reading
      light traffic
      load up
      lying out
      man breast
      man tit
      milk chocolate
      mother earth
      not afraid
      nut butter
      off beat
      off night
      off-putting
      offhand
      off piste (Sarah)
      offset
      oil lamp
      old age
      ongoing
      on hold
      output
      outback
      outbreak
      outcome
      outgoing
      outlay
      outlook
      output
      outright
      outrun
      outtake
      outsell
      outset
      outshoot
      outstanding
      over blow
      over drive
      overdue
      overfall (physical science)
      overhang
      overlay
      overlook
      overpass
      overrun
      over sleep
      overstrike
      overtake
      overturn
      pancake
      passover
      Peace time
      piano player
      pissed off
      playing card
      police state  (Stephen)
      put out
      putting off
      race horse
      rat pack
      reading light
      rock hard
      rock solid
      run out
      run over
      scale up
      sellout
      set off
      set up
      short cut
      shortstop
      shotgun
      show dog
      slip cover
      state police (Stephen)
      stop short
      tail coat
      take over
      take out
      talkback
      think over  (Mark Wessels)
      Time Life
      to go
      tune in
      turnover
      up beat
      up close
      up end
      uphold (hold up or hold-up or holed up)
      up end
      upkeep
      up set
      up start
      up top
      up turned
      up wind
      wax moustache
      weed killer
      well wishing
      where else
      wide world
      wind down
      wind up
      wood box
      wood pecker
      work over
      workout outwork
      workpiece piecework
    },

    'Homonymic' => %q{
      Dear John
      Welfare
      Write down
      boys’ home
      bow tie
      overdue
      gun show  (not really)
      warehouse
    },

    'Two Letters' => %q{
      AD
      AP
      AV
      BC
      BO
      CD
      CJ
      CK
      CV
      DI
      DJ
      DL
      DM
      EG
      EP
      KO
    },

    'Class B' => %q{
      Club Renegade
      PT  teepee
      Underwent
      Undergo
      instep
    },

    'Class C' => %q{
      guest house bird song
      arm chair
      racquet sports
      orange juice
      passenger train
      horse cart
      ferry passenger
      lamp oil
      cows milk
      panel discussion
      cheese pizza
      dog show
      horse ranch
      sugar maple
      Back talk
      Game board
      sled dog
      tap water
      horse race
      fry pan
      frying pan
    },

    'Class H/K' =>  %q{
      liquid plumber
      ski lift
      water boy
      chick corea
      cheese dog
      teepee
      hostage
      hospital
      sex slave
      monkey business
      french dressing
      wiener dog
      knee-hi hiney
      light beer
      hookmeat
      rubber band
      Bach's music
      good liquor
      neck pencil
      poker face
      book marks
      pain window
      threshold pain
      sperm whale
      hairball
      peanut
      Polish sausage
      moreover
      Behind trouble
      man action (action man is good)
      chickweed
    },

    'Class I' => %q{
      glass eye (es)
      head light (ed)
      crap shoot (s)
      wash machine(ing)
      bone saw (s)
      sideburn (s)
      fairway (er)
      on hand (s)
      Matchbox (ing)
      lighthouse (s)
      man tits  (Sarah)
      Stand-up (upstanding)
      Toilet paper (pay toilet)
      step aside
    },

    'Class Q' => %q{
      patient aids
      rock bed
      house party
      ballroom dance
      lightheart
      tape recording
      baby doll
      smoke pot
      chicken stew
      booknote
      shot money
      filecase
      truck panel
      dog house
      half back
      saw fish
      afraid not
      Tic tac
      Seatac
      fall down
      standing up
      Name brand
      Bass string
      Gillette pen
      overgo
      boxwood, wood box
      work basket
    },


  }
end




