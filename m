Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YXE9+laI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C9XhD7yt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z6NBWQwq62WMsD9xHHX53MQarN+jYNfx0zd73mIJYDY=; b=YXE9+laIpiHbmi
	FXn2Vd5Z7TE+zbxlE0mOh9QLrD85W9tXNe/5P1VTEXSonUo6sUWvw56dM+UrgwKLBFiePlm24ztZ/
	yXXnQjx56QvyQUzlAsR3hh7rnHYxdqPTMh+DLShwMSE8QT5j36wV/DQ7XhBrSdY1xE1hL+Ud+l8XB
	B+3KymbEERc7q8pR1A+0hbanv/63/1wuBicApEHcM8BaKapbNshhC6uVrMJtLOxGUSGoOrSTz2LbA
	kT75xIWvlEacVgHjB7RjVBs3Apalh7JlmMP98+rLEZehr6U78WFWRB4/+R+JT5TYE+7R5N/EIR6xg
	r3F7JksKZZPx8vZ+COeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7cq-00000006hQQ-2WI5;
	Wed, 11 Nov 2026 12:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7co-00000006hP2-1P00
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529981682;
	Wed, 11 Nov 2026 04:40:22 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.69.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECE893F632;
	Wed, 11 Nov 2026 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794400825; bh=vIBy4XHEmMq+a7WOcp8oCZYM/Nul7OGUwR27Mh+ImGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9XhD7ytu2bt1Kd/DDVg2+++w+Lb4iP/Mr3D6SGS1jz5z0RujlQvZD3ep1BLEMGiY
	 1fkaKMKPt4Jek4kBl1f55PSV9aM67fm0jn4eoVH26eRIVKP9PUhcxm4rKNKspO3bfD
	 0H9vf/UyAED7w713XPS21/hr31GgeRI2gSRUTqBI=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
Date: Wed, 11 Nov 2026 13:39:27 +0100
Message-ID: <20261111124005.2688820-2-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111124005.2688820-1-beata.michalska@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_044026_458557_BF212B8D 
X-CRM114-Status: GOOD (  12.91  )
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

The erratum causing significant inaccuracies in the AMU CNT_CYCLES
counter due to WFI/WFE has been identified in additional
microarchitectures.
Extend the existing workaround to cover these implementations,
which are affected by the following errata:

 - ARM Cortex-A725 erratum 3821522 (SDEN-2832921)
 - ARM Cortex-A720 erratum 4689339 (SDEN-2439421)
 - ARM Cortex-A720AE erratum 4689340 (SDEN-3090091)
 - ARM Neoverse N3 erratum 4689341 (SDEN-3050973)
 - ARM C1-Pro erratum 4689344 (SDEN-3273080)

Cc: stable@vger.kernel.org
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  8 ++++++++
 arch/arm64/Kconfig                          | 12 +++++++++---
 arch/arm64/kernel/cpu_errata.c              |  9 +++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..09fe032e1aea 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -175,6 +175,10 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A720     | #3456091        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720     | #4689339        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A720AE   | #4689340        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
@@ -233,6 +237,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #3456111        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N3     | #4689341        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
@@ -257,6 +263,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Pro          | #4689344        | ARM64_ERRATUM_3821522       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #3683289        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..cf50f3051edc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1086,14 +1086,20 @@ config ARM64_ERRATUM_2645198
 	  If unsure, say Y.
 
 config ARM64_ERRATUM_3821522
-	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
+	bool "Cortex-*/Neoverse-*/C1-*: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
 	depends on ARM64_AMU_EXTN
 	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
 	default y
 	help
-	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
+	  This option adds the workaround for the following errata:
+
+	  * ARM Cortex-A725 erratum 3821522
+	  * ARM Cortex-A720 erratum 4689339
+	  * ARM Cortex-A720AE erratum 4689340
+	  * ARM Neoverse N3 erratum 4689341
+	  * ARM C1-Pro erratum 4689344
 
-	  On affected A725 cores, the CNT_CYCLES event may incur a significant
+	  On affected cores, the CNT_CYCLES event may incur a significant
 	  increment error when entering and subsequently exiting WFx.
 	  As a result, the CNT_CYCLES may diverge from the system counter
 	  frequency at which it is expected to increment.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 38abd123c740..b20da8b24be3 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -420,8 +420,17 @@ static const struct midr_range workaround_amu_constcnt_list[] = {
 	MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_3821522
+	/* Cortex-A720 r0p0 - r0p2 */
+	MIDR_RANGE(MIDR_CORTEX_A720, 0, 0, 0, 2),
+	/* Cortex-A720AE r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_CORTEX_A720AE, 0, 0, 0, 1),
 	/* Cortex-A725 r0p0 - r0p2 */
 	MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
+	/* Neoverse N3 r0p0 - r0p1 */
+	MIDR_RANGE(MIDR_NEOVERSE_N3, 0, 0, 0, 1),
+	/* C1-Pro r0p0 - r1p3 */
+	MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 3),
+
 #endif
 	{}
 };
-- 
2.43.0


