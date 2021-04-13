connection: "bitcoin_blockchain"

# include all the views
include: "/views/**/*.view"

datagroup: bitcoin_blockchain_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bitcoin_blockchain_default_datagroup

explore: blocks {
  join: blocks__transactions {
    view_label: "Blocks: Transactions"
    sql: LEFT JOIN UNNEST(${blocks.transactions}) as blocks__transactions ;;
    relationship: one_to_many
  }

  join: blocks__transactions__outputs {
    view_label: "Blocks: Transactions Outputs"
    sql: LEFT JOIN UNNEST(${blocks__transactions.outputs}) as blocks__transactions__outputs ;;
    relationship: one_to_many
  }

  join: blocks__transactions__inputs {
    view_label: "Blocks: Transactions Inputs"
    sql: LEFT JOIN UNNEST(${blocks__transactions.inputs}) as blocks__transactions__inputs ;;
    relationship: one_to_many
  }
}

explore: transactions {
  join: blocks {
    type: left_outer
    sql_on: ${transactions.block_id} = ${blocks.block_id} ;;
    relationship: many_to_one
  }

  join: transactions__outputs {
    view_label: "Transactions: Outputs"
    sql: LEFT JOIN UNNEST(${transactions.outputs}) as transactions__outputs ;;
    relationship: one_to_many
  }

  join: transactions__inputs {
    view_label: "Transactions: Inputs"
    sql: LEFT JOIN UNNEST(${transactions.inputs}) as transactions__inputs ;;
    relationship: one_to_many
  }
}
