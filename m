Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43BOFaId;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OUK12/k2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7JONSrXCmQqyFR9iPWs8rPJH7dhEZvs5CIrklp4jqPc=; b=43BOFaIdkFZOP8OBPEd4Qz55fA
	L1eEmUvvN1ToOhdZQa0lodlLo3qiuhFpS69NsSNwuaKJGxJqRi0IZyn+17tIMzUQBlgTa+38MrIrQ
	XAouEIvkr2YRylHoTpFCL7srsYwvqOButCYrNyI96yOUugsJuKMdfFYZVFZHQgyqk6sFlIeRucGrN
	VY61IUFVBMG68Aft6oKWP/AGkAVWPReggL4+splszS9WHY1ZiGWJjoJ2Y7OPyqmzHlUYKP0eHhYez
	uR8eg9hrqMi+hfN3F+B//Z24QulPpcyL1iJ+SoO2QMtjfsyWiSnV7tplnjB9tZTK2rgM1ZbAucjOQ
	1q/Ig6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9y1-0000000Fekl-2bK0;
	Sat, 14 Nov 2026 09:22:37 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9xp-0000000Fegs-01Aq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 09:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7J
	ONSrXCmQqyFR9iPWs8rPJH7dhEZvs5CIrklp4jqPc=; b=OUK12/k2+SoPodWN7C
	5aFm/rs1KwNpUrQbV86IujIDkEylH2VEjXgItlTWSTc+wcdcDcXtLiuB7ZOC0ok9
	EWEkpVhiKN6MHzxdWnFb71/4gihQZdeycRuh9OW2lNjuNmIy1hVOYjyG+xB85HSv
	uba7s2gUctcvWLaffdw8caUJ4=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3r6IRKPhqiIvzHA--.51340S2;
	Sat, 14 Nov 2026 17:21:26 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: tommaso.merciai.xr@bp.renesas.com,
	dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net v7 0/4] net: stmmac: fix RX descriptors and XSK TX on resume
Date: Sat, 14 Nov 2026 17:21:12 +0800
Message-Id: <cover.1794646293.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3r6IRKPhqiIvzHA--.51340S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWfGw4xJry7Cw4kXry8uFg_yoWxtr4rpF
	WrKw4Yyw1kJr18Aws5uw4xXFyrKa95CrW3WrW5J3yF9FW5WF1aqr4akF4Yqa4DCrs7G3W2
	vr4UuanrCF15ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyLvtUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8xjoFWr4KBiioAAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_012225_859575_8EE57EC1 
