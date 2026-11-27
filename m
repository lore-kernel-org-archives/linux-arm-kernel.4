Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36389606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Diz+Ja7Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TsSga4kn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzafw3HQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=; b=Diz+Ja7Q/jjGlz
	2m+AB7QcGG3i3I3Jv+e0OYyHD+V0Ld2fvmYS1ffeA3HxNa+4HtkSZgQVjPVEcHjjPidz3U36i/yDi
	6jvGyWlWKoTMLh5YraQwMnKbLt0GpaM4Ac6pH82E9xbLHPzpr6s0yTHA1CrAnZ9c1X//H0RKSTBHi
	MFy+YSZiK+YAqArj3JB5sgdmzf3YVffIxGsmT8gIaqLZugXSNwnT4Un0kLry6sE53OThdxvtbXC/W
	ADDzs8GilBI7tDxQ4awJFYFwxWEtL9FrDFLoUPyQ8S97AJphqBRhYb0BuH1gwfGMuC41KzgZX32s2
	cIbeiDOlZG8l5dlqDrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz4l-22ki;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueh-0000000Fx8G-0hOh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=; b=TsSga4knzIS+Dt5/26AXTehawi
	4Bx9EVl/994Q2okiIG0xsmwru2RNy5k+YJrB5c46nJ+mFsctMiR0kN97uB9Ku3tfsF8yrWCzhZQBJ
	60WWpFBS7meJCsKIsGftpagJp55rQRP8rBvnsxmtTEfO++1FezQSgcBlL98taFnT+GU3aMPJGTOEd
	IYofeykPvXwi4BoHxjoEJP/XbKo6Io8+lXA016+WnPv9r7KBUPQdse03A3e4+3OqGVojVfcxJFXwP
	vZluZ0eHxzoa3v6WhJYGw3HtW8XjOSTh4qa2pqKhuFq9gsQa4QZIZXAjSujgK7sDZCJFXYCoadPIJ
	6Pew30AQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkh-2PRe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so65053675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780929; x=1796385729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=kzafw3HQBDgZjKbmHd+xHOTtwM90yjEE/dWc8saLLrcj0IwxHzQN3d35283xEsjRS3
         BJbb1qN8YDAIXXipBBrRrIIDVTqtnw3rW4ur+9ApkSdxNAXXTyBi8dijsVTTHzbDCQ4z
         gEa0TwjAkIm+8kMCrfpWTuqolPGmcgcfPfkui5KMHn4gxFoOPA0YXhm+mTDHDMqkok8u
         G6l40BBNICgFwfRvJTlwA9audV7xGMMUpYWe68PmzfxKIZ1oIrtHtB2MWRDfaG5SzRkg
         q4ML1hG0KUq0EGwe9nMo+Kq1h6i2GnDpxKVSVl32QUm8AjDLBlCdOs/3Nz9k3lO6AW4o
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780929; x=1796385729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=c/rGd/ZkLhI3X48WkzWzxMjJ4b8Ovbz8O91C8cQFAzsO3+W0J0v5XlsGJmkxGcxdYm
         S5mvSc9fmUOVAOFVVJ8rU4PO/mcWlV8sIOL4pWvbyy5pZXhk4ZyMsbuITSzqrhJjh71J
         Dzz04rvTXd0rKj0+gPaCaep/aLNsJTCZl+I8IaBc8fE97lHZGhWLw0iLKiflyrgd1ZKM
         qM5ttV6ixwEkV2egbM9IuL8O6yQB+nrQ4em7RkCmw6s5k9qDifT5GQSFi5pebl32vmPp
         1W2rHPBbKOipvrqMfHZWO7sS5Vj5VZ8TqlHZaFZtF3ZzfOSoiN6Q0+x/UukpPUDhJygp
         RtLA==
X-Forwarded-Encrypted: i=1; AL+hErGCGkjUfvEDGbAPc+0+qylhOvgz3Uo8RML711Kh7Bypz59EQrhZ2HaSE3P4Nd/WI/aHhUn5gzhMNQK5Zn87zBCg@lists.infradead.org
X-Gm-Message-State: APuU4Z9OwFN44rh1JMUcEE2kSkOglBilUwX/CDAxusZuJA1HmDj/tyGT
	sIY4h/MmoeqCESCsNvPW3Iu9uzXbNHdtUvetSn4fnKCYhFEAeG8UtAax
