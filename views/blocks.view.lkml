view: blocks {
  sql_table_name: `bitcoin_blockchain.blocks`
    ;;
  drill_fields: [block_id]

  dimension: block_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.block_id ;;
  }

  dimension: difficulty_target {
    type: number
    sql: ${TABLE}.difficultyTarget ;;
  }

  dimension: merkle_root {
    type: string
    sql: ${TABLE}.merkle_root ;;
  }

  dimension: nonce {
    type: number
    sql: ${TABLE}.nonce ;;
  }

  dimension: previous_block {
    type: string
    sql: ${TABLE}.previous_block ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }

  dimension: transactions {
    hidden: yes
    sql: ${TABLE}.transactions ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: work_error {
    type: string
    sql: ${TABLE}.work_error ;;
  }

  dimension: work_terahash {
    type: number
    sql: ${TABLE}.work_terahash ;;
  }

  measure: count {
    type: count
    drill_fields: [block_id, transactions.count]
  }
}

view: blocks__transactions {
  dimension: inputs {
    hidden: yes
    sql: ${TABLE}.inputs ;;
  }

  dimension: outputs {
    hidden: yes
    sql: ${TABLE}.outputs ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }
}

view: blocks__transactions__outputs {
  dimension: output_pubkey_base58 {
    type: string
    sql: ${TABLE}.output_pubkey_base58 ;;
  }

  dimension: output_pubkey_base58_error {
    type: string
    sql: ${TABLE}.output_pubkey_base58_error ;;
  }

  dimension: output_satoshis {
    type: number
    sql: ${TABLE}.output_satoshis ;;
  }

  dimension: output_script_bytes {
    type: string
    sql: ${TABLE}.output_script_bytes ;;
  }

  dimension: output_script_string {
    type: string
    sql: ${TABLE}.output_script_string ;;
  }

  dimension: output_script_string_error {
    type: string
    sql: ${TABLE}.output_script_string_error ;;
  }
}

view: blocks__transactions__inputs {
  dimension: input_pubkey_base58 {
    type: string
    sql: ${TABLE}.input_pubkey_base58 ;;
  }

  dimension: input_pubkey_base58_error {
    type: string
    sql: ${TABLE}.input_pubkey_base58_error ;;
  }

  dimension: input_script_bytes {
    type: string
    sql: ${TABLE}.input_script_bytes ;;
  }

  dimension: input_script_string {
    type: string
    sql: ${TABLE}.input_script_string ;;
  }

  dimension: input_script_string_error {
    type: string
    sql: ${TABLE}.input_script_string_error ;;
  }

  dimension: input_sequence_number {
    type: number
    sql: ${TABLE}.input_sequence_number ;;
  }
}
