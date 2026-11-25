Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7B0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwU4ok4k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Bn9wcGTO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fk7nJXxJFLmiwoCypaRQUIjeIoYCMrQUBCirL/0Tp8s=; b=EwU4ok4kuSlUPeM1f9cihU6mpY
	E7A9QTPye7SdCJCj6NE698qxjot4pZNyx5/4jTiUrPMUMifaxVPJ21u8Nt4XAW5grD0iPGGMBv3To
	TwKRELHaeev6l+DzmhVbnUNY1TIzQWCqhdWUsxKcRmP75qWy6ELtZrl33ZMv6hLQ+h2NrnnFj404p
	m1sn0XX7Ryflg1XahzESI5OcTjL8G6p/kqJw6/eX0Rtke6Y+QAmxVrpm0zeRao12dSsfnuKH2t83Q
	bm3DB9+Jdn/S4Blfkto6QhJax8KQP0TMDb1jVvdPCqj3MPiCOOcwHkQj6vuiL4a/hGv5MX5N9rIPh
	qv9hHnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Fg-00000008H68-0sXX;
	Wed, 25 Nov 2026 03:00:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Ff-00000008H5o-1Fsn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 03:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Fk7nJXxJFLmiwoCypaRQUIjeIoYCMrQUBCirL/0Tp8s=; b=Bn9wcGTOBmGILFMOuDbrvfu0jV
	hNEnISVTe5qjGDukTNRF9pil7OymioEoRwkBHKQUQ+N8ajiEGzl/g4mIvvJQ+mtuO4aTJRh6ofs72
	ryzMbq/qD/0b7FdoH9dtf7iwtSQsFBpGXodgeEFkx928P7COA5Ot1ZpajgEdUUw2pGkKoPG3WmQ/s
	vmFdu+XI5N8ay12hhElHl3bM5AgcaWBm5r7sf+oX8rrXvyhNJIz1Rf+tFS0oqK7RoCEBCeHQJ/9gT
	mWJyjneDPkoUYWfK2PfxKXBdUBq68ns+VZxm5d00Vcy1XqGZTKcJC7sNFXEIdZdmx8roO8OD9BuOH
	SJ3WrxMQ==;
Received: from quail.birch.relay.mailchannels.net ([23.83.209.151])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Fb-00000004mjP-28Jd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:00:53 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1C23238153C;
	Wed, 25 Nov 2026 02:58:33 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (trex-green-2.trex.outbound.svc.cluster.local [100.96.4.162])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1D18238134F;
	Wed, 25 Nov 2026 02:58:31 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Harbor-Fearful: 43dfbfa3666e5809_1795575512989_2441478636
X-MC-Loop-Signature: 1795575512989:85526249
X-MC-Ingress-Time: 1795575512989
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.4.162 (trex/8.0.2);
	Wed, 25 Nov 2026 02:58:32 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:51640 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3DI-0000000BJhc-1Lqj;
	Wed, 25 Nov 2026 02:58:29 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ARM: NOMMU: fix PMSAv7/v8 MPU setup on M-class
Date: Tue, 24 Nov 2026 20:57:52 -0600
Message-ID: <20261125025757.1159931-1-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_030052_204515_386917C2 
X-CRM114-Status: GOOD (  13.07  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_ARM_MPU=y, a Cortex-M3 kernel under QEMU (mps2-an385)
panics before its console comes up. Patch 1 fixes that: the M-class
region base register has VALID and REGION in its low bits, so the
R-class probe selects a region that does not exist. After that,
allocate_region() can return one region too many (2),
mpu_setup_region() accepts a number one past the end (3), and
try_split_region() can return a base not aligned to its size (4).
Patch 5 fixes the same off-by-one as patch 3 in pmsa-v8.c.

Patches 2 to 4 also run on R-class.

I know the Cortex-M platforms are going in 7.5. These are for the
stable kernels that still carry them, and for the v8-M core while its
future is discussed.

Not fixed here: on M-class, pmsav7_setup() rewrites regions with the
MPU on, so for a moment a region has its new base and old size, and
QEMU faults when it covers the running code (an385, 0x3f9000 of RAM).
Turning the MPU off around the rewrite works only where the default
memory map matches the kernel's. Vladimir, how would you want this
handled?

Testing: I have no PMSAv7 hardware, so patches 1 to 4 are tested
under QEMU only (mps2-an385, several memory layouts; every prefix
builds with W=1). Patch 5 is tested under QEMU (mps2-an505) and on an
RP2350 board (Cortex-M33). A test on any Cortex-M3/M4/M7 or Cortex-R
board with CONFIG_ARM_MPU=y would help; the line to check is "Using
ARMv7 PMSA Compliant MPU ... Used N of M regions", with N no larger
than M.

This series was written with an AI coding assistant (Claude Opus 5.5,
Anthropic), as each patch says; I reviewed the reasoning and the test
results.

Brad Hawthorne (5):
  ARM: NOMMU: pmsa-v7: Do not probe the region order on M-class
  ARM: NOMMU: pmsa-v7: Do not allocate more RAM regions than the limit
  ARM: NOMMU: pmsa-v7: Fix off-by-one in mpu_setup_region()
  ARM: NOMMU: pmsa-v7: Align a split region's base to its size
  ARM: NOMMU: pmsa-v8: Fix off-by-one in __pmsav8_setup_region()

 arch/arm/mm/pmsa-v7.c | 29 ++++++++++++++++++-----------
 arch/arm/mm/pmsa-v8.c |  2 +-
 2 files changed, 19 insertions(+), 12 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


