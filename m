Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VUeZEZg2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfWRm3ux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=; b=VUeZEZg2cEctL9
	TgqrhrgLPLyNQ9h6a0XzYvunlwqcuABehGREMteECaN0uY7tlEsGn2vz1NLFGgUENL9LYQKLEvmKf
	nVZz8zMvFFEhnnd0rVS2J0CCroWtCGLLcJq3WlhQjpdcDWQV3+UdwbTxrfY1wNNnFlUya4usNQ366
	rtlxM5GIbMNHiRkRLHJCxcuhQRxnCP7hk3y6TGbcvOkXH4FtEepuVO2ZQkKyLXHvbkgZU9WAD8CM/
	+Of4nblcLZ31A7n0A2UNQfPv/BIBZHi2Llv1pz7Bcaovlnsc6DD0ihOgQa6kpKTpxXh5hMfz/wYxE
	cKfVKKbVLBHMphfOWMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDs-0000000EK10-22Ld;
	Thu, 26 Nov 2026 19:33:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDa-0000000EJZb-3wed
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so60043655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721597; x=1796326397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=sfWRm3uxHhT6lz48zANOtGbGlJ6A9JnrAlnZPUsazsS6+ijUxoyW08V3oPMTBNdtGq
         VbwGAuAdZiNL9PBykGpsw0zKEUfJhaB+RFsixO6lRoMH1iIdYK7fgRlmnKNr5xJso7Ug
         uY5FBLNDehKOf+0x76X3NKGrAdOfUDYLrqP8R0UDRP5Mtpg1pl0w9v9LSPNf9TLYqWX9
         jkeZaagmMenVQda53Cm1MQ4GA+ZV6rZ4//zl3180jPyzgmuA9/MByqo6gmqitnl+zBUZ
         //lCxCsbJuiLrmOBVbBPx29AIExu+lHrigyMDZOMsE+ECSKjwRdgYe2HtR/hZIsf7s2h
         vNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721597; x=1796326397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=TSD26rb/JMkkMTXL/4mOYZWGhu79ND22g+6RMlPr0I00d2mMYGbnrUbHWKT8wZIfOU
         PbyO8NghCL2TuwmpBusr/i/pLd1bWhWssjcwKM02F7a4Rd9XSCorY1ygK1hK91w/mugc
         ukL12gJee/kxKWS5hiJEAxW7PXWRcLFWW0tIPguMPWLvLOVyFzwFvzqk59UrEqcQsP6C
         oaIyOPItLKt5HALAcH8SbTKxr28l9nDQDcbGmUc91DRSZ+pytWHdBKJ46YcTpeP9zV3S
         OcGt4/P7TaUV1x3iRkfKRqFGelCBWRENvt1fEU5VN/DdpfatRsHXvZom+4ZvR9n3UXO+
         EyJg==
X-Forwarded-Encrypted: i=1; AL+hErF6lV2Td+xA7ZhnN9IJE0wMGY7cjZ8v5bQWSPF79TFsvBKSh81IB+J6ChSb4zWp927PtRQUTKKkL2v5NWwluBgz@lists.infradead.org
X-Gm-Message-State: APuU4Z/4ys+bEUobkBoB97cMSbso0l8m3PbIEzWVNHca7Yf2OVDUr3m7
	thewsmgSgK46/hBMh4rzZf7iEE92VuZbMFw7SWiKO/6OqLAcrIgKKndS
X-Gm-Gg: AZFdTZfnI6zwAFCcfYNdKOvm4nU9kjF/5kJJPCb4ML3Fmdw8P9s1fiNX6DuHp3MOVeE
	5DNio9mSKRbzFXLw/0Q0ivCzK5SmHaCr4QKvVwu11HEXTfdvEJ8KZDrTYLH4fVnB8gRFNNP2W6L
	5cCoQLfilq2xpyWf0RdWKjo3c33hf/ZZZFA3Qa2HxJJ7VoyapeZ/GIjDE3OniDl+NCkqiEW4f7n
	ogHgGD3orJybWbf8IYrCIpZJXPZ/2wUd00ckHTYosAQcxsRQxGmCrxcJ2YhPXQt9edNn+45r1zF
	hd8FsPWfIYzxDhiQSjFAn/HmSdQrwz3GLqnFZqG/Zr5qYoaDr2ZEdJDNOydTqR+HsT46j1/2H5e
	4Vufue54GRYtEZ1hPlIAa7K/SxxwTEpAGsuvywUtWzCXg2sqd6L00TsKs/vH1UBLLWgud9byOMN
	lxmYbv3xZHdHw7X6N0Mdp+4hBCllFZd/NJadBqFXf3Y6Nv9bVhngw8oaxrAM+Jm6ruG3W/8R/zb
	5JPToEtMlzsgfUXA7PExsib8b6t9J/hsUfMWQxWXNq47+ja/P6OSSzs56JA++2dk4vgnXexSfWA
	cMckII3h+qd9vgUkprU89tp60e8p1GKHebKj0mJtviB0cg==
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr450709145e9.23.1795721597209;
        Thu, 26 Nov 2026 11:33:17 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:16 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 11/25] crypto: amlogic - Process more than MAXDESCS descriptors
