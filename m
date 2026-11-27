Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645FB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOePcFQm;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XxrpZZdD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3JVbttkhm6I5++gPzvnPr0hFtWh8Q67J/hB5mpA0iPY=; b=lOePcFQmSkT9Wl
	Kjgio3lTePG6lk2JbRF3/7MBtSA/XDp5Szy4cleukJla2qQt1OH7rX09VcBcUhIMsqWo1g9YPBJnh
	Hu3Jw6S1yU9FD/DbfqcSFedfH/rnrPuY9TgdVdxucRT8lSq3ChptiMpDS38SmV56xNUS4JV/R2Jdt
	wnMUtPFzjU3yQjFo7oFvHEOMAlUQx+SnBy5OHvSY197zmraZojDynrmpiyjuxYH+S3DmPFJKpyiQg
	3ejP67aX3lZQ+yQ5iabDPazqTyA/xQZ2GH4IGivAx/0stm/hnmMiHzMTCdxYaqRu5m1P2r6St9yMA
	+WreZIlmfwZhtI4nnUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxtz-0000000Gnla-0hSy;
	Fri, 27 Nov 2026 15:30:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsZ-0000000GmkP-3X71
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 870211DB5;
	Fri, 27 Nov 2026 07:28:48 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7856F3F632;
	Fri, 27 Nov 2026 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793331; bh=gqIRchJ0lpHwYVrv0REskzYp112rmgejFgpxWvSU8hE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XxrpZZdDW3rgvcDPRPN0O3EtGAVfrFInNcuifUpq8njX9a69bXLgSLvnlpjUFFZqP
	 0vRu7XDAV2wCJfxozsBzflM0XoESEvgOqpfWvYFBgHfhhOKL7i5MWbde2gFE+CyK4r
	 qEayM/hPttaC2yom1m57yxDyNSMpzPg+7dH3JOxE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:34 +0000
Subject: [PATCH RFC v2 4/6] ctlv: add auto-generated files for
 ctlv-attestation-firme
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-4-ab88b2d0b4e0@arm.com>
References: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
In-Reply-To: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=56525; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=gqIRchJ0lpHwYVrv0REskzYp112rmgejFgpxWvSU8hE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGok/KMB0+93Hlwo9NH0QrG5qMKvqRNkrP88
 chLHMCAOjqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhqAAKCRBt1cPRWsUx
 M4XjC/4jzL9CD+j7VCgh1kd/YttZJCHvyMZwRkw8aXxq7NH+IceMzpv+cukFF8MU8/DwVjeBmBt
 e3u4nIsd4+CaDP3uUwY6ND7utFFf+rx8cnTycJG7gXdi3YJdSOnGhxliVyULkL6XSajbdbg4g8h
 EVO+T5iQFpq+U+VD6TzboLC4GOmK4DAT9ck+uenf9i5aufcrBvib4EW6kSUyvK/+YFN+JwhYnDp
 3yofLD3I0VXrrKYZm0bPMKwvkhCUNyILACP4reMLqsTA+WcLKFI9srHgFmeqANJaSEnYDN6hrL4
 0B9EA9GLTVIjYTog21fqIJ4Fm0fuAJ+GNrESla9hAYIV4u9n93hSD5qvq4Y/oTV8PXMtyqkU9j0
 UgGrk55O58ClJWXOYJa8oYZ0XVdG0uk7sBVk1dTpPd4qhlZFTwmzBaceM1bDslMMFf7dMGXlDZ0
 aejRYTfzxLaQ4kw9WyGDYiJzFhBXqlJ6/QJHaAmRVCRRpklk8swp35rc1plTEmPUgC2Zo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072852_120113_5E142B99 
