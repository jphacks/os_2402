package jobs

import (
	"context"
	mail "mail/injection"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func Start() {
    ctx, cancel := context.WithCancel(context.Background())
    defer func() {
        cancel()
        time.Sleep(10 * time.Second)
    }()

    jobs := &Jobs{}
    jobs.Register(
        NewJob("SendMailBatch", time.Minute*5, mail.InitializeSendMailBatch().SendAll, ctx),
    )
    jobs.Start()

    sigs := make(chan os.Signal, 1)
    signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
    <-sigs
}

type Jobs struct {
    js []*Job
}

func (jobs *Jobs) Register(js ...*Job) {
    jobs.js = append(jobs.js, js...)
}

func (jobs *Jobs) Start() {
    for _, j := range jobs.js {
        j.Start()
    }
}
