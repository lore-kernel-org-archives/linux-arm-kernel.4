Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGDXIf9L;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XX5QCdNB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nhvCX7cnFUOP+0odNG8L+g8M1AE11udJIdxY7bhisvM=; b=tGDXIf9LOOaNhp
	NCRpCLmBz3Lkw8Ca8GVTQArxKyWQDZVwsOHZWK12qo6Oy6lwWujXUeSHX53AuCgxQE342m0MAR3F+
	ZI0UlmXO184N3mlWHXrhcZ+bxkZYqGLlG6Xby5X+0eqFVbshAEV4a0mJy8KrJ7cIDbptc4g1S/mRD
	YhfTsq0crIo2GLveQilzg9HT257GDD0PkEOAOeDGEYY8TYN3mwLq5FzXMfD4/d5te5o6LZIfrZmKE
	chYDsFt02gWEwCtXf+y7pE4spMLHaZmp77mHt7byIvL6ft0BJscEVlySL3zvs9nDZMKqfd60cSlFQ
	qZPzADdKxt14/6ufhXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxX-0000000Gq5d-0gDU;
	Fri, 27 Nov 2026 15:33:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxws-0000000Gpqh-29eH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A25D1758;
	Fri, 27 Nov 2026 07:33:15 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB4463F632;
	Fri, 27 Nov 2026 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793597; bh=cUEeEDhw26MzKI+o/cVqmkhloHFBYlXpdnq5OfyLNyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XX5QCdNBGrDEyBaQV6v6LDU51UcYbGAAHIlhsF8IPNvaRAGBJJXNtl3PDm3VINBDv
	 mxVPuohQENZ9Jn6CSJODHBqOv1kYkw/25AVGuhXN0EXt+ySs6BN3nBt3RghnqmHFKr
	 dOD5YB7wD1Z+rdC5Gf9iVydsY5MKXMyI+GW9V814=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:32:56 +0000
Subject: [PATCH RFC v3 1/8] arm64: rsi: Add helpers for Arm CCA measurement
 register operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-arm_cca_mr-v3-1-df3230afce8f@arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
In-Reply-To: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
 Pawel Chmielewski <pawel.chmielewski@intel.com>, 
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5188; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=i/trOAo/5aLMwaFojQRTPyK2C5aW6zfxp4PidixBGE8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaKzHmJD71Kx6SstCr7RmLqfXK8HGCiRm3KSg
 FpitXZuVOCJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmiswAKCRBt1cPRWsUx
 Mw2NDACHWQR4ihSMybCNJIddm6XmCGy7fJAc8VB+YoBibrDvL0yr3Y1Dm+/4XH1aBUEcFjoG9f2
 ma9VIOQ2JD3vLQFYD9qdx9h925qbkjDPkPtN7XtQb0nM751v251Fv4aqnFLKpoOjNTx5lhztn9Y
 GG4nBaKcyu2D6+d1PDjwqXl5XicO0IZMceqGi2GReqsLDCOnWUgTuIGHUn4y5IwBIJbpax2a2tD
 Kigt3pStLCLoi9oi8ys3M7XMUoEGE0BS5OkSK6ibVnBHdq32Vf9ie2Bt/jnKoZFHVgJeScjYyFI
 jZpYA+CLd4DoQD4q81pygpJmrxAxNqWJ35bljqJAXrryzlHkjyqkMeQOHO8Kkns37+AAomeDxga
 5jL5/8m6KAz/E5rqRVEpgBU2fcu6TAj9GpV4dQwcQvCjh4fpYrki18EesoB7/1sN86Ow2qNA08A
 O4ra4yGFXweq2uuO1ORuYPETZUa0CCEYls1huGfMV3mLXRL7Q4o2PxwyuNuOARLTG0Re4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073318_648095_3F19836D 
X-CRM114-Status: GOOD (  19.58  )
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

From: Sami Mujawar <sami.mujawar@arm.com>

Add static inline helper functions to support reading the Realm
Initial Measurement (RIM) and reading/extending the Realm
Extensible Measurement (REM) registers.

The indices of the Arm CCA measurement registers, as defined by
the Realm Management Monitor specification, are as follows:
    Index    Register
    0        RIM
    1 - 4    REM[0 - 3]

