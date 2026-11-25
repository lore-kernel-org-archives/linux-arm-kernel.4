Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eRSbbyJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6WqlIESBGi2Mj5SLPTUypPXaBNmLKW1S4LixEPXMrUg=; b=eRSbbyJ7J2LLzA
	/UOAG1V32R1wE6gQCMIQP8QEesyt5malUBXdiIaq5HrHxkNoHAfxcoOrJPw3IIcCIIzQUiK9dwPo2
	Wl9wHX3aVM8b6PpcGd5/owXeQsMixR+BvvGxJJ7Qft1/fWUtAvsMvLxl8ZXXj1TY4sDzV+sRloz7a
	j9o3T/4SFoGfg0k0HsF8g9+3hUR+7FleXXUx8nKJwTo0u1XAVO8DpjrclPVUvewFqYvZlP++3fmjV
	whhyhW1Qf8EF0Ucu04Pp3ueT0QMxr9D55OAn62mhcMqblLHnYR59SZYjfPMtCynGGD1kPVz7NFvVr
	68gFgIXexRDsn1Lz4j1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3EK-00000008Ge9-3Bpt;
	Wed, 25 Nov 2026 02:59:32 +0000
Received: from buffalo.tulip.relay.mailchannels.net ([23.83.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3E9-00000008GWt-0REY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:22 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6FEF39414F1;
	Wed, 25 Nov 2026 02:59:20 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-96-5-164.trex-nlb.outbound.svc.cluster.local [100.96.5.164])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1F21A942231;
	Wed, 25 Nov 2026 02:59:14 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Well-Made-Bitter: 1bbf9a0f3e03fd0b_1795575560368_3404297731
X-MC-Loop-Signature: 1795575560368:658793710
X-MC-Ingress-Time: 1795575560368
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.5.164 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:20 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dz-0000000BJlE-1of8;
	Wed, 25 Nov 2026 02:59:12 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot
Date: Tue, 24 Nov 2026 20:58:52 -0600
Message-ID: <20261125025852.1160075-3-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025852.1160075-1-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185921_313323_C87D4B03 
X-CRM114-Status: GOOD (  14.25  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With ACTLR.EXTEXCLALL set and the MPU off, a Cortex-M33 sends every
exclusive access to the system's global monitor. The bit resets to 0,
but the Raspberry Pi pico-sdk sets it for its multicore spin locks
(spinlock_set_extexclall() in hardware_sync_spin_lock/sync_spin_lock.c),
so a kernel started by a pico-sdk loader inherits it. On the RP2350,
the PSRAM where the kernel runs is not covered by the global monitor,
so every STREX there fails, and the kernel's atomics, which loop until
STREX succeeds, never finish. The kernel never reaches its console.

The bit only has an effect while the MPU is off (RP2350 datasheet,
ACTLR: "External Exclusives Allowed with no MPU"), so this affects
kernels built without CONFIG_ARM_MPU. With the bit clear, the core
handles exclusives in its local monitor, which is all a uniprocessor
kernel needs. Clear it in a Cortex-M33 setup function before
__v7m_setup, which already sets other state a loader may have changed
(VTOR, the fault enables, the exception priorities).

Tested on an RP2350 board booted by such a loader: without this patch
the kernel hangs before its console; with it, it boots. QEMU does not
model ACTLR, so there it only shows the boot is unaffected.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it wrote the change, the board probe and this changelog,
and ran the QEMU and board tests; I reviewed the reasoning and the test
results.

Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/include/asm/v7m.h |  3 +++
 arch/arm/mm/proc-v7m.S     | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/v7m.h b/arch/arm/include/asm/v7m.h
index 4512f7e1918f..505f75deeea9 100644
--- a/arch/arm/include/asm/v7m.h
+++ b/arch/arm/include/asm/v7m.h
@@ -5,6 +5,9 @@
 #define V7M_SCS_ICTR			IOMEM(0xe000e004)
 #define V7M_SCS_ICTR_INTLINESNUM_MASK		0x0000000f
 
+#define V7M_SCS_ACTLR			IOMEM(0xe000e008)
+#define V7M_SCS_ACTLR_CM33_EXTEXCLALL		(1 << 29)
+
 #define BASEADDR_V7M_SCB		IOMEM(0xe000ed00)
 
 #define V7M_SCB_CPUID			0x00
diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index 6d0532abc086..7d830fa5bf86 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -96,6 +96,16 @@ SYM_FUNC_END(cpu_cm7_proc_fin)
 
 	.section ".init.text", "ax"
 
+/* Cortex-M33: clear ACTLR.EXTEXCLALL so that exclusives use the local monitor */
+__v7m_cm33_setup:
+	ldr	r0, =V7M_SCS_ACTLR
+	ldr	r1, [r0]
+	bic	r1, r1, #V7M_SCS_ACTLR_CM33_EXTEXCLALL
+	str	r1, [r0]
+	dsb
+	isb
+	b	__v7m_setup
+
 __v7m_cm7_setup:
 	mov	r8, #(V7M_SCB_CCR_DC | V7M_SCB_CCR_IC| V7M_SCB_CCR_BP)
 	b	__v7m_setup_cont
@@ -216,7 +226,7 @@ __v7m_cm55_proc_info:
 __v7m_cm33_proc_info:
 	.long	0x410fd210		/* ARM Cortex-M33 0xD21 */
 	.long	0xff0ffff0		/* Mask off revision, patch release */
-	__v7m_proc __v7m_cm33_proc_info, __v7m_setup, hwcaps = HWCAP_EDSP
+	__v7m_proc __v7m_cm33_proc_info, __v7m_cm33_setup, hwcaps = HWCAP_EDSP
 	.size	__v7m_cm33_proc_info, . - __v7m_cm33_proc_info
 
 	/*
-- 
2.43.0


