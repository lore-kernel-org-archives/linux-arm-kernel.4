Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GGm37dE0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcUOzkQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=; b=GGm37dE0EQr7yU
	7gH6Fmf19NwkaE0JXz7r4ofc/N4jU1nP6DViATqwem29Vytge+yOvehEodYesjwV/3bGV8IseB5C3
	rVwvZyq+QHiMedAJ7btBtbB5zMQ0b/hhW3YzhNwW8jwl1hZ3tXN6wbAhnlR3/4bD87z0KNx0Zm4xF
	H/OwMdzPoBDMiBnV8ZZDcp8g7+QDQUKeS9jrgFEaIVfWMYRTMg5+nsK+uEeUK6KFZn7wjkKQJGBQH
	hnL0qIEe+N8sQlrzi1S+DSQnGt1UKJpj7EcULXRMHcdAT70Orokp+++3gTGLrlPdwIY/gMhJDgDKS
	j2g5H7obKhImWK/ienUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueC-0000000FwMq-2pWv;
	Fri, 27 Nov 2026 12:01:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudm-0000000Fw4U-11d3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102597095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780881; x=1796385681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=wcUOzkQhEQSHRpfCNtLMMEpvMxmfHkMtN2SwzJ8WwANr2DNtFefOv6oyNCS/TAZTKy
         ykaP8o+uM+jLKD3w8ryJxwqeWV5j24ztwvCGgyRyEeH5KpkHT5EbEvelwqx0YgN4uXcP
         HHMh38DxiQju0f1GsDwOgrLAK/miI1GCZ+lt/JYZk7Kps9MIz9Dt0ggjaIdurc5I8Kps
         LWcC/G4VhasOkjeqmAG7D0uebZz0vnePMfd/QLJ0yWGKFklVdFBzlnMnXMbzr+2NaHdc
         C+7rcbn7RCo5mPwziOl5wvYgrDTxgDSL45fEG4so3doEP6oxAHKCO8I85hKm7+0dlxLB
         0nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780881; x=1796385681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dPCbEZZdSDry+u4vUWC6GFpLLhoS8x3SOrFseRsQ00=;
        b=FWNEOnPKOEsIzRch8Fv6ZZvs9WxrcKM1MO/YX6c+A2nMteJChXp/wqtHnzHV7KjUn2
         7kJZNoMnAtR1cttbSU7HKxCNJuRioi/vAYgHlqQuBgGGfxHu3lzgojjry3QFuwvJPEzt
         DC4/hWqFy9YE8rxpUaOI/TMPQfzgnz5M88E9lY4DhmWbai+BWmpnGZi2tFl5ibjrhR6N
         dSrNfNrq/xRSbbTtLuXlWFDQ+YCIKN3qEal7c3KmTFyxKECQyyKcGdemaNn3rH4uEEYv
         xZPwX9cCnS/T4oQzRlK+pk+eaw0QW4n9MECv6Coal2fFrfnUXl+VXFUQI0Dlf90rJ3vF
         a9+Q==
X-Forwarded-Encrypted: i=1; AL+hErERTcV/gyg/QAMGEZTkQ2ns11iu4nU4PbR7m+B0SOSK0G1Qjumb7qh0n6EPlrVdjohDkugWUNrj1hl77m4yhGvl@lists.infradead.org
X-Gm-Message-State: APuU4Z9UWUlAycaPOub96eRSTIdhO00ZoG9M3tD1VH2XReek1yhRY42S
	HBylH+BRcFtXj6LSm+5C2FT70fU2oM1XrqkkKMfibwRfuwZ/hHw+7myL
X-Gm-Gg: AZFdTZc4cyIYQCu8k3tbpf1go3qYofNZOQ4f+/kKjKLaaxjyq2LswzeKL/2K2yr8gQ2
	FoAr/EkkrL/BeyrtHfC8pVxsT3sW2kDZU4HqF5abwrNZWNXdkRwhE7wyfooh+F+i+PjpwfYcLyA
	g2ojikAb4MqjhiBZCAgifC/pNuONgyAD11SNapjaZypc/fS6zAVASUP2QVjFGwQkHXsb3BOZBBl
	Rq/kQkqEroDKwhhbn//SONqyhD8HcdmMGGBZ+a/SLx/XSKWwPOEhZ0OcCxNuiVBX1Bv4b/9eiDI
	t2ukrM3FTujr170X8MWIFtUuIZ4Yc9I8iwxnAJBaWVwErR2qRO+KNHqoK65jBkbfmVaW21id21D
	xg6ZRPua7ewkjUa+Q1bputq+inPcRry7SY/LLFACOr1zMzwZTML49Nup1Ng4ZgGrOMlR1VDD123
	VCurtPK0IDp41ki8nqJjT578/VAM03SYo/UpFH8n/ReaR0ZRmYh8BnFbSzn56Z+/ucmK/VnJ3BO
	h91dvWFrb4e6FEfRWpESwpGCiSFr5t/jvcDHft/9uJDwGYRqtBrBWYhqu59fx/cDso5ajExYlRH
	X88vLZH8zLq2lOSzCyDx8v1mJa/SWncyRGcK2t7gZusZi/F6Ow7q1l/Ch2X6Tu214idm
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr293754675e9.2.1795780880469;
        Fri, 27 Nov 2026 04:01:20 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:19 -0800 (PST)
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
Subject: [PATCH v14 06/30] crypto: amlogic - Add MMIO helpers
Date: Fri, 27 Nov 2026 13:00:39 +0100
Message-ID: <20261127120103.1532882-7-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040124_200820_355D5BB8 
X-CRM114-Status: GOOD (  15.31  )
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


