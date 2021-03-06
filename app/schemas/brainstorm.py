from marshmallow_jsonapi.flask import Schema, Relationship
from marshmallow_jsonapi import fields

from flask_rest_jsonapi import ResourceDetail, ResourceList

from app.models.brainstorm import Brainstorm, BrainstormThought, BrainstormTopic, BrainstormTopicThought

from app import db


class BrainstormSchema(Schema):
    class Meta:
        type_ = 'brainstorm'
        self_view = 'brainstorm_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'brainstorm_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    title = fields.String(required=True)
    description = fields.String()

    brainstorm_thought = fields.Nested('BrainstormThoughtSchema', many=True)
    brainstorm_topic = fields.Nested('BrainstormTopicSchema', many=True)


class BrainstormList(ResourceList):
    schema = BrainstormSchema
    data_layer = {'session': db.session,
                  'model': Brainstorm}


class BrainstormDetail(ResourceDetail):
    def after_get(self, result):
        # SORT BRAINSTORM THOUGHTS BY POSITION
        brainstorm_thoughts = result['data']['attributes']['brainstorm_thought']['data']

        if len(brainstorm_thoughts):
            brainstorm_thoughts = sorted(brainstorm_thoughts, key=lambda k: k['attributes']['position'])

        result['data']['attributes']['brainstorm_thought']['data'] = brainstorm_thoughts

        # SORT TOPICS BY POSITION
        topics = result['data']['attributes']['brainstorm_topic']['data']

        if len(topics):
            topics = sorted(topics, key=lambda k: k['attributes']['position'])

        result['data']['attributes']['brainstorm_topic']['data'] = topics

        # SORT TOPIC THOUGHTS BY POSITION
        for topic in result['data']['attributes']['brainstorm_topic']['data']:
            topic_thoughts = topic['attributes']['brainstorm_topic_thought']['data']

            if len(topic_thoughts):
                topic_thoughts = sorted(topic_thoughts, key=lambda k: k['attributes']['position'])

                topic['attributes']['brainstorm_topic_thought']['data'] = topic_thoughts

    schema = BrainstormSchema
    data_layer = {'session': db.session,
                  'model': Brainstorm}


class BrainstormThoughtSchema(Schema):
    class Meta:
        type_ = 'brainstorm_thought'
        self_view = 'brainstorm_thought_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'brainstorm_thought_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    thought = fields.String(required=True)

    chapter = fields.String()
    page = fields.Integer()

    position = fields.Integer(required=True)

    reference = fields.Nested('ReferenceSchema')

    brainstorm_rel = Relationship(
        schema='BrainstormSchema',
        type_='brainstorm',
        required=True
    )

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class BrainstormThoughtList(ResourceList):
    schema = BrainstormThoughtSchema
    data_layer = {'session': db.session,
                  'model': BrainstormThought}


class BrainstormThoughtDetail(ResourceDetail):
    schema = BrainstormThoughtSchema
    data_layer = {'session': db.session,
                  'model': BrainstormThought}


class BrainstormTopicSchema(Schema):
    class Meta:
        type_ = 'brainstorm_topic'
        self_view = 'brainstorm_topic_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'brainstorm_topic_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    label = fields.String(required=True)

    position = fields.Integer(required=True)

    brainstorm_topic_thought = fields.Nested('BrainstormTopicThoughtSchema', many=True)

    brainstorm_rel = Relationship(
        schema='BrainstormSchema',
        type_='brainstorm',
        required=True
    )


class BrainstormTopicList(ResourceList):
    schema = BrainstormTopicSchema
    data_layer = {'session': db.session,
                  'model': BrainstormTopic}


class BrainstormTopicDetail(ResourceDetail):
    schema = BrainstormTopicSchema
    data_layer = {'session': db.session,
                  'model': BrainstormTopic}


class BrainstormTopicThoughtSchema(Schema):
    class Meta:
        type_ = 'brainstorm_topic_thought'
        self_view = 'brainstorm_topic_thought_detail'
        self_view_kwargs = {'id': '<id>'}
        self_view_many = 'brainstorm_topic_thought_list'

    id = fields.Str(dump_only=True)
    created = fields.Date()
    modified = fields.Date()

    thought = fields.String(required=True)

    chapter = fields.String()
    page = fields.Integer()

    position = fields.Integer(required=True)

    reference = fields.Nested('ReferenceSchema')

    brainstorm_topic_fk = fields.Integer()

    brainstorm_topic_rel = Relationship(
        schema='BrainstormTopicSchema',
        type_='brainstorm_topic',
        required=True
    )

    reference_rel = Relationship(
        schema='ReferenceSchema',
        type_='reference',
        required=False
    )


class BrainstormTopicThoughtList(ResourceList):
    schema = BrainstormTopicThoughtSchema
    data_layer = {'session': db.session,
                  'model': BrainstormTopicThought}


class BrainstormTopicThoughtDetail(ResourceDetail):
    schema = BrainstormTopicThoughtSchema
    data_layer = {'session': db.session,
                  'model': BrainstormTopicThought}
