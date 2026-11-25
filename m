Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16106606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMtK/Ywk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j7/TU3r0M5ErrnkAaeYvU8NA1oSeaB9TmwP0o8jjlrM=; b=mMtK/Ywkuu7M/g
	A0lt+Cwet6t1uEme2Ll/+uA13FKxmxoCGDP681TvNHSiWnzV/mbKsaGy/9TBI9Djv6sg+EPc+W1fl
	lTCcpEoIVAJb6AwdCgGMxP70dyQUkpbhvxPHxfK5/6/j02apFocQw/L00B/EzKMtUPBxeKAzaDXlB
	zeGcW6AkFo1ZeaMMldsB+970qnB9f5i8mc8N67FWegWMH3ifksuqM7EYA4NpMpa2G4dSA4pav3pjA
	X/an1n7pzfU7JaQgluT8EA/BiSvQnG5hhYfcKIoAh3zWJq0NzUDvWbeoNHaQ11zV0DFafvYKG/Wwt
	w/MglwdOLXSkPUZJNTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dn-00000008GNK-3fJl;
	Wed, 25 Nov 2026 02:58:59 +0000
Received: from slateblue.cherry.relay.mailchannels.net ([23.83.223.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dc-00000008GL1-1gf5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:58:50 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A4C85800FEF;
	Wed, 25 Nov 2026 02:58:47 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-blue-0.trex.outbound.svc.cluster.local [100.103.208.39])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id CD4D280095A;
	Wed, 25 Nov 2026 02:58:46 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Suffer-Bitter: 0819c53e3d6c5705_1795575527587_537115737
X-MC-Loop-Signature: 1795575527587:2532055056
X-MC-Ingress-Time: 1795575527587
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.208.39 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:47 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DX-0000000BJhc-0biL;
	Wed, 25 Nov 2026 02:58:44 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ARM: NOMMU: pmsa-v7: Fix off-by-one in mpu_setup_region()
Date: Tue, 24 Nov 2026 20:57:55 -0600
Message-ID: <20261125025757.1159931-4-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185848_890518_E8E065DD 
X-CRM114-Status: GOOD (  12.43  )
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

mpu_setup_region() rejects "number > mpu_max_regions", which lets
number == mpu_max_regions through. Regions are numbered from 0, so
that number names a region the MPU does not have. Reject it too.

Now that allocate_region() respects its limit, no caller passes that
number. Tested under QEMU (mps2-an385): no change in behaviour.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 5ad7dcbe40ae ("ARM: mpu: add MPU probe and initialisation functions in C")
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index f2ad0f3ff480..af0c71135a6e 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -371,7 +371,7 @@ static int __init mpu_setup_region(unsigned int number, phys_addr_t start,
 	u32 size_data;
 
 	/* We kept a region free for probing resolution of MPU regions*/
-	if (number > mpu_max_regions
+	if (number >= mpu_max_regions
 	    || number >= MPU_MAX_REGIONS)
 		return -ENOENT;
 
-- 
2.43.0


