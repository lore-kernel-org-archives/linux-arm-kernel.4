Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWA9zRvU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdWIAy0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HmV9sETKCIqTEm5gpQSn0ZKljOkssnactLIkz6YmI5s=; b=VWA9zRvU4yo+2C
	tbtmE8NLumvYwYk7lPYpEwjsUppO6fGsDH0Z64JFubRtiDJqM/V7tSqFkYMj0sssAQc6FgCdcyZZZ
	3dTbKK29bs35uGxyStkoTt5THIT7jgYmNgaMEJTd78XRkljopfqz81FbyWdkhnKC3GPtxBqEM2S4Q
	/EZVtUzDFDjs55QS084vx3oxh63E1XhnvPNotQe8i6+w1LoN4Dw3625u+Ye2hgPZ6QXM6sVpTLle8
	ryN+2yxJAeZSoKpchovrp/sp6sxHvqOdfkLNFSnPXRIKN0/iovOOoGnPQZ7H1kVPg40/scheGrvzq
	JLEKNjJ3AUQv3KgfQT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXku-00000004LUx-3j3y;
	Mon, 23 Nov 2026 17:23:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkr-00000004LTG-1AC1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:23:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D93D40939;
	Mon, 23 Nov 2026 17:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4729D1F000D0;
	Mon, 23 Nov 2026 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454580;
	bh=HmV9sETKCIqTEm5gpQSn0ZKljOkssnactLIkz6YmI5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UdWIAy0IYBltJGVJMVfmHqWjwv6Mpp8Pq0EQnRnN4LY4bdqGl9tvW36dWPYuUjipM
	 fG+6WkatUFaSKiUU7SdiMmcPybvYYg+fDz3X2HgPVi0Kp5wK0UakOut1SyuwjnJXHg
	 6TtiX/5NcpW6iwm1HtZ/xVb69hkry+/4IMRDPS1Hf7m6zGK5QZ/XKkbJ3oJJT9Wo9q
	 BxRTLBUCg4yxiUTCXs13qMY6F0Wq7pjl+RfoE4orvHnG8w8NxqJGBb16nQMyzdgrgm
	 T5vrm7tIEVTXqrn1pAAg6QxhQnzQKS9WQLfW69M4v/8d58sK5yPOXALFdwdBbv1fNP
	 uEOKxgr3hsrIw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 10/10] remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
Date: Mon, 23 Nov 2026 17:20:54 +0000
Message-ID: <20261123172140.3547896-11-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>
References: <20261123172140.3547896-1-lee@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When size is not a multiple of 4, both imx_dsp_rproc_memcpy() and
imx_dsp_rproc_memset() compute affected_mask as GENMASK(8 * r, 0) for
the remaining r bytes (1 <= r <= 3).  Because GENMASK(h, l) is inclusive
of bit h, GENMASK(8 * r, 0) sets 8 * r + 1 bits and clears or overwrites
the least-significant bit of the first byte past the end of the target
region during the 32-bit read-modify-write.

Use GENMASK(8 * r - 1, 0) to mask exclusively the r trailing bytes.

Fixes: 408ec1ff0caa ("remoteproc: imx_dsp_rproc: Add custom memory copy implementation for i.MX DSP Cores")
Closes: https://sashiko.dev/#/bug/linux-2e407b68-a7e9-42ff-a613-e61b47a4461b
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 2771043ee433..0e0325d5df9f 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -799,7 +799,7 @@ static int imx_dsp_rproc_memcpy(void *dst, const void *src, size_t size)
 		writel(source[i], dest + i * 4);
 
 	if (r) {
-		affected_mask = GENMASK(8 * r, 0);
+		affected_mask = GENMASK(8 * r - 1, 0);
 
 		/*
 		 * first read the 32bit data of dest, then change affected
@@ -849,7 +849,7 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	}
 
 	if (r) {
-		affected_mask = GENMASK(8 * r, 0);
+		affected_mask = GENMASK(8 * r - 1, 0);
 
 		/*
 		 * first read the 32bit data of addr, then change affected
-- 
2.56.1.750.gf70dc682cf-goog


