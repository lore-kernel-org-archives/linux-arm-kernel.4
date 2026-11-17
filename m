Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F24606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OkQrhjPL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMp4DzAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JVdWED9lCpstMBkqd4TNKoEbfRhRrtDeXaw+rnQt51c=; b=OkQrhjPLKUxpFgsMA8BLBZ9PaB
	qbL/kV+VT4Aa2Zu9K+tk7TkVUj6d4knjjMsQ58++iDmFjQ7YffntmYrNv5THtHXhL/0x9J1ogiBri
	xi1DVYgj8vUV2x4JEv1IIUABtiMTTO5qewv6l3Z5Qt4HS9qN9iwS5DzCR+8a5jTOthkfo85eQrmtK
	a6eq4JzoMNGeDJ2HCrNAQYOET6vbGwMH4XCVRmA9CTaRAPFL2dPAkLl1hr+2I+0x+k5AHKFnNipgx
	uM6tv2wqzhrScFqc0ajzGmYIH3m/o86r2xVxzkaWRDtIInb6sT/ihBbaiVEKsCkjJ3LeaodzAUyvl
	1fz3DybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMCI-00000006RUR-38HG;
	Tue, 17 Nov 2026 16:38:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMCH-00000006RTj-2aDV;
	Tue, 17 Nov 2026 16:38:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F390040DCB;
	Tue, 17 Nov 2026 16:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8085E1F000C4;
	Tue, 17 Nov 2026 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933496;
	bh=JVdWED9lCpstMBkqd4TNKoEbfRhRrtDeXaw+rnQt51c=;
	h=From:To:Cc:Subject:Date;
	b=kMp4DzAVffwgAnDTqUfw8+P9hqV0NQe8PzTtfA2/wqZlwRPMnkQnLArhA6Py3xoj/
	 /5kD+fhlfN6WpBGm6iqeMDr4gBIfTMB73WA4O1d89PVGcCwrKT7Wt4te+zNR0qzkXZ
	 Re+AfeUaiWnlC5JtjXCAZyK9SJU5dxmtWm9DPL++QEwuwNU7LkUogj4Q/hrHZHCRhE
	 PfzbffnZYetn85u19f3q/yqLzQMtndhklIKGGns9tDQ5vuhxVhrvrpao9Zv14DS94Y
	 1cGaEvsVFrMbASdlRKlj1NLVexObltN4HiL/FzbcUiGmhck/sN6jCUNUfEK99hBNK1
	 SG6I+cJ4pI7iQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Alex Smith <alex@alex-smith.me.uk>,
	Andrey Volkov <avolkov@varma-el.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Dale Farnsworth <dfarnsworth@mvista.com>,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Gary R Hook <gary.hook@amd.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Joachim Eastwood <manabian@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Pearse <peter.pearse@arm.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Sylvain Munaut <tnt@246tNt.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH v2 00/11] dmaengine: Fix teardown races, resource leaks, and error handling
Date: Tue, 17 Nov 2026 16:37:01 +0000
Message-ID: <20261117163809.622249-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

These issues were reported by Sashiko.

v1 => v2:
 - ae4dma: Make the completion work terminable, so that cancelling it can
   no longer hang, and stop it before destroying the descriptor cache
   (Basavaraj)
 - jz4780: Correct the Fixes: tag

v1: https://lore.kernel.org/all/20261111215349.1983909-1-lee@kernel.org/

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Alex Smith <alex@alex-smith.me.uk>
Cc: Andrey Volkov <avolkov@varma-el.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Colin Ian King <colin.i.king@gmail.com>
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Cc: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>
Cc: Gary R Hook <gary.hook@amd.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peter Pearse <peter.pearse@arm.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Sylvain Munaut <tnt@246tNt.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>

Lee Jones (11):
  dmaengine: pl08x: Defer OF DMA controller registration until slave
    setup
  dmaengine: ae4dma: Let the pending work exit before cancelling it
  dmaengine: ae4dma: Unregister DMA engine in ae4_pci_remove()
  dmaengine: ptdma: Unmap descriptor in pt_do_cleanup()
  dmaengine: ptdma: Remove completed descriptor under vc.lock in
    pt_cmd_callback_work()
  dmaengine: amlogic: Destroy free_wq after devres DMA device
    unregistration
  dmaengine: arm-dma350: Query dma_cookie_status() under vc.lock in
    d350_tx_status()
  dmaengine: bestcomm: Defer publishing bcom_eng until initialisation
    completes
  dmaengine: bestcomm: Check rh_create() return value in
    bcom_sram_init()
  dmaengine: jz4780: Fix descriptor cleanup on hwdesc setup failure
  dmaengine: dmatest: Avoid unsigned underflow in min_odd()

 drivers/dma/amba-pl08x.c                | 23 +++++++++
 drivers/dma/amd/ae4dma/ae4dma-dev.c     |  8 +++
 drivers/dma/amd/ae4dma/ae4dma-pci.c     |  6 +++
 drivers/dma/amd/ae4dma/ae4dma.h         |  1 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c |  3 +-
 drivers/dma/amlogic-dma.c               |  3 +-
 drivers/dma/arm-dma350.c                |  3 +-
 drivers/dma/bestcomm/bestcomm.c         | 69 +++++++++++++------------
 drivers/dma/bestcomm/sram.c             |  6 +++
 drivers/dma/dma-jz4780.c                |  5 +-
 drivers/dma/dmatest.c                   |  6 +++
 11 files changed, 93 insertions(+), 40 deletions(-)

-- 
2.56.0.679.gc527c65306-goog


