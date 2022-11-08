//
//  HomeModel.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 09/11/22.
//

import Foundation

struct HomeModel: Codable{
    let crypto_balance: CryptoBalance
    let your_crypto_holdings: [CryptoHolding]
    let crypto_prices: [CryptoPrices]
    let all_transactions: [CryptoTransactions]
}
struct CryptoBalance: Codable {
    let title: String
    let subtitle: String
    let current_bal_in_usd: String
}
struct CryptoHolding: Codable {
    let logo: String
    let title: String
    let current_bal_in_token: String
    let current_bal_in_usd: String
}
struct CryptoPrices: Codable {
    let logo: String
    let title: String
    let current_price_in_usd: String
}
struct CryptoTransactions: Codable {
    let txn_logo: String
    let title: String
    let txn_time: String
    let txn_amount: String
    let txn_sub_amount: String
}
//{
//  "crypto_balance": {
//    "title": "Crypto Account",
//    "subtitle": "BTC, ETH & more",
//    "current_bal_in_usd": "34.20"
//  },
//  "your_crypto_holdings": [
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/BTC.svg",
//      "title": "BTC",
//      "current_bal_in_token": "0.072839",
//      "current_bal_in_usd": "32.07"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/ETH.svg",
//      "title": "ETH",
//      "current_bal_in_token": "0.3323",
//      "current_bal_in_usd": "64.07"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/USDC.svg",
//      "title": "USDC",
//      "current_bal_in_token": "12.54",
//      "current_bal_in_usd": "12.54"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/AVAX.svg",
//      "title": "AVAX",
//      "current_bal_in_token": "2.839",
//      "current_bal_in_usd": "53.87"
//    }
//  ],
//  "crypto_prices": [
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/BTC.svg",
//      "title": "Bitcoin",
//      "current_price_in_usd": "39910"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/ETH.svg",
//      "title": "Ethereum",
//      "current_price_in_usd": "2960.63"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/USDC.svg",
//      "title": "USD Coin",
//      "current_price_in_usd": "1.00"
//    },
//    {
//      "logo": "https://cdn.onjuno.com/crypto-logo/AVAX.svg",
//      "title": "Avalanche",
//      "current_price_in_usd": "66.92"
//    }
//  ],
//  "all_transactions": [
//    {
//      "txn_logo": "https://cdn.onjuno.com/crypto-logo/AVAX.svg",
//      "title": "AVAX Bought",
//      "txn_time": "29 Minutes ago",
//      "txn_amount": "10.00",
//      "txn_sub_amount": "Buy Price = $63.84"
//    },
//    {
//      "txn_logo": "https://cdn.onjuno.com/crypto-logo/USDC.svg",
//      "title": "USDC Sold",
//      "txn_time": "2 hours ago",
//      "txn_amount": "34.40",
//      "txn_sub_amount": "34.40 USDC"
//    },
//    {
//      "txn_logo": "https://cdn.onjuno.com/crypto-logo/BTC.svg",
//      "title": "BTC Withdrawn",
//      "txn_time": "3 days ago",
//      "txn_amount": "230.47",
//      "txn_sub_amount": "≈0.00290589 BTC"
//    },
//    {
//      "txn_logo": "https://cdn.onjuno.com/crypto-logo/ETH.svg",
//      "title": "ETH Received",
//      "txn_time": "Apr 27, 2022",
//      "txn_amount": "10.00",
//      "txn_sub_amount": "≈0.08290589 ETH"
//    }
//  ]
//}
