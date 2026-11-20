Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=exkSoqpJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=D3U3CzEf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eTqndXSoVjv8prCPAM8vYvbnqbOARC3EPYXvVmzxF6o=; b=exkSoqpJG8aBrp
	eJEvn/9muc7ZC7WcjXf5HfPL0G97JxYgckzITFV0aPjZJya0ldLwk6aJcctTAlHxtv+f3feCKDTlQ
	03qSvvnmqzcnBUkcWCnwpSTzMWug2R5y7jH4adt7DZg0AWLatJwIGfSNWlO4ugIexupx5kQe06w1p
	Wr4k3sXChr5/d6ItXC/kNWdUI7aGgK58pVFJnKRh1uYA+stALBUlQkR28guB/Q5TNtepMnmrgroHs
	grJKacpjb6mno0kwFLvkfNNuMyxDfXfiEEVHOPWuwwHDNzNLrtLE+j/gHsQBaks9lJhJgvhEiUeBU
	njaYIwUZ+5TbtLNp+dWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPeU-0000000FFsE-1VXk;
	Fri, 20 Nov 2026 14:31:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPeS-0000000FFrE-0DVD;
	Fri, 20 Nov 2026 14:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795185101;
	bh=1ZPtzm7B2+TCZF2ySc+x5bmtJZBLwrSuv34z+pW3mqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3U3CzEfU0Q9CCZYqO2LIecxvGVEvDk6+1OlgUlAUYo8maRf7vBpM41MgwdXXEBDC
	 YkVpk+39Ub9KMRgQ1erSS68JXrBxyRvJQ5aRwUPdaM/Fmbx5KlK1mGSWZYtEOptbnE
	 3ctFHwccMyuFyt8zGpuw+AMo8/SW0bAK0iotBGKUvRSLlM95tcCLmVBvojnySSoZRT
	 YLzrbKF4HuT9iXAvS3DJxLNzGd7wEjF8szi0+EFkqBQiS74YkU4z4qRsBehDFaXoIv
	 4H5S/mAnEFoAhT4jT5Fxp/4CsLt070lGE9U1XfJALzbFTg9wojoJWjo/xwsTkXT882
	 3I+e+x0dbR/2Q==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51FB817E09F3;
	Fri, 20 Nov 2026 15:31:41 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 2/3] media: verisilicon: AV1: Fix luma size
Date: Fri, 20 Nov 2026 15:31:34 +0100
Message-ID: <20261120143135.71134-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_063144_246406_9080027C 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Use the values computed by v4l2 helpers to get luma size.
Unlile before this will also take care of padding.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 5da59104a966..5e0cd5268f22 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -221,7 +221,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
 
 static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
 }
 
 static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
-- 
2.53.0


