Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA461606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSTLe8dG;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=P69EQ0nQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sND+NEh1U7ec3zRhuBVC2cOrGYzuk39FS8iFLI3SGKw=; b=fSTLe8dGGKUrrU
	TuyMbviH6mjqCOxVWYBBs3+mbHPkO7G6iSdpRY3NQuu6Ni/fAo0tQRxddtk2ouAUhYhSvKqC6BtTA
	TvQcR0y3f9Lzo2iRjDQGw9XsITS3pF7IJAoc8ZsFuKUPYmn/5MGoM4RBZCmPINcEqx5RevzonCabK
	2DkAGNKQ3YehWA4njMEIUCyUxw04TscDibYk7RJS8McVLUCuSrEA2bms/fjw78yAvjX6PVN7821Qw
	B2c7PwggAk2xrd9zvAVo/t+0oTCOJfBihPK3lnL/demdVg83zI6lmniw0jmgl3wlL4e0R0Ntt2zuw
	OaSoemBO+S6GteH/3cHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC8H-00000009q0P-3QFv;
	Wed, 25 Nov 2026 12:29:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC70-00000009pSJ-1oJB;
	Wed, 25 Nov 2026 12:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609712;
	bh=CS7dmwAJB+LPTlLHZFV68ZX+5emOwH579RTQInfKmB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P69EQ0nQBmIA7x6NDluOH5IoF5q2hRKXIny3Gwpkms/UBfGG9sMu+bUCho3OWe4pL
	 MfmSLqqIysoUIYAMlH7fOtIKVw7VK45aqnaw+1aoQ8adKg0pz3gN4p8qEDGJ75gBBu
	 arvY+B4cBeI3hiYQ8SGl4eR1/7fPGqah2q7CMNmKgwRiXVhX7b4zvKBic7J1kkzzY5
	 2t+9wezfxZ0Eotd5RuZw0LqwGPhJYVih7m1kgXO3SvGYjc1b1Y6890zf4JrOBEDLT8
	 1HaR+sT35v1sZn1nFYRecG+xGtNAXqEtzwljSZrVUr1b/9wPLXzUBDaTK3eOX3dxdm
	 qevsk5XPHYzqg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D245717E0883;
	Wed, 25 Nov 2026 13:28:31 +0100 (CET)
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
Subject: [PATCH v9 3/4] media: verisilicon: AV1: Fix luma size
Date: Wed, 25 Nov 2026 13:28:24 +0100
Message-ID: <20261125122825.236422-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042837_112339_CEDBD92D 
X-CRM114-Status: GOOD (  10.37  )
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
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 087a944b3394..5c2ce22c17a4 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -214,7 +214,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
 
 static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
 }
 
 static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
-- 
2.53.0


