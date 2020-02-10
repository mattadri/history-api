from itertools import groupby

from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.timeline import Timeline, TimelinePerson, TimelineEvent

from app import db


class TimelineSchema(Schema):
    class Meta:
        type_ = 'timeline'
        self_view = 'timeline_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String()
    timeline_event = fields.Nested('TimelineEventSchema', exclude=('timeline',), many=True)


class TimelineList(ResourceList):
    def after_get(self, result):
        pass

    schema = TimelineSchema
    data_layer = {'session': db.session,
                  'model': Timeline}


class TimelineDetail(ResourceDetail):
    def after_get(self, result):
        bc_timeline = []
        ad_timeline = []

        # order the events from oldest to most recent
        timeline_events = result['data']['attributes']['timeline_event']['data']

        sorted_timeline = sorted(
            timeline_events,
            key=lambda k: k['attributes']['event']['data']['attributes']['event_start_era']['data']['attributes']['label'])

        for era, events in groupby(
                sorted_timeline,
                key=lambda k: k['attributes']['event']['data']['attributes']['event_start_era']['data']['attributes']['label']):
            if era == 'BC':
                for event in events:
                    bc_timeline.append(event)

            else:
                for event in events:
                    ad_timeline.append(event)

        sorted_ad_timeline = sorted(
            ad_timeline,
            key=lambda k: k['attributes']['event']['data']['attributes']['event_start_year'])

        sorted_bc_timeline = sorted(
            bc_timeline,
            key=lambda k: k['attributes']['event']['data']['attributes']['event_start_year'],
            reverse=True)

        result['data']['attributes']['timeline_event']['data'] = sorted_bc_timeline + sorted_ad_timeline

    schema = TimelineSchema
    data_layer = {'session': db.session,
                  'model': Timeline}


class TimelinePersonSchema(Schema):
    class Meta:
        type_ = 'timeline_person'
        self_view = 'timeline_person_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_person_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    timeline = fields.Nested('TimelineSchema')
    person = fields.Nested('PersonSchema')

    timeline_rel = Relationship(
        schema='TimelineSchema',
        type_='timeline',
        required=True
    )

    person_rel = Relationship(
        schema='PersonSchema',
        type_='person',
        required=True
    )


class TimelinePersonList(ResourceList):
    schema = TimelinePersonSchema
    data_layer = {'session': db.session,
                  'model': TimelinePerson}


class TimelinePersonDetail(ResourceDetail):
    schema = TimelinePersonSchema
    data_layer = {'session': db.session,
                  'model': TimelinePerson}


class TimelineEventSchema(Schema):
    class Meta:
        type_ = 'timeline_event'
        self_view = 'timeline_event_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_event_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    timeline = fields.Nested('TimelineSchema')
    event = fields.Nested('EventSchema')

    timeline_rel = Relationship(
        schema='TimelineSchema',
        type_='timeline',
        required=True
    )

    event_rel = Relationship(
        schema='EventSchema',
        type_='event',
        required=True
    )


class TimelineEventList(ResourceList):
    schema = TimelineEventSchema
    data_layer = {'session': db.session,
                  'model': TimelineEvent}


class TimelineEventDetail(ResourceDetail):
    schema = TimelineEventSchema
    data_layer = {'session': db.session,
                  'model': TimelineEvent}
