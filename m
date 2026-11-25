Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9009C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cX9IME1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vAJIlDWHhJKjOBp1fKBB7WxI11xs4f93y+8hxs8OBfM=; b=cX9IME1eRmDRH3
	R1UlLCulzcGcORfRpIsIP2kQHC6A254iGuGxgUH+YJN9KkvynOEYUJwLJBfT/FrJdKLP5xpyOFALz
	1Zx6ADXNM02zEsqeg/cromSPDFs7oMCV5vV8Br8bBuUtms4B/bjxflqcJw6pBoigwdQhVvY5hfovq
	l8/H9pD1s0PlWuxbNWjUTCrRzW8PNhhgo6zIp5nyfC0A4CZ9YBidSwEoEpbFweU1yKMdlVgZhz9YQ
	eUS4/MKLV5ROIB3/mMasRAdbYbJ1dzt3zpcDEOGtbkbW94z94rkAsEG09n9uMAs+uhPAgk68Dao+6
	zGUX4g6MsGhJv5SufIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3E3-00000008GT3-0bWM;
	Wed, 25 Nov 2026 02:59:15 +0000
Received: from slateblue.cherry.relay.mailchannels.net ([23.83.223.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dn-00000008GN3-2ZYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:00 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E7677461900;
	Wed, 25 Nov 2026 02:58:58 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-6.trex.outbound.svc.cluster.local [100.103.201.208])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id E68C34606F4;
	Wed, 25 Nov 2026 02:58:53 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Shelf-Hysterical: 4f994290693785d2_1795575538851_2743873970
X-MC-Loop-Signature: 1795575538851:3108965944
X-MC-Ingress-Time: 1795575538851
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.201.208 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:58 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dd-0000000BJhc-46LL;
	Wed, 25 Nov 2026 02:58:51 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ARM: NOMMU: pmsa-v8: Fix off-by-one in __pmsav8_setup_region()
Date: Tue, 24 Nov 2026 20:57:57 -0600
Message-ID: <20261125025757.1159931-6-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185859_715909_12B4FBCA 
X-CRM114-Status: GOOD (  13.14  )
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

__pmsav8_setup_region() rejects "number > mpu_max_regions", which lets
number == mpu_max_regions through. Regions are numbered from 0, so
that number names a region the MPU does not have. Reject it.

A Cortex-M33 can be built with 4 regions. Under QEMU (mps2-an505) with
a 4-region MPU, QEMU logs "MPU region out of range 4/4" and the kernel
takes an unhandled exception during the setup. With this patch the
setup warns "MPU region initialization failure! -2" and the kernel
faults later, in memblock_alloc_try_nid(), because RAM that region
would have mapped has none. On an RP2350 board (Cortex-M33, 8 regions)
the boot is unchanged.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests,
the board test and this changelog, and ran them; I reviewed the
reasoning and the test results.

Fixes: 046835b4aa22 ("ARM: 8757/1: NOMMU: Support PMSAv8 MPU")
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pmsa-v8.c b/arch/arm/mm/pmsa-v8.c
index 28cdc5468406..e5353a030731 100644
--- a/arch/arm/mm/pmsa-v8.c
+++ b/arch/arm/mm/pmsa-v8.c
@@ -140,7 +140,7 @@ static int __init __mpu_max_regions(void)
 
 static int __init __pmsav8_setup_region(unsigned int number, u32 bar, u32 lar)
 {
-	if (number > mpu_max_regions
+	if (number >= mpu_max_regions
 	    || number >= MPU_MAX_REGIONS)
 		return -ENOENT;
 
-- 
2.43.0


