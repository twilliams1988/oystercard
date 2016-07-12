class Oystercard
    DEFAULT_BALANCE = 0
    MAXIMUM_BALANCE = 90
    attr_reader :balance
    MINIMUM_FARE = 1

    def initialize(balance = DEFAULT_BALANCE)
        @balance = balance
        @in_journey = false
    end
    def top_up(amount)
        fail "Card limited to £90" if (@balance+amount)>MAXIMUM_BALANCE
        @balance += amount
        @balance
    end

    def touch_in
      fail 'Insufficient balance' if @balance < MINIMUM_FARE
      @in_journey = true
    end

    def touch_out
      deduct(MINIMUM_FARE)
      @in_journey = false
    end

    def in_journey?
      @in_journey
    end

  private
    def deduct(amount)
        @balance -= amount
        @balance
    end
end
