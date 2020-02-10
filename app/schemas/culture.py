from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.culture import Culture, CulturePeriod, CultureReference

from app import db


class CultureSchema(Schema):
    class Meta:
        type_ = 'culture'
        self_view = 'culture_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'culture_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)
    culture_period = Relationship(
        related_view='culture_period_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='CulturePeriodSchema',
        type_='cultureperiod',
        required=False
    )


class CultureList(ResourceList):
    schema = CultureSchema
    data_layer = {'session': db.session,
                  'model': Culture}


class CultureDetail(ResourceDetail):
    schema = CultureSchema
    data_layer = {'session': db.session,
                  'model': Culture}


class CulturePeriodSchema(Schema):
    class Meta:
        type_ = 'cultureperiod'
        self_view = 'culture_period_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'culture_period_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    period_start_day = fields.Integer(required=False)
    period_start_month = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )
    period_start_year = fields.Integer(required=True)
    period_start_era = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )
    period_end_day = fields.Integer(required=False)
    period_end_month = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )
    period_end_year = fields.Integer(required=True)
    period_end_era = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )


class CulturePeriodList(ResourceList):
    schema = CulturePeriodSchema
    data_layer = {'session': db.session,
                  'model': CulturePeriod}


class CulturePeriodDetail(ResourceDetail):
    schema = CulturePeriodSchema
    data_layer = {'session': db.session,
                  'model': CulturePeriod}


class CultureReferenceSchema(Schema):
    class Meta:
        type_ = 'culture_reference_schema'
        self_view = 'culture_reference_detail'
        self_view_kwargs = {'id', '<id>'}
        self_view_many = 'culture_reference_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    reference = Relationship(
        related_view='reference_detail',
        related_view_kwargs={'id': '<id>'},
        many=True,
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class CultureReferenceList(ResourceList):
    schema = CultureReferenceSchema
    data_layer = {'session': db.session,
                  'model': CultureReference}


class CultureReferenceDetail(ResourceDetail):
    schema = CultureReferenceSchema
    data_layer = {'session': db.session,
                  'model': CultureReference}