X-CRM114-Status: GOOD (  15.59  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

This series restores RX descriptor addresses overwritten by hardware
writeback between disabling NAPI and stopping RX DMA during suspend. It
also fixes an AF_XDP TX-only resume stall found while testing the
series.

Patch 1 honors RX allocation flags. Patch 2 keeps unfilled XSK slots
CPU-owned and tracks pending refills explicitly, including an empty ring
and short refills. Patch 3 restores RX addresses from retained buffers,
rebuilds chain pointers and initializes descriptor control fields. It
publishes a contiguous XSK prefix and recomputes the tail and pending
region. Patch 4 restores the bound XSK TX pool after TX buffer cleanup;
otherwise zero-copy transmission can stop after resume.

Commit 9c63faaa931e ("net: stmmac: re-init rx buffers when mac resume
back") was reverted by commit 00423969d806 ("Revert "net: stmmac:
re-init rx buffers when mac resume back"") after a Jetson TX2
suspend/resume regression. This series retains existing buffers and DMA
mappings instead of recycling and reallocating every buffer. Jetson TX2
has not been tested.

Hardware validation used backports on our XGMAC platform with a vendor
kernel based on Linux 6.12.41, not these upstream commits as-is:
- Receiving iperf traffic from a PC while suspending and resuming caused
  a fatal bus error after resume in almost every run without the RX fix.
  The same test no longer showed that failure with the fix.
- Native XDP/AF_XDP zero-copy RX continued after two suspend/resume
  cycles with the receive socket kept open.
- Zero-copy TX-only, with no RX fill buffers, passed one suspend/resume
  cycle with no fatal bus error.
- Pausing the receive application with SIGSTOP and resuming it with
  SIGCONT recovered RX without recreating the socket.
- xdpsock is used for native XDP testing.

Additional testing would be welcome for RX sockets initially supplied
with 0/1/8/15 fill buffers, replenishment in batches below 16, and those
states across suspend/resume. These differ from TX-only with no RX fill
buffers. Legacy descriptor cores, GMAC4, chain mode, timestamp-specific
descriptor paths, multiple XSK queues and long suspend/resume runs
remain untested.

Missing page_pool buffers are still allocated during resume. Allocation
failure returns -ENOMEM without restarting DMA and leaves the device
detached. This adds a trigger for existing resume error-recovery
problems; full close/open recovery, including NAPI and platform power
handling, is separate work. The Medium-severity AI review on failure
recovery is not fully resolved by this revision.

Changes in v7:
- Rebase onto net/main at aa40afa831eb.
- Adapt the XSK pending-refill accounting to the upstream split-frame
  and error paths, preserving extended descriptor status handling and
  the existing per-frame drop accounting.
- Use the upstream stmmac_reset_rx_queue() saved-state cleanup instead
  of freeing the saved skb separately in the resume helper, avoiding a
  double free with the new baseline. Update the commit description
  accordingly.
- Recheck ARM64 STMMAC builds with XDP_SOCKETS enabled and disabled.
  Hardware validation remains from the Linux 6.12.41 vendor backports;
  the rebased series has not been retested on hardware.

Link to v6:
https://lore.kernel.org/netdev/cover.1794311618.git.dinghui@lixiang.com/

Changes in v6:
- Add a separate fix to restore the bound XSK TX pool after resume
  cleanup, addressing TX-only stalls found during XGMAC validation.
- Factor resume descriptor work into one TX queue loop and one RX loop,
  following Thomas's review, and use common error cleanup.
- Restore addresses and chain pointers before initializing RX control
  fields, preserving legacy fields and RIWT/IOC policy without a
  separate OWN loop.
- Add format-specific RX ownership clearing for unfilled XSK
  descriptors.
- Track pending XSK refills independently of circular index equality;
  retry short refills and prevent consumption of unfilled descriptors.
- Restore a populated XSK prefix and retain later attached buffers for
  refill; recompute the allocation count, initial tail and pending
  region.
- Select XSK buffer size independently of the initial allocation count.
- Discard any partially assembled RX frame before resetting the RX ring
  after resume.

Link to v5:
https://lore.kernel.org/netdev/20261025100636.613670-1-dinghui1111@163.com/

Changes in v5:
- Target net and add Fixes tags to both patches.
- Split the allocation-flags fix into a separate patch, with a Fixes tag
  identifying the page_pool conversion that stopped honoring the flags.
- Share page_pool and XSK buffer preparation with the RX refill paths.
- Allocate missing secondary pages even when the primary page exists,
  using the current baseline's buffer2 capability check.
- Condense the reinitialization kernel-doc to two paragraphs.
- Restore descriptor addresses before the final dma_wmb()/OWN pass.
- Clarify that unavailable XSK slots remain CPU-owned and may stop DMA
  with RBU, rather than claiming that hardware skips them.
- Power down legacy SerDes if RX descriptor restoration fails.

Link to v4:
https://lore.kernel.org/netdev/20260627122533.1165324-1-dinghui1111@163.com/

Changes in v4:
- Document the return value of stmmac_reinit_rx_descriptors().

Link to v3:
https://lore.kernel.org/netdev/20260604144557.3175399-1-dinghui1111@163.com/

Changes in v3:
- Allocate missing page_pool buffers with GFP_KERNEL and abort resume on
  allocation failure.
- Try to allocate missing XSK buffers and clear descriptors when the
  fill ring cannot supply a buffer.
- Restore OWN after programming addresses and rebuilding chain pointers.
- Honor the flags argument of stmmac_init_rx_buffers().
- Restore RX descriptors after stmmac_clear_descriptors().

Link to v2:
https://lore.kernel.org/netdev/20260526022620.501229-1-dinghui1111@163.com/

Changes in v2:
- Introduce a helper to restore addresses from existing RX buffers.
- Update the commit message.

Link to v1:
https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/

Ding Hui (4):
  net: stmmac: honor allocation flags when initializing RX buffers
  net: stmmac: track unfilled XSK RX descriptors explicitly
  net: stmmac: restore RX descriptor buffer addresses on resume
  net: stmmac: restore the XSK TX pool on resume

 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |   6 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   6 +
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |   6 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   3 +
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |   6 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 273 +++++++++++++-----
 7 files changed, 224 insertions(+), 78 deletions(-)


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.34.1