X-CRM114-Status: GOOD (  14.47  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add auto-generated files for ctlv-attestation-firme via
tools/ctlv/ctlv-regen.sh.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../generated/ctlv_attestation_firme_gen.c         |   64 +
 .../generated/ctlv_attestation_firme_gen.h         |   40 +
 include/uapi/ctlv/ctlv_attestation_firme_gen.h     |   34 +
 .../attestation/ctlv_attestation_firme_user_gen.c  | 1547 ++++++++++++++++++++
 .../attestation/ctlv_attestation_firme_user_gen.h  |   47 +
 5 files changed, 1732 insertions(+)

diff --git a/drivers/attestation/generated/ctlv_attestation_firme_gen.c b/drivers/attestation/generated/ctlv_attestation_firme_gen.c
new file mode 100644
index 0000000000000..9d3d7fc34f113
--- /dev/null
+++ b/drivers/attestation/generated/ctlv_attestation_firme_gen.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+/*
+ * Generated from Documentation/ctlv/specs/ctlv-attestation-firme.yaml by
+ * tools/ctlv/ctlv-regen.sh. Do not edit.
+ */
+/* CTLV-GEN kernel source */
+
+#define _CTLV_GENERATED_METADATA_ONLY
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/ctlv_family.h>
+#include <linux/export.h>
+#include <linux/limits.h>
+
+#include <uapi/ctlv/ctlv_gen.h>
+#include <uapi/ctlv/ctlv_attestation_firme_gen.h>
+
+#include "ctlv_attestation_firme_gen.h"
+
+static const struct ctlv_node_schema device_info_fill_node_schemas[] = {
+	CTLV_NODE_SCHEMA_ROOT(1, 1, 1),
+	CTLV_NODE_SCHEMA_UINT(CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION, 1, 0, S32_MAX),
+};
+
+/* The extension points this family fills. */
+static const struct ctlv_ext_fill_schema ctlv_attestation_firme_ext_fill_schemas[] = {
+	CTLV_EXT_FILL_SCHEMA(CTLV_FAMILY_ATTESTATION, CTLV_ATTESTATION_EXT_DEVICE_INFO,
+			     device_info),
+};
+
+/* The enum extension points this family fills. */
+static const struct ctlv_enum_fill_schema ctlv_attestation_firme_enum_fill_schemas[] = {
+	CTLV_ENUM_FILL_SCHEMA(CTLV_FAMILY_ATTESTATION,
+			      CTLV_ATTESTATION_ENUM_EXT_EVIDENCE_VENDOR_FORMAT, 1),
+};
+
+/* The family ID is its position in the central registry. */
+const struct ctlv_family_schema ctlv_attestation_firme_schema = {
+	.name = "ctlv-attestation-firme",
+	.family_id = 6,
+	.ext_fill_schemas = ctlv_attestation_firme_ext_fill_schemas,
+	.ext_fill_schemas_count = ARRAY_SIZE(ctlv_attestation_firme_ext_fill_schemas),
+	.enum_fill_schemas = ctlv_attestation_firme_enum_fill_schemas,
+	.enum_fill_schemas_count = ARRAY_SIZE(ctlv_attestation_firme_enum_fill_schemas),
+};
+
+/* Maximum uevent cost for this family chain. */
+static_assert(154 <= CTLV_UEVENT_MAX_LEN);
+static_assert(5 <= CTLV_UEVENT_MAX_VARS);
+
+/* Extension-point callbacks. */
+static const struct ctlv_ext_ops ctlv_attestation_firme_ext_ops[] = {
+	CTLV_EXT_OPS(CTLV_FAMILY_ATTESTATION, CTLV_ATTESTATION_EXT_DEVICE_INFO,
+		     ctlv_attestation_firme_device_info),
+};
+
+/* Family descriptor used by ctlv_init(). */
+const struct ctlv_family ctlv_attestation_firme_family = {
+	.schema = &ctlv_attestation_firme_schema,
+	.parent = &ctlv_attestation_family,
+	.ext_ops = ctlv_attestation_firme_ext_ops,
+	.ext_ops_count = ARRAY_SIZE(ctlv_attestation_firme_ext_ops),
+};
+EXPORT_SYMBOL_NS_GPL(ctlv_attestation_firme_family, "CTLV");
diff --git a/drivers/attestation/generated/ctlv_attestation_firme_gen.h b/drivers/attestation/generated/ctlv_attestation_firme_gen.h
new file mode 100644
index 0000000000000..fc2f57cae368e
--- /dev/null
+++ b/drivers/attestation/generated/ctlv_attestation_firme_gen.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * Generated from Documentation/ctlv/specs/ctlv-attestation-firme.yaml by
+ * tools/ctlv/ctlv-regen.sh. Do not edit.
+ */
+/* CTLV-GEN kernel header */
+
+/* Kernel metadata and family API of the ctlv-attestation-firme CTLV family. */
+
+#ifndef _LINUX_CTLV_ATTESTATION_FIRME_GEN_H
+#define _LINUX_CTLV_ATTESTATION_FIRME_GEN_H
+
+#include <linux/ctlv_family.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+
+#include <uapi/ctlv/ctlv_attestation_firme_gen.h>
+
+#include "ctlv_attestation_gen.h"
+
+extern const struct ctlv_family_schema ctlv_attestation_firme_schema;
+
+/* device-info of ctlv-attestation: fill and read callbacks. */
+int ctlv_attestation_firme_device_info_fill(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+					    const struct ctlv_cursor *request,
+					    struct ctlv_cursor *record);
+void ctlv_attestation_firme_device_info_read(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+					     const struct ctlv_cursor *record);
+
+extern const struct ctlv_family ctlv_attestation_firme_family;
+
+#ifndef _CTLV_GENERATED_METADATA_ONLY
+
+/* Writing a reply. An append is atomic; a record ends with ctlv_record_end(). */
+/* FIRME attestation service version. */
+CTLV_PUT_U64(ctlv_attestation_firme_device_info_version,
+	     CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION, CTLV_SCHEMA_UINT)
+#endif /* _CTLV_GENERATED_METADATA_ONLY */
+
+#endif /* _LINUX_CTLV_ATTESTATION_FIRME_GEN_H */
diff --git a/include/uapi/ctlv/ctlv_attestation_firme_gen.h b/include/uapi/ctlv/ctlv_attestation_firme_gen.h
new file mode 100644
index 0000000000000..d030733e0c5e6
--- /dev/null
+++ b/include/uapi/ctlv/ctlv_attestation_firme_gen.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * Generated from Documentation/ctlv/specs/ctlv-attestation-firme.yaml by
+ * tools/ctlv/ctlv-regen.sh. Do not edit.
+ */
+/* CTLV-GEN uapi header */
+
+/*
+ * Constants of the ctlv-attestation-firme CTLV family. Types and op IDs are complete; the message
+ * format carrying them is in <ctlv/ctlv.h>.
+ *
+ * The inherited ctlv-attestation header is included here, so one include covers the whole effective
+ * schema.
+ */
+
+#ifndef _UAPI_CTLV_CTLV_ATTESTATION_FIRME_GEN_H
+#define _UAPI_CTLV_CTLV_ATTESTATION_FIRME_GEN_H
+
+#include <ctlv/ctlv.h>
+#include <ctlv/ctlv_attestation_gen.h>
+#include <ctlv/ctlv_families_gen.h>
+
+/* enum evidence-vendor-format, an extension point of ctlv-attestation */
+enum _ctlv_attestation_firme_evidence_vendor_format {
+	/* platform attestation token. */
+	CTLV_ATTESTATION_FIRME_EVIDENCE_VENDOR_FORMAT_PLATFORM_ATTESTATION_TOKEN = 1,
+};
+
+/* device-info */
+/* FIRME attestation service version. */
+#define CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION \
+	CTLV_TYPE(CTLV_FAMILY_ATTESTATION_FIRME, 0x00010000, 1)
+
+#endif /* _UAPI_CTLV_CTLV_ATTESTATION_FIRME_GEN_H */
diff --git a/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.c b/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.c
new file mode 100644
index 0000000000000..5cf536ee5be51
--- /dev/null
+++ b/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.c
@@ -0,0 +1,1547 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+/*
+ * Generated from Documentation/ctlv/specs/ctlv-attestation-firme.yaml by
+ * tools/ctlv/ctlv-regen.sh. Do not edit.
+ */
+/* CTLV-GEN user source */
+
+#include <stdint.h>
+
+#include <ctlv.h>
+
+#include "ctlv_attestation_firme_user_gen.h"
+
+/* Effective request and reply schemas. */
+
+static const struct ctlv_node_schema device_get_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+};
+
+/* device-get caps.evidence.objects.challenge-lengths, optional fields */
+static const struct ctlv_node_schema
+	device_get_reply_caps_evidence_objects_challenge_lengths_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CHALLENGE_LENGTHS_LENGTH,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX |
+			   CTLV_NODE_SCHEMA_HAS_UNIT | CTLV_NODE_SCHEMA_HAS_SCALE,
+		.min = 1,
+		.max = 4096,
+		.unit = CTLV_UNIT_BYTES,
+		.scale = 0,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CHALLENGE_LENGTHS_MIN_LENGTH,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX |
+			   CTLV_NODE_SCHEMA_HAS_UNIT | CTLV_NODE_SCHEMA_HAS_SCALE,
+		.min = 1,
+		.max = 4096,
+		.unit = CTLV_UNIT_BYTES,
+		.scale = 0,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CHALLENGE_LENGTHS_MAX_LENGTH,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX |
+			   CTLV_NODE_SCHEMA_HAS_UNIT | CTLV_NODE_SCHEMA_HAS_SCALE,
+		.min = 1,
+		.max = 4096,
+		.unit = CTLV_UNIT_BYTES,
+		.scale = 0,
+	},
+};
+
+/* device-get caps.evidence.objects, fields */
+static const struct ctlv_node_schema device_get_reply_caps_evidence_objects_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 15,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_CLASS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 4,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_MAX_LENGTH,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = UINT64_MAX,
+	},
+};
+
+/* device-get caps.evidence.objects, optional fields */
+static const struct ctlv_node_schema
+	device_get_reply_caps_evidence_objects_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_FORMATS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 4,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 8,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_VENDOR_FORMATS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 4,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_CHALLENGE_LENGTHS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 8,
+		.optional_fields =
+	device_get_reply_caps_evidence_objects_challenge_lengths_optional_field_node_schemas,
+		.optional_fields_count = 3,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_INSTANCE,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_TCB_DIGEST_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+};
+
+/* device-get caps.evidence, fields */
+static const struct ctlv_node_schema device_get_reply_caps_evidence_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_EVIDENCE_OBJECTS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 16,
+		.fields = device_get_reply_caps_evidence_objects_field_node_schemas,
+		.fields_count = 3,
+		.optional_fields =
+			device_get_reply_caps_evidence_objects_optional_field_node_schemas,
+		.optional_fields_count = 5,
+	},
+};
+
+/* device-get caps.evidence, optional fields */
+static const struct ctlv_node_schema
+	device_get_reply_caps_evidence_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_EVIDENCE_FLAGS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 15,
+	},
+};
+
+/* device-get caps.mr, fields */
+static const struct ctlv_node_schema device_get_reply_caps_mr_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_MR_FLAGS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 3,
+	},
+};
+
+/* device-get caps, optional fields */
+static const struct ctlv_node_schema device_get_reply_caps_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CAPS_EVIDENCE,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = device_get_reply_caps_evidence_field_node_schemas,
+		.fields_count = 1,
+		.optional_fields = device_get_reply_caps_evidence_optional_field_node_schemas,
+		.optional_fields_count = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CAPS_MR,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = device_get_reply_caps_mr_field_node_schemas,
+		.fields_count = 1,
+	},
+};
+
+/* device-get info, fields */
+static const struct ctlv_node_schema device_get_reply_info_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0x7fffffffULL,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema device_get_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_CAPS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.optional_fields = device_get_reply_caps_optional_field_node_schemas,
+		.optional_fields_count = 2,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GET_INFO,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = device_get_reply_info_field_node_schemas,
+		.fields_count = 1,
+	},
+};
+
+static const struct ctlv_node_schema device_get_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = device_get_reply_field_node_schemas,
+	.fields_count = 3,
+};
+
+/* evidence-get objects, fields */
+static const struct ctlv_node_schema evidence_get_request_objects_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_OBJECTS_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 15,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_OBJECTS_DATA,
+		.kind = CTLV_SCHEMA_BLOB,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_BLOB,
+		.blob_direction = CTLV_BLOB_DIRECTION_OUTPUT,
+		.blob_backings = 14,
+		.blob_max_length = 0xffffffffULL,
+		.blob_alignment = 1,
+	},
+};
+
+/* evidence-get selection, fields */
+static const struct ctlv_node_schema evidence_get_request_selection_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SELECTION_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SELECTION_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema evidence_get_request_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_OBJECTS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 16,
+		.fields = evidence_get_request_objects_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema evidence_get_request_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_CHALLENGE,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 4096,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SELECTION,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 256,
+		.fields = evidence_get_request_selection_field_node_schemas,
+		.fields_count = 2,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_PRIVLEVEL,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SERVICE_PROVIDER,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SERVICE_GUID,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 16,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_SERVICE_MANIFEST_VERSION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_OPTIONS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+	},
+};
+
+static const struct ctlv_node_schema evidence_get_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = evidence_get_request_field_node_schemas,
+	.fields_count = 1,
+	.optional_fields = evidence_get_request_optional_field_node_schemas,
+	.optional_fields_count = 8,
+};
+
+/* evidence-get results.tcb-digest, fields */
+static const struct ctlv_node_schema evidence_get_reply_results_tcb_digest_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_TCB_DIGEST_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_TCB_DIGEST_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* evidence-get results, fields */
+static const struct ctlv_node_schema evidence_get_reply_results_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS_LENGTH,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = UINT64_MAX,
+	},
+};
+
+/* evidence-get results, optional fields */
+static const struct ctlv_node_schema evidence_get_reply_results_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS_FORMAT,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 8,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS_VENDOR_FORMAT,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS_TCB_DIGEST,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = evidence_get_reply_results_tcb_digest_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema evidence_get_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 16,
+		.fields = evidence_get_reply_results_field_node_schemas,
+		.fields_count = 1,
+		.optional_fields = evidence_get_reply_results_optional_field_node_schemas,
+		.optional_fields_count = 3,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema evidence_get_reply_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_GET_EVIDENCE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema evidence_get_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = evidence_get_reply_field_node_schemas,
+	.fields_count = 2,
+	.optional_fields = evidence_get_reply_optional_field_node_schemas,
+	.optional_fields_count = 2,
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema mr_get_request_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GET_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema mr_get_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.optional_fields = mr_get_request_optional_field_node_schemas,
+	.optional_fields_count = 1,
+};
+
+/* mr-get items, fields */
+static const struct ctlv_node_schema mr_get_reply_items_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GET_ITEMS_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_DESC_NAME,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_DESC_SUPPORTED_HASH_ALGORITHMS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 23,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_DESC_CAPS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 3,
+	},
+};
+
+/* mr-get items, optional fields */
+static const struct ctlv_node_schema mr_get_reply_items_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_DESC_REGISTER_INDEX,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_DESC_STATE_FLAGS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 1,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_get_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GET_ITEMS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 0, /* unlimited */
+		.fields = mr_get_reply_items_field_node_schemas,
+		.fields_count = 4,
+		.optional_fields = mr_get_reply_items_optional_field_node_schemas,
+		.optional_fields_count = 2,
+	},
+};
+
+static const struct ctlv_node_schema mr_get_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_get_reply_field_node_schemas,
+	.fields_count = 1,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_read_request_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_READ_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema mr_read_request_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_READ_OPTIONS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+	},
+};
+
+static const struct ctlv_node_schema mr_read_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_read_request_field_node_schemas,
+	.fields_count = 1,
+	.optional_fields = mr_read_request_optional_field_node_schemas,
+	.optional_fields_count = 2,
+};
+
+/* mr-values, fields */
+static const struct ctlv_node_schema mr_read_reply_mr_values_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_read_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 23,
+		.fields = mr_read_reply_mr_values_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+static const struct ctlv_node_schema mr_read_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_read_reply_field_node_schemas,
+	.fields_count = 3,
+};
+
+/* mr-values, fields */
+static const struct ctlv_node_schema mr_extend_request_mr_values_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* mr-extend record, fields */
+static const struct ctlv_node_schema mr_extend_request_record_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_RECORD_FORMAT,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_RECORD_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 0,
+		.max_length = 4096,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_extend_request_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema mr_extend_request_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 23,
+		.fields = mr_extend_request_mr_values_field_node_schemas,
+		.fields_count = 2,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_RAW_DATA,
+		.kind = CTLV_SCHEMA_BLOB,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_BLOB,
+		.blob_direction = CTLV_BLOB_DIRECTION_INPUT,
+		.blob_backings = 14,
+		.blob_max_length = 0xffffffffULL,
+		.blob_alignment = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_OPTIONS,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_EXTEND_RECORD,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_extend_request_record_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+static const struct ctlv_node_schema mr_extend_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_extend_request_field_node_schemas,
+	.fields_count = 1,
+	.optional_fields = mr_extend_request_optional_field_node_schemas,
+	.optional_fields_count = 5,
+};
+
+/* mr-values, fields */
+static const struct ctlv_node_schema mr_extend_reply_mr_values_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_extend_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 23,
+		.fields = mr_extend_reply_mr_values_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+static const struct ctlv_node_schema mr_extend_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_extend_reply_field_node_schemas,
+	.fields_count = 3,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema device_state_changed_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema device_state_changed_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = device_state_changed_reply_field_node_schemas,
+	.fields_count = 1,
+};
+
+/* mr-values, fields */
+static const struct ctlv_node_schema
+	mr_log_entry_appended_reply_entry_mr_values_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* mr-log-entry.mr, fields */
+static const struct ctlv_node_schema mr_log_entry_appended_reply_entry_mr_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_NAME,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_SUPPORTED_HASH_ALGORITHMS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 23,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_CAPS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 3,
+	},
+};
+
+/* mr-log-entry.mr, optional fields */
+static const struct ctlv_node_schema
+	mr_log_entry_appended_reply_entry_mr_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_REGISTER_INDEX,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* mr-log-entry.ima, fields */
+static const struct ctlv_node_schema mr_log_entry_appended_reply_entry_ima_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_TEMPLATE_NAME,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_TEMPLATE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 0,
+		.max_length = 0x10000ULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_VIOLATION,
+		.kind = CTLV_SCHEMA_BOOL,
+		.max_occurrences = 1,
+	},
+};
+
+/* mr-log-entry.record, fields */
+static const struct ctlv_node_schema
+	mr_log_entry_appended_reply_entry_record_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD_FORMAT,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 0,
+		.max_length = 4096,
+	},
+};
+
+/* mr-log-entry-appended entry, fields */
+static const struct ctlv_node_schema mr_log_entry_appended_reply_entry_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_EVENT,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 2,
+	},
+};
+
+/* mr-log-entry-appended entry, optional fields */
+static const struct ctlv_node_schema
+	mr_log_entry_appended_reply_entry_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 23,
+		.fields = mr_log_entry_appended_reply_entry_mr_values_field_node_schemas,
+		.fields_count = 2,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_entry_appended_reply_entry_mr_field_node_schemas,
+		.fields_count = 3,
+		.optional_fields = mr_log_entry_appended_reply_entry_mr_optional_field_node_schemas,
+		.optional_fields_count = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_entry_appended_reply_entry_ima_field_node_schemas,
+		.fields_count = 3,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_entry_appended_reply_entry_record_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+/* root, fields */
+static const struct ctlv_node_schema mr_log_entry_appended_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_APPENDED_ENTRY,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_entry_appended_reply_entry_field_node_schemas,
+		.fields_count = 4,
+		.optional_fields = mr_log_entry_appended_reply_entry_optional_field_node_schemas,
+		.optional_fields_count = 4,
+	},
+};
+
+static const struct ctlv_node_schema mr_log_entry_appended_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = mr_log_entry_appended_reply_field_node_schemas,
+	.fields_count = 1,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema evidence_accept_request_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_ACCEPT_EVIDENCE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema evidence_accept_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = evidence_accept_request_field_node_schemas,
+	.fields_count = 2,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema evidence_accept_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema evidence_accept_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = evidence_accept_reply_field_node_schemas,
+	.fields_count = 1,
+};
+
+static const struct ctlv_node_schema devsec_state_get_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema devsec_state_get_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema devsec_state_get_reply_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVSEC_STATE_GET_TDISP_STATE,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 4,
+	},
+};
+
+static const struct ctlv_node_schema devsec_state_get_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = devsec_state_get_reply_field_node_schemas,
+	.fields_count = 1,
+	.optional_fields = devsec_state_get_reply_optional_field_node_schemas,
+	.optional_fields_count = 1,
+};
+
+/* root, fields */
+static const struct ctlv_node_schema evidence_state_changed_reply_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema evidence_state_changed_reply_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_EVIDENCE_STATE_CHANGED_EVIDENCE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema evidence_state_changed_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.fields = evidence_state_changed_reply_field_node_schemas,
+	.fields_count = 1,
+	.optional_fields = evidence_state_changed_reply_optional_field_node_schemas,
+	.optional_fields_count = 1,
+};
+
+/* mr-log-get selection, fields */
+static const struct ctlv_node_schema mr_log_get_request_selection_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_GET_SELECTION_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema mr_log_get_request_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_GET_SELECTION,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 256,
+		.fields = mr_log_get_request_selection_field_node_schemas,
+		.fields_count = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_START_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_END_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+static const struct ctlv_node_schema mr_log_get_request_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.optional_fields = mr_log_get_request_optional_field_node_schemas,
+	.optional_fields_count = 3,
+};
+
+/* mr-values, fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_mr_values_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_HASH_ALGO,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 16,
+		.max_length = 64,
+	},
+};
+
+/* mr-log-entry.mr, fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_mr_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_NAME,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_SUPPORTED_HASH_ALGORITHMS,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 23,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = HASH_ALGO_MD4,
+		.max = HASH_ALGO__LAST - 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_CAPS,
+		.kind = CTLV_SCHEMA_FLAGS,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_FLAGS_MASK,
+		.flags_mask = 3,
+	},
+};
+
+/* mr-log-entry.mr, optional fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_mr_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_REGISTER_INDEX,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+};
+
+/* mr-log-entry.ima, fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_ima_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_TEMPLATE_NAME,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_TEMPLATE_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 0,
+		.max_length = 0x10000ULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA_VIOLATION,
+		.kind = CTLV_SCHEMA_BOOL,
+		.max_occurrences = 1,
+	},
+};
+
+/* mr-log-entry.record, fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_record_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD_FORMAT,
+		.kind = CTLV_SCHEMA_STRING,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 1,
+		.max_length = 128,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD_DATA,
+		.kind = CTLV_SCHEMA_BINARY,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN_LENGTH | CTLV_NODE_SCHEMA_HAS_MAX_LENGTH,
+		.min_length = 0,
+		.max_length = 4096,
+	},
+};
+
+/* mr-log-get entries, fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_DEVICE_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR_ID,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_EVENT,
+		.kind = CTLV_SCHEMA_ENUM,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 1,
+		.max = 2,
+	},
+};
+
+/* mr-log-get entries, optional fields */
+static const struct ctlv_node_schema mr_log_get_reply_entries_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_VALUES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 23,
+		.fields = mr_log_get_reply_entries_mr_values_field_node_schemas,
+		.fields_count = 2,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_MR,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_get_reply_entries_mr_field_node_schemas,
+		.fields_count = 3,
+		.optional_fields = mr_log_get_reply_entries_mr_optional_field_node_schemas,
+		.optional_fields_count = 1,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_IMA,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_get_reply_entries_ima_field_node_schemas,
+		.fields_count = 3,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_ENTRY_RECORD,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 1,
+		.fields = mr_log_get_reply_entries_record_field_node_schemas,
+		.fields_count = 2,
+	},
+};
+
+/* root, optional fields */
+static const struct ctlv_node_schema mr_log_get_reply_optional_field_node_schemas[] = {
+	{
+		.type = CTLV_ATTESTATION_T_MR_START_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_END_GENERATION,
+		.kind = CTLV_SCHEMA_UINT,
+		.max_occurrences = 1,
+		.present = CTLV_NODE_SCHEMA_HAS_MIN | CTLV_NODE_SCHEMA_HAS_MAX,
+		.min = 0,
+		.max = 0xffffffffULL,
+	},
+	{
+		.type = CTLV_ATTESTATION_T_MR_LOG_GET_ENTRIES,
+		.kind = CTLV_SCHEMA_RECORD,
+		.max_occurrences = 0, /* unlimited */
+		.fields = mr_log_get_reply_entries_field_node_schemas,
+		.fields_count = 4,
+		.optional_fields = mr_log_get_reply_entries_optional_field_node_schemas,
+		.optional_fields_count = 4,
+	},
+};
+
+static const struct ctlv_node_schema mr_log_get_reply_node_schema = {
+	.type = CTLV_TYPE_ROOT,
+	.kind = CTLV_SCHEMA_RECORD,
+	.max_occurrences = 1,
+	.optional_fields = mr_log_get_reply_optional_field_node_schemas,
+	.optional_fields_count = 3,
+};
+
+/* Effective ops in declaration order. */
+static const struct ctlv_op_spec ctlv_attestation_firme_op_specs[] = {
+	{
+		.op_id = CTLV_ATTESTATION_OP_DEVICE_GET,
+		.type = CTLV_OP_TYPE_ACTION,
+		.fd_access = CTLV_OP_FD_ACCESS_READ,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.request_max_len = 16,
+		.action_reply_max_len = 16688,
+		.error_info_max_len = 456,
+		.request = &device_get_request_node_schema,
+		.reply = &device_get_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_EVIDENCE_GET,
+		.type = CTLV_OP_TYPE_ACTION,
+		.fd_access = CTLV_OP_FD_ACCESS_READ_WRITE,
+		.availability = CTLV_OP_AVAILABILITY_DYNAMIC,
+		.optional = true,
+		.request_max_len = 23216,
+		.action_reply_max_len = 3416,
+		.error_info_max_len = 456,
+		.request = &evidence_get_request_node_schema,
+		.reply = &evidence_get_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_MR_GET,
+		.type = CTLV_OP_TYPE_QUERY,
+		.fd_access = CTLV_OP_FD_ACCESS_READ,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.optional = true,
+		.request_max_len = 40,
+		.query_reply_min_len = 184,
+		.query_reply_suggested_len = 4096,
+		.error_info_max_len = 456,
+		.request = &mr_get_request_node_schema,
+		.reply = &mr_get_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_MR_READ,
+		.type = CTLV_OP_TYPE_QUERY,
+		.fd_access = CTLV_OP_FD_ACCESS_READ,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.optional = true,
+		.request_max_len = 80,
+		.query_reply_min_len = 112,
+		.query_reply_suggested_len = 4096,
+		.error_info_max_len = 456,
+		.request = &mr_read_request_node_schema,
+		.reply = &mr_read_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_MR_EXTEND,
+		.type = CTLV_OP_TYPE_ACTION,
+		.fd_access = CTLV_OP_FD_ACCESS_READ_WRITE,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.optional = true,
+		.request_max_len = 7232,
+		.action_reply_max_len = 2824,
+		.error_info_max_len = 456,
+		.request = &mr_extend_request_node_schema,
+		.reply = &mr_extend_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_DEVICE_STATE_CHANGED,
+		.type = CTLV_OP_TYPE_EVENT,
+		.event_max_len = 64,
+		.reply = &device_state_changed_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_MR_LOG_ENTRY_APPENDED,
+		.type = CTLV_OP_TYPE_EVENT,
+		.event_max_len = 73704,
+		.reply = &mr_log_entry_appended_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_EVIDENCE_ACCEPT,
+		.type = CTLV_OP_TYPE_ACTION,
+		.fd_access = CTLV_OP_FD_ACCESS_READ_WRITE,
+		.availability = CTLV_OP_AVAILABILITY_DYNAMIC,
+		.optional = true,
+		.request_max_len = 64,
+		.action_reply_max_len = 40,
+		.error_info_max_len = 456,
+		.request = &evidence_accept_request_node_schema,
+		.reply = &evidence_accept_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_DEVSEC_STATE_GET,
+		.type = CTLV_OP_TYPE_QUERY,
+		.fd_access = CTLV_OP_FD_ACCESS_READ,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.optional = true,
+		.request_max_len = 16,
+		.query_reply_min_len = 40,
+		.query_reply_suggested_len = 1024,
+		.error_info_max_len = 456,
+		.request = &devsec_state_get_request_node_schema,
+		.reply = &devsec_state_get_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_EVIDENCE_STATE_CHANGED,
+		.type = CTLV_OP_TYPE_EVENT,
+		.event_max_len = 88,
+		.reply = &evidence_state_changed_reply_node_schema,
+	},
+	{
+		.op_id = CTLV_ATTESTATION_OP_MR_LOG_GET,
+		.type = CTLV_OP_TYPE_QUERY,
+		.fd_access = CTLV_OP_FD_ACCESS_READ,
+		.availability = CTLV_OP_AVAILABILITY_FIXED,
+		.optional = true,
+		.request_max_len = 10304,
+		.query_reply_min_len = 65600,
+		.query_reply_suggested_len = 131072,
+		.error_info_max_len = 456,
+		.request = &mr_log_get_request_node_schema,
+		.reply = &mr_log_get_reply_node_schema,
+	},
+};
+
+/* Family specification descriptor. */
+const struct ctlv_family_spec ctlv_attestation_firme_spec = {
+	.name = "ctlv-attestation-firme",
+	.family_id = 6,
+	.parent = &ctlv_attestation_spec,
+	.ops = ctlv_attestation_firme_op_specs,
+	.ops_count = 11,
+};
diff --git a/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.h b/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.h
new file mode 100644
index 0000000000000..c69f364111a62
--- /dev/null
+++ b/tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * Generated from Documentation/ctlv/specs/ctlv-attestation-firme.yaml by
+ * tools/ctlv/ctlv-regen.sh. Do not edit.
+ */
+/* CTLV-GEN user header */
+
+/* Userspace binding of the ctlv-attestation-firme CTLV family. */
+
+#ifndef _CTLV_CTLV_ATTESTATION_FIRME_USER_GEN_H
+#define _CTLV_CTLV_ATTESTATION_FIRME_USER_GEN_H
+
+#include <ctlv.h>
+
+#include <ctlv/ctlv_attestation_firme_gen.h>
+
+#include "ctlv_attestation_user_gen.h"
+
+/* What this family's specification says, for holding a device against it. */
+extern const struct ctlv_family_spec ctlv_attestation_firme_spec;
+
+/* Building a request. ctlv_msg_err() reports the first failure. */
+
+/* FIRME attestation service version. */
+static inline int ctlv_attestation_firme_device_info_version_put(struct ctlv_msg *msg, __u64 value)
+{
+	return ctlv_put_u64(msg, CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION, value);
+}
+
+/* Reading a reply or an event. A getter answers whether it could read. */
+
+/* FIRME attestation service version. */
+static inline bool ctlv_attestation_firme_device_info_version_present(const struct ctlv_hdr *record)
+{
+	return ctlv_hdr_find(record, CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION);
+}
+
+static inline bool ctlv_attestation_firme_device_info_version_get(const struct ctlv_hdr *record,
+								  __u64 *value)
+{
+	const struct ctlv_hdr *hdr;
+
+	hdr = ctlv_hdr_find(record, CTLV_ATTESTATION_FIRME_T_DEVICE_INFO_VERSION);
+	return hdr && !ctlv_get_u64(hdr, value);
+}
+
+#endif /* _CTLV_CTLV_ATTESTATION_FIRME_USER_GEN_H */

-- 
2.43.0


