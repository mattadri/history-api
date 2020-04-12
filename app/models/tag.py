from app import db


class Tag(db.Model):
    __tablename__ = 'tag'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String, nullable=False, unique=True)


class EventTag(db.Model):
    __tablename__ = 'event_tag'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('event_tag'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])

    tag_fk = db.Column(db.Integer, db.ForeignKey('tag.id'))
    tag = db.relationship('Tag', foreign_keys=[tag_fk], backref=db.backref('event_tag'))
    tag_rel = db.relationship('Tag', foreign_keys=[tag_fk])


class PersonTag(db.Model):
    __tablename__ = 'person_tag'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('person_tag'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])

    tag_fk = db.Column(db.Integer, db.ForeignKey('tag.id'))
    tag = db.relationship('Tag', foreign_keys=[tag_fk], backref=db.backref('person_tag'))
    tag_rel = db.relationship('Tag', foreign_keys=[tag_fk])
