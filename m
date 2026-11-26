Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FAB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z2I+pYMA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nCWo6mh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=; b=z2I+pYMAyAiESw
	iJ2svcX+MUh3YYOGRqrSmaVNqj7oHVIYz6gcGm4nmvyBj8mEHoGDtR4lGd8s8jdtUlO7BhVTn22Se
	uuh+i9Rg3yKvXTShmXO7Ah+4NhVj2gJUXi77b2x6xnLlvMeW7awJGn/W2PhOLIIn4fA4oHjsglz//
	nmu03J4j06EEn60+XNYSxb4gDzGhqTYbK+6JRN30PQJebF0g1+gRH53ITt2SZsN+/KNvzVXygWgqo
	epKOWfFbDzTA6SWx7SqNdjAKdLjXhUbsHjT07QlQAf7LPJiElbiISm2FazNzET0xdz1rixKc1rBAz
	xFWfuH7jIKEmEca4AW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJkb-3kKg;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDT-0000000EJSZ-08lK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso52981615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721589; x=1796326389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=nCWo6mh5K7sIv1J5FE6pvao1MQQC4mcBwYz0t+BgAbgq+MqSBYDtV4LE5LT5AWHeKM
         nCb+vbIrQX7AqJXQV7CQRdmROqdVbWQh5VHhTGK3CCSRraFAln773OeUb0PisVg9Pr5+
         tXfNuSPGWrU3UdvSYpmou/D07dN8vSEMiRbdprtVyY8cdtXNU5VEOc0hvwmNbAsWsWiM
         7HNgUbNCvKiUbyhCZAfBOZYOx5jrdikdvImZznglUefKhDRJcxxj9B3osbHpv79j5FNd
         Wn2xXGJKlPAU9z0YbweeFtCzRp7J69Lq8/KsBLwVON0bKwAncN8eQ6Sn3Sg7XGI0DOGY
         YjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721589; x=1796326389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=g7f5t48MQRxXHohIHtRO1WT+zrtreuhMwaNOSU9fm+MMA42fcm5QwDjJIna7xYBMWi
         k0M+2Mnve41bOdyTJpocIzqnlXEP900hmkwqPRR2LYhrvwQPqy3uyS27JTUE1ta5Y2d8
         0Vkgcf9ZNWdu7TZdz+Qd0VEiRSpkonhiyeIOu4ArT2QbcL0+d37wpPQy1OSALEBULJrl
         1CZbSAx2Bv0gBfQ6gAe7OuhMOcmMhFaYGe4j8BBe7aESmIY3xXboxN8rol0N4CBi3VNw
         b3NFHlNLcvHWcUGIgqTSLnON168En6JV1XOqpDSEFSArTM+/EshIbs4lyJFP8p0iuf7R
         QPcg==
X-Forwarded-Encrypted: i=1; AL+hErH0ouBc0v6QfVaEAN52JoCfinAQ+Gspd1rAFZkSEr5gilG/hI3cOEaD02SV4G3/58GofxGQPShVs8jC6nzsGP3/@lists.infradead.org
X-Gm-Message-State: APuU4Z/ABMbka4++yAPC/xapzqtbqi9DyS5XgrxgL8K8KqA8FdZ3Ud0Y
	I93PYNs/72dGFtypmqo70cbvHEhJdrPreeCwAEJn7cuRef6a4Xbt8sud
X-Gm-Gg: AZFdTZeRVZ44NM7HExXK3RJd2PFPD5oLs8NYjrivBMzExmSEOQddWoFfX8e1rbEIKfJ
	35aVCm4ESF64xUny7UNUpuAd1dnNZMdg90UNJRKTuiyFl1r0DYmO4caoihBJLRKNd5xAowiVcsE
	v1ffajrrU10fuFH8pjCts34ftnp92EbFuJEz5ACA9qJB2VjSMZOS+3LNfpInIXaqhi+bIbm6Iiz
	Geld4Bp2HVvc0ZQ9errAuqJOKJlFbQEt7EFSwL+miVk1PTD6M5cQQ/77dBcVl3ynWMBfSVM8Ig3
	otMdM5Et/i2ggTmpX1cgco0tMiGiGw6LuimPMDhFp+z1nvJlwRzlYLeEh/o6CQUcv46qZX89XyO
	qN6fKMSQzXP2Frum5LYofMWJ2xA/rrD2GQlZqPeQYmN8xpA/mz30knV95x2diw1+A6nfmW+DUyt
	WvtnjoeCzplYrh/pgQG9EmD9E57wsd5oEXO1OTkFsYNX+ygsWYnlOFq915QGPRgt6pxs2rTRJVr
	pTh3d0h76gV/RZR/7SfC4pZKuGGqPkH9fG+HNHDIwF9Y7cX2h5dZmpX8eQTWD18XRwCdPMMNdDP
	fMLeS5vWQ/q6a2qWrFC6SEuutsuuivg50izHaJeVUq4OBw==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr432560755e9.19.1795721589007;
        Thu, 26 Nov 2026 11:33:09 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:08 -0800 (PST)
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
Subject: [PATCH v13 06/25] crypto: amlogic - Add MMIO helpers
Date: Thu, 26 Nov 2026 20:32:22 +0100
Message-ID: <20261126193241.1471372-7-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113311_086320_B979BF0C 
X-CRM114-Status: GOOD (  15.57  )
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

Add MMIO access helpers: meson_dma_start() and meson_dma_ready().

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c458548f29b2..62aa82e1cb5d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -234,7 +234,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
+	meson_dma_start(mc, flow);
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 37224d75edfb..b972df44e8b5 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,18 +22,32 @@
 
 #include "amlogic-gxl.h"
 
+void meson_dma_start(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->descs_reg + flow) << 2;
+
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
+}
+
+static bool meson_dma_ready(struct meson_dev *mc, int flow)
+{
+	u32 offset = (mc->pdata->status_reg + flow) << 2;
+	u32 data = readl(mc->base + offset);
+
+	if (data)
+		writel_relaxed(0xF, mc->base + offset);
+
+	return data;
+}
+
 static irqreturn_t meson_irq_handler(int irq, void *data)
 {
 	struct meson_dev *mc = (struct meson_dev *)data;
 	int flow;
-	u32 p;
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
-			if (p) {
-				writel_relaxed(0xF, mc->base +
-					      ((mc->pdata->status_reg + flow) << 2));
+			if (meson_dma_ready(mc, flow)) {
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 5149dc6e9f60..64f2f0e63f12 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+void meson_dma_start(struct meson_dev *mc, int flow);
+
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		     unsigned int keylen);
 int meson_cipher_init(struct crypto_tfm *tfm);
-- 
2.47.3


