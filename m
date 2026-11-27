Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B832606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSXzyB6h;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SjjeWAMt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N8r7Otei+XSQJ5qNWiGsPFaP8lhiVxL0XWwhCZpynbE=; b=mSXzyB6hCXtX2H
	eb7aoMobH71Kr7wm2F7Bxx2DQWeLYfjGDaTa/gGR91krUi15yP3d/0ulMiJwdYwbRlc3ID5Kiknjj
	oKRAwZ9tpFvQ8cIoMWP4OnvC0z/jti3GbE+OB/DJkYvIkmB01JKEngx4EsVAumx9S5BIaTu61Lfoe
	rFd8+JSP7rT4IfhaUoQ4Zl7tv1zX9fwiyMNPjvJXvruEiMvp8x7ODRpdlR8hVLLjxbH39PSpGa5Ia
	0ogJ4lrUHQKPCy4/7vzBf111SMBzqXyxByNu9nhcri/7nclT9v4U24y7hLoVH0opFxYW93Bqfzwc8
	X5VDBEWBfJvuuB64titQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxtz-0000000Gnlw-1cSX;
	Fri, 27 Nov 2026 15:30:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsd-0000000GmkP-3qHY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F73C1E8D;
	Fri, 27 Nov 2026 07:28:52 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E50A3F632;
	Fri, 27 Nov 2026 07:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793334; bh=/J/nROVIoZfoB1kVaPX0p0IurFF2MGHYOgFXul0PDkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SjjeWAMtp20zvUXg+ogHMN48NpR5QpTddtKSBt9GdLAe/1Xcizztwq4rWfpfrgpTi
	 IpaxNy8bkLQgh8Z/mx9UEvtvZMye/mij4trOgS4hstyejOwzkdjMnufkl4pS7EZzPt
	 Ij6bYEJSbijZ6/5cT67xT45dYYAxwyj/5iSRbu68=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:36 +0000
Subject: [PATCH RFC v2 6/6] selftest: attestation: add
 firme_attestation_test selftest
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-6-ab88b2d0b4e0@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9210; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=/J/nROVIoZfoB1kVaPX0p0IurFF2MGHYOgFXul0PDkE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGpLeJqr102GJNW8A2fQ89QeQhR9OEC9d1DG
 nmVSNkqCKeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhqQAKCRBt1cPRWsUx
 M0ktDADHeqR92777tLtYurePe/KD3Jsn/dV6dtVAi9x1oX/EHilUgdp83LTDBhaOd9gI9ZlOof8
 sz9wl3Gx3LEGIz3Wu/WCLtC2JxRDuw+0LhMHhTi8QvCGclzoAMurlDcDTgBA2rnpP0cDVYnT4Hi
 lTrMTX3fGgQVy1OvoB4uBiZXjf+idXQ+vKFku1kirgzkzAg+0ora9O/u3c7DmWblwnC00HTBjA+
 sfGRNGx2wNsskCFLLInyQOsKTpOqzpvsHXpNM7Ptj6kbLTwmI63O7sv1itFtM8B97dRcdv3terV
 O+FaVFcAkwu5S5oOGf7PYuVPquPgulPVM/vu0Xmm46T//Acm07HoK8QYVlesUuUVTFj9cYIJnvC
 XiXjUeH/F6kpQ7Yr+hrqKigICkk2sUSvKqBGU6WHIzLYBAyt4eRPW8vZXtbanx1EQmQeq81v3Wl
 aMvVKm/bYUXzQ6hoFIKhg3I6aa1MVa97ymUZU6n2axd0WPB1z/2Mzb3d9MHxkJU0oXH9g=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072856_230613_A2F7A93D 
X-CRM114-Status: GOOD (  17.65  )
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

Add firme attestation selftest to test evidence-get interface
for getting platform attestation token.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/attestation/.gitignore     |   1 +
 tools/testing/selftests/attestation/Makefile       |  10 +-
 .../selftests/attestation/firme_attestation_test.c | 232 +++++++++++++++++++++
 3 files changed, 241 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/attestation/.gitignore b/tools/testing/selftests/attestation/.gitignore
