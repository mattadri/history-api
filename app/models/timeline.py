from app import db


class Timeline(db.Model):
    __tablename__ = 'timeline'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String)
    description = db.Column(db.Text)


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
    is_shadow = db.Column(db.Boolean, default=False)
    priority = db.Column(db.Integer, default=0)

    timeline_fk = db.Column(db.Integer, db.ForeignKey('timeline.id'))
    timeline = db.relationship('Timeline', foreign_keys=[timeline_fk], backref=db.backref('timeline_event'))
    timeline_rel = db.relationship('Timeline', foreign_keys=[timeline_fk])

    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('timeline_event'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])


class TimelineCategory(db.Model):
    __tablename__ = 'timeline_category'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    label = db.Column(db.String)

    timeline_fk = db.Column(db.Integer, db.ForeignKey('timeline.id'))
    timeline = db.relationship('Timeline', foreign_keys=[timeline_fk], backref=db.backref('timeline_category'))
    timeline_rel = db.relationship('Timeline', foreign_keys=[timeline_fk])


class TimelineCategoryEvent(db.Model):
    __tablename__ = 'timeline_category_event'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    timeline_category_fk = db.Column(db.Integer, db.ForeignKey('timeline_category.id'))
    timeline_category = db.relationship(
        'TimelineCategory', foreign_keys=[timeline_category_fk], backref=db.backref('timeline_category_event'))
    timeline_category_rel = db.relationship('TimelineCategory', foreign_keys=[timeline_category_fk])

    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('timeline_category_event'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])


class TimelineCategoryPerson(db.Model):
    __tablename__ = 'timeline_category_person'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    timeline_category_fk = db.Column(db.Integer, db.ForeignKey('timeline_category.id'))
    timeline_category = db.relationship(
        'TimelineCategory', foreign_keys=[timeline_category_fk], backref=db.backref('timeline_category_person'))
    timeline_category_rel = db.relationship('TimelineCategory', foreign_keys=[timeline_category_fk])

    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('timeline_category_person'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])
