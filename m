Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A654606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2gZrM9fq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdg8W00C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=; b=2gZrM9fqSjc2z5
	AjDQdIF/Q9mWq9kVc5lj86rTu3D7uOti+zrQVUnezorVUVmzN+au/m7TtBGjilF2e6fcfmRweKscT
	0FSneX+9Eg0vf1c0P5OKAzIc1ugJ9APtU3K+Cyh4AmyKHJRvjSFyEdL0mdKBeLiSN4yM/zRaE0ziN
	buPjwwSZayU/uj8xn1vZ1FWXnqVqS0FW09h/EON76JSSwG8j7WPFN5R5rnXJ8+1HszUUuRfv3OIms
	YSMxMvNim0qji+ju0Rn3/M85vj15ZFSsi7sdm88MK8kdkr6VbtXf+vmuCOO57HFZI4q/XOxNtCK/s
	R8tmsi3SdIDQLHOxlkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueN-0000000Fwh3-2xi8;
	Fri, 27 Nov 2026 12:01:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWue0-0000000FwEE-1303
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102601055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780894; x=1796385694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=Hdg8W00CLx6wzR3aStRYy7SaDDrxbpFzhOL8sF79zbrv/64VO6Z9V+mAejFNc/ZOQZ
         cPPRtbN1YKsywGPoGKND053FcSvU6tde4OfIJ2lylb7D3LuUnsF8U4fVJ78Ji4cFEF34
         hw/vbLCV/J1K6Iw3pttNhftExKLNlkeyRR1OnJcUHyjotLVXGpgmTxNvcVZQO/hfff43
         4AQMC78hb7aYU0+H95kiW+YIUAVqJ6zfvgREVqF2kTrJukbRUBPnvMHulGNGibkQZK+g
         Wq9o17GIV6e4Tp0wvDvK8FnfS9fOzZQU76/aRJqKmQ6Yfh1JiCWkxRggC45H2lsyyQRc
         w91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780894; x=1796385694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=1GJpPOa/u3bCyw72BrIWecgT8PvNVHOOvhHfYFPjcnQR/TylDRfIjuZ10rCdmxEKlz
         5TK0D5SFsv9ENOxuee8sRl8KsU1Hz0V18dt00/HEhTW82O0QN19v98XKJT/EjANyuwNl
         A5O4FlEPyJQqyHEqVfKC+N6nqUarntz+AbowNpHCl42rGGQ0fumwylCLDNi92eCtRmEr
         5gjocXFj/FSuvbR7nE+qSkd6rL94cgzu4yS6TF5ZWzNuHGmWGTOysWj8nXoNmvpD5im3
         oFh8WMYeo98p9ZHMNiH3Rf5oSjXdJ5fbuKvOnaFWmJ5N56RtlGzdISSjmG4oXJLn5iz2
         ODzQ==
X-Forwarded-Encrypted: i=1; AL+hErHI+75Ao8Y20JOIVbnjDyECBZuR6ud8gggDakRK8CvVH1zI3Rd6LAaIF3v30SOqPAsUDARRC6bLO67hi1/K+RPP@lists.infradead.org
X-Gm-Message-State: APuU4Z8lZpvQKw+HRc55oNp2X1L1orzAkf95OSaaVK1qWJLeJQ7czE9p
	Hp21eDbe5RoEY/ZIWN0eksMCXrDP5MrchzQsIxhx94fvXT1+emGRlUx0
