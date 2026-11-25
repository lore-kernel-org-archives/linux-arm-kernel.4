Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7265606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uV1w22NA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5ibFZ+i+ymLK1m6DwZvihMaR247fHo0RA4dE4rRYq+M=; b=uV1w22NAQAYLn4
	SPkH55SlqB8OivuNe1Br/exl77x9WNV7J2fJMW4QF+p+DKubxPLDUplMS+6WTIgNKtfdiB12UAu8a
	d0lN49b+1d6mGBmUWG5KvCr4dvgTI/ah8rI3VEGv/+7TJJ/sGmU8aoK5R7zWEkKqLeQJo/cW0Bjxq
	G5adP4MTZj5ehPKS6WTudX/ISCjCtdF+v3F60A+JReSUtR2G0sHtljg7dDjECIuMjwIcgpD/+QTLm
	/JcgAuVbtK9NWbydHJ79McXnO/DdiTbYxMOyiFzLhehGgfH8vwrO9SLjkA3Vnfx6HiCk2JpnArgPn
	D7eEBCCxqHYLv/2jJCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3EK-00000008GdO-1uQ6;
	Wed, 25 Nov 2026 02:59:32 +0000
Received: from purple.birch.relay.mailchannels.net ([23.83.209.150])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3E1-00000008GSL-3OEo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:15 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0B4E442336;
	Wed, 25 Nov 2026 02:59:13 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-6.trex.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id C692340D72;
	Wed, 25 Nov 2026 02:59:11 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Decisive-Lonely: 4b1ed81d566136a0_1795575552955_4153679430
X-MC-Loop-Signature: 1795575552955:3972808987
X-MC-Ingress-Time: 1795575552955
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:12 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dw-0000000BJlE-0VWx;
	Wed, 25 Nov 2026 02:59:09 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: v7m: clear CONTROL.FPCA before the boot SVC
Date: Tue, 24 Nov 2026 20:58:51 -0600
Message-ID: <20261125025852.1160075-2-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025852.1160075-1-brad@sim.vu>
References: <20261125025852.1160075-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185913_988049_A698496C 
X-CRM114-Status: GOOD (  11.41  )
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

__v7m_setup writes CONTROL only after the SVC it uses to enter Handler
mode. If the boot loader ran FP code, CONTROL.FPCA can still be set,
so the SVC stacks an extended frame, and its EXC_RETURN has FType
clear. Since commit 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only
bits in EXC_RETURN we are really care of"), that EXC_RETURN is saved in
exc_ret, which every return to user space uses, so each return expects
an extended frame that ret_to_user never builds. init then starts with
a corrupted stack.

Write CONTROL to its reset value, 0, before the SVC. That clears FPCA,
and also selects the main stack, which the code after the SVC reads.

Tested under QEMU (mps2-an505) with a boot shim that runs a VMOV
before jumping to the kernel: without this patch init loses its
arguments; with it init starts with them. It also boots on an RP2350
board.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it wrote the change, the boot shim and this changelog, and
ran the QEMU and board tests; I reviewed the reasoning and the test
results.

Fixes: 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only bits in EXC_RETURN we are really care of")
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/proc-v7m.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index d4675603593b..6d0532abc086 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -124,6 +124,11 @@ __v7m_setup_cont:
 	mov	r5, #0x00800000
 	str	r5, [r0, V7M_SCB_SHPR3]	@ set PendSV priority
 
+	@ Clear CONTROL: a boot loader may leave FPCA or SPSEL set
+	mov	r5, #0
+	msr	control, r5
+	isb
+
 	@ SVC to switch to handler mode. Notice that this requires sp to
 	@ point to writeable memory because the processor saves
 	@ some registers to the stack.
-- 
2.43.0


