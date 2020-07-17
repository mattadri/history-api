from app import db


class Person(db.Model):
    __tablename__ = 'person'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    first_name = db.Column(db.String)
    middle_name = db.Column(db.String)
    last_name = db.Column(db.String)
    description = db.Column(db.String)
    birth_day = db.Column(db.Integer)
    birth_year = db.Column(db.Integer)
    death_day = db.Column(db.Integer)
    death_year = db.Column(db.Integer)

    birth_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    birth_month = db.relationship('Month', foreign_keys=[birth_month_fk])
    birth_month_rel = db.relationship('Month', foreign_keys=[birth_month_fk])

    birth_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    birth_era = db.relationship('Era', foreign_keys=[birth_era_fk])
    birth_era_rel = db.relationship('Era', foreign_keys=[birth_era_fk])

    death_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    death_month = db.relationship('Month', foreign_keys=[death_month_fk])
    death_month_rel = db.relationship('Month', foreign_keys=[death_month_fk])

    death_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    death_era = db.relationship('Era', foreign_keys=[death_era_fk])
    death_era_rel = db.relationship('Era', foreign_keys=[death_era_fk])

    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('person'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])


class PersonNote(db.Model):
    __tablename__ = 'person_note'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    note = db.Column(db.String, nullable=False)

    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('person_note'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])


class PersonBiography(db.Model):
    __tablename__ = 'person_biography'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    essay_fk = db.Column(db.Integer, db.ForeignKey('essay.id'))
    essay = db.relationship('Essay', foreign_keys=[essay_fk], backref=db.backref('person_biography'))
    essay_rel = db.relationship('Essay', foreign_keys=[essay_fk])

    person_fk = db.Column(db.Integer, db.ForeignKey('person.id'))
    person = db.relationship('Person', foreign_keys=[person_fk], backref=db.backref('person_biography'))
    person_rel = db.relationship('Person', foreign_keys=[person_fk])
