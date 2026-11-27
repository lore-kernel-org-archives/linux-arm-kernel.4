Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKZSS1p4;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=BF9/M/FJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=87loX2K1MRUkuuriEOw5VwScje1H4+shrb09r2CZSlo=; b=zKZSS1p4GLknHyR00ximOt6iRo
	UWK5lQYK6WKol/9n4+In4+VfBs7zngm8219JoVL3HKFAu81R6fWCN1ehW8ExhBbwPY8VcDzTGiqYa
	Q9aHXdydjlTuNK/TD0P1heyrNBcIpYksNJiQ1paDXVBXMkM6n2Zh7hApl6YtgdkS+evtF3zvaKc23
	c0WlCsKSM6jvRJjlbMWL1iNCfZaN4W57qzE2PiAcNfmdFy+0bXsxW3IOu1kNpJDDDq8lSYWqIRl+o
	TJ6+NPzeC6ZdE2xT6PqGVGT5eu89zbrrpQQIfTF706zzE3B2SlC6R2noJMX7iKF5Qx9lJ2BVfbsR3
	tN5cBAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvx4-0000000GFgs-30ZX;
	Fri, 27 Nov 2026 13:25:22 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvx1-0000000GFej-0s0M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:25:20 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 8a5ecd65-d520-476d-b113-531c87366ce0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795785917;
	bh=TFZW56ctheIsJ0mDPfySDHNMgAhFyvnxeAxQ3mNsdZM=;
	h=From:To:Cc:Subject:Date:From;
	b=BF9/M/FJpQud79g1eDuHaDZh/VfV/gCMOpSOs/kMUYPS0n551LaZqCkuLuDkivO+5
	 aJE+yNF3auuRXMoe88w9bVsP8GNl/EOY6xO62gsBDjxPA3ce6X/nV5PrLptkJGJbtz
	 nIXf4HoZeTTRzanm0kQtDf3kC6Q9GkHyKCvJg9MVnnD1jprLsU2V5NKghVe7wvNK2h
	 f8Cvf7vdVPfkCm9WR1fxw6imPRc15Xhb47k92IQ57JIlGvqtyilkt0LBpxmJYJCyBn
	 aAK2E4Y/C0XV/zSYUFJRvIzjZlZY1cZMrIzmOVrqpE2gZ6XvhJsPAsdwl15UHBSCPC
	 EQRCoeeYdP3aQ==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v3 0/2] Bluetooth: Broadcom controllers of the Apple T2 Macs
Date: Fri, 27 Nov 2026 14:25:11 +0100
Message-ID: <20261127132513.262754-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052519_395220_0CCDC4C2 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series is for the Broadcom Bluetooth controllers of the Apple T2
Macs, the BCM4364 over UART (hci_bcm) and the BCM4377 over PCIe
(hci_bcm4377).

Patch 1 builds on a vendor command the Android Broadcom vendor library
uses, 0xfc57, to keep A2DP from dropping out while WLAN runs on 2.4 GHz.
Patch 2 sets the strict duplicate filter quirk in both drivers, so a
discovery reports changed advertisement data before its next cycle.

The T2 Linux community runs these patches. Users reported them working
on the MacBookPro15,1, 15,2, 15,3, 15,4, 16,1, 16,4, MacBookAir9,1 and
iMac20,1.

Changes in v3:
- Rebase on bluetooth-next. Patch 2 sets the quirk after the new
  platform address check in bcm_setup()
- Patch 2: shorter subject
- Patch 1 is unchanged. The comparison with Sasha Finkelstein's channel
  priority patch is in the v2 thread

Changes in v2:
- Dropped "Bluetooth: btbcm: clear vendor bits in LE advertising report
  types" and the revert of 88397423671f. The mask in hci_event.c stays
  as it is.

v2: https://lore.kernel.org/all/20261105085750.120392-1-dev@deq.rocks/
v1: https://lore.kernel.org/all/20261104151601.70493-1-dev@deq.rocks/

Andre Eikmeyer (2):
  Bluetooth: btbcm: raise ACL priority on Apple Broadcom controllers
  Bluetooth: set the strict duplicate filter quirk on Apple Broadcom

 drivers/bluetooth/Kconfig       |  1 +
 drivers/bluetooth/btbcm.c       | 71 +++++++++++++++++++++++++++++++++
 drivers/bluetooth/btbcm.h       |  7 ++++
 drivers/bluetooth/hci_bcm.c     | 23 +++++++++--
 drivers/bluetooth/hci_bcm4377.c |  8 ++++
 5 files changed, 107 insertions(+), 3 deletions(-)


base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00

