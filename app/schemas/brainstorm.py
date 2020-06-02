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