X-Gm-Gg: AZFdTZeIFOvVPEGRvCwqIM/NS4RNDq6mV6llWS43zPCKX4iF/usCizXLT3zJw9icafh
	WxJJRuj9tahDrHxKxsbCzqSIe5IWmb0PkkzJvE9Jg2EGMNTnOWtp6Qk6cAKOBT/rjYo+5W3vnFr
	kJrzbWajJayyQRby65hg58RUgNJ6LP/FEDSn9jQsTbGk9QsQ/UcB/QlqEYDoI14OFxJGVGwsR5Z
	3+uJzBk8oKA5k/L6Qg7Di/F/OJzqpbyr/ZeLdCgOQ9g0uQj513HAcEdO6lJk8BxUC+ihnGArOx8
	Q6uumQzUoPK7qqMw0TCg2+FwomNH+fI3QZSD/qh/K1xz4lVDESTe6tMLmKmICI8V/Rcx915lsFU
	MsWXAGvEZ7CD3+bkLIQCHfI+kzwgvWyEf7J2XuKFwVi91M+5YmxIYNvbsuYNhdGCELOKAwifYpm
	SaNG9BrQfOPCcmCqQLKGWWULgYSZMgAINlGbEOxfnneN9WcznmRvtEj4XN277SqFJV8cWxiz2hQ
	bcwo8fFBCGeqc2cJfGveVkST7EHlk/m1aPuAVhQtpZQzWFnqUqIV0LrGf/U9dcP+diUKL/s/ARU
	IRvM6STOKGUMrL+3APrxZeFgZbGifh8OlaUU9Ll2S4NpnUo=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr518044795e9.14.1795780894323;
        Fri, 27 Nov 2026 04:01:34 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:33 -0800 (PST)
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
Subject: [PATCH v14 12/30] crypto: amlogic - Avoid kzalloc in engine thread
Date: Fri, 27 Nov 2026 13:00:45 +0100
Message-ID: <20261127120103.1532882-13-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040137_024871_2DC98D95 
X-CRM114-Status: GOOD (  19.95  )
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

It makes no sense to allocate memory via kzalloc, we
can use static buffer, speedup data processing and
don't think about kfree() calls.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 60 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  4 +-
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index cb6b959bb1f9..df42940f1112 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -59,7 +59,7 @@ static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 static int meson_cipher_do_fallback(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	int err;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -91,7 +91,6 @@ struct cipher_ctx {
 	struct skcipher_request *areq;
 	struct scatterlist *src_sg;
 	struct scatterlist *dst_sg;
-	void *bkeyiv;
 
 	unsigned int src_offset;
 	unsigned int dst_offset;
@@ -147,7 +146,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 		struct meson_alg_template, alg.skcipher.base);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
 	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	unsigned int blockmode = algt->blockmode;
@@ -157,7 +156,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 		return;
 
 	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
 		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
 					   ctx->keyiv.len, DMA_TO_DEVICE);
 	}
