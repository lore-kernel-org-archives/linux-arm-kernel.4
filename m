Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HZwlzMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cs/bIuj6faZHY2+m+7Lb05sSFQmd4u7K9KRN4ncXS8k=; b=3HZwlzMUQD3sJP
	QS3yvchRO95XAsmVLy3offwNiduKrMkSOLzKVjGp086WOA/QOEhNyxBfTIqUf5dTR7ayrZnfOb64P
	YimHfSKOpgWBz/iHp3XmV8hj2GiKJCzAiSPdILvzUe+vsKHekFyb2YldhDhAbVpXAEE1D87WjwWIS
	0mwofHnuRoerN2jUdZmO5VNixLoALLT4nuMS4YzXbS8DjircYjcPFsiOgnAmIF8QqeCpqeflPl+MW
	Zxds5micU6JDEV4rNP7sDoGzrookgtxAXFEy/R7bjysgktYHn3XuZ/+yEJDk3IiCYU4Bb1RkpDnPG
	aq+jgTBXA0dHoAWLiTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3EK-00000008GeK-3nYs;
	Wed, 25 Nov 2026 02:59:32 +0000
Received: from flamingo.ash.relay.mailchannels.net ([23.83.222.60])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3ED-00000008GKV-3wWa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:27 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B8989801067;
	Wed, 25 Nov 2026 02:58:43 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id DB25C800291;
	Wed, 25 Nov 2026 02:58:42 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Chief-Troubled: 161335d910f9261a_1795575523645_3815192862
X-MC-Loop-Signature: 1795575523645:1737345223
X-MC-Ingress-Time: 1795575523645
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:43 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DS-0000000BJhc-2TQ7;
	Wed, 25 Nov 2026 02:58:40 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions than the limit
Date: Tue, 24 Nov 2026 20:57:54 -0600
Message-ID: <20261125025757.1159931-3-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185926_124116_8BB612CE 
X-CRM114-Status: GOOD (  12.90  )
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

allocate_region() checks "count > limit" only after it has filled
regions[count], so it can return one region more than the limit. The
caller passes the number of MPU regions left for RAM, so the setup
then programs a region the MPU does not have. Under QEMU (mps2-an385,
8 regions) with a memory node of 0x21000000 + 0x9f9000, which needs
more regions than are left, QEMU logs "MPU region out of range 8/8"
and the kernel reports:

  Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 9 of 8 regions

Stop allocating once the limit is reached, so the memory that does not
fit is truncated, as intended.

Tested under QEMU (mps2-an385): the same case now truncates memory and
boots to user space. Not tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index a20a43867210..f2ad0f3ff480 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -193,7 +193,7 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
 	phys_addr_t diff = size;
 	int attempts = MPU_MAX_REGIONS;
 
-	while (diff) {
+	while (diff && count < limit) {
 		/* Try cover region as is (maybe with help of subregions) */
 		if (try_split_region(base, size, &regions[count])) {
 			count++;
@@ -215,9 +215,6 @@ static int __init allocate_region(phys_addr_t base, phys_addr_t size,
 			size = asize < p2size ? asize + 1 : p2size + 1;
 		}
 
-		if (count > limit)
-			break;
-
 		if (!attempts)
 			break;
 
-- 
2.43.0


