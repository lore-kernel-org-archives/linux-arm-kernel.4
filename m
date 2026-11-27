Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06439606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnfZP8il;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L4Jx6BGM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HH/2+xfCOjuwRYj2WMgLPPxYArJ7Gznshqxm4/N66IM=; b=TnfZP8ilzw2N0B
	+wDmpmdamwFxABd5FXkSXHv8Gpw7paNje7K8ECFzAMn9bo3u6y3pdtvxs3BjdsNifoIuwTSCTQRCk
	1NX0eIE+hiEK0tvaW6GUYV6y6SAbH3UAbkP1UI0wvgIWmDxSDHyw2bTE3ckeX5ip1eoX8R60naljo
	rs+028DTRvBWtDY4OVwrdpwTJ4nFp5ZRCH4wWifHOwdYakNKsyA6wDUbxfKac96kksTqp0bq9QaDd
	DBEYdgPVA3cAMz20SQTT1OwBNSL3dL9ABh0oet/qZoaK9k0rhdC1irrpMW1mMgq3wxc39wXDuDCAG
	pczo0ShXZCWm9gtN678g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxtz-0000000Gnlm-1B0J;
	Fri, 27 Nov 2026 15:30:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsb-0000000Gmn1-3SiD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C4291E5E;
	Fri, 27 Nov 2026 07:28:50 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79A883F632;
	Fri, 27 Nov 2026 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793333; bh=oadpTDtHeXjF2SABam78ABW4/8bIdiMW6mWuu/fzTQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L4Jx6BGMahxyMmVpVIpk2TZL1fr2/aSBcEskTu6cuYdjHkFzT04KojX29cfdKYNOr
	 hO3EehL64pFZnmlpBYuuKCtrSqad77rrTlfH3R/aJBBqsfVh1qscBxpnBFbFbh5kc0
	 kgTJ2VByamC6HiaRFhR1LgwUyT9UEq6s8d/qxNgM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:35 +0000
Subject: [PATCH RFC v2 5/6] attestation: providers: introduce FIRME
 attestation provider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-5-ab88b2d0b4e0@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10410; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=oadpTDtHeXjF2SABam78ABW4/8bIdiMW6mWuu/fzTQs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGozL5gKhb8ioez1siWjlbvZ+Z683Mmmof+R
 k6cyKea3tmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhqAAKCRBt1cPRWsUx
 M/zmC/9UJ/8IDspapNjXCOrfFcJJLK0nexBflOy8KSnDxjsi8XSe2QGTS1D2a7/qWvYsvgCWRge
 upzEap+n1dz8oUn/GngyoLI19V6IXw2BqItpGmZ+64xORWpEGoduz8/960GSpH5OIYUdPUOZUPP
 uZ/Tu7BzP+7lxvwHBsF6IwLlBKHlPTB/xwXZpx4BD/Q8wCF/JJAkODukJtZXYAahdDYtwMpImF3
 FnMa878cdnK7zEaLcfWTEI65i9z2yj6rYityRRMipUIR7tRxpVRVgUS9TVR/x3m1Ut+VOh7Gr2s
 pgqDJJYMWLDqM4liVKrgHe01cWpiGZf0NcRqEE1pxAmQww2G6iHaoW+d4bYMOLbpGwGFskXJEpK
 EuEnrWkZcihwdNm2G9Bvv83smSgdQjqQ8fwIU9D+yrImoRIbPqcz2mxyRLIp07S594TEEWwHbJH
 wuxozLZjxC1LnBDfp4YUypMMWda23u2UMbu1tO5OUPPZ95uzTdHTPvx7RuPl8TvCx28IU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072853_951393_850BBD7D 
X-CRM114-Status: GOOD (  19.36  )
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

Introduce FIRME attestation provider for retrieving an attestation
token for host.

When a evidence-get is requested, firme attestation provider invokes
the appropriate FIRME interfaces to query an attestation token.

The steps to retrieve an attestation token are as follows:

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/attestation/Kconfig           |   9 ++
 drivers/attestation/Makefile          |   5 +
 drivers/attestation/providers/firme.c | 292 ++++++++++++++++++++++++++++++++++
 3 files changed, 306 insertions(+)

