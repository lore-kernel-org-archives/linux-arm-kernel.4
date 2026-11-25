Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wq7v6KNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sFfToTjxrXhqjWFslrVSSBXXpw/HKn3njfc1bOFFNxc=; b=wq7v6KNqINWe4T
	Dx+gHazamrjXpxU+FsBThZ5tB1Do6nZX8NMrTRFllDzjzLldk9LgIJvgfrZ7JL6AUTcnWeXralJEF
	M1BEcOmPleGSeQoZli/R1Gi3HEjfEJl6a7UoA8RJGxouwljAsHx7755a+iTgIfXs8+rND1CXRrplf
	E6oe0LuhX3QAMqjiPCpji+61cp8qpgj+McXl6qy9uGbcMPtkmUD6n7CAeNrK0k1PInPh9yRgG6U2u
	aNmdNUgbVIgIKJOk1HEIZucrXr9ZU3XAR2xHcHAO/9lJwm4GYxVKxYQt2sEdtk7Oc7QpM0NOrXoXp
	RUa/R05d+0nboilaIb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3EK-00000008Gdg-2R2B;
	Wed, 25 Nov 2026 02:59:32 +0000
Received: from siberian.tulip.relay.mailchannels.net ([23.83.218.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3E7-00000008GKQ-32Er
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:20 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EF8604164A;
	Wed, 25 Nov 2026 02:58:37 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1F4A34233B;
	Wed, 25 Nov 2026 02:58:36 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Absorbed-Continue: 2c15b09b2671a9ef_1795575517884_2219833327
X-MC-Loop-Signature: 1795575517883:3984899341
X-MC-Ingress-Time: 1795575517883
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:37 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DM-0000000BJhc-37wp;
	Wed, 25 Nov 2026 02:58:34 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ARM: NOMMU: pmsa-v7: Do not probe the region order on M-class
Date: Tue, 24 Nov 2026 20:57:53 -0600
Message-ID: <20261125025757.1159931-2-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185919_828529_EA0F9ABE 
X-CRM114-Status: GOOD (  14.35  )
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

__mpu_min_region_order() finds the minimum region size by writing
0xFFFFFFFC to the region base register and reading it back. That
works on R-class, where the low bits are reserved. On M-class,
MPU_RBAR bits [4:0] are VALID and REGION, so the write selects region
12, which an MPU with fewer than 13 regions does not have. QEMU
(mps2-an385, 8 regions) logs "MPU region out of range 12/8", the
read-back is 0, every RAM region fails, and the kernel panics:

  Kernel panic - not syncing: MPU region initialization failure! -12

Region 12 is outside the permitted values on hardware too. If the write
lands, the read-back returns the current region number in bits [3:0]
(MPU_RBAR, Cortex-M3 Devices Generic User Guide), so the probe returns
order 2 instead of 5. Nothing checks against that, so the bug can go
unseen there.

On M-class the minimum region size is fixed at 32 bytes, so return
that order without probing.

Tested under QEMU (mps2-an385): the kernel now sets up the MPU and
reaches user space. Not tested on PMSAv7 hardware.

This patch was written with an AI coding assistant (Claude Opus 5.5,
Anthropic): it found the bug in review, wrote the fix, the QEMU tests
and this changelog, and ran them; I reviewed the reasoning and the test
results.

Fixes: 9fcb01a9f54c ("ARM: 8711/1: V7M: Add support for MPU to M-class")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Hawthorne <brad@sim.vu>
---
 arch/arm/mm/pmsa-v7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
index 59d916ccdf25..a20a43867210 100644
--- a/arch/arm/mm/pmsa-v7.c
+++ b/arch/arm/mm/pmsa-v7.c
@@ -341,6 +341,10 @@ static int __init __mpu_min_region_order(void)
 {
 	u32 drbar_result, irbar_result;
 
+	/* On M-class, writing MPU_RBAR selects a region; the minimum is 32 bytes */
+	if (IS_ENABLED(CONFIG_CPU_V7M))
+		return 5;
+
 	/* We've kept a region free for this probing */
 	rgnr_write(PMSAv7_PROBE_REGION);
 	isb();
-- 
2.43.0