Date: Thu, 26 Nov 2026 20:32:27 +0100
Message-ID: <20261126193241.1471372-12-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113319_136218_7DAF625C 
X-CRM114-Status: GOOD (  23.39  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

1. The old alhorithm was not designed to process a large
amount of memory, and therefore gave incorrect results.

2. Not all Amlogic SoC's use 3 KEY/IV descriptors.
Add keyiv descriptors count parameter to platform data.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 459 ++++++++++++--------
 drivers/crypto/amlogic/amlogic-gxl-core.c   |   1 +
 drivers/crypto/amlogic/amlogic-gxl.h        |   2 +
 3 files changed, 283 insertions(+), 179 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c17ce5cc70a8..cb6b959bb1f9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,35 +17,41 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static bool meson_cipher_need_fallback(struct skcipher_request *areq)
+static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
+					  struct scatterlist *sg)
 {
-	struct scatterlist *src_sg = areq->src;
-	struct scatterlist *dst_sg = areq->dst;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
+	unsigned int cryptlen = areq->cryptlen;
+
+	while (cryptlen) {
+		unsigned int len = min(cryptlen, sg->length);
+
+		if (!IS_ALIGNED(sg->offset, sizeof(u32)))
+			return true;
+		if (len % blocksize != 0)
+			return true;
+
+		cryptlen -= len;
+		sg = sg_next(sg);
+	}
+
+	return false;
+}
 
+static bool meson_cipher_need_fallback(struct skcipher_request *areq)
+{
 	if (areq->cryptlen == 0)
 		return true;
 
-	if (sg_nents(src_sg) != sg_nents(dst_sg))
+	if (meson_cipher_need_fallback_sg(areq, areq->src))
 		return true;
 
-	/* KEY/IV descriptors use 3 desc */
-	if (sg_nents(src_sg) > MAXDESC - 3 || sg_nents(dst_sg) > MAXDESC - 3)
-		return true;
+	if (areq->dst == areq->src)
+		return false;
 
-	while (src_sg && dst_sg) {
-		if ((src_sg->length % 16) != 0)
-			return true;
-		if ((dst_sg->length % 16) != 0)
-			return true;
-		if (src_sg->length != dst_sg->length)
-			return true;
-		if (!IS_ALIGNED(src_sg->offset, sizeof(u32)))
-			return true;
-		if (!IS_ALIGNED(dst_sg->offset, sizeof(u32)))
-			return true;
-		src_sg = sg_next(src_sg);
-		dst_sg = sg_next(dst_sg);
-	}
+	if (meson_cipher_need_fallback_sg(areq, areq->dst))
+		return true;
 
 	return false;
 }
@@ -76,6 +82,213 @@ static int meson_cipher_do_fallback(struct skcipher_request *areq)
 	return err;
 }
 
