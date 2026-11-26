Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vybKAyD4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M8qEcUdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BKteHXSeQ4vAL5IGzDLeB/HltG0/9os/cj4GKi2Cm+0=; b=vybKAyD4SX3Z5I
	zW+tqshVYvPe3aDKiv9cbIL0cgcDj5yzPwMeim8buYWw0M/q87L6BOSIbQc7f3ksVyYRjWRsr8IqW
	IWmXy1+xpM4xeHceH9tSoG0Zym6TtZ3vxGmlW0pLFuUTr+ZjEIfd6XruhxjrGXxi3QoVsIxr0Uf0y
	iT+97qj+/r/Fl9TDbb7KHlV4TEMVlvdLskDIfThwZ2ccyAG8qJBb4HpxoIfxwEkeua7F1bYVEibk0
	cGLWprexrYVh89C44MDOeVuZLJUqHsfRvRkQWYF8OFtCrhnQqm6FnJdCyZ+/rPVv6q3el4hjuGRmU
	pAFQIHIWBk9ixWKieLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDq-0000000EJwg-16qk;
	Thu, 26 Nov 2026 19:33:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDX-0000000EJVd-1649
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so43217505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721593; x=1796326393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKteHXSeQ4vAL5IGzDLeB/HltG0/9os/cj4GKi2Cm+0=;
        b=M8qEcUdNii/v+qYPhAV1geD4nAfxGyBMb+OLHs2YH9Agv9UjrB7rmFvX0GL/nbvXv1
         VEzjv2htgqWJ3oDQX3rF3hG0u3zNpeM+LM8kK4itozYXWt34mYShL57aTe7+vyn9cCIs
         THMXM+7YU7y9SZ7JGdkKcPX7BJ3hOO1/rKBj+JZofX/g79o/cN5XcFsgyaRwAWO/5x5E
         GUMaZTRt76DcIQJWeJfGtqALPaHjdBGI2UedSbZbTflFE72p9o1QEq10ylKOZ6pyKqJZ
         2I6Z3d0GRohrxgmitBqIWLgl/DDUpc0kH4uT4bvs9ML9EmBuWqMeXlG/AtlxVFqbMFij
         wttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721593; x=1796326393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKteHXSeQ4vAL5IGzDLeB/HltG0/9os/cj4GKi2Cm+0=;
        b=RADFxhmO0v9j8Z34FwzNpWmZaF0wwR2lRCoOrnsIvlTl+2t9OvTY55zNePxk00yAUB
         YgHST8I9/aY6fytXf/9Yctdn+xBw+Y6WRlIvDw/1uoaKh9/U/LI2MKdpNHcmSJijQZOd
         e0w1HZeRlPuqztpEfJqdosVcevi/YW2vBKxGbyBuFrUU4fE0UuRLs5fTYr3ka7LuKu1J
         J3kz8cjLoMKPk2yvomtU9aNDNhdDIMMjoDw+fDz4/hjJ1C489lBfhP5DrkAYbBM7Laz8
         85WHomce+KTTiWH/U8GNFue3ZUfDs/oUIkYY6yzYunzrYwFMlk1GmEi+BENE8Hvmb5uM
         7kTA==
X-Forwarded-Encrypted: i=1; AL+hErGPAqXkQ+t/Ya0iOlT/tsOoHHcL9EKHYyAZOf3r8wtAs9GbM0TwI5ZQnGx4XbBYtkhJXk7E4P6Wzf2/4liD6oC0@lists.infradead.org
X-Gm-Message-State: APuU4Z90cxlusbyStLstgDq/kxg6ULAjuKpj91JGNFRXZpGJfLvlRN0a
	DR2X3aQHQV1cfVVxSNQKX/ULutLixo8/yh6EaJhR/D7CDtQv3J5UdFvm
