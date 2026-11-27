Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MibmMv91;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tY6GELsg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=; b=MibmMv91gsbwtW
	F7NIBEUlmJjDd5AxQd67+D/cRs/KvZB0KhMcaRdOAa6g7WV+zmmeerf7NB9QcZZIsZZigqGP2yIYO
	mXLdsvqdS2HYzE+5ZQz7+Vo+vZWF5gXdGEQPX4S87D+uN/QZD1ZohV1SAFoctXgMVYsL+F9ek3J8I
	DgLSdcmtcygg+DCrySN0WcxgkGhoI9Jd8KiYc/VOeR8q1QsPjHVzEQFrWSxBP1Ottyh/c/RzPuV9e
	Ptt2RJQiVKx14CYmGpkJUschc8quKiHLhsigZfJXrGmwaUwlALE0YOKav8mTU8i7dqUAy75lNeIA0
	6mwYosvm0xX/fD8WNCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueQ-0000000Fwmi-01ye;
	Fri, 27 Nov 2026 12:02:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudz-0000000FwDP-1gJ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so65617345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780894; x=1796385694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=tY6GELsgfRYLOMjrFrGB9DKgcapemkRt7l7fg5kBYJVFt4AOcGB2g9Ir5CpHLbRsG1
         NmtOBJRWcp7nGlO5+kwmoUe4a7ux3dwsQGLKKVr9dSC8tC0y7gglkAIahaVd/yL6N8O8
         gfaUeMHOLvq6xnOFcwclGKy+yZehu/yq6Cv8jH/cq95MCNDpVqyi4DX9K+sP2lPPuM8b
         jthDtBzNDEmM7UL2VN49EAPhVHjeZcbndFVJylBTp3W1tcRFIN72WeJ6l09Ktu+yti//
         m2q0IF9ECAZS01pHs2hi2b/qVgCrTJS27sl/1bYNgmukTL3CY8ex7i8n9JrNoBCMWFOE
         GmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780894; x=1796385694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irpOvezoJ07TWhE5LsBvszMrdXj1JWX1J2IkgqrEATQ=;
        b=TTJGtMeBUU05jWYggIr1EkidcNxhEH77z9jsN3v87rnZPutJRYuqeDiK9mjJ1qZZf4
         zXsxPOEQFSp55K7eiHp5Z8HneFSHrl67xD6J4/LHBsYGNZjsihhQifOcXhMNyieNGlOU
         bs1QOHEFo/yO0RJSvo98KzZwbFPzAjkWN4bo8xK9JasyWAoZ5tHV5+cwORyVUJabREGC
         jeaQyAJ5t8bAPr7aNkbQO6otysFskyO0O0yoZxUGEiSZ/RcZkQe4cPK8XuRHoEHgSPT/
         azp3Q2asthqdvz/Ix4ftkxgFglDljR1qhEcmyxyidxgBWGxmFjQNXZ2YujFfNAhG+79q
         ZUKQ==
X-Forwarded-Encrypted: i=1; AL+hErEd5Mon8JjW8/dXQCu1L4D59lXr4FNEaq16ePZrouXSq9TfjtkOyQVG6/D7MGLh9wRGObgT0UOhYO2LEToBYda5@lists.infradead.org
X-Gm-Message-State: APuU4Z+DjTZlxO8VeUA/YDRSwlL8TWhWVf562roEqTzHR7WgLgZSe5H+
	irzx9xa2hM9crtZ2V7br/QY4ptDhgM0IRzY5lvmiC4/FTgBZZ3oPyvWZ
X-Gm-Gg: AZFdTZc5oh8z3TOA+q3trN/noV4i3Po+ZbMJokYaySCI2U1F/oOzIu1t5ocX2PIO0oL
	oqMCaB0RHzVV/Y5kZmtIezAc6DR8X63hzeeTZZaSJ1771lBiBD7hdCmErQNa8JBp1+w1VaeONWB
	p5617XcWbg2JhEoyno1CkQb9cTqd7Yck+pZPlJ51TC4x10lp03pQrsBrM3KUfjhU/62PsAIZAOG
	HG/PC1TcY7ERhhr+MR1uVgqss3T1iDXGDdaisVjCofP9t3qjY7qN+SS6E2kMllNd2tYRMg3hMfe
	4KStRCPfaebMzdmtIojv0HP9oIi2djh7eEsMfDvb7qXUpCtR4abg/z4CAzKWSEAsSQ8Kg/AP7WH
	/6DTMfDPLgCVUvNLXWAFEM9PdYFZcw6dwMG/v4UNIVbggwrvaJICUw1JX8E7HFzRRgFnFAwy8yP
	vlVt0ZvuULchboRNCnf67hqpLqoRD0gRM2D7sECF9z9F2vN35RvtOyz0/+WB18CU5RYInZzvuCa
	G7+n7MNqJPTcr8Dl8xHpbRYf1G5oxeK/rwWHgz5Ya6ZQu0QrVAd9u9nACVIUOfZJd8FQEgWlc8Y
	Z/QKICoBa9tzQKEBL3iOKeCnqkKpGTrx5ohoy3PqHjxJZ70=
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb8892a21amr453451655e9.34.1795780892976;
        Fri, 27 Nov 2026 04:01:32 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:32 -0800 (PST)
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
Subject: [PATCH v14 11/30] crypto: amlogic - Process more than MAXDESCS descriptors
Date: Fri, 27 Nov 2026 13:00:44 +0100
Message-ID: <20261127120103.1532882-12-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040137_034513_16A5CA29 
X-CRM114-Status: GOOD (  23.11  )
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