index 8f2cf420b7c19..e10d0c9e4723c 100644
--- a/tools/testing/selftests/attestation/.gitignore
+++ b/tools/testing/selftests/attestation/.gitignore
@@ -2,3 +2,4 @@
 attestation_test
 ima_attestation_test
 tdx_attestation_test
+firme_attestation_test
diff --git a/tools/testing/selftests/attestation/Makefile b/tools/testing/selftests/attestation/Makefile
index eb35544afef6f..d4875652b4a14 100644
--- a/tools/testing/selftests/attestation/Makefile
+++ b/tools/testing/selftests/attestation/Makefile
@@ -3,12 +3,14 @@ CFLAGS += -Wall -O2 $(KHDR_INCLUDES)
 CFLAGS += -I../../../ctlv/libctlv
 LDLIBS += -lpthread
 
-TEST_GEN_PROGS := attestation_test ima_attestation_test tdx_attestation_test
+TEST_GEN_PROGS := attestation_test ima_attestation_test tdx_attestation_test \
+		  firme_attestation_test
 
 LIBCTLV_DIR := ../../../ctlv/libctlv
 BINDINGS := ctlv_attestation_user_gen.c \
 	    ctlv_attestation_sim_user_gen.c \
-	    ctlv_attestation_tdx_user_gen.c
+	    ctlv_attestation_tdx_user_gen.c \
+	    ctlv_attestation_firme_user_gen.c
 
 EXTRA_CLEAN = $(OUTPUT)/libctlv
 
@@ -25,6 +27,9 @@ $(OUTPUT)/ima_attestation_test: ima_attestation_test.c $(BINDINGS) $(LIBCTLV)
 $(OUTPUT)/tdx_attestation_test: tdx_attestation_test.c $(BINDINGS) $(LIBCTLV)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $^ $(LDLIBS) -o $@
 
+$(OUTPUT)/firme_attestation_test: firme_attestation_test.c $(BINDINGS) $(LIBCTLV)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $^ $(LDLIBS) -o $@
+
 $(LIBCTLV): FORCE
 	$(Q)mkdir -p $(OUTPUT)/libctlv
 	$(Q)$(MAKE) -C $(LIBCTLV_DIR) CC="$(CC)" OUTPUT=$(OUTPUT)/libctlv/ \
@@ -33,3 +38,4 @@ $(LIBCTLV): FORCE
 FORCE:
 
 .PHONY: FORCE
