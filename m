Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dj7qge1A;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjagkggL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=; b=Dj7qge1AYjX6hI3FMgkBw4tFQu
	N1als00lpbd2m9OlhFfCHZ4DNHkG7wYLR7paCuemDmrQigIdnvgqU2Ay5ddsKNndZX98IcM3nWPJk
	ulk0cjQmzvXwMNRRjuNZNT4uSkrRDcy6Yn5NOS4rZmx4s5NDe6OAQMij2e8VX1r3kY3KSX10bpauB
	OON0lAH4dTCfc7I5tn47ytQHG1f59AGnMoSn7jBjoPM+ZudaURvcX8RWQRocwwp71+ECQg5eCGok3
	sLf88EJNen3eWiyIslRZoHMGHcwIbFvOSejgkz6LTrjHMixUJvwfQTTMLmrbeVoIZvvV0gl58gjxC
	CCCvdfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoyz-00000006Ob4-0Tpz;
	Tue, 24 Nov 2026 11:46:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoyg-00000006OHY-2jOu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:46:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BC9E625DA;
	Tue, 24 Nov 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520785;
	b=M0gTENFTvswihkTCTUkXdpQlC5ExGoPnFloMoMTu4BjlU4S+lbvk0LKZ30zIIv5BEqH4
	 FAumdt/j9vjh+CNaFrUzjN7ZVdvHAheV1F29suqSopHDnUBhLS9klFS37N6t664EXTlaT
	 kfwtxZjadybZAJSkDu71uqy/o1gaL9jFaamrvtHYofN5jKINLrtUmTfPSib3mBOXHZaeU
	 Zx+bok9CLgDwOJMIWtXokG3eTQQaPVWtfUD//IkIYJt2r5t9anD3iIR/ZsO8gVoKHuVFi
	 lFcj4hB7b+E7i9pHeYckrJL5MPT0mtsss3lL5myE+mfXobwRGbp4hdz+W/Eat5WOcxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=;
	b=yQC4+xKUHvBBxF9yGWeNHtbHnO2gX2MI0Q6DtCQb/SSeVsMcC3U8vg7so+33wPm4G3Nw
	 XdVDkp4zYSBtaUCVVgwJ3PF3c/uHhHX1bNVovMLdupBu4I/deGeBGKj8Ra+rxmR3bgqGq
	 /PAF6qNB5mqoNcf6LD5aSGifU0E8pQYsagj82GgPlJvi4DVs/0LwCgmlrinUPhQ0EugW6
	 YQvcZmlyz0err5zMoQkL7xe46DMPzVjgoW59Xnum+oXRlskbvgiZqj8EYh9A3oO1pA2IV
	 zNQXHblVTzEebO2XPQbq5AhesbvQnzYrpVYOivX9K9G1KjdM1Gp5bAtcmhm0yOqSMfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34CD01F00A3C;
	Tue, 24 Nov 2026 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520785;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SjagkggLOYNkPxeIo+sj7KYBN3s5XTrrlJVSy9lulDP6zBrqjCpCCT9LUZVwMwKVt
	 khrLCBBbe8twWp6tV4SimBUQSyWjmk0k/6fU9pE/jlcrflfj+kyZ8OHgeBEcHxcF9K
	 w+LQC47eDa8WUODOmdoDFA7qL/fsUpdO71Xm0yfN/7LZL5J5YjbuFiQZZhhVxNswXW
	 T/lk5wHulFz10G3H3oyM7hz7jxoJJSegjfI0M5TWR5Ww1Y8pt8Q+50O9YYFthL/rX+
	 cBg4EERhNzl+uzf3/cArgzKp0L1lSyNY/wX+gdSXqWz4hZ0qe/KsMP9IsAO+yzWtAW
	 ncj409ywl9vNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 13C8B4CA37;
	Tue, 24 Nov 2026 11:45:29 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:22 +0530
Subject: [PATCH v13 20/20] dmaengine: ti: k3-udma: Validate resource ID and
 fix logging in reservation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-dma-upstream-v13-v13-20-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=1811;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=3SmkAPYsTzacE+IK1GgfJoKJ8iRPP+nzvDNxs+11xKY=;
 b=s7M6c6qRUdqFBHU8PhL96fM8whg+saMsieN9Pil9t9aJNsjhbo8Ql66Q1SBqQImGh9V8tevEk
 NwXDhzTW6wRCoY7I3WYGg6kc3so7JBEDCU+ruL4Jj4lwXHzKX3Yb6Vj
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
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
Reply-To: s-adivi@ti.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 42c4064d72b4f..20a2ef5445ae7 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2046,9 +2046,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\

-- 
2.55.0



