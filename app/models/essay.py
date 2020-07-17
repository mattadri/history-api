from app import db


class Essay(db.Model):
    __tablename__ = 'essay'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    title = db.Column(db.String, nullable=False)
    abstract = db.Column(db.Text)
    essay = db.Column(db.Text)

    type_fk = db.Column(db.Integer, db.ForeignKey('essay_type.id'))
    type = db.relationship('EssayType', foreign_keys=[type_fk], backref=db.backref('essay'))
    type_rel = db.relationship('EssayType', foreign_keys=[type_fk])


class EssayReference(db.Model):
    __tablename__ = 'essay_reference'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    chapter = db.Column(db.String)
    page = db.Column(db.Integer)

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_reference'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('essay_reference'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])


class EssayEvent(db.Model):
    __tablename__ = 'essay_event'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_event'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    event_fk = db.Column(db.Integer, db.ForeignKey('event.id'))
    event = db.relationship('Event', foreign_keys=[event_fk], backref=db.backref('essay_event'))
    event_rel = db.relationship('Event', foreign_keys=[event_fk])


class EssayPerson(db.Model):
    __tablename__ = 'essay_person'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_person'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('essay_person'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])


class EssayTimeline(db.Model):
    __tablename__ = 'essay_timeline'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_timeline'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    timeline_fk = db.Column(db.Integer, db.ForeignKey('timeline.id'))
    timeline = db.relationship('Timeline', foreign_keys=[timeline_fk], backref=db.backref('essay_timeline'))
    timeline_rel = db.relationship('Timeline', foreign_keys=[timeline_fk])


class EssayNote(db.Model):
    __tablename__ = 'essay_note'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    note = db.Column(db.String)

    reference_chapter = db.Column(db.String)
    reference_page = db.Column(db.Integer)

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('essay_note'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('essay_note'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])


class EssayType(db.Model):
    __tablename__ = 'essay_type'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    label = db.Column(db.String)