X-Gm-Gg: AZFdTZfGKPQlQ2AbjDA+yB1qBn2HhYvMaWWnIPVyxXDNpPfieiAoVXFoVeDrcSBEl13
	lIW3IhGRMQeCzwBpN046LbVX226Cl9KaK+IFjXlJnVNNvNRYyqAF38k/32JS3WXHMw05f6Yv8ae
	iikLoxHaFvbVAvyCDWAS4q2fLQOpR//3T6le5Em9lBhOsnrk/R6M3hUpnNHFMKSgiUhkw8VxZL+
	klLGcbRN/8R3MXG/EDCp10YJp9mDDAgYoyJand5RD7PaiRPih0fPKrxXK0b8EJS4JgjnjONgiWM
	BLCVM0u+XIW99mVqVAIaRsqLmmxCk99OMiFKtXJ/rRLyE+dk7C2fu18vVAbZ7UFR5f39pffyRQc
	oNp72Cyt1g+YXJ8xB8m2w/9h71jV81O4nBeANYWXdvWG713mX021pox/VEOUr++bWPSn6xHcklY
	lMEuEXDFL7cwsWwhsDxi5qVrKtqoB7zJMttEw0dDUSjacS33PHIdbCTAWw1EHxynmz7QeyccU4W
	ZyJohmAw2ew8U7u9nUTob6MVJLjAyBNMdTzFKEiLMAgVT7ad1+LaH89MiQuaPIog4j6OtvSk1BO
	+N3KvZCv/HrwHuMI/tG6d/0AShrL2LDCiuAx2agLjlQHn/I=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr485025885e9.26.1795780928793;
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 28/30] crypto: amlogic: fix setup descriptor lengths and CBC IV copy
Date: Fri, 27 Nov 2026 13:01:01 +0100
Message-ID: <20261127120103.1532882-29-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_570427_52B5C9CA 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -0.2 (/)
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

Fix the key/IV and SHA state setup descriptors and drop a duplicated CBC IV
copy, found during review:

  - meson_setup_keyiv_descs(): program the per-descriptor length as
    keyiv.len / setup_desc_cnt instead of the full keyiv.len, so SoCs with
    more than one setup descriptor do not read past the key/IV buffer.
  - meson_setup_state_descs(): use MESON_SHA_BUFFER_SIZE / setup_desc_cnt
    for
    the same reason.
  - Drop the CBC IV memcpy() + dma_sync_single_for_device() in
    meson_setup_keyiv_descs(); the IV is already copied and the buffer
    mapped
    once in meson_cipher().

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 15 +++------------
 drivers/crypto/amlogic/amlogic-gxl-hasher.c |  3 ++-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c11ccbaf920d..10815ffe3313 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -147,24 +147,13 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-	struct meson_alg_template *algt = container_of(alg,
-		struct meson_alg_template, alg.skcipher.base);
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
-	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
-	unsigned int blockmode = algt->blockmode;
 	int i;
 
 	if (ctx->tloffset)
 		return;
 
-	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
-		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
-					   ctx->keyiv.len, DMA_TO_DEVICE);
-	}
-
 	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
 		struct meson_desc *desc =
 			&mc->chanlist[rctx->flow].tl[ctx->tloffset];
@@ -172,7 +161,9 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 
 		desc->t_src = cpu_to_le32(ctx->keyiv.addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY | ctx->keyiv.len);
+		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY |
+					     ctx->keyiv.len /
+					     mc->pdata->setup_desc_cnt);
 
 		ctx->tloffset++;
 	}
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index 978cdcd8a4f9..710dd413bd51 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -253,7 +253,8 @@ static void meson_setup_state_descs(struct hasher_ctx *ctx)
 		desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
 		desc->t_src = cpu_to_le32(ctx->state_addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE |
+		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE /
+					     mc->pdata->setup_desc_cnt |
 					     DESC_MODE_KEY | DESC_OWN);
 
 		ctx->tloffset++;
-- 
2.47.3


