from flask import request

from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.event import Event, EventNote
from app.models.tag import EventTag

from app import db


class EventSchema(Schema):
    class Meta:
        type_ = 'event'
        self_view = 'event_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'event_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)
    description = fields.String()
    event_start_day = fields.Integer(required=False, allow_none=True)
    event_start_month = fields.Nested('MonthSchema')
    event_start_year = fields.Integer(required=True)
    event_start_era = fields.Nested('EraSchema')
    event_end_day = fields.Integer(required=False, allow_none=True)
    event_end_month = fields.Nested('MonthSchema')
    event_end_year = fields.Integer(required=False)
    event_end_era = fields.Nested('EraSchema', required=False)
    reference = fields.Nested('ReferenceSchema')
    event_note = fields.Nested(
        'EventNoteSchema',
        exclude=('event',),
        many=True)
    timeline_event = fields.Nested(
        'TimelineEventSchema',
        # exclude=('timeline.timeline_event', 'timeline.timeline_person', 'event'),
        only=('timeline.label', 'timeline.id', 'id'),
        many=True)
    event_tag = fields.Nested(
        'EventTagSchema',
        exclude=('event',),
        many=True
    )

    event_start_month_rel = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )

    event_start_era_rel = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=True
    )

    event_end_month_rel = Relationship(
        related_view='month_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='MonthSchema',
        type_='month',
        required=False
    )

    event_end_era_rel = Relationship(
        related_view='era_detail',
        related_view_kwargs={'id': '<id>'},
        many=False,
        schema='EraSchema',
        type_='era',
        required=False
    )

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class EventList(ResourceList):
    schema = EventSchema
    data_layer = {'session': db.session,
                  'model': Event}


class EventDetail(ResourceDetail):
    def before_patch(self, args, kwargs):
        if 'event_start_day' in request.json['data']['attributes'].keys() and request.json['data']['attributes']['event_start_day'] == 'null':
            request.json['data']['attributes']['event_start_day'] = None

        if 'event_end_day' in request.json['data']['attributes'].keys() and request.json['data']['attributes']['event_end_day'] == 'null':
            request.json['data']['attributes']['event_end_day'] = None

        if 'event_start_month_rel' in request.json['data']['attributes'] and request.json['data']['attributes']['event_start_month_rel']['data']['id'] == 'null':
            request.json['data']['attributes']['event_start_month_rel']['data']['id'] = None

        if 'event_end_month_rel' in request.json['data']['attributes'] and request.json['data']['attributes']['event_end_month_rel']['data']['id'] == 'null':
            request.json['data']['attributes']['event_end_month_rel']['data']['id'] = None

        return

    schema = EventSchema
    data_layer = {'session': db.session,
                  'model': Event}


class EventNoteSchema(Schema):
    class Meta:
        type_ = 'event_note'
        self_view = 'event_note_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'event_note_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    note = fields.String(required=True)
    event = fields.Nested('EventSchema')

    event_rel = Relationship(
        many=False,
        schema='EventSchema',
        type_='event'
    )


class EventNoteList(ResourceList):
    schema = EventNoteSchema
    data_layer = {'session': db.session,
                  'model': EventNote}


class EventNoteDetail(ResourceDetail):
    schema = EventNoteSchema
    data_layer = {'session': db.session,
                  'model': EventNote}


class EventTagSchema(Schema):
    class Meta:
        type_ = 'event_tag'
        self_view = 'event_tag_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'event_tag_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    tag = fields.Nested('TagSchema')
    event = fields.Nested('EventSchema')

    tag_rel = Relationship(
        many=False,
        schema='TagSchema',
        type_='tag'
    )

    event_rel = Relationship(
        many=False,
        schema='EventSchema',
        type_='event'
    )


class EventTagList(ResourceList):
    schema = EventTagSchema
    data_layer = {'session': db.session,
                  'model': EventTag}


class EventTagDetail(ResourceDetail):
    schema = EventTagSchema
    data_layer = {'session': db.session,
                  'model': EventTag}