X-Gm-Gg: AZFdTZeEC02qwvMrXwME5WySgdujCCYxjBLAzjGpfDjorRhMTc6o1gt8xNAhJDLeHJi
	MuJ/M8NCrzyeMsc7VEuzAHqdzUwDlvY98kLMZr1RLFJ07cq/Es1B5+1z2KauPqiduclAhYdujJ8
	oGxR7Qiss2k593tDfYUnv21jOyfDM598iNG4eYWXFMe6JYSt4YzMehWDmg5vu3cLSoluiIFP5na
	7xrrgiQYxxar3psreeDSL7r/FEOIrkO+SSbZ1lpEiG9rN0jrL5fUIdXFEFTiwV1Ky55uvEdNjpz
	Kl3ZRQVRGAZhNTiCvI5S4HQwoo49zcRPV0b2ZEiLvrYG4mYSDD31HEwQaxZWb+TFBJqPD7GHbrw
	/9qeLn4zAtxkfbBk2zvMP/qfYt+3BsKHEoHF2JqYFDh6hJRwqmcMovcYiP65M/fRvKdrMgNb2Hg
	eMUbcV9mpIaSa+uhaABY/9Qi1zNEBjCf/1HPgidbKuYe8YDTimFqf+MlaCzS4MzbeUzJ7yLaWIY
	ziH3jjh3LF3wQzXtdy4peSz4228CPlR4gkoNVm46pYrVnyCFWnM1PjTtrK1ECL0qbVsF/Dz+51g
	/ZE/45nXjNoblwDJjOZt8XO5B058lBdwNyeQbJq8Om2iYqH2qC8EVgXYVfx77n+NXoQ=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr425778115e9.27.1795721593304;
        Thu, 26 Nov 2026 11:33:13 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:12 -0800 (PST)
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
Subject: [PATCH v13 09/25] crypto: amlogic - Move algs definition and cipher API to cipher.c
Date: Thu, 26 Nov 2026 20:32:25 +0100
Message-ID: <20261126193241.1471372-10-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113315_419802_AB1BB60C 
X-CRM114-Status: GOOD (  19.56  )
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

Because that is proper place for them. In particular,
it takes less of exported symbol between compiling entities.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  98 +++++++++++++++--
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 111 ++++----------------
 drivers/crypto/amlogic/amlogic-gxl.h        |  14 +--
 3 files changed, 120 insertions(+), 103 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index cd94296e4d9a..00d3247ebea1 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -286,7 +286,7 @@ int meson_handle_cipher_request(struct crypto_engine *engine, void *areq)
 	return 0;
 }
 
-int meson_skdecrypt(struct skcipher_request *areq)
+static int meson_skdecrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
@@ -304,7 +304,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	return crypto_transfer_skcipher_request_to_engine(engine, areq);
 }
 
-int meson_skencrypt(struct skcipher_request *areq)
+static int meson_skencrypt(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
@@ -322,7 +322,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	return crypto_transfer_skcipher_request_to_engine(engine, areq);
 }
 
-int meson_cipher_init(struct crypto_tfm *tfm)
+static int meson_cipher_init(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 	struct meson_alg_template *algt;
@@ -348,7 +348,7 @@ int meson_cipher_init(struct crypto_tfm *tfm)
 	return 0;
 }
 
-void meson_cipher_exit(struct crypto_tfm *tfm)
+static void meson_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
@@ -356,8 +356,8 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 	crypto_free_skcipher(op->fallback_tfm);
 }
 
-int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-		     unsigned int keylen)
+static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
+			    unsigned int keylen)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct meson_dev *mc = op->mc;
@@ -384,3 +384,89 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 
 	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
