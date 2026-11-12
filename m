Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA6606A8A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pFFl3a2T;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QReUpAgC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C2odGeLZEmGKKS+pPQWO+gnDXflT3SuRERn2bLK128Q=; b=pFFl3a2TwUf5Mg
	ekbngIeXB1AJ2jNxsRtdEG5aEfXgBH8cTJJ/0DJhL3Hs4BQZ8FgCNA1nKFPVdqRkpkNKlOGzoWLMH
	6sYCOoY+z+wSZCW8bz4oTfXccUlV1AW0lkxI6TcaBYHAZ8N2gMtbsE3IhrOhLjk0ab20aYwepD9sb
	uU5jyk3WuFUuTZO6v4e2tjvy74cRMeCYvvb5zEIh1eFqN50JhXQvlGNnNDxulwAXuVfYH1oxnrLyy
	IaiepVb3qDZyj2gwojmqeZEETZPAXZjyxMovr7PnBjbzfxbZtbTF111ZE65PIzDd0lYq0H/xs+lqI
	1z6SIOwYG+harebnQQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaDt-0000000AvbB-1oD5;
	Thu, 12 Nov 2026 19:12:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaDp-0000000AvZK-1vVV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:12:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4E81576;
	Thu, 12 Nov 2026 11:12:29 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15A983F632;
	Thu, 12 Nov 2026 11:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510752; bh=cUISQqJ6bIH9uxhCbIo672a2b5JutTHIBbB+Bd8wS1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QReUpAgCmpiG5ELToV7wja4dmXT5kMZsEHjGLoM7euQLkO7At1FjmiEuGgysx32lB
	 fHmgnVD6iVLhYWmWqPD7jr/M0cnDvvw7qj6EhLfGissQqbB2A0j41E6kNq61QN+woA
	 gRbImwK2ZB2sfZr3xnIcUyisVU8YPesjUMAL4zY8=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
Date: Thu, 12 Nov 2026 20:12:08 +0100
Message-ID: <20261112191211.3336725-3-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_111233_630353_8BF897D3 
X-CRM114-Status: GOOD (  18.47  )
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

On Cortex-A715 (erratum 2738462) and Cortex-A720 (erratum 2738461),
the AMEVCNTR00 counter may continue incrementing while the core
remains in WFE with the clocks being enabled. The resulting core
cycle count may become unreliable.

Add a workaround that effectively treats the AMU counter
as unavailable.

Cc: stable@vger.kernel.org
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  4 +++
 arch/arm64/Kconfig                          | 32 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 20 +++++++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/topology.c                |  3 +-
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 09fe032e1aea..5801597a387c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -171,8 +171,12 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #2645198        | ARM64_ERRATUM_2645198       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A715     | #2738462        |  ARM64_ERRATUM_2738461      |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A715     | #3456084        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720     | #2738461        | ARM64_ERRATUM_2738461       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #3456091        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #4689339        | ARM64_ERRATUM_3821522       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cf50f3051edc..afc6226689be 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1051,6 +1051,38 @@ config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	# making it unreliable. As a result, AMU users should treat it as
 	# unavailable rather than relying on misleading counter values.
 
+config ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	bool
+	# Targeting errata affecting AMEVCNTR00, the AMU core cycle counter.
+	# On affected CPUs the counter may continue incrementing while core
+	# remains in WFE with the clocks enabled.
+	# This may lead to readings of said counter being unreliable.
+	# How much though depends on the sampling intervals.
+
+config ARM64_ERRATUM_2738461
+	bool "Cortex-A715/Cortex-A720: workaround for AMEVCNTR00 incrementing incorrectly"
+	depends on ARM64_AMU_EXTN
+	select ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	default y
+	help
+	   This option adds the workaround for the following errata:
+
+	   * ARM Cortex-A715 erratum 2738462
+	   * ARM Cortex-A720 erratum 2738461
+
+	   On affected cores the AMEVCNTR00 counter (AMU core frequency cycles
+	   counter) may continue incrementing while the core remains in WFE
+	   with the clocks being enabled.
+	   This may result in inaccurate counter readings, with the magnitude
+	   of the discrepancy depending on the sampling interval.
+
+	   With this workaround, reads of the affected counter return 0 in
+	   the relevant paths. This causes users of the counter to treat it
+	   as unavailable and is functionally equivalent to firmware disabling
+	   the affected counter.
+
+	   If unsure, say Y.
+
 config ARM64_ERRATUM_2457168
 	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
 	depends on ARM64_AMU_EXTN
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index b20da8b24be3..957917cfab70 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -436,6 +436,18 @@ static const struct midr_range workaround_amu_constcnt_list[] = {
 };
 #endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
 
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+static const struct midr_range workaround_amu_corecnt_list[] = {
+#ifdef CONFIG_ARM64_ERRATUM_2738461
+	/* Cortex-A715 r0p0 - r1p3 */
+	MIDR_RANGE(MIDR_CORTEX_A715, 0, 0, 1, 3),
+	/* Cortex-A720 r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_CORTEX_A720, 0, 0, 0, 1),
+#endif
+	{}
+};
+#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT */
+
 #ifdef CONFIG_CAVIUM_ERRATUM_23154
 static const struct midr_range cavium_erratum_23154_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
@@ -979,6 +991,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		CAP_MIDR_RANGE_LIST(workaround_amu_constcnt_list)
 	},
 #endif
+#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CORECNT
+	{
+		.desc = "Broken AMU AMEVCNTR00 (core cycle counter)",
+		.capability = ARM64_WORKAROUND_BROKEN_AMU_CORECNT,
+		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
+		CAP_MIDR_RANGE_LIST(workaround_amu_corecnt_list)
+	},
+#endif
 #ifdef CONFIG_ARM64_ERRATUM_2038923
 	{
 		.desc = "ARM erratum 2038923",
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b..0e8a9aedb84b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1938,7 +1938,8 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
 		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
 
 		/* 0 reference values signal broken/disabled counters */
-		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
+		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)
+		    && !this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
 			update_freq_counters_refs();
 	}
 }
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 44305b997a02..30a52659f15c 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -389,7 +389,8 @@ static void cpu_read_corecnt(void *val)
 	 * counter read is properly handled as an error case by the users of the
 	 * counter.
 	 */
-	*(u64 *)val = read_corecnt();
+	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
+		      0UL : read_corecnt();
 }
 
 static void cpu_read_constcnt(void *val)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 20cc185649f9..3125695122a0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -133,3 +133,4 @@ WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 WORKAROUND_BROKEN_AMU_CONSTCNT
+WORKAROUND_BROKEN_AMU_CORECNT
-- 
2.43.0


