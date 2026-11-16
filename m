Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CejGzVUE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXNMYjGM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=; b=CejGzVUEV+HJpenkHeE7shaYjH
	HUafQ2BzG1DsIETD1StuZBK0tEHCLz4xPOJtcnAgDltuMfqOnwcQE8OXCER9eNK5RKwAtU23K8Suw
	cJhrfEOGX6T1eSHoJ5D0vDjO7V0wOsKUHCDsKI4HDNgwJEYLjh0pu0y2bhMJg3xL3cNSyeGu0e6nd
	dHWssDUkoNyk8LsCwcsfqIV6t5B5osK9VYJaJoD96PQoG8poB7Zw3EYh8z4QLal3cS1cjeuec1eDg
	gHBdJRMt8ia5URNtTt71ldTLEM9QoKu1xaCQdS66NoxHuJGxmZekuqueph60gLXmpRbYRP+yFlF/n
	LqCnBjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncv-000000013m2-3rme;
	Mon, 16 Nov 2026 03:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncu-000000013lI-29fq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B927360D2D;
	Mon, 16 Nov 2026 03:43:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794800607;
	b=iq8mfRWlMrpFViKYlGFGjCpXbZOP63wRqXGIYE+ciFQoTGieNZmzpfiaqKX1K+/UtiYB
	 LSN7ZGCQmNOpPv3CiV54Q52vuoH15nPZZh5+ZHycXm2Ej1zgM1EIjNFpgjq+4Kt40D1aR
	 CG+CfUAlOn0qpjtpX2ccROdiT9K4a8jp71ppy0oL7nLxvxvSzyQMxcdxfZaT8zjy9MD2r
	 PrhXASWITt+v8BhCnk6Hudjcg8tCp6BAz6swM/G7RboStsxXStjYcWKLWuHR3h0GxK1GT
	 Zh/enDgLOBQw740mrzoECv/ln3yvrPRz/0RqsgrJXIYLrRgBELJsZdhrVRIcG/IPjQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794800607;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=;
	b=c7BRWWHojW7YaB01Sp59HgEgPwYDNCZFactInl+Yy79Rw16dOJ0N+V52F23hQnGuuzRZ
	 725Hg959T8JuoygC59ce9tTKMQVbuLZs1Q5fDbjiquDJKfPGx5n8c5ItN9tYcEV3x7oPW
	 w6kMicUyISf2vs7t8T2IQ368PKuipGfdBntZ26xet1U/7q5MJnTO5F0XeQXn6zQkijdIe
	 5gWW8l9W2QuhAP+XkyUqfNyeSPp9lSfnVgRF94WLHWsDp9nhQ+8RrmcVcc8Vs4zw42FVg
	 BG76NF6k0w17Mjt9mbhADolJjmPRM8y8dBtomRBqUTbLiIFq2Cqx6am1qgTvCc40Wgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E70E81F000C7;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800607;
	bh=eHfiIPPPyeG7mm6lxIdPhmX/nwJCmqyxv51o3cPcj0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oXNMYjGMdHw2JtieZhhQgQ3KWBiTdRHjqhk4ZFWOzsIuBbplyGr8AYOBHufbm5SWY
	 C9dd6k5S2Vm4zmNkT0pO1ePaXzVvwwOaZCzAz6gBrf60DRMPG/r4QBY8pJ2bGoK4bY
	 QoH478LNndG+EOQfmLmhkb4ORazwnWiE+8fnnUtRObiL0WFZtV5b5VRepV4dzYMmWQ
	 nNKZdERRdnOuWxbdLRiwIFNaN7al0fHzR83vnOjeKzh5+J74TzHr8LmiFxjM5+YvB7
	 cmieEmpIhoDlnDdn3TGU6XRLm5D6gmhPDchuvdZTViCKRKvVfvmO9x3x0iT67ldYgq
	 4zd9Z/AeUHqKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 73FA84A2FB;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Sun, 15 Nov 2026 19:43:05 -0800
Subject: [PATCH v2 2/3] dmaengine: xilinx_dma: Fix cyclic period count
 truncation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-xilinx-dma-work-v2-2-681ed00c15a1@nullptr.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=YUWNqOn/+Zb1scbFCp7ICqUXI0F0lLN8QDUGg53bhVo=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm/qu+uvPpBVkHu+WbX4IaZqbyrbzYI/c0y3Wkv92Cax
 hudZR8+dpSyMIhxMciKKbIcPzZtZ76tf11R9f0qmDmsTCBDGLg4BWAirfcYGQ63mp6z7lC443r1
 fMTf+i/3Ko8cllddclx0bs9WnS9HDzAzMhxc+/ePzrqTOc7zKqs/9qtb1kSr6fZcfLG82Ec7av7
 sx0wA
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

xilinx_dma_prep_dma_cyclic() stores buf_len / period_len, a size_t
quotient, in an unsigned int. On 64-bit builds the count can be
truncated: a buffer of 2^32 + 1 bytes split into 1-byte periods becomes
a single period, and the transfer covers one byte of the buffer the
client asked for.

Compute the quotient as a size_t and reject it if it exceeds
XILINX_DMA_NUM_DESCS before narrowing it. Each period needs at least one
hardware descriptor, so a larger count could never be prepared from the
pool anyway.

Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 6f00ab41b143..ba4fa1aafc50 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2511,7 +2511,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 	struct xilinx_dma_tx_descriptor *desc;
 	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
-	size_t copy, sg_used;
+	size_t copy, sg_used, periods;
 	unsigned int num_periods;
 	int i;
 	u32 reg;
@@ -2519,10 +2519,11 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	if (!period_len)
 		return NULL;
 
-	num_periods = buf_len / period_len;
-
-	if (!num_periods)
+	/* a period takes at least one descriptor */
+	periods = buf_len / period_len;
+	if (!periods || periods > XILINX_DMA_NUM_DESCS)
 		return NULL;
+	num_periods = periods;
 
 	if (!is_slave_direction(direction))
 		return NULL;

-- 
2.43.0



