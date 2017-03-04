// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'framework.dart';

/// Base class for stateful widgets that have exactly one inflated instance in
/// the tree.
///
/// Such widgets must be given a [GlobalKey]. This key can be generated by the
/// subclass from its [Type] object, e.g. by calling `super(key: new
/// GlobalObjectKey(MyWidget))` where `MyWidget` is the name of the subclass.
///
/// Since only one instance can be inflated at a time, there is only ever one
/// corresponding [State] object. That object is exposed, for convenience, via
/// the [currentState] property.
///
/// When subclassing [UniqueWidget], provide the corresponding [State] subclass
/// as the type argument.
abstract class UniqueWidget<T extends State<StatefulWidget>> extends StatefulWidget {
  /// Creates a widget that has exactly one inflated instance in the tree.
  ///
  /// The [key] argument cannot be null because it identifies the unique
  /// inflated instance of this widget.
  UniqueWidget({
    @required GlobalKey<T> key
  }) : super(key: key) {
    assert(key != null);
  }

  @override
  T createState();

  /// The state for the unique inflated instance of this widget.
  ///
  /// Might be null if the widget is not currently in the tree.
  T get currentState {
    final GlobalKey<T> globalKey = key;
    return globalKey.currentState;
  }
}
