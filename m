Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZFYWGk8K;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=eX0EEoO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zueww4+1NwCyF5cy2SwCRp8wZjZi0tJ4fAEc3gDf94o=; b=ZFYWGk8KWfg7dtY1USQuRIHVFi
	5wkIjeU4lfaqXXgWtmj4+dHUpEfVde3XvaueRDzz2ltHpExF0pvDrRcNNS19ScHeUpIQmrRsIdw0y
	nsw/NPvL6VaL++3eFUtyQfidzxyOsgHNosLyPhFcR+ZRqChb8n4aRZlQBLGGN03+HpyoKbzap8NJj
	RUrkz6q3A2DPJL/gWqj3j+ZVa7t8v1bPNY4kz0SWhKeepShRqwl6DnGI+p5Gs89A82Boj86llYTdk
	k8nBHDyB+OAYKVpU+leyQ244Z2Ifdxkal5DFgXmBktXOyWS/KzC1wQX07E3vcYfCZTOCr6OWUD0hH
	FuUYTWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOD0-00000000dcr-1Gse;
	Mon, 09 Nov 2026 12:10:46 +0000
Received: from out28-3.mail.aliyun.com ([115.124.28.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOCy-00000000dcR-06ne
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794226237; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zueww4+1NwCyF5cy2SwCRp8wZjZi0tJ4fAEc3gDf94o=;
	b=eX0EEoO91t/GJMC+Z1PGzRv9jJ6ohf6MPP3JUAEsZErLLpFyd8f8UEdLvsAeJZkh4UUGcqGdre43nV7R97bPH6oA+RYz09rm9rtIoOms22JOwuyt9L88dXqyz6F4IiTTDDeeV5A2jN/Mgv98qyAYzDQHfrumP1OzBljnHfVh28g=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.04439086|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.02383-0.000494716-0.975675;FP=9592083956290293074|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034020;MF=fangxy@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.k-86pZ7_1794226235;
Received: from localhost.localdomain(mailfrom:fangxy@xiaopeng.com fp:SMTPD_---.k-86pZ7_1794226235 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:10:36 +0800
From: Fang Xieyan <fangxy@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Johan Hovold <johan@kernel.org>,
	Roland Stigge <stigge@antcom.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Guanglei Zhu <zhugl3@xiaopeng.com>
Subject: [PATCH] usb: gadget: lpc32xx_udc: handle interrupts with an empty queue
Date: Mon,  9 Nov 2026 20:10:35 +0800
Message-ID: <20261109121035.34561-1-fangxy@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_041044_253973_D8E31835 
X-CRM114-Status: GOOD (  14.75  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A request can be dequeued after a DMA transfer has completed and filled
both endpoint buffers, while the delayed endpoint or DMA interrupt is
still pending.  lpc32xx_ep_dequeue() removes the request from ep->queue
and gives it back via done() without clearing the pending endpoint or
DMA interrupt status.

When the interrupt handler then runs with an empty queue,
list_entry(ep->queue.next, ...) derives an invalid request pointer from
the list head; list_entry() does not return NULL.  Passing that pointer
to done() in udc_handle_eps(), or dereferencing req->dd_desc_ptr in
udc_handle_dma_ep(), results in invalid memory accesses and can crash
the kernel.

Check whether the request queue is empty before touching the request in
both handlers.  In udc_handle_eps(), do this before sending the deferred
ZLP and disable the endpoint interrupt when there is nothing to
complete.  In udc_handle_dma_ep(), still disable the DMA channel and
clear the pending EOT/NDDRT (and SYSERR) interrupt status so the
interrupt does not keep firing, without dereferencing the missing
request.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 044c31869cfb..67b0d6f73e43 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1945,6 +1945,13 @@ static void udc_handle_eps(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 	/* Get endpoint status */
 	epstatus = udc_clearep_getsts(udc, ep->hwep_num);
 
+	/* If there isn't a request waiting, something went wrong */
+	if (list_empty(&ep->queue)) {
+		ep->req_pending = 0;
+		uda_disable_hwepint(udc, ep->hwep_num);
+		return;
+	}
+
 	/*
 	 * This should never happen, but protect against writing to the
 	 * buffer when full.
@@ -1958,7 +1965,6 @@ static void udc_handle_eps(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 	} else
 		return;
 
-	/* If there isn't a request waiting, something went wrong */
 	req = list_entry(ep->queue.next, struct lpc32xx_request, queue);
 
 	done(ep, req, 0);
@@ -1985,6 +1991,23 @@ static void udc_handle_dma_ep(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 	ep->totalints++;
 #endif
 
+	if (list_empty(&ep->queue)) {
+		u32 mask = 1U << ep->hwep_num;
+
+		ep->req_pending = 0;
+		ep_err(ep, "DMA interrupt on no req!\n");
+
+		/* Disable DMA and clear pending interrupts */
+		udc_ep_dma_disable(udc, ep->hwep_num);
+		writel(mask, USBD_EOTINTCLR(udc->udp_baseaddr));
+		writel(mask, USBD_NDDRTINTCLR(udc->udp_baseaddr));
+
+		if (readl(USBD_SYSERRTINTST(udc->udp_baseaddr)) & mask)
+			writel(mask, USBD_SYSERRTINTCLR(udc->udp_baseaddr));
+
+		return;
+	}
+
 	req = list_entry(ep->queue.next, struct lpc32xx_request, queue);
 	dd = req->dd_desc_ptr;
 
-- 
2.50.1


