//go:build wireinject
// +build wireinject

package injection

import (
	"authentication/application"
	"authentication/domain"
	"authentication/infrastructure"
	"authentication/userinterface"

	"github.com/google/wire"
)

func InitializeAuthController() *userinterface.AuthController {
    wire.Build(
        infrastructure.GetDB,
        wire.Bind(
            new(application.Transaction),
            new(*infrastructure.DB),
        ),
        infrastructure.NewAuthRepository,
        wire.Bind(
            new(domain.AuthRepository),
            new(*infrastructure.AuthRepository),
        ),
        application.NewAuthService,
        userinterface.NewAuthController,
    )

    return nil
}
