Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A173606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8CF7Kgn;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SLyKHpmv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=; b=W8CF7KgnBacVT85LVa9GgCVVR4
	0EmF9SFxZ4ln+m7uihGP0xj2qPy/dJVc8cMvp/OwjJQ9mpPLHlf1VvukRP/eaTcMVMYlJQjzePA5L
	hYDOFsoiznfEiMiB+UHeSwYZx54A50fsKLwDJ7dEMXIr7eiIOQ5yW8nDJOdCxnw4VZUS8VwiNvjDn
	6DCcHfXANzuTAeyLJTpWNrbn/f28lOQMBa7uJjjWhPZzNHMytuUuwD2aoi2xYdZKbjqRgiWhQTT9S
	Ai7E9yyytp41W0qX7B8bbreXlYVT9qSXlgHljql/0CEKD6JtNMOrGHYHotL/ASF5qFavPVIrOcErv
	vwuki9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUN-0000000Evhx-2clc;
	Sat, 07 Nov 2026 15:37:55 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU7-0000000EvF5-3d7T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:41 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6b565e7a09aso247276a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065857; x=1794670657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=;
        b=SLyKHpmvjRGkS/m8cv+3aeBHo8jub2hUPpEDdwsNiHJ77+26tNK8EdaH4DdlGmQ7zN
         PoHRjynYnQGZU5sbzGAZ/N53RTesNPxiDOiE8pqcvEpvlHGsI1W2mkGqDkcRtpxTJBRO
         I7YYVRTBaLie67NH6iGOuFznLnipnzrgghjbucqQSLjkFVOlskIhtmBM/A07jZ1B3bXn
         FlDG5VxDwnCYRwKDmxoWc9W5CCVeIWqX7d3dL92WXSPkCiYWULXAquSBz4nUWU1kyyYC
         FkLFvtaUKjCfzuEBaAxLHduORVD04mHVHrVnURFWHfMleFzT60mJ6dT9BPJVu+o7lZ9W
         5gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065857; x=1794670657;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=;
        b=btDw9CGllpfBv0u15WsXXudyOrF58vi4X9Y2/hQqr2Tqn6MyQalEsJk786QopDWvRW
         iMW2mQ4ZcGzN7B+BpkgXFzXNifUPw9cTacyNeaV0n08urrCRdpebtfHtD58WFkbAvzyw
         S6tG89ZBW4/Uj9QnMbURKXYlfLnSnomoO2lpl4LNLHmJ3gMV9Jdn36MDzabnI6659Hoi
         wdPMIx/YlTjnHlmxOt4mCkQzkqWvqBMOFD1CEOzrY3eSfJBnR7iwDsAoQGA9ZhO2l34t
         nLmTh3dOFXRats4uU3RTjQKf8lItDRo/Hop9AUcUndB1z4XP4WklGoqh3AYGnICuNmZZ
         XtMw==
X-Forwarded-Encrypted: i=1; AL+hErEMLbYWHggJVYR4Qc0fpcSdgzsJfSAAmQX1SnEbagEszBWvvByim1z5cW29QWW4qSWgPGSp1uvN0xRZnHnxvZJC@lists.infradead.org
X-Gm-Message-State: APuU4Z9RIkdt8ALaO/Fk+G3Fj/RqtOeix7zZctabvTOyDYzazRbXyWSE
	HYZpGdVfI/lcOLJDD7dn7VNbRI5Pjo1C5YSXCXOZXPskb37DpQmm7NTUVJ0XD8f5ODxil2i+Q7O
	mJw==
X-Received: from eddq13.prod.google.com ([2002:a05:6402:518d:b0:6b6:fcaf:dc3a])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1ec4:b0:6b4:206d:724b
 with SMTP id 4fb4d7f45d1cf-6b5977d7e53mr4186090a12.7.1794065856781; Sat, 07
 Nov 2026 07:37:36 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:27 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-21-d84ea5f30f94@google.com>
