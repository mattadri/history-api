from app import db


class Brainstorm(db.Model):
    __tablename__ = 'brainstorm'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp())
    title = db.Column(db.String, nullable=False)
    description = db.Column(db.Text)


class BrainstormThought(db.Model):
    __tablename__ = 'brainstorm_thought'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp())
    thought = db.Column(db.Text)
    chapter = db.Column(db.String)
    page = db.Column(db.Integer)

    brainstorm_fk = db.Column(db.Integer, db.ForeignKey('brainstorm.id'))
    brainstorm = db.relationship('Brainstorm', foreign_keys=[brainstorm_fk], backref=db.backref('brainstorm_thought'))
    brainstorm_rel = db.relationship('Brainstorm', foreign_keys=[brainstorm_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('brainstorm_thought'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])


class BrainstormTopic(db.Model):
    __tablename__ = 'brainstorm_topic'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp())
    label = db.Column(db.String, nullable=False)

    brainstorm_fk = db.Column(db.Integer, db.ForeignKey('brainstorm.id'))
    brainstorm = db.relationship('Brainstorm', foreign_keys=[brainstorm_fk], backref=db.backref('brainstorm_topic'))
    brainstorm_rel = db.relationship('Brainstorm', foreign_keys=[brainstorm_fk])


class BrainstormTopicThought(db.Model):
    __tablename__ = 'brainstorm_topic_thought'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp())
    thought = db.Column(db.Text)
    chapter = db.Column(db.String)
    page = db.Column(db.Integer)

    brainstorm_topic_fk = db.Column(db.Integer, db.ForeignKey('brainstorm_topic.id'))
    brainstorm_topic = db.relationship('BrainstormTopic', foreign_keys=[brainstorm_topic_fk], backref=db.backref('brainstorm_topic_thought'))
    brainstorm_topic_rel = db.relationship('BrainstormTopic', foreign_keys=[brainstorm_topic_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('brainstorm_topic_thought'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])
