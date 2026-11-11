Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DFF606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m3DJtS1o;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ec8SJnfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OQisv41zonTwK6MIXLSJWGm8DbW31eQIK/zim4WS9w8=; b=m3DJtS1o1fzzBF
	65sh6oBoPf/A881mvS+574LzBJm24bdkZEnxCDEyLaeBV6oNQMQuG12JUd7/sPnSTIWnOTSgIMTZU
	tcUrvIH3Ppy1a8aiEzG6Lat68EX/3I71z53yi+HxTLogHX+Ka/AMaY5nb8NKzxkMjBBgoDkkjlW3K
	VY3OE5bJfPZ/SCyoAW161+kOtrjTk80btNZlgTlu0SlTtp+wwgYrEydidESNoghy+nHH6mQk0p3rm
	kLXXWslxAg4YZhWqs4ayL7Bd9UhC38TY7a4JtocAKOMFsZ7fg8a2BqXzq9Ns4mLqBzZPs7aB85jpB
	0LABWowyonb0bwZ/uVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7cx-00000006hTY-3jb4;
	Wed, 11 Nov 2026 12:40:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7cr-00000006hQr-1Zsy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:40:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90431576;
	Wed, 11 Nov 2026 04:40:25 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.69.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D6DD3FA32;
	Wed, 11 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794400828; bh=fdhI5OJ6JP19A+vzyhmagkBe6w4lslzc0+1PixJDvII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ec8SJnfkAdMPT92Z/+CH6iNkSHpUNNB0dLugjgdBQt0S+egm6Ll2HQgyayzx97WKk
	 SqCF92s4C8Dhfdk9dAkw8oPa7wFCkYCkfUqZkK+rixdaupxhC/zMvN8b32UZR2ml5b
	 TdDYtWWp8mR/dZPsubI8bREGheZ8MxkCC1X17B9A=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback counter sampling
Date: Wed, 11 Nov 2026 13:39:29 +0100
Message-ID: <20261111124005.2688820-4-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111124005.2688820-1-beata.michalska@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_044029_493750_2C6DC6EC 
X-CRM114-Status: GOOD (  17.18  )
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

With the FFH support for CPPC, the AMU feedback counters, core and const
counter, are being sampled to measure CPU performance. Checking for errata
(which can affect both counters) between the reads delays the second
sample and can skew the result.

Take both samples in succession, then discard values from affected
counters. This narrows the sampling interval used for CPPC feedback.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 66ac67bd025e..c968fa5b0c88 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
 	CPC_FFH_CTR_CONST = 0x1,
 };
 
-static void cpu_read_corecnt(void *val)
+static inline void cpu_read_corecnt(void *val)
 {
-	/*
-	 * A value of 0 can be returned if the current CPU does not support AMUs
-	 * or if the counter is disabled for this CPU. A return value of 0 at
-	 * counter read is properly handled as an error case by the users of the
-	 * counter.
-	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
-		0UL : read_corecnt();
+	*(u64 *)val = read_corecnt();
 }
 
-static void cpu_read_constcnt(void *val)
+static void cpu_try_read_corecnt(void *val)
 {
-	/*
-	 * Return 0 if the current CPU is affected by a HW erratum.
-	 * A value of 0 is also returned if the current CPU does not
-	 * support AMUs or if the counter is disabled. A return
-	 * value of 0 at counter read is properly handled as an error
-	 * case by the users of the counter.
-	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
-		      0UL : read_constcnt();
+	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
+		cpu_read_corecnt(val);
+	} else {
+		/*
+		 * A value of 0 can be returned if the current CPU does not support AMUs
+		 * or if the counter is disabled for this CPU. A return value of 0 at
+		 * counter read is properly handled as an error case by the users of the
+		 * counter.
+		 */
+		*(u64 *)val = 0UL;
+	}
+}
+
+static inline void cpu_read_constcnt(void *val)
+{
+	*(u64 *)val = read_constcnt();
+}
+
+static void cpu_try_read_constcnt(void *val)
+{
+	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
+		cpu_read_constcnt(val);
+	} else {
+		/*
+		 * Return 0 if the current CPU is affected by a HW erratum.
+		 * A value of 0 is also returned if the current CPU does not
+		 * support AMUs or if the counter is disabled. A return
+		 * value of 0 at counter read is properly handled as an error
+		 * case by the users of the counter.
+		 */
+		*(u64 *)val = 0UL;
+	}
 }
 
 static inline
@@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
 {
 	struct amu_ffh_ctrs *ctrs = val;
 
+	cpu_read_corecnt(&ctrs->corecnt);
+	cpu_read_constcnt(&ctrs->constcnt);
+
 	/*
-	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
-	 * Read it first to minimize the sampling skew between the const
-	 * and core counters.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * A value of 0 is also returned if the current CPU does not
+	 * support AMUs or if the counter is disabled. A return
+	 * value of 0 at counter read is properly handled as an error
+	 * case by the users of the counter.
 	 */
-	cpu_read_constcnt(&ctrs->constcnt);
-	cpu_read_corecnt(&ctrs->corecnt);
+	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
+		ctrs->corecnt = 0UL;
+	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
+		ctrs->constcnt = 0UL;
 }
 
 static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
@@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 
 	switch ((u64)reg->address) {
 	case CPC_FFH_CTR_CORE:
-		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
+		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
 		break;
 	case CPC_FFH_CTR_CONST:
-		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
+		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
 		break;
 	}
 
-- 
2.43.0


