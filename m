Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CPy3l3VA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WW3kvaeG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1sqIuqvMzVFwYcFFuvB/apl5px1GCvknNh/xIFDj1SY=; b=CPy3l3VAU/KSX6
	Tnv9xCdpZoFDZzzdFdRBoqDyRAxxv2eUsXWOeG+dkTSdq4TnPCme8h7i9RZGoa7KYLWkwdfu8rKyd
	HaPk3DVJXM6S2JBwt49Y/h0pWfdcFXXIgmlKX4GCcbRnSmwSlC0ah7aMvIehm+dOj0l2ClEfbcIKr
	E+aDzMyLBnpFjdanzXTUi5wIpYi/McPpMNBkq8bCNST81F42Pie5W5MbEc/K+hi74wz1im2EIGlgi
	ZC3R/DanVf9ZIQ37zs9C/kaM0nlYfASuQ1zjDUYqbvQeTQ5qt1osJeVUH299vBir908gSBmd1kc8x
	Hg8zmi3bstN5PsVgOKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc7-0000000DEAt-1GlG;
	Fri, 13 Nov 2026 14:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc0-0000000DE5G-1DN4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:50:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6493C152B;
	Fri, 13 Nov 2026 06:50:38 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E4B73F673;
	Fri, 13 Nov 2026 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581441; bh=9SQUwLMIpYjcJX0oV2YKzFqBcvrlXidnGf8kMaWOSRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WW3kvaeG9n4NBPABbem1UbMv99+oSVaMw1U5+oBv4pPoupwTYXe4OMAfkgLFyHtVN
	 GMCpq55Y+7ITdds5C+fDgP25eWxbVe0cI9jU1dh8LTjbZjt+rTmIJpiWLr5UvLYq/K
	 FA1QCBM924D3Nf9NnWkqCzQD1gQPXaZba0GJw8zU=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/6] arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list
Date: Fri, 13 Nov 2026 14:50:16 +0000
Message-ID: <20261113145022.2592454-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065044_389823_B34D1F19 
X-CRM114-Status: GOOD (  10.93  )
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

Cortex-X4 erratum 3043263 can cause a load or store to livelock when
mapping size changes without break-before-make or when contiguous hints
are programmed inconsistently.

The erratum was previously reported as fixed in r0p3. On that basis,
commit 5aa4b625762e ("arm64: Add BBM Level 2 cpu feature") added
Cortex-X4 from r0p3.

The updated Cortex-X4 SDEN v13, dated 18 June 2026, lists r0p0, r0p1,
r0p2 and r0p3 as affected and the erratum as open.

Remove the entry so Cortex-X4 observes break-before-make, and record the
workaround in the silicon errata registry.

Cc: stable@vger.kernel.org
Link: https://support.arm.com/documentation/109148/13-0/?lang=en
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/kernel/cpufeature.c              | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 9ad965d3e1ea..9d6d13045a55 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -201,6 +201,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #4193786        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X4       | #3043263        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #3194386        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #4118414        | ARM64_ERRATUM_4118414       |
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b15619690f42..8819652a67ed 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2011,7 +2011,6 @@ bool cpu_supports_bbml3(void)
 {
 	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
 	static const struct midr_range supports_bbml3_list[] = {
-		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
-- 
2.43.0


