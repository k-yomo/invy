package cache

import (
	"context"
	"errors"
	"fmt"
	"github.com/k-yomo/invy/pkg/logging"
	"github.com/redis/go-redis/v9"
	"github.com/vmihailenco/msgpack/v5"
	"go.uber.org/zap"
	"time"
)

var ErrCacheMiss = errors.New("value not found for the key")

type Cache struct {
	redisClient *redis.Client
}

func New(redisClient *redis.Client) *Cache {
	return &Cache{redisClient: redisClient}
}

func GetWithCache[T comparable](ctx context.Context, c *Cache, key string, ttl time.Duration, f func() (T, error)) (T, error) {
	var v T
	if err := c.Get(ctx, key, &v); err != nil && err != ErrCacheMiss {
		logging.Logger(ctx).Warn("failed to get from cache", zap.Error(err))
	}
	var zeroV T
	if v != zeroV {
		return v, nil
	}

	v, err := f()
	if err != nil {
		return v, err
	}
	if v != zeroV {
		if err := c.Set(ctx, key, v, ttl); err != nil {
			logging.Logger(ctx).Warn("failed to set to cache", zap.Error(err))
		}
	}
	return v, nil
}

func (c *Cache) Get(ctx context.Context, key string, v interface{}) error {
	b, err := c.redisClient.Get(ctx, key).Bytes()
	if err == redis.Nil {
		return ErrCacheMiss
	}
	if err != nil {
		return fmt.Errorf("get valaue from cache store: %w", err)
	}
	if err := msgpack.Unmarshal(b, v); err != nil {
		return fmt.Errorf("unmarshal valaue: %w", err)
	}
	return nil
}

func (c *Cache) Set(ctx context.Context, key string, value interface{}, ttl time.Duration) error {
	b, err := msgpack.Marshal(value)
	if err != nil {
		return fmt.Errorf("marshal valaue: %w", err)
	}
	if err := c.redisClient.Set(ctx, key, b, ttl).Err(); err != nil {
		return fmt.Errorf("set valaue to cache store: %w", err)
	}
	return nil
}
