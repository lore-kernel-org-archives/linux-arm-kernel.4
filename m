Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5CS3mvpb;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dGFRbzx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2cHoKfMTCq8qVifnRs0Z8Ntt3pn0su/nfO0nJQ9487s=; b=5CS3mvpbyAEAMDuMHTMY9o4LI7
	dBPjgD0mrV7JGWlkrUjGDWkk2K2fkKmN/PTAdxQ0OwxfWydBKnU8guQOuhStfP55b8jG4Ytqty4eL
	nTuYD3CMxI65wI5MtAGpN7vpG8XtZ3XeGt3Y8fspklaWFK/vKLXiirPvs5SO00Vx3izcpUz1SYT2Q
	znX7LuaSy5o/cqu5Fw8JTqGMQE9fugxKQ+Hlz83SD2wvuVl0dsCrDDVWCEXpEwke+vge1P+z29pn4
	b4eXp2szPhw0zkK85W0Wxh38GJbEqV3wkN+YFyRQh2B3KIWqlkXqGHO0oKs+IyQo/WcCQpM/zC2ep
	jJ58zjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCT-0000000HD4W-45dp;
	Sun, 15 Nov 2026 08:02:57 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVCR-0000000HD34-1lhW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2c
	HoKfMTCq8qVifnRs0Z8Ntt3pn0su/nfO0nJQ9487s=; b=dGFRbzx3fNZVhnYwa2
	mdZ982tnEwZzeHvABeQ1FQjbJZeTHWYKl92Yo+9Sv2o8j1g/LIeUNFkGhblbfiZh
	smQZMvkfAZQ0y3SulsA6GlanApw9VU1EV4c8/9eL9fBf3wJnzngR0LzNYpXd8w9C
	6qy/Q8wajVI4z7kJHuVXR8cYY=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wB3fJUmZ_lqQz57HA--.24354S2;
	Sun, 15 Nov 2026 16:02:46 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: at_xdmac: handle empty transfer list in tx_status
Date: Sun, 15 Nov 2026 16:02:45 +0800
Message-ID: <20261115080245.910534-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3fJUmZ_lqQz57HA--.24354S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry3Aw1kAw17CF45GrWDXFb_yoW5Gr43pa
	yfG3y5CryktF4ruF1kG3W09ay5ZF4rCayUuayDW3s8uF4Yvr4rW3s7t34jqF98Wrs5XFyv
	yF4Ut3s3CryDGrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bU-erUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7Qb7TGr5ZyavCQAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_000255_832915_0C72F8B0 
X-CRM114-Status: GOOD (  15.17  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

at_xdmac_device_terminate_all() removes every descriptor from
atchan->xfers_list without completing their cookies, so
dma_cookie_status() keeps reporting a terminated cookie as
DMA_IN_PROGRESS. at_xdmac_tx_status() then calls list_first_entry()
on the empty list and uses the list head, which lives inside struct
at_xdmac_chan, as a descriptor: active_xfer and xfer_size are read
from neighbouring channel fields, and if active_xfer happens to be
non-zero the residue loop walks a descs_list made of those fields.

For audio this is a routine path. The generic dmaengine PCM calls
dmaengine_terminate_async() on TRIGGER_STOP and later
dmaengine_tx_status() on the same cookie from
snd_dmaengine_pcm_sync_stop() and on close. What happens depends on
the struct layout. On a 32-bit build active_xfer overlays
sconfig.device_fc, which is normally false, so only a bogus residue
is reported. With CONFIG_DEBUG_SPINLOCK the larger spinlock_t puts
active_xfer on the held lock word and descs_list on the owner_cpu and
owner fields, so the loop follows a pointer that is not a descriptor.

Report a residue of 0 when no descriptor is queued.

Found by LLM-assisted source review. Not tested on hardware; the
layout analysis above is from reading the code only.

Fixes: e1f7c9eee707 ("dmaengine: at_xdmac: creation of the atmel eXtended DMA Controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---

Notes:
    The changelog was drafted with an AI assistant from my analysis;
    I have reviewed the code, the fix and the text.

 drivers/dma/at_xdmac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d3..bcfbb41ea 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1553,7 +1553,16 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 
 	spin_lock_irqsave(&atchan->lock, flags);
 
-	desc = list_first_entry(&atchan->xfers_list, struct at_xdmac_desc, xfer_node);
+	desc = list_first_entry_or_null(&atchan->xfers_list, struct at_xdmac_desc,
+					xfer_node);
+	/*
+	 * The list is empty once the channel has been terminated, while the
+	 * cookie of the terminated transfer is still reported as in progress.
+	 */
+	if (!desc) {
+		dma_set_residue(txstate, 0);
+		goto spin_unlock;
+	}
 
 	/*
 	 * If the transfer has not been started yet, don't need to compute the

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0