+struct cipher_ctx {
+	struct {
+		dma_addr_t addr;
+		unsigned int len;
+	} keyiv;
+
+	struct skcipher_request *areq;
+	struct scatterlist *src_sg;
+	struct scatterlist *dst_sg;
+	void *bkeyiv;
+
+	unsigned int src_offset;
+	unsigned int dst_offset;
+	unsigned int cryptlen;
+	unsigned int tloffset;
+};
+
+static int meson_map_scatterlist(struct skcipher_request *areq, struct meson_dev *mc)
+{
+	int nr_sgs, nr_sgd;
+
+	if (areq->src == areq->dst) {
+		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
+				    DMA_BIDIRECTIONAL);
+		if (!nr_sgs) {
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+			return -EINVAL;
+		}
+	} else {
+		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
+				    DMA_TO_DEVICE);
+		if (!nr_sgs) {
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+			return -EINVAL;
+		}
+
+		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
+				    DMA_FROM_DEVICE);
+		if (!nr_sgd) {
+			dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void meson_unmap_scatterlist(struct skcipher_request *areq, struct meson_dev *mc)
+{
+	if (areq->src == areq->dst) {
+		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
+	} else {
+		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+		dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
+	}
+}
+
+static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+		struct meson_alg_template, alg.skcipher.base);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_dev *mc = op->mc;
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	int i;
+
+	if (ctx->tloffset)
+		return;
+
+	if (blockmode == DESC_OPMODE_CBC) {
+		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
+		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
+					   ctx->keyiv.len, DMA_TO_DEVICE);
+	}
+
+	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
+		struct meson_desc *desc =
+			&mc->chanlist[rctx->flow].tl[ctx->tloffset];
+		int offset = i * 16;
+
+		desc->t_src = cpu_to_le32(ctx->keyiv.addr + offset);
+		desc->t_dst = cpu_to_le32(offset);
+		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY | ctx->keyiv.len);
+
+		ctx->tloffset++;
+	}
+}
+
+static bool meson_setup_data_descs(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+						       struct meson_alg_template,
+						       alg.skcipher.base);
+	struct meson_dev *mc = op->mc;
+	struct meson_desc *desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
+	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	unsigned int maxlen = rounddown(DESC_MAXLEN, blocksize);
+	unsigned int todo;
+	u32 v;
+
+	ctx->tloffset++;
+
+	todo = min(ctx->cryptlen, maxlen);
+	todo = min(todo, ctx->cryptlen);
+	todo = min(todo, sg_dma_len(ctx->src_sg) - ctx->src_offset);
+	todo = min(todo, sg_dma_len(ctx->dst_sg) - ctx->dst_offset);
+
+	desc->t_src = cpu_to_le32(sg_dma_address(ctx->src_sg) + ctx->src_offset);
+	desc->t_dst = cpu_to_le32(sg_dma_address(ctx->dst_sg) + ctx->dst_offset);
+
+	ctx->cryptlen -= todo;
+	ctx->src_offset += todo;
+	ctx->dst_offset += todo;
+
+	v = DESC_OWN | blockmode | op->keymode | todo;
+	if (rctx->op_dir == MESON_ENCRYPT)
+		v |= DESC_ENCRYPTION;
+
+	if (!ctx->cryptlen || ctx->tloffset == MAXDESC)
+		v |= DESC_LAST;
+
+	desc->t_status = cpu_to_le32(v);
+
+	return v & DESC_LAST;
+}
+
+static int meson_kick_hardware(struct cipher_ctx *ctx)
+{
+	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct meson_alg_template *algt = container_of(alg,
+						       struct meson_alg_template,
+						       alg.skcipher.base);
+	struct meson_dev *mc = op->mc;
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
+	unsigned int blockmode = algt->blockmode;
+	enum dma_data_direction new_iv_dir;
+	struct scatterlist *sg_head;
+	void *new_iv;
+	int err;
+
+	if (blockmode == DESC_OPMODE_CBC) {
+		struct scatterlist *sg_current;
+		unsigned int offset;
+
+		if (rctx->op_dir == MESON_ENCRYPT) {
+			sg_current = ctx->dst_sg;
+			sg_head = ctx->areq->dst;
+			offset = ctx->dst_offset;
+			new_iv_dir = DMA_FROM_DEVICE;
+		} else {
+			sg_current = ctx->src_sg;
+			sg_head = ctx->areq->src;
+			offset = ctx->src_offset;
+			new_iv_dir = DMA_TO_DEVICE;
+		}
+
+		if (ctx->areq->src == ctx->areq->dst)
+			new_iv_dir = DMA_BIDIRECTIONAL;
+
+		offset -= ivsize;
+		new_iv = sg_virt(sg_current) + offset;
+	}
+
+	if (blockmode == DESC_OPMODE_CBC &&
+	    rctx->op_dir == MESON_DECRYPT) {
+		dma_sync_sg_for_cpu(mc->dev, sg_head,
+				    sg_nents(sg_head), new_iv_dir);
+		memcpy(ctx->areq->iv, new_iv, ivsize);
+	}
+
+	reinit_completion(&mc->chanlist[rctx->flow].complete);
+	meson_dma_start(mc, rctx->flow);
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[rctx->flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
+		dev_err(mc->dev, "DMA timeout for flow %d\n", rctx->flow);
+		return -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+		return err;
+	}
+
+	if (blockmode == DESC_OPMODE_CBC &&
+	    rctx->op_dir == MESON_ENCRYPT) {
+		dma_sync_sg_for_cpu(mc->dev, sg_head,
+				    sg_nents(sg_head), new_iv_dir);
+		memcpy(ctx->areq->iv, new_iv, ivsize);
+	}
+
+	ctx->tloffset = 0;
+
+	return 0;
+}
+
 static int meson_cipher(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
@@ -84,191 +297,79 @@ static int meson_cipher(struct skcipher_request *areq)
 	struct meson_dev *mc = op->mc;
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt;
-	int flow = rctx->flow;
-	unsigned int todo, eat, len;
-	struct scatterlist *src_sg = areq->src;
-	struct scatterlist *dst_sg = areq->dst;
-	struct meson_desc *desc;
-	int nr_sgs, nr_sgd;
-	int i, err = 0;
-	unsigned int keyivlen, ivsize, offset, tloffset;
-	dma_addr_t phykeyiv;
-	void *backup_iv = NULL, *bkeyiv;
-	u32 v;
-
-	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
+	struct cipher_ctx ctx = {
+		.areq = areq,
+		.src_offset = 0,
+		.dst_offset = 0,
+		.src_sg = areq->src,
+		.dst_sg = areq->dst,
+		.cryptlen = areq->cryptlen,
+	};
+	int err;
 
-	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u flow=%d\n", __func__,
+	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
 		crypto_tfm_alg_name(areq->base.tfm),
 		areq->cryptlen,
 		rctx->op_dir, crypto_skcipher_ivsize(tfm),
-		op->keylen, flow);
+		op->keylen, rctx->flow);
+
+	algt = container_of(alg, struct meson_alg_template, alg.skcipher.base);
 
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	algt->stat_req++;
-	mc->chanlist[flow].stat_req++;
+	mc->chanlist[rctx->flow].stat_req++;
 #endif
 
