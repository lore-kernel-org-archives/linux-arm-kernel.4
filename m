Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45105606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGgM/oxf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTdI9DsW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gmKeO02Lkz2HZki8M1t6FXuRL2Y6gezRIxbAmMHv4Q0=; b=tGgM/oxfzIMIatbsDPo5lzB5BO
	1mQJs9rleTSGcqdReVSeM+MmzSPx3tmks65w/t1FP/GR1YdovmK6tc48waMIwyihcCvA2zLNb+X/0
	yc/pD1941NS3vnLmtzPB7qOEGYqEkETv5h802BYAJEjfV8RCaDgTQicmfvaL2pxuufCiR+zrvh9c+
	zNYmZiIyBUAzpGb7j1tuQlNPkt3/+7GaOGlO06MCv9jgwZpbDvAsEnRtN4dT3di7iWv0AykaSEWU5
	eRv7k47lV/9XXz2sX5sNnRzaTbeezHXF/b+9OLKEgOU7VhlLPrHlsEhmFG/Fa1ewbrxYXaSDbqD+o
	LTqvQ+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncw-000000013mM-04w2;
	Mon, 16 Nov 2026 03:43:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncu-000000013lJ-2rb7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 269066154D;
	Mon, 16 Nov 2026 03:43:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794800607;
	b=esplc2htj8wc9rypTVQZmdscVWc5J9oimWjhbjbU6kgz1p7+qZIxk/zYRXe/XAHxLmhQ
	 J8OaJe1ur9IazFG2Malqgxa8zMaN+xhp5q6GuEF08Nr4NaLaqB0v5uIaRtsI18NUiIWNe
	 1wTy2QIg+3RQpyr2TkaJQK7rfnXGV2S4/TzNyVpLQ1td8e/qj7FoXjCxrOyILMXogdqwT
	 X7Pr9SfoK7Zd0VMi4PZeuJnAA8gINwpvFZHNbVfhlBn5MeW8rTu5vwcIjig5jkYPkNOEq
	 ykzqdv6uNyfb0Z375HWqwBlrg1RLfIlyj75DnSo7O8MS7M5Uz4vyiigPzCCdQy51jCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794800607;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gmKeO02Lkz2HZki8M1t6FXuRL2Y6gezRIxbAmMHv4Q0=;
	b=CQ6t0G0A5JFzGMfQm4dFLnPWNBbyt2CsEZx61dToAPF52tW1KUGLdt2whgHVGoFI4dGS
	 1Ph+ULOqRrpDSr4OUBMZtuTR/p1vv5y9Bb6XwBA8cc+ZucFe9q8LK1g8xWGLgVHstKDKa
	 FUFfTVPx9th7w+uthezj0/Ild6d2JB3n7yWs74aW/JfKHWC5rXXCl/kkg5ib2JZxpC0+r
	 gSvVQB1cs35stGStG4ZBY7+1JneUdtW71sXk8n74TUbRCgdqkBQvsAkZ8BqA+/g2m8QQa
	 sNgF9sPe7s5vaWG9QHHIjUCVCrI0pvOIx+lo/AopHV0OKPg4V0zEQeFm2Q/3SDu9aUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDB6D1F000C5;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800607;
	bh=gmKeO02Lkz2HZki8M1t6FXuRL2Y6gezRIxbAmMHv4Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lTdI9DsW4kdTXJ+jkMHrLao74m00yU7bfe8b7IbZdLAEdNUgkSJ+gcryOmHSKoXxF
	 ouvg3IqeLKFT6kwghgt2qvNuIxZomkfDQncmTOXZtmbG1mWZYDqtiXgrmFmGfxNpKl
	 5UZT1/sXEDixPokD1zi/4bUCD5Fvdz2Iw9daGCs83s3XvhyM7WOW/Mp3EtDEgfYIUq
	 FOS25APpjj+wSIlWvFYjsz7Zz+Ec3RhRhMhOVo1dT2IFBkzMQHf1NyX0j8L9rcxCOy
	 8MFEFq0iBJcAge32hWoruGVUerXmWHu8CD3nRRn9ZDOUC7G+4WEpXDfhoDq8mRaJzR
	 T9Zka/4SJV0Tw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E1624A2DE;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Sun, 15 Nov 2026 19:43:04 -0800
Subject: [PATCH v2 1/3] dmaengine: xilinx_dma: Reject transfers that map no
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-xilinx-dma-work-v2-1-681ed00c15a1@nullptr.com>
References: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
In-Reply-To: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=QYC4vX1LRQq4IFV/4oVzvQGjzHrh3TFPTAyJaiMRS6w=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm/qu9u37Bwf9cj464VdyWPnon2l2u6kPzRpZLx88IJx
 x+//tC/o6OUhUGMi0FWTJHl+LFpO/Nt/euKqu9XwcxhZQIZwsDFKQATub+N4X+KD8f0mzM0Dq8T
 WSZbuSz5RtqrSJtPHeGqa+z3NzvKn9zFyHD7ysuA2sK8Q/Z2Ky1m+R5a8HT9wWOpa6p5+tYGzpe
 s1OEFAA==
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: kernel@nullptr.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jeff C. Jensen" <kernel@nullptr.com>

If every entry of a scatterlist or a DMA vector array has zero length,
the preparation loops in xilinx_dma_prep_slave_sg(),
xilinx_dma_prep_peripheral_dma_vec() and xilinx_mcdma_prep_slave_sg()
allocate no segments. Each function then takes list_first_entry() of the
empty segment list anyway, so desc->async_tx.phys, which is later
programmed as the current descriptor, is derived from the list head
rather than from a segment. For DMA_MEM_TO_DEV, the SOP and EOP bits are
also set through pointers that do not point at a segment.

Fail the preparation when no segment was allocated.

Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Fixes: 38433a6fdfb7 ("dmaengine: xilinx_dma: Support descriptor setup from dma_vecs")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 0336941d4095..6f00ab41b143 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2362,6 +2362,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2463,6 +2466,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2670,6 +2676,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;

-- 
2.43.0



