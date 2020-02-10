from app import db


class Timeline(db.Model):
    __tablename__ = 'timeline'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String)


class TimelinePerson(db.Model):
    __tablename__ = 'timeline_person'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    timeline_fk = db.Column(db.Integer, db.ForeignKey('timeline.id'))
    timeline = db.relationship('Timeline', foreign_keys=[timeline_fk], backref=db.backref('timeline_person'))
    timeline_rel = db.relationship('Timeline', foreign_keys=[timeline_fk])
    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('timeline_person'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])


class TimelineEvent(db.Model):
    __tablename__ = 'timeline_event'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    timeline_fk = db.Column(db.Integer, db.ForeignKey('timeline.id'))
    timeline = db.relationship('Timeline', foreign_keys=[timeline_fk], backref=db.backref('timeline_event'))
    timeline_rel = db.relationship('Timeline', foreign_keys=[timeline_fk])
    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('timeline_event'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])