diff --git a/drivers/attestation/Kconfig b/drivers/attestation/Kconfig
index e9c1d7865f2a0..e2391ef4aee2d 100644
--- a/drivers/attestation/Kconfig
+++ b/drivers/attestation/Kconfig
@@ -43,4 +43,13 @@ config ATTESTATION_SIM
 
 	  If you are unsure, say N.
 
+config ATTESTATION_FIRME
+	tristate "FIRME attestation provider"
+	depends on ARM_FIRME
+	help
+	  Exposes FIRME platform token get (PAT) operations through the common
+	  attestation CTLV family.
+
+	  If you are unsure, say N.
+
 endif # ATTESTATION
diff --git a/drivers/attestation/Makefile b/drivers/attestation/Makefile
index 448fe4a3856d4..2c7a1a09daaed 100644
--- a/drivers/attestation/Makefile
+++ b/drivers/attestation/Makefile
@@ -12,3 +12,8 @@ obj-$(CONFIG_ATTESTATION_SIM) += attestation-sim.o
 
 attestation-sim-y := providers/sim.o \
 		     generated/ctlv_attestation_sim_gen.o
+
+obj-$(CONFIG_ATTESTATION_FIRME) += attestation-firme.o
+
+attestation-firme-y := providers/firme.o \
+		       generated/ctlv_attestation_firme_gen.o
diff --git a/drivers/attestation/providers/firme.c b/drivers/attestation/providers/firme.c
new file mode 100644
index 0000000000000..b8de3e14aff5a
--- /dev/null
+++ b/drivers/attestation/providers/firme.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <crypto/sha2.h>
+#include <linux/arm_firme.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/attestation.h>
+#include <linux/ctlv.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "../generated/ctlv_attestation_firme_gen.h"
+
+struct firme_attestation {
+	struct attestation_dev att;
+	u32 version;
+	size_t max_pat_size;
+};
+
+static struct firme_attestation *to_firme_attestation(struct attestation_dev *att)
+{
+	return container_of(att, struct firme_attestation, att);
+}
+
+static const struct attestation_evidence_format firme_attestation_pat_format[] = {
+	{ .vendor = true, .value = CTLV_ATTESTATION_FIRME_EVIDENCE_VENDOR_FORMAT_PLATFORM_ATTESTATION_TOKEN },
+};
+
+static const struct attestation_evidence_challenge_length
+firme_attestation_challenge_lengths[] = {
+	{ .min = 1, .max = SHA512_DIGEST_SIZE },
+};
+
+static struct attestation_evidence_supported_object
+firme_attestation_evidence_objects[] = {
+	{
+		.evidence_class = ATTESTATION_EVIDENCE_SIGNED,
+		.formats = firme_attestation_pat_format,
+		.formats_count = ARRAY_SIZE(firme_attestation_pat_format),
+		.challenge_lengths = firme_attestation_challenge_lengths,
+		.challenge_lengths_count =
+			ARRAY_SIZE(firme_attestation_challenge_lengths),
+		.max_length = 0,
+	},
+	/*
+	 * TODO: add LFA log and need to call
+	 * attestation_device_changed_locked() when LFA is done.
+	 */
+};
+
+static const struct attestation_evidence_caps firme_attestation_evidence_caps = {
+	.objects = firme_attestation_evidence_objects,
+	.objects_count = ARRAY_SIZE(firme_attestation_evidence_objects),
+};
+
+static int firme_get_platform_attestion_token(struct firme_attestation *firme_att,
+					      const void *challenge,
+					      size_t challenge_size,
+					      void *token, size_t *token_size)
+{
+	firme_status_t status;
+	firme_value_t ret;
+	struct firme_shared_buf_info shbuf_info;
+	void *buffer;
+	size_t alloc_size, buffer_size, buffer_pgcnt;
+	size_t read_size, total_size;
+
+	if (firme_get_shared_buffer_info(&shbuf_info))
+		return -EOPNOTSUPP;
+
+	if ((challenge_size > 0) && !challenge)
+		return -EINVAL;
+
+	buffer_size = min(firme_att->max_pat_size, shbuf_info.max_size);
+	if (WARN_ON_ONCE(buffer_size & (shbuf_info.min_size - 1)))
+		return -ENOBUFS;
+
+	alloc_size = buffer_size;
+
+	buffer = firme_alloc_shared_buffer(&alloc_size, GFP_KERNEL | __GFP_ZERO);
+	if (!buffer)
+		return -ENOMEM;
+
+	if (alloc_size < buffer_size)
+		buffer_size = alloc_size;
+
+	buffer_pgcnt = buffer_size / shbuf_info.min_size;
+
+	if (challenge_size > 0) {
+		memcpy(buffer, challenge, challenge_size);
+		/*
+		 * According to Realm Management Monitor specification, S-PNCRK,
+		 * maximum chanllege size should be 64 bytes (SHA512_DIGEST_SIZE).
+		 * If less than, pad with zero.
+		 */
+		challenge_size = SHA512_DIGEST_SIZE;
+	}
+
+	guard(migrate)();
+
+	total_size = 0;
+
+	do {
+		invoke_firme_service((firme_value_t) {
+				     .a0 = FIRME_ATTEST_PAT_GET,
+				     .a1 = virt_to_phys(buffer),
+				     .a2 = 0,
+				     .a3 = buffer_pgcnt - 1,
+				     .a4 = challenge_size,
+				     .a5 = 0,  /**< binding size must be 0 for normal world. */
+				     }, &ret);
+		status = ret.a0;
+		if ((status != FIRME_RET_SUCCESS) &&
+		    (status != FIRME_RET_INCOMPLETE))
+			break;
+
+		challenge_size = 0;
+		read_size = ret.a1;
+		memcpy(token + total_size, buffer, read_size);
+		total_size += read_size;
+	} while (status == FIRME_RET_INCOMPLETE);
+
+	if (status == FIRME_RET_SUCCESS)
+		*token_size = total_size;
+
+	firme_free_shared_buffer(buffer, alloc_size);
+
+	return firme_status_to_errno(status);
+}
+
+static int
+firme_attestation_evidence_get(struct attestation_dev *att,
+			       const struct attestation_evidence_request *request,
+			       struct attestation_evidence_result *result)
+{
+	const struct attestation_evidence_object_request *object;
+	struct attestation_evidence_object_result *produced;
+	struct firme_attestation *firme_att = to_firme_attestation(att);
+	void *token;
+	size_t token_size;
+	int ret;
+
+	if (request->objects_count != 1)
+		return -EOPNOTSUPP;
+
+	object = &request->objects[0];
+	produced = &result->objects[0];
+
+	token_size = object->supported_object->max_length;
+	token = kvmalloc(token_size, GFP_KERNEL);
+	if (!token)
+		return -ENOMEM;
+	if (object->supported_object == &firme_attestation_evidence_objects[0]) {
+		ret = firme_get_platform_attestion_token(firme_att,
+							 request->challenge,
+							 request->challenge_length,
+							 token, &token_size);
+		if (!ret) {
+			produced->format.vendor = true;
+			produced->format.value = CTLV_ATTESTATION_FIRME_EVIDENCE_VENDOR_FORMAT_PLATFORM_ATTESTATION_TOKEN;
+		}
+	} else {
+		ret = -EOPNOTSUPP;
+	}
+
+	if (!ret)
+		ret = attestation_evidence_write(object, token, token_size);
+	if (!ret)
+		produced->length = token_size;
+	kvfree(token);
+
+	return ret;
+}
+
+static const struct attestation_provider firme_attestation_provider = {
+	.evidence_get = firme_attestation_evidence_get,
+	.evidence_caps = &firme_attestation_evidence_caps,
+};
+
+int ctlv_attestation_firme_device_info_fill(struct ctlv *ctlv,
+					  struct ctlv_op_ctx *ctx,
+					  const struct ctlv_cursor *request,
+					  struct ctlv_cursor *record)
+{
+	const struct firme_attestation *firme_att =
+		to_firme_attestation(attestation_from_ctlv(ctlv));
+	bool ok;
+
+	ok = ctlv_attestation_firme_device_info_version_put(record, firme_att->version);
+	return ok ? 0 : -EMSGSIZE;
+}
+
+void ctlv_attestation_firme_device_info_read(struct ctlv *ctlv,
+					   struct ctlv_op_ctx *ctx,
+					   const struct ctlv_cursor *record)
+{
+}
+
+static bool firme_attest_drv_match(const struct arm_smccc_device *sdev)
+{
+	const enum firme_service_id id = (const enum firme_service_id)sdev->match_params;
+
+	if (id == FIRME_ATTEST_SERVICE_ID)
+		return true;
+	return false;
+}
+
+static int firme_attest_drv_probe(struct arm_smccc_device *sdev)
+{
+	int ret;
+	u32 version;
+	unsigned long feature;
+	struct firme_shared_buf_info shbuf_info;
+	u8 max_pat_pgcnt;
+	size_t max_pat_size;
+	struct firme_attestation *firme_att;
+
+	ret = firme_get_shared_buffer_info(&shbuf_info);
+	if (ret)
+		return ret;
+
+	ret = firme_get_version(FIRME_ATTEST_SERVICE_ID, &version);
+	if (ret)
+		return ret;
+
+	ret = firme_get_feature(FIRME_ATTEST_SERVICE_ID, 0x01, &feature);
+	if (ret)
+		return ret;
+
+	max_pat_pgcnt = FIELD_GET(FIRME_ATTEST_FEAT1_MAX_PAT_PG_CNT_MASK, feature);
+	max_pat_size = (max_pat_pgcnt + 1) * shbuf_info.min_size;
+	firme_attestation_evidence_objects[0].max_length = max_pat_size;
+
+	pr_info("FIRME attest service version %d.%d\n",
+		FIRME_MAJOR_VERSION(version),
+		FIRME_MINOR_VERSION(version));
+	pr_info("Maximum PAT size: 0x%lx\n", max_pat_size);
+
+	firme_att = attestation_alloc(&sdev->dev,
+				      &firme_attestation_provider,
+				      &ctlv_attestation_firme_family,
+				      struct firme_attestation, att);
+	if (IS_ERR(firme_att))
+		return PTR_ERR(firme_att);
+
+	firme_att->version = version;
+	firme_att->max_pat_size = max_pat_size;
+
+	ret = attestation_register(&firme_att->att);
+	if (ret) {
+		attestation_put(&firme_att->att);
+		return ret;
+	}
+
+	dev_set_drvdata(&sdev->dev, firme_att);
+
+	pr_info("FIRME attestation ctlvdev is registered\n");
+
+	return 0;
+}
+
+static void firme_attest_drv_remove(struct arm_smccc_device *sdev)
+{
+	struct firme_attestation *firme_att = dev_get_drvdata(&sdev->dev);
+
+	if (!firme_att)
+		return;
+
+	attestation_unregister(&firme_att->att);
+	attestation_put(&firme_att->att);
+	dev_set_drvdata(&sdev->dev, NULL);
+}
+
+static const struct arm_smccc_device_id firme_attest_id_table[] = {
+	{ .func_id = FIRME_SERVICE_VERSION, },
+	{ },
+};
+MODULE_DEVICE_TABLE(arm_smccc, firme_attest_id_table);
+
+static struct arm_smccc_driver firme_attest_drv = {
+	.name = KBUILD_MODNAME,
+	.probe = firme_attest_drv_probe,
+	.remove = firme_attest_drv_remove,
+	.match = firme_attest_drv_match,
+	.id_table = firme_attest_id_table,
+};
+module_arm_smccc_driver(firme_attest_drv);
+
+MODULE_DESCRIPTION("FIRME attestation provider");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("ATTESTATION");
+MODULE_IMPORT_NS("CTLV");
+MODULE_IMPORT_NS("FIRME");

-- 
2.43.0


