Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF13606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYWGDZoA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPI/oWpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vo+Xid6UcgteTwGX3R58YBsHWjRppW5tyw1bkBxSt4I=; b=fYWGDZoA6LxVYcpkArGl9Y6nJp
	A4i1s7OaYz1X7AHd4aMNdWeF2EU7ggk4EfY2Tdoy1/i25C7AlkW7HkZhOnEIu0HliRupeex9y8GsG
	c0mzCEuCL/rmX0TuHnu0vXcsg5aKOLUd3k0lowddjXpuzU1BVK6fTn0tb78mVgBeaTewj358F0WFh
	+49zGT9QhqxM+vTV0vGfn3YsOOWYcyednum1sh7aGUgFzTLKCcMKjfr5S7rSKPbGcVXkv50dV2p/C
	E80DTlSMcUqZ205kUPQk53h08uR7YsRgIZR90IsOlyF+HeeP5MGJTjUIQB6E+TDBlN/9zo4SmR9bS
	orktsapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGT-00000007rR3-3tP1;
	Wed, 11 Nov 2026 21:53:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGS-00000007rQF-1ehf;
	Wed, 11 Nov 2026 21:53:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29DAF404EF;
	Wed, 11 Nov 2026 21:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9C61F00A07;
	Wed, 11 Nov 2026 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434036;
	bh=vo+Xid6UcgteTwGX3R58YBsHWjRppW5tyw1bkBxSt4I=;
	h=From:To:Cc:Subject:Date;
	b=iPI/oWpCeHnCEMErtUbB2VDRAaWW9J2fj7z9qM9xNObLw+vhYbiTeAAwKI1GUFzpB
	 8J6tK9NjXMawtWmXJ7EtuvUVZzv8i3Jpo8wL8PB1fsAMjH0l4TLB9N0tWy/8P5qAs1
	 NTb4kOWKJ9UHTsJy7quNX5jyg9qB1PzdgIaBm78Mui3Pk/VxmwHT9TUjJTvesjDWmH
	 F1rZ6wO/8t6MTYTfWN4BNEmcCIYAHoqq4cZVBcz5j41IjehzfuTZ8B9YHn4DWdlYn1
	 oIGezAmdft8/q/HoSW91hLiKYlQpj3zSQDRMHUe/bqnI+HxDaqih3NGGAF6AB5swkP
	 NchItdGVZuArA==
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
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 00/10] dmaengine: Fix teardown races, resource leaks, and error handling
Date: Wed, 11 Nov 2026 21:52:38 +0000
Message-ID: <20261111215349.1983909-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

Lee Jones (10):
  dmaengine: pl08x: Defer OF DMA controller registration until slave
    setup
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
 drivers/dma/amd/ae4dma/ae4dma-pci.c     |  1 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c |  4 +-
 drivers/dma/amlogic-dma.c               |  3 +-
 drivers/dma/arm-dma350.c                |  3 +-
 drivers/dma/bestcomm/bestcomm.c         | 69 +++++++++++++------------
 drivers/dma/bestcomm/sram.c             |  6 +++
 drivers/dma/dma-jz4780.c                |  5 +-
 drivers/dma/dmatest.c                   |  6 +++
 9 files changed, 80 insertions(+), 40 deletions(-)

-- 
2.56.0.567.gdb80ae8cd5-goog