The rsi_measurement_extend() function allows extending REM[0–3]
registers with a caller-provided digest (up to 64 bytes).
Index 0 (RIM) is read-only and cannot be extended.

The rsi_measurement_read() function allows reading measurement
values from RIM (index 0) or REM[0–3] (indices 1–4). The returned
digest is expected to be 64 bytes.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 include/linux/arm-rsi-cmds.h | 118 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 3f7a6a833993b..188e5dc7eb587 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023 - 2025 ARM Ltd.
  */
 
 #ifndef __LINUX_ARM_RSI_CMDS_H_
@@ -9,6 +9,7 @@
 #include <linux/arm-smccc-rsi.h>
 #include <linux/jump_label.h>
 #include <linux/string.h>
+#include <crypto/sha2.h>
 #include <asm/memory.h>
 
 #ifdef CONFIG_ARM_RMM_RSI
@@ -36,6 +37,26 @@ static inline bool is_realm_world(void) { return false; }
 #define RSI_GRANULE_SHIFT		12
 #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
 
+/*
+ * Maximum measurement data size in bytes.
+ * According to the RMM Specification, the width of the RmmRealmMeasurement type
+ * is 512 bits.
+ */
+#define RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES  64
+
+/*
+ * Indices for the Realm Initial Measurement register (RIM) and the Realm
+ * Extensible Measurement registers (REMs).
+ * According to the RMM Specification, Realm attributes of a Realm include
+ * an array of measurement values. The first entry in this array is a RIM.
+ * The remaining entries in this array are REMs.
+ */
+#define RSI_INDEX_RIM		0
+#define RSI_INDEX_REM0		1
+#define RSI_INDEX_REM1		2
+#define RSI_INDEX_REM2		3
+#define RSI_INDEX_REM3		4
+
 enum ripas {
 	RSI_RIPAS_EMPTY = 0,
 	RSI_RIPAS_RAM = 1,
@@ -236,4 +257,99 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
+#define RSI_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
+
+struct rsi_measurement_extend_args {
+	unsigned long fid;
+	unsigned long idx;
+	unsigned long size;
+	u8	      digest[SHA512_DIGEST_SIZE];
+};
+
+/**
+ * rsi_measurement_extend - Extend the measurement value to the Realm Extensible
+ * Measurement (REM).
+ *
+ * @idx:		Index of the REM register.
+ *				Where:
+ *				Index	Register
+ *				1 - 4	REM[0-3]
+ * @digest:		The digest data to be extended.
+ * @digest_size:	Size of the digest data in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_extend(u32 idx,
+						   const u8 *digest,
+						   unsigned long digest_size)
+{
+	union {
+		struct arm_smccc_1_2_regs regs;
+		struct rsi_measurement_extend_args extend;
+	} args = { 0 };
+
+	/*
+	 * Index 0 is for RIM (which is Read Only), while
+	 * REM[0-3] are indexed from 1 - 4.
+	 * The digest size can be at the most 64 bytes.
+	 */
+	if (!digest || idx < RSI_INDEX_REM0 || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	args.extend.fid = SMC_RSI_MEASUREMENT_EXTEND;
+	args.extend.idx = idx;
+	args.extend.size = digest_size;
+	memcpy(&args.extend.digest, digest, digest_size);
+	arm_smccc_1_2_smc(&args.regs, &args.regs);
+
+	if (args.regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	return RSI_SUCCESS;
+}
+
+/**
+ * rsi_measurement_read - Read the measurement value from the Realm Initial
+ * Measurement (RIM) or the Realm Extensible Measurement (REM) register.
+ *
+ * @idx:		Index of the RIM or REM register.
+ *				Where:
+ *				Index	Register
+ *				0	RIM
+ *				1 - 4	REM[0-3]
+ * @digest:			The digest data to be returned.
+ * @digest_size:	Size of the digest data buffer in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_read(u32 idx,
+						 u8 *digest,
+						 unsigned long digest_size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * The digest size can be at the most 64 bytes, if less then 64 bytes
+	 * it is zero padded.
+	 */
+	if (!digest || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_MEASUREMENT_READ;
+	regs.a1 = idx;
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	memcpy(digest, &regs.a1, digest_size);
+	return regs.a0;
+}
+
 #endif /* __LINUX_ARM_RSI_CMDS_H_ */

-- 
2.43.0