Subject: [PATCH 21/24] arm64: Introduce mte_tag[_and_zero]_range()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073739_937534_9FA02893 
X-CRM114-Status: GOOD (  18.97  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Carve the KASAN-agnostic MTE logic out of the KASAN arch function, so
that it can be reused without needing to depend on a KASAN header.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 57 ++++------------------------------=
----
 arch/arm64/include/asm/mte.h       | 47 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 66d72d0d3c43..81a8cf3b9a95 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -9,7 +9,6 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
=20
-#include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
 #define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
@@ -32,6 +31,7 @@
 #include <linux/bitfield.h>
 #include <linux/types.h>
=20
+#include <asm/mte.h>
 #include <asm/sysreg.h>
=20
 #define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
@@ -81,58 +81,13 @@ static inline void *mte_set_random_tag(const void *addr=
)
 	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
-/*
- * Assign allocation tags for a region of memory based on the pointer tag.
- * Note: The address must be non-NULL and MTE_GRANULE_SIZE aligned and
- * size must be MTE_GRANULE_SIZE aligned.
- */
 static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
-					 bool init)
-{
-	u64 curr, mask, dczid, dczid_bs, dczid_dzp, end1, end2, end3;
-
-	/* Read DC G(Z)VA block size from the system register. */
-	dczid =3D read_cpuid(DCZID_EL0);
-	dczid_bs =3D 4ul << (dczid & 0xf);
-	dczid_dzp =3D (dczid >> 4) & 1;
-
-	curr =3D (u64)mte_tagged(addr, kasan_tag_to_mte(tag));
-	mask =3D dczid_bs - 1;
-	/* STG/STZG up to the end of the first block. */
-	end1 =3D curr | mask;
-	end3 =3D curr + size;
-	/* DC GVA / GZVA in [end1, end2) */
-	end2 =3D end3 & ~mask;
-
-	/*
-	 * The following code uses STG on the first DC GVA block even if the
-	 * start address is aligned - it appears to be faster than an alignment
-	 * check + conditional branch. Also, if the range size is at least 2 DC
-	 * GVA blocks, the first two loops can use post-condition to save one
-	 * branch each.
-	 */
-#define SET_MEMTAG_RANGE(stg_post, dc_gva)		\
-	do {						\
-		if (!dczid_dzp && size >=3D 2 * dczid_bs) {\
-			do {				\
-				curr =3D stg_post(curr);	\
-			} while (curr < end1);		\
-							\
-			do {				\
-				dc_gva(curr);		\
-				curr +=3D dczid_bs;	\
-			} while (curr < end2);		\
-		}					\
-							\
-		while (curr < end3)			\
-			curr =3D stg_post(curr);		\
-	} while (0)
-
-	if (init)
-		SET_MEMTAG_RANGE(__stzg_post, __dc_gzva);
+					 bool zero)
+{
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
 	else
-		SET_MEMTAG_RANGE(__stg_post, __dc_gva);
-#undef SET_MEMTAG_RANGE
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
 }
=20
 void mte_enable_kernel_sync(void);
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 8826d64c8e33..9ba215b2b0fd 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -18,6 +18,7 @@
=20
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <asm/cputype.h>
 #include <asm/pgtable-types.h>
 #include <asm/sysreg.h>
=20
@@ -101,6 +102,52 @@ static inline bool task_uses_sync_mte_faults(struct ta=
sk_struct *task)
 	return task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT);
 }
=20
+/*
+ * Assign allocation tags for a region of memory (and optionally zero it).
+ * Note: The address must be non-NULL and MTE_GRANULE_SIZE aligned and
+ * size must be MTE_GRANULE_SIZE aligned.
+ */
+#define __mte_tag_range(addr, size, tag, stg_post, dc_gva)		\
+do {									\
+	u64 curr, mask, dczid, dczid_bs, dczid_dzp, end1, end2, end3;	\
+	/* Read DC G(Z)VA block size from the system register. */	\
+	dczid =3D read_cpuid(DCZID_EL0);					\
+	dczid_bs =3D 4ul << (dczid & 0xf);				\
+	dczid_dzp =3D (dczid >> 4) & 1;					\
+	curr =3D (u64)mte_tagged(addr, tag);				\
+	mask =3D dczid_bs - 1;						\
+	/* STG/STZG up to the end of the first block. */		\
+	end1 =3D curr | mask;						\
+	end3 =3D curr + size;						\
+	/* DC GVA / GZVA in [end1, end2) */				\
+	end2 =3D end3 & ~mask;						\
+	/* STG on first block is faster than alignment check + branch.*/\
+	if (!dczid_dzp && size >=3D 2 * dczid_bs) {			\
+		/* Post-condition saves one branch in each loop. */	\
+		do {							\
+			curr =3D stg_post(curr);				\
+		} while (curr < end1);					\
+									\
+		do {							\
+			dc_gva(curr);					\
+			curr +=3D dczid_bs;				\
+		} while (curr < end2);					\
+	}								\
+	while (curr < end3)						\
+		curr =3D stg_post(curr);					\
+} while (0)
+
+static inline void mte_tag_range(void *addr, size_t size, u8 tag)
+{
+	__mte_tag_range(addr, size, tag, __stg_post, __dc_gva);
+}
+
+static inline void mte_tag_and_zero_range(void *addr, size_t size, u8 tag)
+{
+	__mte_tag_range(addr, size, tag, __stzg_post, __dc_gzva);
+}
+#undef __mte_tag_range
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */

--=20
2.56.0.455.g6c5a503b38-goog


