---
id: xf4pd8o344b6y99n2zbbt8a
title: Go 实现类似 C++ 析构函数的功能
desc: ''
updated: 1662355062907
created: 1659930786496
---

在 Go 进程模型中，维护了一种叫 `finalizer` 的结构，当内存对象不可访问、需要被GC时，GC 程序会检查对象关联的 `finalizer` 函数，如果有，则调用一次`finalizer`函数，并移除关联的`finalizer`函数，然后该对象再次变成可访问状态，当下一次，该对象再次被GC时，便会被释放并回收。

在`runtime`包中，对外暴露了一个函数`SetFinalizer`，用来设置关联的`finalizer`函数。

## 函数: `runtime.SetFinalizer`

```go
func SetFinalizer(obj interface{}, finalizer interface{})
```

## 构造与析构

### 1. 定义`Initializer`接口，约定初始化函数

```go
type Initializer interface {
  Init()
}
```

### 2. 定义`Finalizer`接口，约定析构函数

```go
type Finalizer interface {
  Delete()
}
```

### 3. 定义`InitObject`函数用来初始化对象

```go
// Sample: `InitObject(obj)`
func InitObject(obj interface{}) {
  // 如果obj实现了Initializer
  if ob, ok := obj.(Initializer); ok {
    ob.Init()
  }
  // 如果obj实现了Finalizer
  if ob, ok := obj.(Finalizer); ok {
    runtime.SetFinalizer(ob, func(ob Finalizer) {
      ob.Delete()
    })
  }
}
```

## 实例

```go
type sample struct {
}

type Sample struct {
  *sample
}

// NewSample returns a Sample.
func NewSample() *Sample {
  // Private object
  s := &sample{}
  // Public object
  obj := &Sample{s}
  {
    InitObject(obj)
  }
  return obj
}

// Init方法会在NewSample时，跟随InitObject执行。
func (s *sample) Init() {
  fmt.Printf("initialized\n")
}

// Delete方法会在NewSample返回的obj需要被GC时调用。
func (s *sample) Delete() {
  fmt.Printf("deleted\n")
}
```

## 总结

- 如果对象存在循环引用，可能永远都不会被GC
- `finalizer`设置的函数只会在GC时被调用
- `finalizer`函数不适合处理太多耗时逻辑
- `finalizer`函数延长了对象的生命周期，如果不必要，尽量不使用

我在一些项目中用到了自己封装的包，但只有少部分场景下用到了 `Delete()`。

<https://oldchan.net/2021/02/20/language/go/struct_like_class/>