-	/*
-	 * The hardware expect a list of meson_desc structures.
-	 * The 2 first structures store key
-	 * The third stores IV
-	 */
-	bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
-	if (!bkeyiv)
+	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
+	if (!ctx.bkeyiv)
 		return -ENOMEM;
 
-	memcpy(bkeyiv, op->key, op->keylen);
-	keyivlen = op->keylen;
-
-	ivsize = crypto_skcipher_ivsize(tfm);
-	if (areq->iv && ivsize > 0) {
-		if (ivsize > areq->cryptlen) {
-			dev_err(mc->dev, "invalid ivsize=%d vs len=%d\n", ivsize, areq->cryptlen);
-			err = -EINVAL;
-			goto theend;
-		}
-		memcpy(bkeyiv + 32, areq->iv, ivsize);
-		keyivlen = 48;
-		if (rctx->op_dir == MESON_DECRYPT) {
-			backup_iv = kzalloc(ivsize, GFP_KERNEL);
-			if (!backup_iv) {
-				err = -ENOMEM;
-				goto theend;
-			}
-			offset = areq->cryptlen - ivsize;
-			scatterwalk_map_and_copy(backup_iv, areq->src, offset,
-						 ivsize, 0);
-		}
-	}
-	if (keyivlen == AES_KEYSIZE_192)
-		keyivlen = AES_MAX_KEY_SIZE;
+	memcpy(ctx.bkeyiv, op->key, op->keylen);
+	ctx.keyiv.len = op->keylen;
+	if (ctx.keyiv.len == AES_KEYSIZE_192)
+		ctx.keyiv.len = AES_MAX_KEY_SIZE;
 
-	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(mc->dev, phykeyiv);
+	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
+					DMA_TO_DEVICE);
+	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
 	if (err) {
 		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
-		goto theend;
+		goto free_keyiv;
 	}
 
