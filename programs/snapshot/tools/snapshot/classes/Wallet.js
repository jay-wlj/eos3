// TEMP:
const bn                = require('bignumber.js')
const Balance           = require('./Balance')
const util              = require('../utilities')

class Wallet {

  constructor( address, config ){
    this.address              = address
    this.eos_key              = null
    this.balance              = new Balance()
    this.registered           = false
    this.registered_fallback  = false
    this.accepted             = false
    this.last_activity_block  = null

    this.fallback             = false

    this.register_error       = null
    this.fallback_error       = null

    this.buys                 = new Array(CS_NUMBER_OF_PERIODS).fill(new bn(0))
    this.claims               = new Array(CS_NUMBER_OF_PERIODS).fill(false)
    this.reclaimables         = []
    this.transfers            = []

    this.config = config
  }

  json (){
    return {
      address:              this.address
      ,eos_key:             this.eos_key
      ,balance_wallet:      this.balance.wallet
      ,balance_unclaimed:   this.balance.unclaimed
      ,balance_reclaimed:   this.balance.reclaimed
      ,balance_total:       this.balance.total
      ,registered:          this.registered
      ,register_error:      this.register_error
      ,fallback_error:      this.fallback_error
      ,fallback:            this.fallback
      ,valid:               this.accepted
    }
  }

  reject () {
    this.accepted = false
  }

  accept ( callback ) {
    this.accepted = true
  }

  set_index ( index ) {
    this.index = index
  }

  maybe_fix_key( ) {
    //remove whitespace
    let eos_key = null

    if( this.eos_key ) {
      eos_key = this.eos_key.trim()

      //Might be hex, try to convert it.
      if( eos_key.length == 106 ){ //TODO use web3.isHex()
        let eos_key_from_hex = util.misc.hex_to_ascii( "0x"+eos_key )
        if ( util.misc.is_eos_public_key(eos_key_from_hex) ) {
          eos_key = eos_key_from_hex
        }
      }
      //Might be user error
      else if(eos_key.startsWith('key')){
        let eos_key_mod = eos_key.substring(3)
        if( eos_key_mod.startsWith('EOS') ) {
          eos_key = eos_key_mod
        }
      }
      //Convert something that looks like a key to EOS key (STM, BTS, ETC)
      else if(!eos_key.startsWith('EOS') && !/[^a-zA-Z0-9]/.test(eos_key)) {
        let eos_key_test = `EOS${eos_key.slice(3, eos_key.length)}`
        eos_key = util.misc.is_eos_public_key(eos_key_test) ? eos_key_test : eos_key
      }
    }

    // this.eos_key = eos_key ? (this.registered=true, eos_key) : (this.registered=false, null)
    this.eos_key = eos_key
  }

  set_registration_status() {
    if( util.misc.is_eos_public_key(this.eos_key) ) {
      this.registered = true
    }
  }

  valid() {
    //Set registration status of any entry with valid key regardless of balance validation.
    this.set_registration_status()
    this.register_error = this.validate()
    return !this.register_error ? true : false
  }

  validate(){
    let error = null

    //Because we haven't toFormat(4) yet, there will be some balances that may be wrongly attributed this error. We'll test against decimal precision 4.
    //Consider toFixed() before validation!
    if( parseFloat(this.balance.total.toFixed(4)) < parseFloat(1.0000) ) {
      error = 'balance_insufficient'
    }

    else if (this.eos_key===null) {
      error = 'not_registered'
    }

    else {
      error = this.validate_key()
    }

    return error;
  }

  validate_key(){
    let error = null

    if(!this.registered) {

      //Key is blank
      if(this.eos_key.length == 0) {
        error = 'key_is_empty'
      }

      //It may be an EOS private key
      else if(this.eos_key.startsWith('5')) {
        error = 'key_is_private'
      }

      // It almost looks like an EOS key
      else if(this.eos_key.startsWith('EOS')) {
        error = 'key_is_malformed'
      }

      // ETH address
      else if(this.eos_key.startsWith('0x')) {
        error = 'key_is_eth'
      }

      //Reject everything else with junk label
      else {
        error = 'key_is_junk'
      }
    }

    return error
  }

}

module.exports = Wallet
