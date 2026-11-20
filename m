Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B8606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPyRr4z0;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=fDE1ROF/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=us7mbpzByrc6IYYiZEo/0XS2sJm4gcQN7+6PoaPd6bI=; b=JPyRr4z0LliCHKQmW0atuQz4pz
	r4arLUNTDcdGhPJx1A24ye9TJ4hPUm1UdZbTKzbKygu3OusXyviRZL8G8lA1nLhyVLCgZgVJ5K/wt
	CLUmbR+jbLHWqUlfPylHHwlQ/61E1Y1BX3gPmw/4/6Ypf1GanRLVlTn2TbvImCSz1i+h0Bmt3jNDC
	DnIyW2T8+bG8lmW5SjIcd+/Nn9JrIMUBhTyPm+Qo6KforXKO3tMqZb5b4u+N0INpUzGKs6+vFAgoK
	dA+YHcmoFT3fGDfvfigYuZIU3wrJoaTAbEI//pakf6FsTConvxqfhJUxEbGM/nS6eua2pUgTFQvb/
	0j/p462A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQFo-0000000FMny-16dV;
	Fri, 20 Nov 2026 15:10:20 +0000
Received: from mail-m8119.xmail.ntesmail.com ([156.224.81.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQFj-0000000FMmH-0m0E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:10:18 +0000
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5571b3b0d;
	Fri, 20 Nov 2026 23:10:00 +0800 (GMT+08:00)
From: David Wu <david.wu@rock-chips.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	joabreu@synopsys.com,
	peppe.cavallaro@st.com,
	luis.la@mail.de,
	lorenzo.bianconi@oss.qualcomm.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	Anandu.Padinhare@electrifex.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Wu <david.wu@rock-chips.com>
Subject: [RESEND PATCH net] net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable
Date: Fri, 20 Nov 2026 23:08:05 +0800
Message-Id: <20261120150805.763415-1-david.wu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1f981df5809cckunm25b76740482ac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx5DVh1JS0xLGUJLHU5JSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fDE1ROF/HErXOzZTrk28RcFqanGnvxfppXJn0ml7GTDlqAr7HYyapRj46zeBq4jyjXe4IAoEghzTvvstOo7oUVtomK8Qg5sIfvvuImaDoKdwMd6FbmRgm4+yaBJfwLMQQ7TEgR4Mkhl0CRPnrPYWaCvA80JoLh1TWGQBbXXwNrk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=us7mbpzByrc6IYYiZEo/0XS2sJm4gcQN7+6PoaPd6bI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_071015_974102_D4106810 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Once the RX ring is exhausted, the RX DMA enters the suspend state and
no more Receive Interrupts can be generated: incoming frames are kept
in the MTL RX FIFO and are dropped once it overflows. The RX DMA only
resumes after software refills the ring and updates the RX tail
pointer, which is done by the RX NAPI poll (stmmac_rx_refill()).

Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
enabled the RBU interrupt for dwmac4, but the interrupt handler only
updates the statistics counter without scheduling the RX NAPI. The RX
NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
the RX path hangs forever once the ring has been exhausted.

Schedule the RX NAPI when the RBU interrupt is received, aligning the
dwmac4 behaviour with XGMAC (commit 6338488356d2 ("net: stmmac: xgmac:
Add RBU handling in DMA interrupt")).

This can be observed on a GMAC4 based platform with Split Header (SPH)
enabled under high TCP RX pressure, where the slower RX refill path
lets the RX ring run dry.

Tested with Split Header (SPH) enabled, running a large file download
over TCP:

- Without this change, the RX path hangs permanently once the RX ring
  is exhausted: the RX tail pointer is never updated again and the
  DMA channel status register latches the RBU bit, while the TX path
  keeps running.

- With this change, each RBU interrupt is handled and the RX path
  recovers by itself. e.g. 3 RBU events within 6 ms during a download
  peak, each one self-recovered (the RX tail pointer resumes advancing
  right after), with no further RBU events afterwards.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 02aa1a3dd1e2..de6bd6f8a7d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -155,8 +155,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 
 	/* ABNORMAL interrupts */
 	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
-		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
+		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
 			x->rx_buf_unav_irq++;
+			ret |= handle_rx;
+		}
 		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
 			x->rx_process_stopped_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))
-- 
2.25.1


