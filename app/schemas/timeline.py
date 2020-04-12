from flask import request

from itertools import groupby

from datetime import date

from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.timeline import Timeline, TimelinePerson, TimelineEvent, TimelineCategory, TimelineCategoryEvent, \
    TimelineCategoryPerson

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
    timeline_person = fields.Nested('TimelinePersonSchema', exclude=('timeline',), many=True)
    timeline_category = fields.Nested('TimelineCategorySchema', exclude=('timeline',), many=True)


class TimelineList(ResourceList):
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

        # split dates between BC and AD
        for era, events in groupby(
                sorted_timeline,
                key=lambda k: k['attributes']['event']['data']['attributes']['event_start_era']['data']['attributes']['label']):
            if era == 'BC':
                for event in events:
                    bc_timeline.append(event)

            else:
                for event in events:
                    ad_timeline.append(event)

        # create a date object for the AD timeline events to sort by
        for element in ad_timeline:
            event_attributes = element['attributes']['event']['data']['attributes']

            year = event_attributes['event_start_year']

            if event_attributes['event_start_month'] is None:
                month = 1
            else:
                month = int(event_attributes['event_start_month']['data']['id'])

            if event_attributes['event_start_day'] is None:
                day = 1
            else:
                day = int(event_attributes['event_start_day'])

            event_attributes['event_date_object'] = date(year, month, day)

        sorted_ad_timeline = sorted(
            ad_timeline,
            key=lambda k: k['attributes']['event']['data']['attributes']['event_date_object'])

        # remove the date object as it cannot be serialized to json
        for element in sorted_ad_timeline:
            event_attributes = element['attributes']['event']['data']['attributes']

            event_attributes['event_date_object'] = None

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
    is_shadow = fields.Boolean(default=False)
    priority = fields.Integer(default=0)
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


class TimelineCategorySchema(Schema):
    class Meta:
        type_ = 'timeline_category'
        self_view = 'timeline_category_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_category_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()
    label = fields.String(required=True)

    timeline_category_event = fields.Nested('TimelineCategoryEventSchema', many=True)

    timeline_rel = Relationship(
        schema='TimelineSchema',
        type_='timeline',
        required=True
    )


class TimelineCategoryList(ResourceList):
    schema = TimelineCategorySchema
    data_layer = {'session': db.session,
                  'model': TimelineCategory}


class TimelineCategoryDetail(ResourceDetail):
    # make sure that when a category is deleted any event objects attached to it are also deleted.
    def before_delete(self, args, kwargs):
        query = db.session.query(TimelineCategoryEvent)
        query = query.filter(TimelineCategoryEvent.timeline_category_fk == kwargs['id'])
        query.delete()

    schema = TimelineCategorySchema
    data_layer = {'session': db.session,
                  'model': TimelineCategory}


class TimelineCategoryEventSchema(Schema):
    class Meta:
        type_ = 'timeline_category_event'
        self_view = 'timeline_category_event_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_category_event_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    event = fields.Nested('EventSchema', only=('id',))

    timeline_category_rel = Relationship(
        schema='TimelineCategorySchema',
        type_='timeline_category',
        required=True
    )

    event_rel = Relationship(
        schema='EventSchema',
        type_='event',
        required=True
    )


class TimelineCategoryEventList(ResourceList):
    schema = TimelineCategoryEventSchema
    data_layer = {'session': db.session,
                  'model': TimelineCategoryEvent}


class TimelineCategoryEventDetail(ResourceDetail):
    schema = TimelineCategoryEventSchema
    data_layer = {'session': db.session,
                  'model': TimelineCategoryEvent}


class TimelineCategoryPersonSchema(Schema):
    class Meta:
        type_ = 'timeline_category_person'
        self_view = 'timeline_category_person_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'timeline_category_person_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    timeline_category_rel = Relationship(
        schema='TimelineCategorySchema',
        type_='timeline_category',
        required=True
    )

    person_rel = Relationship(
        schema='PersonSchema',
        type_='person',
        required=True
    )


class TimelineCategoryPersonList(ResourceList):
    schema = TimelineCategoryPersonSchema
    data_layer = {'session': db.session,
                  'model': TimelineCategoryPerson}


class TimelineCategoryPersonDetail(ResourceDetail):
    schema = TimelineCategoryPersonSchema
    data_layer = {'session': db.session,
                  'model': TimelineCategoryPerson}