-	tloffset = 0;
-	eat = 0;
-	i = 0;
-	while (keyivlen > eat) {
-		desc = &mc->chanlist[flow].tl[tloffset];
-		memset(desc, 0, sizeof(struct meson_desc));
-		todo = min(keyivlen - eat, 16u);
-		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
-		desc->t_dst = cpu_to_le32(i * 16);
-		v = DESC_MODE_KEY | DESC_OWN | 16;
-		desc->t_status = cpu_to_le32(v);
-
-		eat += todo;
-		i++;
-		tloffset++;
-	}
+	err = meson_map_scatterlist(areq, mc);
+	if (err)
+		goto unmap_keyiv;
 
-	if (areq->src == areq->dst) {
-		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
-				    DMA_BIDIRECTIONAL);
-		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid BIDIR SG count %d\n", nr_sgs);
-			err = -EINVAL;
+	ctx.tloffset = 0;
 
-			if (nr_sgs)
-				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
-			goto error_keyiv;
-		}
-		nr_sgd = nr_sgs;
-	} else {
-		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
-				    DMA_TO_DEVICE);
-		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
-			err = -EINVAL;
+	while (ctx.cryptlen) {
+		meson_setup_keyiv_descs(&ctx);
 
-			if (nr_sgs)
-				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-			goto error_keyiv;
+		if (meson_setup_data_descs(&ctx)) {
+			err = meson_kick_hardware(&ctx);
+			if (err)
+				break;
 		}
-		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
-				    DMA_FROM_DEVICE);
-		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
-			err = -EINVAL;
 
-			if (nr_sgd)
-				dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
-			goto error_src;
+		if (ctx.src_offset == sg_dma_len(ctx.src_sg)) {
+			ctx.src_offset = 0;
+			ctx.src_sg = sg_next(ctx.src_sg);
 		}
-	}
 
-	src_sg = areq->src;
-	dst_sg = areq->dst;
-	len = areq->cryptlen;
-	while (src_sg) {
-		desc = &mc->chanlist[flow].tl[tloffset];
-		memset(desc, 0, sizeof(struct meson_desc));
-
-		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
-		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
-		todo = min(len, sg_dma_len(src_sg));
-		v = op->keymode | DESC_OWN | todo | algt->blockmode;
-		if (rctx->op_dir)
-			v |= DESC_ENCRYPTION;
-		len -= todo;
-
-		if (!sg_next(src_sg))
-			v |= DESC_LAST;
-		desc->t_status = cpu_to_le32(v);
-		tloffset++;
-		src_sg = sg_next(src_sg);
-		dst_sg = sg_next(dst_sg);
+		if (ctx.dst_offset == sg_dma_len(ctx.dst_sg)) {
+			ctx.dst_offset = 0;
+			ctx.dst_sg = sg_next(ctx.dst_sg);
+		}
 	}
 
-	reinit_completion(&mc->chanlist[flow].complete);
-	meson_dma_start(mc, flow);
-
-	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-							msecs_to_jiffies(500));
-	if (err == 0) {
-		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
-		err = -EINVAL;
-	} else if (err < 0) {
-		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
-	} else {
-		/* No error */
-		err = 0;
-	}
+	meson_unmap_scatterlist(areq, mc);
 
-	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
+unmap_keyiv:
+	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
 
-	if (areq->src == areq->dst) {
-		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
-	} else {
-		dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-		dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
-	}
-
-	if (areq->iv && ivsize > 0) {
-		if (rctx->op_dir == MESON_DECRYPT) {
-			memcpy(areq->iv, backup_iv, ivsize);
-		} else {
-			scatterwalk_map_and_copy(areq->iv, areq->dst,
-						 areq->cryptlen - ivsize,
-						 ivsize, 0);
-		}
-	}
-	goto theend;
-
-error_src:
-	dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
-error_keyiv:
-	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
-theend:
-	kfree_sensitive(bkeyiv);
-	kfree_sensitive(backup_iv);
+free_keyiv:
+	kfree_sensitive(ctx.bkeyiv);
 
 	return err;
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 68d394e90f66..0e17105520df 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -255,6 +255,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 static const struct meson_pdata meson_gxl_pdata = {
 	.descs_reg = 0x0,
 	.status_reg = 0x4,
+	.setup_desc_cnt = 3,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 15b4335942d5..6797b44905d3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -82,10 +82,12 @@ struct meson_flow {
  * struct meson_pdata - SoC series dependent data.
  * @reg_descs:	offset to descriptors register
  * @reg_status:	offset to status register
+ * @setup_desc_cnt:	number of setup descriptor to configure.
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
+	u32 setup_desc_cnt;
 };
 
 /*
-- 
2.47.3


