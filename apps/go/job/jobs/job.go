package jobs

import (
	"context"
	"fmt"
	"math/rand"
	"sync"
	"time"
)

type JobName string

func (n JobName) String() string {
    return string(n)
}

type Job struct {
    Name    JobName
    d       time.Duration
    handler func(context.Context) []error
    once    *sync.Once
    ctx     context.Context
    done    chan bool
}

func NewJob(
    name string,
    d time.Duration,
    handler func(context.Context) []error,
    ctx context.Context,
) *Job {
    return &Job{
        Name:    JobName(name),
        d:       d,
        handler: handler,
        once:    &sync.Once{},
        ctx:     ctx,
        done:    make(chan bool, 1),
    }
}

func (j *Job) Start() {
    go func(j *Job) {
        rand.Seed(time.Now().UnixNano())
        initD := rand.Int63n(int64(j.d) * 2)
        ticker := time.NewTicker(time.Duration(initD))
        for {
            select {
            case t := <-ticker.C:
                go j.once.Do(func() { j.Exec(t) })
                ticker.Reset(j.d)
            case <-j.ctx.Done():
                j.Stop()
            case <-j.done:
                ticker.Stop()
                return
            }
        }
    }(j)
}

func (j *Job) Exec(t time.Time) {
    var errs []error
    defer func() {
        if rec := recover(); rec != nil {
            errs = append(errs, fmt.Errorf("[JOB EXEC ERROR] %s", rec))
        }

        j.once = &sync.Once{}
    }()

    errs = j.handler(ctx)
}

func (j *Job) Stop() {
    j.done <- true
}
