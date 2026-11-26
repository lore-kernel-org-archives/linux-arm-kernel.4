Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B021E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ieptf3Xc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fxS1z5mg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h5GiJCNwUXIWcpQEzRIOQ92oxBIUY5kMYfK9T+/jm2k=; b=Ieptf3Xcw1ctNk
	W7CV0UmkghBZiwyw9oqanSVkHqeP2Bi1+BBOaLjl3pPXMabwYxwFuAi5FclLrsmPDd/J8Hsviv58l
	SZ4EeiOYiK45YpizOJZmTe/BA/b13mXY4AIi7AUVOnLuOWi/60fUv9HpVnEeiF9EIJwy69RFuoxCB
	sf4Qr44NP13EGBcXwvzjxHPgD69tYeyK0lzX7iT64McGGOtFMFiIVtXBxYmJRO2aiO91LpeNi45FD
	Y+klv+RRiHqFdleX5//kqvGau4gmU/MTxWWo290bqmB8BhCdNzHJyCr9T1bGf1b3KTKEK24Y0egHn
	mz+s71GoJvk7Q+Ii+86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzY-0000000D3uo-2izc;
	Thu, 26 Nov 2026 11:50:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzT-0000000D3se-2tFa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 373251D13;
	Thu, 26 Nov 2026 03:50:12 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C66FE3F632;
	Thu, 26 Nov 2026 03:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693815; bh=qGBo7r4JAWAjdtqdXgMLeYhrT+7MnCHRFBKY0iTyxLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxS1z5mgYeDIlmna6ZpMBnIbhLzYQ4toGwzuedeoRjciWNZAnNrHYgpZFVk4eCNAF
	 SuBJ0xCT/K6P//3GJj0Q22wzYgrRckSvPZi8Qupnb3eiFcRDtJ0dvEFQDPkSjGRs4w
	 B7cLqSdsiza7exCocHzLBLHmt0CHyaKygErPJpDE=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 02/13] arm64: boot: Handle TLBID boot requirements
Date: Thu, 26 Nov 2026 11:49:25 +0000
Message-ID: <20261126114936.864256-3-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035015_803592_88833444 
X-CRM114-Status: GOOD (  10.44  )
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

To use FEAT_TLBID, some configuration is necessary at EL3 and EL2. This
patch documents the requirements and adds the initial EL2 setup code,
which enables the kernel to access the TLBIDIDR_EL1 register at EL1.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 Documentation/arch/arm64/booting.rst | 10 ++++++++++
 arch/arm64/include/asm/el2_setup.h   | 10 +++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dae5ff9fae26..752917bf62c3 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -569,6 +569,16 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
 
+  For CPUs with TLBI domains (FEAT_TLBID):
+
+  - If EL3 is present and the kernel is entered at EL2:
+
+    - SCR_EL3.VTLBIDEn (bit 56) must be initialised to 0b1.
+
+  - If EL2 is present and the kernel is entered at EL1:
+
+    - HFGRTR2_EL2.nTLBIDIDR_EL1 (bit 30) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 12a500181291..1521c9965ae3 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -448,7 +448,15 @@
 .Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x2
-	msr_s   SYS_HFGRTR2_EL2, xzr
+
+	mov	x0, xzr
+	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
+	ubfx	x1, x1, #ID_AA64MMFR4_EL1_TLBID_SHIFT, #ID_AA64MMFR4_EL1_TLBID_WIDTH
+	cbz	x1, .Lskip_tlbid_\@
+	orr	x0, x0, #HFGRTR2_EL2_nTLBIDIDR_EL1
+
+.Lskip_tlbid_\@:
+	msr_s   SYS_HFGRTR2_EL2, x0
 	msr_s   SYS_HFGWTR2_EL2, xzr
 	msr_s   SYS_HFGITR2_EL2, xzr
 .Lskip_fgt2_\@:
-- 
2.43.0