+
diff --git a/tools/testing/selftests/attestation/firme_attestation_test.c b/tools/testing/selftests/attestation/firme_attestation_test.c
new file mode 100644
index 0000000000000..3a893466dbe56
--- /dev/null
+++ b/tools/testing/selftests/attestation/firme_attestation_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <linux/bits.h>
+#include <linux/hash_info.h>
+
+#include "../kselftest_harness.h"
+#include "ctlv_attestation_firme_user_gen.h"
+
+static const char *error_text(const struct ctlv_error *error)
+{
+	static char text[512];
+
+	return ctlv_error_str(error, text, sizeof(text));
+}
+
+static void dump_pat(const void *pat, __u64 pat_size)
+{
+	__u64 i;
+
+	if (!TH_LOG_ENABLED)
+		return;
+
+	fprintf(TH_LOG_STREAM, "FIRME PAT:\n");
+	for (i = 0; i < pat_size; i++) {
+		if (!(i % 16)) {
+			if (i)
+				fprintf(TH_LOG_STREAM, "\n");
+			fprintf(TH_LOG_STREAM, "\t");
+		}
+		fprintf(TH_LOG_STREAM, "%02x ", ((uint8_t *)(pat))[i]);
+	}
+	fprintf(TH_LOG_STREAM, "\n");
+}
+
+static int firme_evidence_get(struct ctlv_dev *dev, __u64 id,
+			    const unsigned char *challenge, size_t challenge_length,
+			    void *output, size_t output_length,
+			    struct ctlv_reply **reply, struct ctlv_error *error)
+{
+	struct ctlv_msg *request;
+	int ret;
+
+	ret = ctlv_attestation_evidence_get_request_new(&request);
+	if (ret)
+		return ret;
+	ctlv_attestation_evidence_get_challenge_put(request, challenge,
+						    challenge_length);
+
+	ctlv_attestation_evidence_get_objects_start(request);
+	ctlv_attestation_evidence_get_objects_id_put(request, id);
+	ctlv_attestation_evidence_get_objects_data_put_va(request, output, output_length);
+	ctlv_record_end(request);
+
+	ret = ctlv_msg_err(request);
+	if (!ret)
+		ret = ctlv_attestation_evidence_get(dev, request, reply, error);
+	ctlv_msg_free(request);
+	return ret;
+}
+
+FIXTURE(firme_attestation)
+{
+	struct ctlv_dev *dev;
+	struct ctlv_error error;
+	__u64 pat_id;
+	__u64 max_challenge_size;
+	__u64 max_token_size;
+};
+
+FIXTURE_SETUP(firme_attestation)
+{
+	const struct ctlv_hdr *caps, *evidence, *obj, *format, *challenge;
+	struct ctlv_reply *reply;
+	__u64 value, class;
+	__u32 obj_count = 0;
+	int ret;
+	bool got, known;
+
+	ret = ctlv_open("ctlv-attestation-firme", 0, O_RDWR, &self->dev);
+	if (ret)
+		SKIP(return, "no FIRME attestation device: %s", strerror(-ret));
+
+	ASSERT_EQ(0, ctlv_attestation_device_get(self->dev, NULL, &reply,
+						 &self->error))
+	{
+		TH_LOG("%s", error_text(&self->error));
+	}
+
+	caps = ctlv_attestation_device_get_caps_get(ctlv_reply_root(reply));
+	ASSERT_NE(NULL, caps);
+
+	evidence = ctlv_attestation_device_get_caps_evidence_get(caps);
+	ASSERT_NE(NULL, evidence);
+
+	ctlv_attestation_device_get_evidence_objects_for_each(obj, evidence) {
+		obj_count++;
+	}
+	EXPECT_EQ(1, obj_count);
+
+	obj = ctlv_hdr_find(evidence, CTLV_ATTESTATION_T_DEVICE_GET_EVIDENCE_OBJECTS);
+	ASSERT_NE(NULL, obj);
+
+	got = ctlv_attestation_device_get_objects_class_get(obj, &class, &known);
+	ASSERT_TRUE(got);
+	ASSERT_EQ(class, CTLV_ATTESTATION_EVIDENCE_CLASS_SIGNED);
+
+	got = ctlv_attestation_device_get_objects_id_get(obj, &value);
+	ASSERT_TRUE(got);
+	self->pat_id = value;
+
+	got = ctlv_attestation_device_get_objects_max_length_get(obj, &value);
+	ASSERT_TRUE(got);
+	self->max_token_size = value;
+	ASSERT_NE(0, self->max_token_size);
+
+	format = ctlv_hdr_find(obj, CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_VENDOR_FORMATS);
+	ASSERT_NE(NULL, format);
+
+	got = ctlv_attestation_device_get_objects_vendor_formats_get(format, &value);
+	ASSERT_TRUE(got);
+	EXPECT_EQ(value, CTLV_ATTESTATION_FIRME_EVIDENCE_VENDOR_FORMAT_PLATFORM_ATTESTATION_TOKEN);
+
+	challenge = ctlv_hdr_find(obj, CTLV_ATTESTATION_T_DEVICE_GET_OBJECTS_CHALLENGE_LENGTHS);
+	ASSERT_NE(NULL, challenge);
+
+	got = ctlv_attestation_device_get_challenge_lengths_max_length_get(challenge, &value);
+	ASSERT_TRUE(got);
+	self->max_challenge_size = value;
+	ASSERT_NE(0, self->max_challenge_size);
+
+	ctlv_reply_free(reply);
+}
+
+FIXTURE_TEARDOWN(firme_attestation)
+{
+	if (self->dev)
+		ctlv_close(self->dev);
+}
+
+TEST_F(firme_attestation, discovery_and_construction_fields)
+{
+	const struct ctlv_hdr *caps, *evidence;
+	const struct ctlv_hdr *info;
+	struct ctlv_reply *reply;
+	__u64 flags, unknown, value;
+	bool got;
+
+	EXPECT_TRUE(ctlv_dev_inherits(self->dev, "ctlv-attestation"));
+	ASSERT_EQ(0, ctlv_attestation_device_get(self->dev, NULL, &reply,
+						 &self->error))
+	{
+		TH_LOG("%s", error_text(&self->error));
+	}
+	caps = ctlv_attestation_device_get_caps_get(ctlv_reply_root(reply));
+	ASSERT_NE(NULL, caps);
+	evidence = ctlv_attestation_device_get_caps_evidence_get(caps);
+	ASSERT_NE(NULL, evidence);
+	got = ctlv_attestation_device_get_evidence_flags_get(evidence, &flags,
+							     &unknown);
+	ASSERT_TRUE(got);
+	EXPECT_EQ(0, flags);
+	EXPECT_EQ(0, unknown);
+
+	info = ctlv_attestation_device_get_info_get(ctlv_reply_root(reply));
+	ASSERT_NE(NULL, info);
+
+	got = ctlv_attestation_firme_device_info_version_get(info, &value);
+	ASSERT_TRUE(got);
+	TH_LOG("FIRME attestation version: %lld.%lld\n",
+		(value & __GENMASK_ULL(31, 16)) >> 16,
+		value & __GENMASK_ULL(15, 0));
+
+	ctlv_reply_free(reply);
+}
+
+TEST_F(firme_attestation, firme_pat_get)
+{
+	void *challenge, *pat;
+	struct ctlv_reply *reply;
+	const struct ctlv_hdr *root, *result;
+	unsigned int index;
+	__u64 pat_size;
+	bool got;
+	int ret;
+
+	ASSERT_EQ(0, posix_memalign(&challenge, 8, self->max_challenge_size));
+	ASSERT_EQ(0, posix_memalign(&pat, 8, self->max_token_size));
+
+	for (index = 0; index < self->max_challenge_size; index++)
+		((uint8_t *)challenge)[index] = index;
+
+	ret = firme_evidence_get(self->dev, self->pat_id,
+				 challenge, self->max_challenge_size,
+				 pat, self->max_token_size,
+				 &reply, &self->error);
+	if (ret == -EIO || ret == -ETIMEDOUT || ret == -EOPNOTSUPP) {
+		free(pat);
+		free(challenge);
+		SKIP(return, "FIRME PAT get service unavailable: %s", strerror(-ret));
+	}
+
+	ASSERT_EQ(0, ret)
+	{
+		TH_LOG("%s", error_text(&self->error));
+	}
+
+	root = ctlv_reply_root(reply);
+	got = ctlv_attestation_evidence_get_evidence_generation_present(root);
+	EXPECT_FALSE(got);
+
+	result = ctlv_hdr_find(root, CTLV_ATTESTATION_T_EVIDENCE_GET_RESULTS);
+	ASSERT_NE(NULL, result);
+
+	got = ctlv_attestation_evidence_get_results_length_get(result, &pat_size);
+	ASSERT_TRUE(got);
+	ASSERT_GT(pat_size, 0);
+	ASSERT_LE(pat_size, self->max_token_size);
+	TH_LOG("FIRME PAT size: 0x%llx\n", pat_size);
+
+	dump_pat(pat, pat_size);
+
+	ctlv_reply_free(reply);
+	free(pat);
+	free(challenge);
+}
+
+TEST_HARNESS_MAIN

-- 
2.43.0


