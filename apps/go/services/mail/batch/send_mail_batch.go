package batch

import (
	"context"
	"fmt"
	"mail/application"
	"mail/domain"
)

type SendMailBatch struct {
    repo    domain.SendMailReservationRepository
    service application.SendMailReservationService
}

func NewSendMailBatch(
    repo domain.SendMailReservationRepository,
    service application.SendMailReservationService,
) *SendMailBatch {
    return &SendMailBatch{
        repo:    repo,
        service: service,
    }
}

func (b *SendMailBatch) SendAll(ctx context.Context) []error {
    var errs []error
    rs, err := b.repo.FindAll(ctx)

    if err != nil {
        errs = append(errs, fmt.Errorf("failed to find reservation mail list. err:%s", err))
        return errs
    }

    for i, r := range rs {
        select {
        case <-ctx.Done():
            return errs
        default:
            es := b.service.Send(ctx, *r)
            if len(es) > 0 {
                errs = append(errs, fmt.Errorf("[error]Index:%d,ReservationID:%s,Errors:%s", i+1, r.ReservationID, es))
            }
        }
    }

    return errs
}
