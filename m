Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuGN22gq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EqZAqUEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yWSjcEYYlYAmdYuP3+fGqSKyGg+3xIkQlvbIfZyBFiU=; b=zuGN22gqtgIAw/
	IG0+r+6lPlLJnXaFtVfiesbCeCvHIljvuGyfArc9zPAhCLaZMYgcui+PuyKcfw4EY5citgZMtkKf5
	gSFt4EeUdFg3me3yoiEYrZ/aVB6huDEuewb/pKJ1bIRHQaFWVEuIehUSGKuBosWB2vllB4anQXVFM
	fWO8cJgoCnU0TJ4yh6nTUncJO50AUEnQbKlXDa9s1+rWnpxXxHkIYsUUwdA4SGQDTsk9hFVH5KVa9
	10k4ljhThgC8RvGRSYKc6sF+/w5Ljh6F6LmInkyuJKe7c1GCnapdNhuJkYEnrVwrWBVVoR7zuMxvS
	bWsL7QANMDg3dB6V7u4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcg-0000000GiJ9-3lzZ;
	Fri, 27 Nov 2026 15:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcR-0000000GiBy-1ysf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25EEF1D70;
	Fri, 27 Nov 2026 07:12:08 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB073F632;
	Fri, 27 Nov 2026 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792330; bh=DwvUUy/1RnTz32AMXT9X1m9COrhuDJWS/hb3hMlp0EI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqZAqUEXaiLOKoLyqRWfagrkndJyfcIuB8FwEUgbQhXo0mhkIxh+0BD4uHfeSJcSp
	 Jb5xkD02VPXbt2uZxgD3SoqN6ESfkqI5jrmF4WRKTTHx73i3hv+0S6CPqscvqqc07i
	 2cbOXIyNLWBQhVuui8mK9LWAloP1DVS304uZJd2U=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: cpufeature: Document BBML3 exclusions
Date: Fri, 27 Nov 2026 15:11:55 +0000
Message-ID: <20261127151157.406111-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127151157.406111-1-ryan.roberts@arm.com>
References: <20261127151157.406111-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071211_605508_D8915DA4 
X-CRM114-Status: GOOD (  12.62  )
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

Several CPUs advertise BBML2 and are known never to raise a conflict
abort, but cannot safely use the BBML3 no-abort semantics because of
hardware errata. Omitting their MIDRs from the allow list hides the
reason for the exclusion and makes it difficult to tell whether a CPU
has simply not been added yet.

Document the excluded CPUs and their erratum numbers above
supports_bbml3_list[]. Record the errata in silicon-errata.rst with N/A
Kconfig entries.

Keep C1-Ultra and C1-Premium enabled from r1p1, where erratum 3683289 is
fixed. Also explain that Cortex-A510 can generate conflict aborts and
therefore does not meet the BBML3 requirements, independently of errata.

Link: https://support.arm.com/documentation/109180/13-0/?lang=en
Link: https://support.arm.com/documentation/111077/10-0/?lang=en
Link: https://support.arm.com/documentation/111078/10-0/?lang=en
Link: https://support.arm.com/documentation/111287/10-0/?lang=en
Link: https://support.arm.com/documentation/SDEN-2055130/18-0?lang=en&rev=18.0
Link: https://support.arm.com/documentation/SDEN-2332927/13-0?lang=en&rev=13.0
Link: https://support.arm.com/documentation/SDEN-1775101/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1775100/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1982442/21-0?lang=en&rev=21.0
Link: https://support.arm.com/documentation/SDEN-1401781/23-0?lang=en&rev=23.0
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 16 ++++++++++++++
 arch/arm64/kernel/cpufeature.c              | 23 ++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index bffaa46c664b..64ad29d00243 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -159,6 +159,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78C     | #4193794        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A710     | #3696244        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2054223        | ARM64_ERRATUM_2054223       |
@@ -197,6 +199,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1C      | #4193792        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X2       | #3696244        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2224489        | ARM64_ERRATUM_2224489       |
@@ -205,6 +209,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #4193788        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X3       | #3696239        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #3324335        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #4193786        | ARM64_ERRATUM_4118414       |
@@ -215,6 +221,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #4118414        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X925     | #3043240        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #3324334        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #4193781        | ARM64_ERRATUM_4118414       |
@@ -231,6 +239,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #4193800        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N2     | #3696250        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2139208        | ARM64_ERRATUM_2139208       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2067961        | ARM64_ERRATUM_2067961       |
@@ -245,12 +255,16 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #4689341        | ARM64_ERRATUM_3821522       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V1     | #3696285        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #4193790        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V2     | #3696242        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #3324336        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #4193787        | ARM64_ERRATUM_4118414       |
@@ -279,6 +293,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C2-Ultra        | #4196850        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #841119,        |                             |
 |                |                 | #826419,        |                             |
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a8a1a73ba1b8..710d44a30d29 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2010,7 +2010,28 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 
 bool cpu_supports_bbml3(void)
 {
-	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
+	/*
+	 * CPUs that support BBML3 but don't advertise through ID_AA64MMFR2_EL1.
+	 *
+	 * The following CPUs advertise BBML2 and are known not to raise
+	 * conflict aborts, but are excluded because of errata that can cause a
+	 * load or store to livelock when changing mapping size without
+	 * break-before-make:
+	 *
+	 *   3043240: Cortex-X925
+	 *   3043263: Cortex-X4
+	 *   3053180: Neoverse-V3 and Neoverse-V3AE
+	 *   3683289: C1-Ultra and C1-Premium (before r1p1)
+	 *   3696239: Cortex-X3
+	 *   3696242: Neoverse-V2
+	 *   3696244: Cortex-A710 and Cortex-X2
+	 *   3696250: Neoverse-N2
+	 *   3696285: Neoverse-V1
+	 *   4196850: C2-Ultra
+	 *
+	 * Cortex-A510 also advertises BBML2 but can generate conflict aborts,
+	 * independently of errata, so it does not meet the BBML3 requirements.
+	 */
 	static const struct midr_range supports_bbml3_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
-- 
2.43.0


