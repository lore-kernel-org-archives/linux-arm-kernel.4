Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4712606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1lcfKT8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sD/x8pLtICCIXulyBkBw9O/tAVZvYw5qRUU4uo3qJbk=; b=1lcfKT8u/GwLol
	dBugR0vIi0yi9HgYwQZcCjaOgq4s92hpBTJ5vX6hZYcN6X1CINpZjLlOYX138FDDDPjgoKbNM3cCQ
	jNiiMNB2ghM+6RhwajRR25X06DEcfsGGurFE5gTdOlhrfWxbjyxb6IaxgF3C8bjAipwCnontNggGX
	pVk212YdJaEFtZHSDlIfrPck/jnTg0miqj6yIrBcdz7wHmhLHRCXsFGaUdK7SSngFrcrCphVoBKcj
	wbyQsnOAL8OOO9x4KySKuVkGrbByOSrKP6AHX39MEUDepKazq4kvqIIW3ICvoVpKlFfo0sT7H8LD0
	L4jr7sL9etdU8aRyegrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dn-00000008GNU-44jr;
	Wed, 25 Nov 2026 02:58:59 +0000
Received: from seashell.cherry.relay.mailchannels.net ([23.83.223.162])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dg-00000008GLg-0ZnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:58:53 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 79E96940E05;
	Wed, 25 Nov 2026 02:58:51 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-103-201-208.trex-nlb.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 89EE794166F;
	Wed, 25 Nov 2026 02:58:50 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Chemical-Print: 0936585d1c6aa1ec_1795575531402_1462623305
X-MC-Loop-Signature: 1795575531402:1731359401
X-MC-Ingress-Time: 1795575531402
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:51 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Da-0000000BJhc-3Y5O;
	Wed, 25 Nov 2026 02:58:48 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ARM: NOMMU: pmsa-v7: Align a split region's base to its size
Date: Tue, 24 Nov 2026 20:57:56 -0600
Message-ID: <20261125025757.1159931-5-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185852_260797_9F778330 
X-CRM114-Status: GOOD (  14.77  )
X-Spam-Score: -0.6 (/)
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

try_split_region() masks the base with size - 1, which aligns it only
when size is a power of two, then rounds the region size up without
aligning the base again. An MPU region's base must be aligned to its
size. For memory at 0x21400000 + 0xa00000, the kernel asks for a 16MB
region at 0x21400000. QEMU ignores such a region. Hardware that
ignores the low bits would map 0x21000000-0x219fffff and leave
0x21a00000-0x21dfffff, which the kernel uses, unmapped.

Start from the size rounded down to a power of two, align the base to
it, and double it until the aligned region covers the request.

Tested under QEMU (mps2-an385) with that memory layout: QEMU no longer
reports a misaligned region, and the kernel boots to user space. Not
tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index af0c71135a6e..bd776ea90934 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -146,13 +146,19 @@ static inline unsigned long irbar_read(void) {return 0;}
 static bool __init try_split_region(phys_addr_t base, phys_addr_t size, struct region *region)
 {
 	unsigned long  subreg, bslots, sslots;
-	phys_addr_t abase = base & ~(size - 1);
-	phys_addr_t asize = base + size - abase;
-	phys_addr_t p2size = 1 << __fls(asize);
-	phys_addr_t bdiff, sdiff;
-
-	if (p2size != asize)
+	phys_addr_t p2size = 1 << __fls(size);
+	phys_addr_t abase, asize, bdiff, sdiff;
+
+	/* The base must be aligned to the region size */
+	for (;;) {
+		abase = base & ~(p2size - 1);
+		asize = base + size - abase;
+		if (asize <= p2size)
+			break;
 		p2size *= 2;
+		if (!p2size)
+			return false;	/* would need a 4GB region */
+	}
 
 	bdiff = base - abase;
 	sdiff = p2size - asize;
-- 
2.43.0


