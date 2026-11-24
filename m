Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9334606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UqAcM6xv;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NL9ibpX/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R7P13K/7gG3j7Sdw2/bXjTTm8YI1OdWUIdO2o+cc/x4=; b=UqAcM6xvw3TY+V
	dzrPLAO+lNXhDYepwSxt8rn0Fjic5jeUqiMUWmHw2mnDxBgFoDXKyM5gOhRnqfNO0iPJvJkLqFEai
	Uqu4JOpn3GhKuN0hoxnhX47koxE4veJyZdUQoM7sjx7VVtlJakFVwOibjpUtC48qJukvtiM+dwI2v
	jYn8tHYM9EDAu659i2yrOzYTnfseFH+sDDhrJTcw32k91hp8JtSUc3/PVm0WGLIVUeBtPLwSojQUB
	2VczPvWGY30owXNnRAAZYLilHKNUpAhPlT9hLjbJsXjX2xXc3Lyybu2hmwsaj53E6Ft9a18BT8BLh
	g5GTRvGmjPn3yl3K3gEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqQ6-00000006bwF-26hc;
	Tue, 24 Nov 2026 13:18:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPi-00000006blF-3gbg;
	Tue, 24 Nov 2026 13:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795526304;
	bh=GYr0Q0EwABsuRiokJjoVaEcIUoL1Wcs+cF91nQ3RLaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NL9ibpX/RiRTvzWOOboZox5WC3WHJaf4GouK+EUGnv+VOrFwTZifPzBjHynHqA46j
	 LRBqyLxPKWkEaaLY+WknPwS7x7GcCKOLlSW+tNh5jPzs2M80GyLvUOmMQUIHzY4e1L
	 9wYgFl/cQRATQwj9b6tAr+HU/o3MiqbVqRJtBuAFnjSJjwNKGhEHgVACa+fZryvxwh
	 AFlyMjO03pEpB9LV28EDCmruBXrOJA4nAjmNnrCwX11ZppF57FZLC8lMniDTQsqXT8
	 3LSxrJTcyWs8V9SX1dIK6G42pKtoxvnLDB/KbUfPd23a6dGUIhAOA3/UXhwIngygC/
	 0EHUrWe/ghPoA==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1ECF217E0CA0;
	Tue, 24 Nov 2026 14:18:24 +0100 (CET)
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
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH v8 2/3] media: verisilicon: AV1: Fix luma size
Date: Tue, 24 Nov 2026 14:18:15 +0100
Message-ID: <20261124131816.115131-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
References: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051827_253462_D56BF6BA 
X-CRM114-Status: GOOD (  10.42  )
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
Unlike before this will also take care of padding.

Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
changes in v8
- add Reviewed-by tag and CC stable kernel.

 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index bbfca34688eb..afa91a6c503c 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -215,7 +215,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
 
 static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
 }
 
 static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
-- 
2.53.0


