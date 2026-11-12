Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE963606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fTavh4oD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MOQ910Wy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DVkz0UZLTs7I1LooIbYzT7d/+amjhMIGXKxwIrrHSHI=; b=fTavh4oDkPDkWb
	vnOKTlsazDn/hFzz77F3fbDzxtWz788pUB01AKjMtBEEDZ5BWaWYihwA9FY7sVpMIrvGL8vHmb1nX
	jU1pm8PVwTWXNoxYZXC3IGPt388eS/vyh/0Dy3tQUgX6jGT9Afktf4N69f+zrn16+N4EQuegCQCVH
	M+8DrEryxtRDlo6ECSqfOuNxkhQRn6a0R8qMvGlLYrJdFfbhJogHl1EQK+M60k1AccMe74dhesKnX
	I5XIiaOPJ1WDlVXyaNv0CBedrLPR7a/UVzJbTN4RpoL1Di5DaZvRQB/81pvF81EaVcKzvwu2QSgkM
	e3KMpf4tFMa8VfBqjF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaE8-0000000AvfA-3u9i;
	Thu, 12 Nov 2026 19:12:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaDr-0000000Ava3-3RLn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:12:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4309F165C;
	Thu, 12 Nov 2026 11:12:32 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B55E3F632;
	Thu, 12 Nov 2026 11:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510755; bh=PvN8tedJB6Toir/Xd6zuZyZuu5gAER3iy5Ik24jAPnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MOQ910WyDyxDDppNZCQGQIZXFJi5nFSHmf7UMt0bkNAf1zmLbTroHb5hAWmCFvJuF
	 V94m+4qj8LBnvLrcPG7EMENSnQCNdH/z3CYaE0CsBib4L6imcUO2/Eh+I2dLewRQB1
	 dvGuh9hf0v2WIIUaUuXt/rnUg74Pnbwee6jyBeiw=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: topology: Reduce the skew for AMU feedback counter sampling
Date: Thu, 12 Nov 2026 20:12:09 +0100
Message-ID: <20261112191211.3336725-4-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_111235_963811_BC1513D9 
X-CRM114-Status: GOOD (  15.31  )
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
one and can skew the result.

Read both counters in succession if none is actually affected by HW
errata.

And while at it, update the comments to be more accurate (or less
inaccurate).

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/kernel/topology.c | 38 ++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 30a52659f15c..d00aec6354e4 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -384,10 +384,10 @@ enum cpc_ffh_ctr_id {
 static void cpu_read_corecnt(void *val)
 {
 	/*
-	 * A value of 0 can be returned if the current CPU does not support AMUs
-	 * or if the counter is disabled for this CPU. A return value of 0 at
-	 * counter read is properly handled as an error case by the users of the
-	 * counter.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
 	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
 		      0UL : read_corecnt();
@@ -397,10 +397,9 @@ static void cpu_read_constcnt(void *val)
 {
 	/*
 	 * Return 0 if the current CPU is affected by a HW erratum.
-	 * A value of 0 is also returned if the current CPU does not
-	 * support AMUs or if the counter is disabled. A return
-	 * value of 0 at counter read is properly handled as an error
-	 * case by the users of the counter.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
 	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
 		      0UL : read_constcnt();
@@ -460,15 +459,24 @@ bool cpc_ffh_supported(void)
 static void amu_read_core_const_ctrs(void *val)
 {
 	struct amu_ffh_ctrs *ctrs = val;
-
+	bool corecntr_broken =
+		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
+	bool constcntr_broken =
+		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
+
+	if (!corecntr_broken && !constcntr_broken) {
+		ctrs->corecnt = read_corecnt();
+		ctrs->constcnt = read_constcnt();
+		return;
+	}
 	/*
-	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
-	 * Read it first to minimize the sampling skew between the const
-	 * and core counters.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
-	cpu_read_constcnt(&ctrs->constcnt);
-	cpu_read_corecnt(&ctrs->corecnt);
+	ctrs->corecnt = corecntr_broken ? 0UL : read_corecnt();
+	ctrs->constcnt = constcntr_broken ? 0UL : read_constcnt();
 }
 
 static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
-- 
2.43.0


