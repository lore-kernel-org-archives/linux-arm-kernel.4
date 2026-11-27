Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D779606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fXlbsFGH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BE4Clym6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=; b=fXlbsFGH+rTI/R
	yTJ5g/VUw+iYVCj80UrSivbArGe7HPxpe+W4oI2Wa4dctKEfUBqXQWfz46hBGZOvhfAkqjH99w2z1
	d8K4ugVrh4haxRx2XbGj82GooCkWQPdvNDc9j4hbpXjk/0VSAflZ2jd1dS8Y5/0ZpVHayHgdhLmoF
	e7GXP9I0UO/bkCyIbOjemTy9rR/my+8ZDo/M1XK19q0L0XlvzZx93F8YbnqMVSOjX0Y95NNhUtlRq
	4aA/judb98/xMwXXdrg/k/IX2/p9+Io8ZrEt2VrizUuWBc1rddDE5U0QRuxgooZ8Fyv9S5KzLyP/I
	5kU6THG4CL+AydlZZ0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueT-0000000FwwY-3WTc;
	Fri, 27 Nov 2026 12:02:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWue5-0000000FwGf-2IiL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so78722485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780899; x=1796385699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=BE4Clym6wdOUtHets39KviY4WgF2NDslmaDpf7McuoGo+TofIWoFJVreWWhHUlHM+o
         L9U0lnc2DmDjPs0LK1egVqfTWgA+Xxn7VZn0eXo3a74ASzVRAvAnzDv7enkz7AREZd0X
         WbJqvqVBu7iXdLK0NPyd/E9MfBSpH4dI1UFqxCbAwKH5K6ElAc/7W42DCduo/LyI2AU8
         pspLCqHgeg2LOpBWmHLsNtVV8JjfvIzTIozm1cTtWXoZPwl6iNtzIKMueS+TkxbZqgJv
         xerv7EYqDupsUhqtPpz2mRjwjX3zIhrxSW0kCKKIfbcTF4FZ2yb8wlfCbUAyDeJ9KDZo
         tcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780899; x=1796385699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=nrNbOQ/kgiuBS4Imeu1wdTO8rHZ05odaxdh33E8gaqJGAIQ1bTVmYt+oa8/YH6bBo1
         rjpS3JfAwsSSOewS/zNffM62W2oN8rx6mht3X5mDIKvvKdr/yKdECwSenaJ17hCXdmwF
         5EzuBxpH9Zx+kvc09zbVcPHVW5p4FdBHUmQ3z9HuJeHrvMLh7m8kJkAzkcANjLngY7IY
         Qb9sgYUYvD+D+YLbSL0oTT5TLXSGvtjxl3NHzKnLhGenveSZVsoJEPbSoGZD8PDugkB/
         uw6x/Xkq7TyHsOuXgoGT+GlyQPTsp6CJKWklSKO760Z/n9xG9cdfzOSYcO5Otz1iyNcB
         ZEmA==
X-Forwarded-Encrypted: i=1; AL+hErHLBIIexpQBAm2kEOcSfvRloggs8sdzlaihZsYnHwE5qAlxmplrP0Ltu0cnnBp6dfivMA05HqVFII7pERLTVf9O@lists.infradead.org
X-Gm-Message-State: APuU4Z86zDi9FZczBAvbku9twEao8ddwBxJzWAjoZxagqHenNfRpU2v5
	c4RFdn/PP3NA+lYhnlM+sgFypy2B8dWI2ZjGySVJMlrU8RMWl4it3O+5
X-Gm-Gg: AZFdTZc+nxSP+N1tKS3S2Pn11/nvHKijg78QmLpGj35slYhpEGTEmsPaud9jv2roBjd
	wVOJL2eAMH+JkfLEsnTHGiLJOq9740QN5yVC9BwNNk0ek3mx4cAdQJmGqEypfgxjXT8JRcqyyTz
	NiTa3EPgLppOOU1kdyI0N6uzT8MN3OTEolc+dkp2LNMPPwyNqp3G9+1DHguWUhS17O3qBtMjC4U
	41lDy6ft4QAP0HQ3fJP7rMzeOJHptE/pvFPeUPxtUVUYhrouKsu/QWLNUws6X3f+Sy0uqfSS1MY
	7g1HTZf+bULE6uqOyuI5I1ArsTBMjS4qBzwBEepD/v0jyz2v7A7KUav4cKZ3FsC4QvvaMcJqO0F
	zwlodQdtrZU6ZAAEZdL/ZuVxnLUY51Y2qfjdGLMHd65tnfGTn96Ro+elMdufEYU8ZuoeOSwertI
	KndRfFjbPjK6wG5vZ1DQaGxy0Ipku1ecsGCgRTQRoCUZ2FjnDTwXPN1R3afVjvJagkesprKyI1T
	mhdMomtnYPSG+3cFHkFTBhXf6Rsvm3c6OT5XpnxrB21aItyZKKC/CNbBE4bRdkNse8U++G4anz6
	973Q8mprttkZ/HlvJQqcuiQohI3RLNGAgDxfnE4wjzEuYfA=
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr480667555e9.20.1795780899271;
        Fri, 27 Nov 2026 04:01:39 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:38 -0800 (PST)
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
Subject: [PATCH v14 14/30] crypto: amlogic - Use fallback for 192-bit keys
Date: Fri, 27 Nov 2026 13:00:47 +0100
Message-ID: <20261127120103.1532882-15-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040141_652114_1626F73B 
X-CRM114-Status: GOOD (  14.67  )
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index df42940f1112..6070ee6b488e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 9676b86a5089..f530e238812e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -279,6 +279,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
 	.hasher_supported = false,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b092d0c89cd8..a44290fcf3a0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -94,12 +94,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
 	bool hasher_supported;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.47.3


