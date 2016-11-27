/* filedb.c generated by valac 0.34.3, the Vala compiler
 * generated from filedb.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <gobject/gvaluecollector.h>


#define LAIR_TYPE_FILE_DB (lair_file_db_get_type ())
#define LAIR_FILE_DB(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), LAIR_TYPE_FILE_DB, LAIRFileDB))
#define LAIR_FILE_DB_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), LAIR_TYPE_FILE_DB, LAIRFileDBClass))
#define LAIR_IS_FILE_DB(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), LAIR_TYPE_FILE_DB))
#define LAIR_IS_FILE_DB_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), LAIR_TYPE_FILE_DB))
#define LAIR_FILE_DB_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), LAIR_TYPE_FILE_DB, LAIRFileDBClass))

typedef struct _LAIRFileDB LAIRFileDB;
typedef struct _LAIRFileDBClass LAIRFileDBClass;
typedef struct _LAIRFileDBPrivate LAIRFileDBPrivate;

#define LAIR_TYPE_LAIR_FILE (lair_lair_file_get_type ())
#define LAIR_LAIR_FILE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), LAIR_TYPE_LAIR_FILE, LAIRLairFile))
#define LAIR_LAIR_FILE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), LAIR_TYPE_LAIR_FILE, LAIRLairFileClass))
#define LAIR_IS_LAIR_FILE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), LAIR_TYPE_LAIR_FILE))
#define LAIR_IS_LAIR_FILE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), LAIR_TYPE_LAIR_FILE))
#define LAIR_LAIR_FILE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), LAIR_TYPE_LAIR_FILE, LAIRLairFileClass))

typedef struct _LAIRLairFile LAIRLairFile;
typedef struct _LAIRLairFileClass LAIRLairFileClass;

#define LAIR_TYPE_IMAGE (lair_image_get_type ())
#define LAIR_IMAGE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), LAIR_TYPE_IMAGE, LAIRImage))
#define LAIR_IMAGE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), LAIR_TYPE_IMAGE, LAIRImageClass))
#define LAIR_IS_IMAGE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), LAIR_TYPE_IMAGE))
#define LAIR_IS_IMAGE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), LAIR_TYPE_IMAGE))
#define LAIR_IMAGE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), LAIR_TYPE_IMAGE, LAIRImageClass))

typedef struct _LAIRImage LAIRImage;
typedef struct _LAIRImageClass LAIRImageClass;
#define __g_list_free__g_object_unref0_0(var) ((var == NULL) ? NULL : (var = (_g_list_free__g_object_unref0_ (var), NULL)))
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))
typedef struct _LAIRParamSpecFileDB LAIRParamSpecFileDB;

struct _LAIRFileDB {
	GTypeInstance parent_instance;
	volatile int ref_count;
	LAIRFileDBPrivate * priv;
};

struct _LAIRFileDBClass {
	GTypeClass parent_class;
	void (*finalize) (LAIRFileDB *self);
};

struct _LAIRFileDBPrivate {
	GList* imgRes;
	LAIRLairFile* imgListPath;
	LAIRLairFile* sndListPath;
	LAIRLairFile* ttfListPath;
};

struct _LAIRParamSpecFileDB {
	GParamSpec parent_instance;
};


static gpointer lair_file_db_parent_class = NULL;

gpointer lair_file_db_ref (gpointer instance);
void lair_file_db_unref (gpointer instance);
GParamSpec* lair_param_spec_file_db (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void lair_value_set_file_db (GValue* value, gpointer v_object);
void lair_value_take_file_db (GValue* value, gpointer v_object);
gpointer lair_value_get_file_db (const GValue* value);
GType lair_file_db_get_type (void) G_GNUC_CONST;
GType lair_lair_file_get_type (void) G_GNUC_CONST;
GType lair_image_get_type (void) G_GNUC_CONST;
#define LAIR_FILE_DB_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), LAIR_TYPE_FILE_DB, LAIRFileDBPrivate))
enum  {
	LAIR_FILE_DB_DUMMY_PROPERTY
};
static void _g_object_unref0_ (gpointer var);
static void _g_list_free__g_object_unref0_ (GList* self);
LAIRFileDB* lair_file_db_new (const gchar* imgList, const gchar* sndList, const gchar* ttfList);
LAIRFileDB* lair_file_db_construct (GType object_type, const gchar* imgList, const gchar* sndList, const gchar* ttfList);
LAIRLairFile* lair_lair_file_new_WithPath (const gchar* path);
LAIRLairFile* lair_lair_file_construct_WithPath (GType object_type, const gchar* path);
gboolean lair_lair_file_CheckPath (LAIRLairFile* self);
gchar* lair_lair_file_GetPath (LAIRLairFile* self);
gboolean lair_file_db_LoadFiles (LAIRFileDB* self);
GList* lair_lair_file_LoadLineDelimitedConfig (LAIRLairFile* self);
LAIRImage* lair_image_new (const gchar* Path);
LAIRImage* lair_image_construct (GType object_type, const gchar* Path);
static void lair_file_db_finalize (LAIRFileDB* obj);


static void _g_object_unref0_ (gpointer var) {
#line 3 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	(var == NULL) ? NULL : (var = (g_object_unref (var), NULL));
#line 105 "filedb.c"
}


static void _g_list_free__g_object_unref0_ (GList* self) {
#line 3 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_list_foreach (self, (GFunc) _g_object_unref0_, NULL);
#line 3 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_list_free (self);
#line 114 "filedb.c"
}


static gpointer _g_object_ref0 (gpointer self) {
#line 10 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return self ? g_object_ref (self) : NULL;
#line 121 "filedb.c"
}


LAIRFileDB* lair_file_db_construct (GType object_type, const gchar* imgList, const gchar* sndList, const gchar* ttfList) {
	LAIRFileDB* self = NULL;
	LAIRLairFile* imgfile = NULL;
	const gchar* _tmp0_ = NULL;
	LAIRLairFile* _tmp1_ = NULL;
	LAIRLairFile* _tmp2_ = NULL;
	gboolean _tmp3_ = FALSE;
	LAIRLairFile* sndfile = NULL;
	const gchar* _tmp10_ = NULL;
	LAIRLairFile* _tmp11_ = NULL;
	LAIRLairFile* _tmp12_ = NULL;
	gboolean _tmp13_ = FALSE;
	LAIRLairFile* ttffile = NULL;
	const gchar* _tmp20_ = NULL;
	LAIRLairFile* _tmp21_ = NULL;
	LAIRLairFile* _tmp22_ = NULL;
	gboolean _tmp23_ = FALSE;
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (imgList != NULL, NULL);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (sndList != NULL, NULL);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (ttfList != NULL, NULL);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self = (LAIRFileDB*) g_type_create_instance (object_type);
#line 8 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp0_ = imgList;
#line 8 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp1_ = lair_lair_file_new_WithPath (_tmp0_);
#line 8 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	imgfile = _tmp1_;
#line 9 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp2_ = imgfile;
#line 9 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp3_ = lair_lair_file_CheckPath (_tmp2_);
#line 9 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (_tmp3_) {
#line 162 "filedb.c"
		LAIRLairFile* _tmp4_ = NULL;
		LAIRLairFile* _tmp5_ = NULL;
#line 10 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp4_ = imgfile;
#line 10 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp5_ = _g_object_ref0 (_tmp4_);
#line 10 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_object_unref0 (self->priv->imgListPath);
#line 10 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		self->priv->imgListPath = _tmp5_;
#line 173 "filedb.c"
	} else {
		FILE* _tmp6_ = NULL;
		LAIRLairFile* _tmp7_ = NULL;
		gchar* _tmp8_ = NULL;
		gchar* _tmp9_ = NULL;
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp6_ = stderr;
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp7_ = imgfile;
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp8_ = lair_lair_file_GetPath (_tmp7_);
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp9_ = _tmp8_;
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		fprintf (_tmp6_, "File '%s' doesn't exist.\n", _tmp9_);
#line 12 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_free0 (_tmp9_);
#line 191 "filedb.c"
	}
#line 14 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp10_ = sndList;
#line 14 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp11_ = lair_lair_file_new_WithPath (_tmp10_);
#line 14 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	sndfile = _tmp11_;
#line 15 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp12_ = sndfile;
#line 15 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp13_ = lair_lair_file_CheckPath (_tmp12_);
#line 15 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (_tmp13_) {
#line 205 "filedb.c"
		LAIRLairFile* _tmp14_ = NULL;
		LAIRLairFile* _tmp15_ = NULL;
#line 16 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp14_ = sndfile;
#line 16 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp15_ = _g_object_ref0 (_tmp14_);
#line 16 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_object_unref0 (self->priv->sndListPath);
#line 16 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		self->priv->sndListPath = _tmp15_;
#line 216 "filedb.c"
	} else {
		FILE* _tmp16_ = NULL;
		LAIRLairFile* _tmp17_ = NULL;
		gchar* _tmp18_ = NULL;
		gchar* _tmp19_ = NULL;
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp16_ = stderr;
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp17_ = sndfile;
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp18_ = lair_lair_file_GetPath (_tmp17_);
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp19_ = _tmp18_;
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		fprintf (_tmp16_, "File '%s' doesn't exist.\n", _tmp19_);
#line 18 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_free0 (_tmp19_);
#line 234 "filedb.c"
	}
#line 20 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp20_ = ttfList;
#line 20 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp21_ = lair_lair_file_new_WithPath (_tmp20_);
#line 20 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	ttffile = _tmp21_;
#line 21 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp22_ = ttffile;
#line 21 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_tmp23_ = lair_lair_file_CheckPath (_tmp22_);
#line 21 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (_tmp23_) {
#line 248 "filedb.c"
		LAIRLairFile* _tmp24_ = NULL;
		LAIRLairFile* _tmp25_ = NULL;
#line 22 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp24_ = ttffile;
#line 22 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp25_ = _g_object_ref0 (_tmp24_);
#line 22 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_object_unref0 (self->priv->ttfListPath);
#line 22 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		self->priv->ttfListPath = _tmp25_;
#line 259 "filedb.c"
	} else {
		FILE* _tmp26_ = NULL;
		LAIRLairFile* _tmp27_ = NULL;
		gchar* _tmp28_ = NULL;
		gchar* _tmp29_ = NULL;
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp26_ = stderr;
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp27_ = ttffile;
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp28_ = lair_lair_file_GetPath (_tmp27_);
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_tmp29_ = _tmp28_;
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		fprintf (_tmp26_, "File '%s' doesn't exist.\n", _tmp29_);
#line 24 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		_g_free0 (_tmp29_);
#line 277 "filedb.c"
	}
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (ttffile);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (sndfile);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (imgfile);
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return self;
#line 287 "filedb.c"
}


LAIRFileDB* lair_file_db_new (const gchar* imgList, const gchar* sndList, const gchar* ttfList) {
#line 7 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return lair_file_db_construct (LAIR_TYPE_FILE_DB, imgList, sndList, ttfList);
#line 294 "filedb.c"
}


gboolean lair_file_db_LoadFiles (LAIRFileDB* self) {
	gboolean result = FALSE;
	GList* imgStrings = NULL;
	LAIRLairFile* _tmp0_ = NULL;
	GList* _tmp1_ = NULL;
	GList* _tmp2_ = NULL;
#line 27 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (self != NULL, FALSE);
#line 28 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	result = FALSE;
#line 28 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return result;
#line 310 "filedb.c"
}


static void lair_value_file_db_init (GValue* value) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	value->data[0].v_pointer = NULL;
#line 317 "filedb.c"
}


static void lair_value_file_db_free_value (GValue* value) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (value->data[0].v_pointer) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		lair_file_db_unref (value->data[0].v_pointer);
#line 326 "filedb.c"
	}
}


static void lair_value_file_db_copy_value (const GValue* src_value, GValue* dest_value) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (src_value->data[0].v_pointer) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		dest_value->data[0].v_pointer = lair_file_db_ref (src_value->data[0].v_pointer);
#line 336 "filedb.c"
	} else {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		dest_value->data[0].v_pointer = NULL;
#line 340 "filedb.c"
	}
}


static gpointer lair_value_file_db_peek_pointer (const GValue* value) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return value->data[0].v_pointer;
#line 348 "filedb.c"
}


static gchar* lair_value_file_db_collect_value (GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (collect_values[0].v_pointer) {
#line 355 "filedb.c"
		LAIRFileDB* object;
		object = collect_values[0].v_pointer;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		if (object->parent_instance.g_class == NULL) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
			return g_strconcat ("invalid unclassed object pointer for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
#line 362 "filedb.c"
		} else if (!g_value_type_compatible (G_TYPE_FROM_INSTANCE (object), G_VALUE_TYPE (value))) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
			return g_strconcat ("invalid object type `", g_type_name (G_TYPE_FROM_INSTANCE (object)), "' for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
#line 366 "filedb.c"
		}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = lair_file_db_ref (object);
#line 370 "filedb.c"
	} else {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = NULL;
#line 374 "filedb.c"
	}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return NULL;
#line 378 "filedb.c"
}


static gchar* lair_value_file_db_lcopy_value (const GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	LAIRFileDB** object_p;
	object_p = collect_values[0].v_pointer;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (!object_p) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		return g_strdup_printf ("value location for `%s' passed as NULL", G_VALUE_TYPE_NAME (value));
#line 389 "filedb.c"
	}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (!value->data[0].v_pointer) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		*object_p = NULL;
#line 395 "filedb.c"
	} else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		*object_p = value->data[0].v_pointer;
#line 399 "filedb.c"
	} else {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		*object_p = lair_file_db_ref (value->data[0].v_pointer);
#line 403 "filedb.c"
	}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return NULL;
#line 407 "filedb.c"
}


GParamSpec* lair_param_spec_file_db (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags) {
	LAIRParamSpecFileDB* spec;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (g_type_is_a (object_type, LAIR_TYPE_FILE_DB), NULL);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	spec = g_param_spec_internal (G_TYPE_PARAM_OBJECT, name, nick, blurb, flags);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	G_PARAM_SPEC (spec)->value_type = object_type;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return G_PARAM_SPEC (spec);
#line 421 "filedb.c"
}


gpointer lair_value_get_file_db (const GValue* value) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_val_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LAIR_TYPE_FILE_DB), NULL);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return value->data[0].v_pointer;
#line 430 "filedb.c"
}


void lair_value_set_file_db (GValue* value, gpointer v_object) {
	LAIRFileDB* old;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LAIR_TYPE_FILE_DB));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	old = value->data[0].v_pointer;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (v_object) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LAIR_TYPE_FILE_DB));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = v_object;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		lair_file_db_ref (value->data[0].v_pointer);
#line 450 "filedb.c"
	} else {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = NULL;
#line 454 "filedb.c"
	}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (old) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		lair_file_db_unref (old);
#line 460 "filedb.c"
	}
}


void lair_value_take_file_db (GValue* value, gpointer v_object) {
	LAIRFileDB* old;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LAIR_TYPE_FILE_DB));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	old = value->data[0].v_pointer;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (v_object) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LAIR_TYPE_FILE_DB));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = v_object;
#line 479 "filedb.c"
	} else {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		value->data[0].v_pointer = NULL;
#line 483 "filedb.c"
	}
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (old) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		lair_file_db_unref (old);
#line 489 "filedb.c"
	}
}


static void lair_file_db_class_init (LAIRFileDBClass * klass) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	lair_file_db_parent_class = g_type_class_peek_parent (klass);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	((LAIRFileDBClass *) klass)->finalize = lair_file_db_finalize;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_type_class_add_private (klass, sizeof (LAIRFileDBPrivate));
#line 501 "filedb.c"
}


static void lair_file_db_instance_init (LAIRFileDB * self) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->priv = LAIR_FILE_DB_GET_PRIVATE (self);
#line 3 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->priv->imgRes = NULL;
#line 4 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->priv->imgListPath = NULL;
#line 5 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->priv->sndListPath = NULL;
#line 6 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->priv->ttfListPath = NULL;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self->ref_count = 1;
#line 518 "filedb.c"
}


static void lair_file_db_finalize (LAIRFileDB* obj) {
	LAIRFileDB * self;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, LAIR_TYPE_FILE_DB, LAIRFileDB);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_signal_handlers_destroy (self);
#line 3 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	__g_list_free__g_object_unref0_0 (self->priv->imgRes);
#line 4 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (self->priv->imgListPath);
#line 5 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (self->priv->sndListPath);
#line 6 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	_g_object_unref0 (self->priv->ttfListPath);
#line 536 "filedb.c"
}


GType lair_file_db_get_type (void) {
	static volatile gsize lair_file_db_type_id__volatile = 0;
	if (g_once_init_enter (&lair_file_db_type_id__volatile)) {
		static const GTypeValueTable g_define_type_value_table = { lair_value_file_db_init, lair_value_file_db_free_value, lair_value_file_db_copy_value, lair_value_file_db_peek_pointer, "p", lair_value_file_db_collect_value, "p", lair_value_file_db_lcopy_value };
		static const GTypeInfo g_define_type_info = { sizeof (LAIRFileDBClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) lair_file_db_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (LAIRFileDB), 0, (GInstanceInitFunc) lair_file_db_instance_init, &g_define_type_value_table };
		static const GTypeFundamentalInfo g_define_type_fundamental_info = { (G_TYPE_FLAG_CLASSED | G_TYPE_FLAG_INSTANTIATABLE | G_TYPE_FLAG_DERIVABLE | G_TYPE_FLAG_DEEP_DERIVABLE) };
		GType lair_file_db_type_id;
		lair_file_db_type_id = g_type_register_fundamental (g_type_fundamental_next (), "LAIRFileDB", &g_define_type_info, &g_define_type_fundamental_info, 0);
		g_once_init_leave (&lair_file_db_type_id__volatile, lair_file_db_type_id);
	}
	return lair_file_db_type_id__volatile;
}


gpointer lair_file_db_ref (gpointer instance) {
	LAIRFileDB* self;
	self = instance;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	g_atomic_int_inc (&self->ref_count);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	return instance;
#line 561 "filedb.c"
}


void lair_file_db_unref (gpointer instance) {
	LAIRFileDB* self;
	self = instance;
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
	if (g_atomic_int_dec_and_test (&self->ref_count)) {
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		LAIR_FILE_DB_GET_CLASS (self)->finalize (self);
#line 2 "/home/idk/Projects/valair/src/resmanage/filedb.vala"
		g_type_free_instance ((GTypeInstance *) self);
#line 574 "filedb.c"
	}
}



