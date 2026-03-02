// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'antivirus_database.dart';

// ignore_for_file: type=lint
class $AntivirusItemsTable extends AntivirusItems
    with TableInfo<$AntivirusItemsTable, AntivirusItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AntivirusItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    shortDescription,
    iconUrl,
    colorValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'antivirus_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<AntivirusItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_iconUrlMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AntivirusItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AntivirusItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      )!,
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
    );
  }

  @override
  $AntivirusItemsTable createAlias(String alias) {
    return $AntivirusItemsTable(attachedDatabase, alias);
  }
}

class AntivirusItem extends DataClass implements Insertable<AntivirusItem> {
  final int id;
  final String name;
  final String description;
  final String shortDescription;
  final String iconUrl;
  final int colorValue;
  const AntivirusItem({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.iconUrl,
    required this.colorValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['short_description'] = Variable<String>(shortDescription);
    map['icon_url'] = Variable<String>(iconUrl);
    map['color_value'] = Variable<int>(colorValue);
    return map;
  }

  AntivirusItemsCompanion toCompanion(bool nullToAbsent) {
    return AntivirusItemsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      shortDescription: Value(shortDescription),
      iconUrl: Value(iconUrl),
      colorValue: Value(colorValue),
    );
  }

  factory AntivirusItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AntivirusItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'iconUrl': serializer.toJson<String>(iconUrl),
      'colorValue': serializer.toJson<int>(colorValue),
    };
  }

  AntivirusItem copyWith({
    int? id,
    String? name,
    String? description,
    String? shortDescription,
    String? iconUrl,
    int? colorValue,
  }) => AntivirusItem(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    shortDescription: shortDescription ?? this.shortDescription,
    iconUrl: iconUrl ?? this.iconUrl,
    colorValue: colorValue ?? this.colorValue,
  );
  AntivirusItem copyWithCompanion(AntivirusItemsCompanion data) {
    return AntivirusItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AntivirusItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, shortDescription, iconUrl, colorValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AntivirusItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.shortDescription == this.shortDescription &&
          other.iconUrl == this.iconUrl &&
          other.colorValue == this.colorValue);
}

class AntivirusItemsCompanion extends UpdateCompanion<AntivirusItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> shortDescription;
  final Value<String> iconUrl;
  final Value<int> colorValue;
  const AntivirusItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.colorValue = const Value.absent(),
  });
  AntivirusItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String shortDescription,
    required String iconUrl,
    required int colorValue,
  }) : name = Value(name),
       description = Value(description),
       shortDescription = Value(shortDescription),
       iconUrl = Value(iconUrl),
       colorValue = Value(colorValue);
  static Insertable<AntivirusItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? shortDescription,
    Expression<String>? iconUrl,
    Expression<int>? colorValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (shortDescription != null) 'short_description': shortDescription,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (colorValue != null) 'color_value': colorValue,
    });
  }

  AntivirusItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? shortDescription,
    Value<String>? iconUrl,
    Value<int>? colorValue,
  }) {
    return AntivirusItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      iconUrl: iconUrl ?? this.iconUrl,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AntivirusItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AntivirusItemsTable antivirusItems = $AntivirusItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [antivirusItems];
}

typedef $$AntivirusItemsTableCreateCompanionBuilder =
    AntivirusItemsCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String shortDescription,
      required String iconUrl,
      required int colorValue,
    });
typedef $$AntivirusItemsTableUpdateCompanionBuilder =
    AntivirusItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> shortDescription,
      Value<String> iconUrl,
      Value<int> colorValue,
    });

class $$AntivirusItemsTableFilterComposer
    extends Composer<_$AppDatabase, $AntivirusItemsTable> {
  $$AntivirusItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AntivirusItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $AntivirusItemsTable> {
  $$AntivirusItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AntivirusItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AntivirusItemsTable> {
  $$AntivirusItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );
}

class $$AntivirusItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AntivirusItemsTable,
          AntivirusItem,
          $$AntivirusItemsTableFilterComposer,
          $$AntivirusItemsTableOrderingComposer,
          $$AntivirusItemsTableAnnotationComposer,
          $$AntivirusItemsTableCreateCompanionBuilder,
          $$AntivirusItemsTableUpdateCompanionBuilder,
          (
            AntivirusItem,
            BaseReferences<_$AppDatabase, $AntivirusItemsTable, AntivirusItem>,
          ),
          AntivirusItem,
          PrefetchHooks Function()
        > {
  $$AntivirusItemsTableTableManager(
    _$AppDatabase db,
    $AntivirusItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AntivirusItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AntivirusItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AntivirusItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<String> iconUrl = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
              }) => AntivirusItemsCompanion(
                id: id,
                name: name,
                description: description,
                shortDescription: shortDescription,
                iconUrl: iconUrl,
                colorValue: colorValue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String shortDescription,
                required String iconUrl,
                required int colorValue,
              }) => AntivirusItemsCompanion.insert(
                id: id,
                name: name,
                description: description,
                shortDescription: shortDescription,
                iconUrl: iconUrl,
                colorValue: colorValue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AntivirusItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AntivirusItemsTable,
      AntivirusItem,
      $$AntivirusItemsTableFilterComposer,
      $$AntivirusItemsTableOrderingComposer,
      $$AntivirusItemsTableAnnotationComposer,
      $$AntivirusItemsTableCreateCompanionBuilder,
      $$AntivirusItemsTableUpdateCompanionBuilder,
      (
        AntivirusItem,
        BaseReferences<_$AppDatabase, $AntivirusItemsTable, AntivirusItem>,
      ),
      AntivirusItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AntivirusItemsTableTableManager get antivirusItems =>
      $$AntivirusItemsTableTableManager(_db, _db.antivirusItems);
}
