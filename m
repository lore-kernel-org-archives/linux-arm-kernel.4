Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxPamR/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hsWRqvlnSPIR2F6gY8CRs4jFUdQZq/jxCGYtqXKn8TE=; b=bxPamR/32iEx+8CtDXdSmn9tB9
	siXjjOdo1/evGpl4UKVyTRCnJHUbKFqzGQ6Txta2k/zL8oqIgz8liOT6ASL1glWxRNRamTmyyWUbv
	2BNEhMPvdxaAxDY3wtOHO5xcvJcE/sA/RziCe0Os2uzr8NOCgFITWOEh7F+pdw7VVYXbtzALAyC6s
	qVlsdUuLE1bRBhCBuhOR7KITqbCXDUsbFfYNDu6whWaFym3yqoVT81GNVaEaSRNa7md77vVAw8lAJ
	kdQKTmuC8N6PixU6cEPpzPbgq1E0q7V+IPg3ooWdY2CrG8mLS52ka+a0cgTw4wbD7mPWR7rp1Ph+m
	3x5BGTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Df-00000008GLe-04tT;
	Wed, 25 Nov 2026 02:58:51 +0000
Received: from buffalo.birch.relay.mailchannels.net ([23.83.209.24])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Da-00000008GK0-1L9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:58:48 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 31ADC4019B2;
	Wed, 25 Nov 2026 02:58:04 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-5.trex.outbound.svc.cluster.local [100.96.23.111])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id CD7704012AD;
	Wed, 25 Nov 2026 02:57:58 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Cellar-Cellar: 27dacd100249e60e_1795575483987_1197842351
X-MC-Loop-Signature: 1795575483987:1605370920
X-MC-Ingress-Time: 1795575483987
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.23.111 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:03 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:41714 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Ck-0000000BJbh-1ytC;
	Wed, 25 Nov 2026 02:57:56 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: kees@kernel.org,
	gustavoars@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: xip: end _etext before the read-only data
Date: Tue, 24 Nov 2026 20:56:50 -0600
Message-ID: <20261125025650.1159785-1-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185846_435889_F574A075 
X-CRM114-Status: GOOD (  11.92  )
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

The XIP linker script sets _etext after the read-only data, while
vmlinux.lds.S sets it at the end of the text. Hardened usercopy
refuses any copy to user space from _stext to _etext, so with
XIP_KERNEL=y and HARDENED_USERCOPY=y, copying a const string from
.rodata to user space ends in BUG(). The first readdir() of /dev is
enough:

  usercopy: Kernel memory exposure attempt detected from kernel text (offset 2955300, size 1)!
   __check_object_size from filldir+0xd6/0xfc
   filldir from dir_emit_dots+0x34/0x80

Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
_etext in vmlinux.lds.S for the same reason; the XIP script was
missed. Set _etext at the end of the text there too.

Tested under QEMU (mps2-an385) and on an RP2350 board, both XIP: the
BUG is gone and directories list normally.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the cause of the usercopy report, wrote the fix
and this changelog, and ran the QEMU and board tests; I reviewed the
reasoning and the test results.

Fixes: dfd45b6103c9 ("ARM: uaccess: Enable hardened usercopy")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/kernel/vmlinux-xip.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/vmlinux-xip.lds.S b/arch/arm/kernel/vmlinux-xip.lds.S
index 5afb725998ec..76e024cc50c9 100644
--- a/arch/arm/kernel/vmlinux-xip.lds.S
+++ b/arch/arm/kernel/vmlinux-xip.lds.S
@@ -58,6 +58,8 @@ SECTIONS
 		ARM_TEXT
 	}
 
+	_etext = .;			/* End of text section */
+
 	RO_DATA(PAGE_SIZE)
 
 	. = ALIGN(4);
@@ -71,8 +73,6 @@ SECTIONS
 	ARM_UNWIND_SECTIONS
 #endif
 
-	_etext = .;			/* End of text and rodata section */
-
 	ARM_VECTORS
 	INIT_TEXT_SECTION(8)
 	.exit.text : {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