@@ -179,7 +178,7 @@ static bool meson_setup_data_descs(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 						       struct meson_alg_template,
@@ -222,7 +221,7 @@ static int meson_kick_hardware(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct meson_alg_template *algt = container_of(alg,
 						       struct meson_alg_template,
@@ -292,7 +291,7 @@ static int meson_kick_hardware(struct cipher_ctx *ctx)
 static int meson_cipher(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct meson_dev *mc = op->mc;
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
@@ -305,6 +304,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		.dst_sg = areq->dst,
 		.cryptlen = areq->cryptlen,
 	};
+	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	int err;
 
 	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
@@ -320,21 +320,21 @@ static int meson_cipher(struct skcipher_request *areq)
 	mc->chanlist[rctx->flow].stat_req++;
 #endif
 
-	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
-	if (!ctx.bkeyiv)
-		return -ENOMEM;
-
-	memcpy(ctx.bkeyiv, op->key, op->keylen);
 	ctx.keyiv.len = op->keylen;
 	if (ctx.keyiv.len == AES_KEYSIZE_192)
 		ctx.keyiv.len = AES_MAX_KEY_SIZE;
 
-	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
+	if (algt->blockmode == DESC_OPMODE_CBC) {
+		memcpy(op->keyiv + AES_MAX_KEY_SIZE, areq->iv, ivsize);
+		ctx.keyiv.len = AES_MAX_KEY_SIZE + ivsize;
+	}
+
+	ctx.keyiv.addr = dma_map_single(mc->dev, op->keyiv, ctx.keyiv.len,
 					DMA_TO_DEVICE);
 	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
 	if (err) {
 		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
-		goto free_keyiv;
+		return err;
 	}
 
 	err = meson_map_scatterlist(areq, mc);
@@ -368,9 +368,6 @@ static int meson_cipher(struct skcipher_request *areq)
 unmap_keyiv:
 	dma_unmap_single(mc->dev, ctx.keyiv.addr, ctx.keyiv.len, DMA_TO_DEVICE);
 
-free_keyiv:
-	kfree_sensitive(ctx.bkeyiv);
-
 	return err;
 }
 
@@ -390,7 +387,7 @@ int meson_handle_cipher_request(struct crypto_engine *engine, void *areq)
 static int meson_skdecrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct crypto_engine *engine;
 	int e;
@@ -408,7 +405,7 @@ static int meson_skdecrypt(struct skcipher_request *areq)
 static int meson_skencrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct crypto_engine *engine;
 	int e;
@@ -425,7 +422,7 @@ static int meson_skencrypt(struct skcipher_request *areq)
 
 static int meson_cipher_init(struct crypto_tfm *tfm)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx_dma(tfm);
 	struct meson_alg_template *algt;
 	const char *name = crypto_tfm_alg_name(tfm);
 	struct crypto_skcipher *sktfm = __crypto_skcipher_cast(tfm);
@@ -443,7 +440,7 @@ static int meson_cipher_init(struct crypto_tfm *tfm)
 		return PTR_ERR(op->fallback_tfm);
 	}
 
-	crypto_skcipher_set_reqsize(sktfm, sizeof(struct meson_cipher_req_ctx) +
+	crypto_skcipher_set_reqsize_dma(sktfm, sizeof(struct meson_cipher_req_ctx) +
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
 	return 0;
@@ -451,16 +448,15 @@ static int meson_cipher_init(struct crypto_tfm *tfm)
 
 static void meson_cipher_exit(struct crypto_tfm *tfm)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx_dma(tfm);
 
-	kfree_sensitive(op->key);
 	crypto_free_skcipher(op->fallback_tfm);
 }
 
 static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			    unsigned int keylen)
 {
-	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
@@ -477,11 +473,9 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	kfree_sensitive(op->key);
+
+	memcpy(op->keyiv, key, keylen);
 	op->keylen = keylen;
-	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
-		return -ENOMEM;
 
 	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
@@ -499,7 +493,6 @@ static struct meson_alg_template algs[] = {
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
 				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
 				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
 			.cra_init = meson_cipher_init,
@@ -528,7 +521,6 @@ static struct meson_alg_template algs[] = {
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
 				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
 				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
 			.cra_init = meson_cipher_init,
@@ -548,6 +540,14 @@ static struct meson_alg_template algs[] = {
 
 int meson_cipher_register(struct meson_dev *mc)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(algs); i++) {
+		struct skcipher_alg *alg = &algs[i].alg.skcipher.base;
+
+		alg->base.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx) + crypto_dma_padding();
+	}
+
 	return meson_register_algs(mc, algs, ARRAY_SIZE(algs));
 }
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 6797b44905d3..c401cbbadaa3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -125,14 +125,14 @@ struct meson_cipher_req_ctx {
 
 /*
  * struct meson_cipher_tfm_ctx - context for a skcipher TFM
- * @key:		pointer to key data
+ * @keyiv:		key data
  * @keylen:		len of the key
  * @keymode:		The keymode(type and size of key) associated with this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  * @fallback_tfm:	pointer to the fallback TFM
  */
 struct meson_cipher_tfm_ctx {
-	u32 *key;
+	u8 keyiv[AES_MAX_KEY_SIZE + AES_BLOCK_SIZE];
 	u32 keylen;
 	u32 keymode;
 	struct meson_dev *mc;
-- 
2.47.3


