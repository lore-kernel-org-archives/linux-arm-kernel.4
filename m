Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF8606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rrRnTaCC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9n4si1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=; b=rrRnTaCCmU79pf
	xiMJNVoUA/A6O1JOJv6sxPpOUEyVpq2dISBN6HGB0dYnyNbjB4Vq4RRzR3JLSnnoeQfplcnBm0vGU
	PMs+eWq2G8NYHrczdrGunnegybDrBnzZJwuoCs1YksFXYiEUMj/M6/HzQD6KQUpjS3PA3ksW6q75q
	maqPoprYV85PsgGH+W8Xe9QMW9raTQfqFGjprYPTOIi2lUw8ptHW+BQsAcKzhfjAv/yiTHWYpHrtZ
	7xtCfWvCZaRLYOnnvtdpicKepP4X5gJ1m62ayR2g2Ag/pqO7KWENA/l3V+RSVU130Yy/2kwOkVPku
	3UiomFGdp8njACD5/3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDu-0000000EK5j-1W7t;
	Thu, 26 Nov 2026 19:33:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDc-0000000EJaz-1k3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so61535305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721599; x=1796326399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=s9n4si1iXeaXyUCzXeuG4GRkeB/8nC/dkLmN1bDmi9SetjxzcdDXlznIY7S//fXrTo
         OC8rFTvLR6uEmUHAncuM71mFHb+6UYvHFw7ucqOJjRb516Lh/LNHyuV3rWfItdX3bYXu
         sJxLNoDOa734n0S0hJc5+SqXizzdbxILsJcOvL4y4rKiCgvVPCcti3ydkGyxeGpAESGP
         QOssvm4uoNgDXRt1xKr51IhSv3V+5uOwCMmH44S8JJFEGxgxan1dWZEDyjWwq5s3q2EB
         nff1b9gYxCjeIPdKagNgIjL/z8s/inngjxaKZ838XLzkcYNfCRuNyZ1EWNHf7hHtVmze
         FsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721599; x=1796326399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+uaDknt7WdBvlAK0vnW3kOhuoYLdbo2w5Zw2Ijjss=;
        b=lCepeuolgQfo1LRUQNplVZAyVMtGJM6MRaZT2kBIdACJnBq6ybJyihsCVoQ5SjVjU2
         lPLB6RUYxx8IYQ9gzRiZZnCUgisK6Vw11+tw3HjBJJoifJBznUzgiLOUzYsrkM5P9R2W
         ME0EblNar0TZa7wJ8b13mT1JRLJ424o8Q66DQhrGqNscjjMNZ4R3ZZm4H2TDLuYTqPEt
         CjvrAxSCG6zM1oRQ/GFYy8tA8WT/s399fUN2mtPW5qq3oLzC7PuKRmTAMJfoT8813pW/
         kKtn1pA92i5iSby+6toD13twtNGRrzDCRU4i/p0wxH6Hq058/RR4jgy++7S4mR4LpPeV
         VSIA==
X-Forwarded-Encrypted: i=1; AL+hErFrC176wpM9fcLBcEaI5/n7MqX30FJOtcT1Qw7Jzz0LXjfdej/NIjhP3bFZGqRtKpxCB5if4gCojCyLMg3AiSo5@lists.infradead.org
X-Gm-Message-State: APuU4Z/s3Sb5G1FiLjDYlsZWa5KieVTyTT/5kU+EUmoDmlziG2MQI+mK
	JpF7x5ywFFTgTVfIRVlUmispLhz3zz5nqxLeIOWowN9zxmc/29YdyA8D
X-Gm-Gg: AZFdTZcKGidHKx0pEjFHJDw0UauHMxA8d+B2x711Cj8Zfhyn+6IcVIVGBuEwJ5Jlh4O
	AW7t8Bcj3Yr48zo/VswoMhgZKIGLTbl6Lx9HghCXHKX8ChiuMaRl4KomFAGQhZ2gRpdBayziiZa
	uNIxp1FxuW5I7F5u5K8Bvl3qlyfydSXHg4gRrXshh9WislhTWheXaN98RPQkjARkH39Hujg7bdA
	Je4c/1VFbUfhlDudLwEddrhk2cSEtO3zClfm1m7G9ZVU8XQ9WC/HSoS8fQ07ZEm7sFX69SSp3B/
	jBweYjqNnippZ4XWMs0FenF36kRsD93hs4r+ko/a2wNn0cbUAHnLiB1RlEpqZPFIvUNJb0h21Tr
	E3QNZIhCH8gSwYmwd3LPfbhGjW+0WPioNBFVqIULoUQ4QsEOAWEP+DZHEBXA/1KlVWe0+bepD78
	172qEq0E68xDzKEiVX0bknoMbQlfV0I34vTfInrQqT+T+IgaFAv5DlDPt/ndzSoaHS6WfWdlFJi
	24U/9khUNpaJ2JlobjHMYZ4gSBSdALV2SKfaf2FC5Fp+MKmIM/biTzkrGF3sGj5vyXoPZQgls5V
	9lhzRsbliDtkD/ZVp8ad2Fsg+X2G9SvfJ7w2m+PubepMkOdW/yaRCNOVnU76NMU8/wQ=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr467148805e9.24.1795721598574;
        Thu, 26 Nov 2026 11:33:18 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:18 -0800 (PST)
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
Subject: [PATCH v13 12/25] crypto: amlogic - Avoid kzalloc in engine thread
Date: Thu, 26 Nov 2026 20:32:28 +0100
Message-ID: <20261126193241.1471372-13-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113320_538904_EC64BFC0 
X-CRM114-Status: GOOD (  20.13  )
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