+
+static struct meson_alg_template algs[] = {
+{
+	.type = CRYPTO_ALG_TYPE_SKCIPHER,
+	.blockmode = MESON_OPMODE_CBC,
+	.alg.skcipher.base = {
+		.base = {
+			.cra_name = "cbc(aes)",
+			.cra_driver_name = "cbc-aes-gxl",
+			.cra_priority = 400,
+			.cra_blocksize = AES_BLOCK_SIZE,
+			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
+				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_NEED_FALLBACK,
+			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
+			.cra_module = THIS_MODULE,
+			.cra_alignmask = 0xf,
+			.cra_init = meson_cipher_init,
+			.cra_exit = meson_cipher_exit,
+		},
+		.min_keysize	= AES_MIN_KEY_SIZE,
+		.max_keysize	= AES_MAX_KEY_SIZE,
+		.ivsize		= AES_BLOCK_SIZE,
+		.setkey		= meson_aes_setkey,
+		.encrypt	= meson_skencrypt,
+		.decrypt	= meson_skdecrypt,
+	},
+	.alg.skcipher.op = {
+		.do_one_request = meson_handle_cipher_request,
+	},
+},
+{
+	.type = CRYPTO_ALG_TYPE_SKCIPHER,
+	.blockmode = MESON_OPMODE_ECB,
+	.alg.skcipher.base = {
+		.base = {
+			.cra_name = "ecb(aes)",
+			.cra_driver_name = "ecb-aes-gxl",
+			.cra_priority = 400,
+			.cra_blocksize = AES_BLOCK_SIZE,
+			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
+				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_NEED_FALLBACK,
+			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
+			.cra_module = THIS_MODULE,
+			.cra_alignmask = 0xf,
+			.cra_init = meson_cipher_init,
+			.cra_exit = meson_cipher_exit,
+		},
+		.min_keysize	= AES_MIN_KEY_SIZE,
+		.max_keysize	= AES_MAX_KEY_SIZE,
+		.setkey		= meson_aes_setkey,
+		.encrypt	= meson_skencrypt,
+		.decrypt	= meson_skdecrypt,
+	},
+	.alg.skcipher.op = {
+		.do_one_request = meson_handle_cipher_request,
+	},
+},
+};
+
+int meson_cipher_register(struct meson_dev *mc)
+{
+	return meson_register_algs(mc, algs, ARRAY_SIZE(algs));
+}
+
+void meson_cipher_unregister(struct meson_dev *mc)
+{
+	meson_unregister_algs(mc, algs, ARRAY_SIZE(algs));
+}
+
+void meson_cipher_debugfs_show(struct seq_file *seq, void *v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(algs); i++) {
+		seq_printf(seq, "%s %s %lu %lu\n",
+			   algs[i].alg.skcipher.base.base.cra_driver_name,
+			   algs[i].alg.skcipher.base.base.cra_name,
+#ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
+			   algs[i].stat_req, algs[i].stat_fb);
+#else
+			   0ul, 0ul);
+#endif
+	}
+}
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 81d0e8731ab1..68d394e90f66 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -65,66 +65,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	return IRQ_NONE;
 }
 
-static struct meson_alg_template mc_algs[] = {
-{
-	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
-	.alg.skcipher.base = {
-		.base = {
-			.cra_name = "cbc(aes)",
-			.cra_driver_name = "cbc-aes-gxl",
-			.cra_priority = 400,
-			.cra_blocksize = AES_BLOCK_SIZE,
-			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
-				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
-			.cra_module = THIS_MODULE,
-			.cra_alignmask = 0xf,
-			.cra_init = meson_cipher_init,
-			.cra_exit = meson_cipher_exit,
-		},
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.ivsize		= AES_BLOCK_SIZE,
-		.setkey		= meson_aes_setkey,
-		.encrypt	= meson_skencrypt,
-		.decrypt	= meson_skdecrypt,
-	},
-	.alg.skcipher.op = {
-		.do_one_request = meson_handle_cipher_request,
-	},
-},
-{
-	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
-	.alg.skcipher.base = {
-		.base = {
-			.cra_name = "ecb(aes)",
-			.cra_driver_name = "ecb-aes-gxl",
-			.cra_priority = 400,
-			.cra_blocksize = AES_BLOCK_SIZE,
-			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
-				CRYPTO_ALG_NEED_FALLBACK,
-			.cra_ctxsize = sizeof(struct meson_cipher_tfm_ctx),
-			.cra_module = THIS_MODULE,
-			.cra_alignmask = 0xf,
-			.cra_init = meson_cipher_init,
-			.cra_exit = meson_cipher_exit,
-		},
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.setkey		= meson_aes_setkey,
-		.encrypt	= meson_skencrypt,
-		.decrypt	= meson_skdecrypt,
-	},
-	.alg.skcipher.op = {
-		.do_one_request = meson_handle_cipher_request,
-	},
-},
-};
-
 static int meson_debugfs_show(struct seq_file *seq, void *v)
 {
 	struct meson_dev *mc __maybe_unused = seq->private;
@@ -138,20 +78,8 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 			   0ul);
 #endif
 
