Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F041606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O3M1xrNx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dT+YVzFn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5O0auP4jitpbItZztn3RS4SvBnW87g5weMpMzD5R8eQ=; b=O3M1xrNx7rK6xK
	b5JpC31IvJ3CVrYpA6W/HmTjnQCLWcrWxgFxppC3/YQ3cxXNm0zdKJ3n/FR5mLHxp9yI1BOLcgxyA
	Pd6m8PuSgTKu/0Tl8rckwGASuZrEwVd2Owy69TcnigplhZ9Bhou/lqLmKI+6LWdD9km+kbOtmpbrA
	/jZFPUN6vCTpgTJB7x3eAaK37IaVPCMSUEeMLerYw+KQZ0j7/xZCrtsAWKTrs5Sf9xpLiEUqCFm7i
	xY5S7Oi3LhVSCma0KNp2Dolm5DpcxQO3ocC8Am2GpreedfEP64n8lSklCXEkOFxzH9THxch/cngEA
	qlFNbIh2XmsFx3IpoHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc7-0000000DEBD-1pLe;
	Fri, 13 Nov 2026 14:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc1-0000000DE5C-0OFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:50:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43A31516;
	Fri, 13 Nov 2026 06:50:36 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6423F673;
	Fri, 13 Nov 2026 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581439; bh=8sH6OWzawGkWhFlM6CLsdZvyw+UZgXwwEVjUcXVsOGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dT+YVzFnfF27iG8kpym2vzxt8yjMknCqDWB/v2AXQJCBIsDPGpSIbSRMpEki2lyeO
	 yyTG9oV5OvUyHKJbbBVp9/JlbYYIahUW4+6bXLUsjVH7eeDS5Pa61HfTlDVK4gZvCj
	 +U2K3KjTYqPLOScnEf6K7fMKAnm8EOe59dbYj+4g=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/6] arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
Date: Fri, 13 Nov 2026 14:50:15 +0000
Message-ID: <20261113145022.2592454-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065045_216786_F701FDA5 
X-CRM114-Status: GOOD (  10.26  )
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

Neoverse-V3 and Neoverse-V3AE erratum 3053180 can cause a load or store
to livelock when mapping size changes without break-before-make or when
contiguous hints are programmed inconsistently.

The erratum was previously reported as fixed in r0p2. On that basis,
commit 5aa4b625762e ("arm64: Add BBM Level 2 cpu feature") allowed
Neoverse-V3 from r0p2, and commit 8fca3852e33d ("arm64: cpufeature: add
Neoverse-V3AE to BBML2 allow list") did the same for Neoverse-V3AE.

The updated SDENs, MP168 v11 for Neoverse-V3 and MP172 v12 for
Neoverse-V3AE, dated 9 June 2026, list r0p0, r0p1 and r0p2 as affected
and the erratum as open. There is no fixed revision on which to base
either allow-list entry.

Remove both entries so these CPUs observe break-before-make, and record
the workaround in the silicon errata registry.

Cc: stable@vger.kernel.org
Link: https://support.arm.com/documentation/109231/11-0/?lang=en
Link: https://support.arm.com/documentation/109704/12-0/?lang=en
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 4 ++++
 arch/arm64/kernel/cpufeature.c              | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..9ad965d3e1ea 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -243,10 +243,14 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #4193787        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3     | #3053180        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #4193784        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3AE   | #3053180        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b..b15619690f42 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2012,8 +2012,6 @@ bool cpu_supports_bbml3(void)
 	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
 	static const struct midr_range supports_bbml3_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
-		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
-		MIDR_REV_RANGE(MIDR_NEOVERSE_V3AE, 0, 2, 0xf),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
-- 
2.43.0


