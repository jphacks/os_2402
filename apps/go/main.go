package main

import (
	"log"

	authdb "authentication/infrastructure"
	userdb "user/infrastructure"

	"github.com/gin-gonic/gin"
)

func main() {
    setupRDB() //DB接続を確立
    engine := gin.Default()

    RegisterHandlers(engine) //ルーティング情報を定義

    //8080ポートでアプリケーションを起動
    if err := engine.Run(":8080"); err != nil {
        log.Fatal(err)
    }
}

func setupRDB() {
    authDSN := "認証コンテキスト用DBへの接続情報"
    if err := authdb.RDBConnect(authDSN); err != nil {
        log.Fatal(err)
    }

    userDSN := "ユーザー管理コンテキスト用DBへの接続情報"
    if err := userdb.RDBConnect(userDSN); err != nil {
        log.Fatal(err)
    }
}