-	for (i = 0; i < ARRAY_SIZE(mc_algs); i++) {
-		switch (mc_algs[i].type) {
-		case CRYPTO_ALG_TYPE_SKCIPHER:
-			seq_printf(seq, "%s %s %lu %lu\n",
-				   mc_algs[i].alg.skcipher.base.base.cra_driver_name,
-				   mc_algs[i].alg.skcipher.base.base.cra_name,
-#ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
-				   mc_algs[i].stat_req, mc_algs[i].stat_fb);
-#else
-				   0ul, 0ul);
-#endif
-			break;
-		}
-	}
+	meson_cipher_debugfs_show(seq, v);
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(meson_debugfs);
@@ -227,19 +155,20 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 	return err;
 }
 
-static int meson_register_algs(struct meson_dev *mc)
+int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
+			unsigned int count)
 {
 	int err, i;
 
-	for (i = 0; i < ARRAY_SIZE(mc_algs); i++) {
-		mc_algs[i].mc = mc;
-		switch (mc_algs[i].type) {
+	for (i = 0; i < count; i++) {
+		algs[i].mc = mc;
+		switch (algs[i].type) {
 		case CRYPTO_ALG_TYPE_SKCIPHER:
-			err = crypto_engine_register_skcipher(&mc_algs[i].alg.skcipher);
+			err = crypto_engine_register_skcipher(&algs[i].alg.skcipher);
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
-					mc_algs[i].alg.skcipher.base.base.cra_name);
-				mc_algs[i].mc = NULL;
+					algs[i].alg.skcipher.base.base.cra_name);
+				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
 			break;
@@ -249,16 +178,17 @@ static int meson_register_algs(struct meson_dev *mc)
 	return 0;
 }
 
-static void meson_unregister_algs(struct meson_dev *mc)
+void meson_unregister_algs(struct meson_dev *mc, struct meson_alg_template *algs,
+			   unsigned int count)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(mc_algs); i++) {
-		if (!mc_algs[i].mc)
+	for (i = 0; i < count; i++) {
+		if (!algs[i].mc)
 			continue;
-		switch (mc_algs[i].type) {
+		switch (algs[i].type) {
 		case CRYPTO_ALG_TYPE_SKCIPHER:
-			crypto_engine_unregister_skcipher(&mc_algs[i].alg.skcipher);
+			crypto_engine_unregister_skcipher(&algs[i].alg.skcipher);
 			break;
 		}
 	}
@@ -288,9 +218,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = meson_register_algs(mc);
+	err = meson_cipher_register(mc);
 	if (err)
-		goto error_alg;
+		goto error_flow;
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG)) {
 		struct dentry *dbgfs_dir;
@@ -304,8 +234,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-error_alg:
-	meson_unregister_algs(mc);
+error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	return err;
 }
@@ -318,7 +247,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(mc->dbgfs_dir);
 #endif
 
-	meson_unregister_algs(mc);
+	meson_cipher_unregister(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
 }
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index cf07c5fbc5bf..608ce75f027a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,10 +161,12 @@ int meson_get_engine_number(struct meson_dev *mc);
 
 void meson_dma_start(struct meson_dev *mc, int flow);
 
-int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-		     unsigned int keylen);
-int meson_cipher_init(struct crypto_tfm *tfm);
-void meson_cipher_exit(struct crypto_tfm *tfm);
-int meson_skdecrypt(struct skcipher_request *areq);
-int meson_skencrypt(struct skcipher_request *areq);
+int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
+			unsigned int count);
+void meson_unregister_algs(struct meson_dev *mc, struct meson_alg_template *algs,
+			   unsigned int count);
+
+int meson_cipher_register(struct meson_dev *mc);
+void meson_cipher_unregister(struct meson_dev *mc);
+void meson_cipher_debugfs_show(struct seq_file *seq, void *v);
 int meson_handle_cipher_request(struct crypto_engine *engine, void *areq);
-- 
2.47.3


