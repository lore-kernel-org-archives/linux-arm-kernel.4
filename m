Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1220606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qOdh/Uwy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNJGfuZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=; b=qOdh/UwyVoqNw3
	3c9ed2D0IzsDfDJW7MteqtagSwXLdFPzorwjbor2V+Ns1GOAmRFdp7ptEGTus62luATokfGkzHhws
	bg1CC+wzJQlUZHgjKvcj2QAeWwr1C7DsqbKUQdbmBo/+sxhaU2nvNHD9SgQdJi2VV94QAHT5GHUoH
	6mNW2a8nA+LnwOBHZSC0fPp2YG8+NWdFUJ0iqALdv3wqwBCZxMWvidwP63nv7F4R7fPcqm/vxBzBz
	5018aRD8TNZHLZz/z6Q0L1yR2y10R9x8WveoTbV8JEobNCSKZUVcZPOR/5jJP+kxLVttR4zV1Tt9/
	OtEZZ4syavUoQ38tGTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJiP-0uXZ;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDO-0000000EJQB-42eB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so59974285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721585; x=1796326385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=KNJGfuZURRkSXLD0+XXo9z8B/YDN2+/R7W+MuaRQsZrX+O1ohw2D//i+lMVKCl8BcR
         f2xI9Qb+dwykwGS+FBozX4Q2daxqux+Rj5E+dvMy0s8qHXzUpfLR9Rl5i3CEWwLhlOFc
         6SNkKUqW18HyUoNhgdXvX2P+zlmQ5ebW+yiFDINC8al/YjJ503Qg0lixN/2NITMI+geg
         1zD8NO5+BFCDb9wKlIqJwLkWRsrxyJt4DPSuIiySazWc5hgGvSvXG+klk3gG/YGYjcv/
         +1BncadeOP/AkSV93NQt4i7HGwl4Z9bDpTwWYIrRCiRYRuCVe1KWirBp1l2A+ovDtneO
         vzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721585; x=1796326385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWye7nZFqyd09wjqBqg26yH/OXa66ZCjw/Hj8r91FQs=;
        b=cUJYj0zM95fLKllUapbPqzIs1QqYR1mabogaErETlQEqwi3x8sc/vH1EavAHit4T5y
         /SDzZwdf8YicvaFLHTBd1jLoF0Eefbm0B4jPw5pZewurpdlaKvH9qObTRsbRsLPUGzOR
         Isq8bGkMQfuP6YFZVLRRJ6LX1KkFYqkZrAVJQzeB3+l8ZyvR7noMyvr7dGISlYQWetII
         1hwzt3KWylfpcl/bbhGVLy6kOBGvQqo0nnWa8r+S2wd8vomJyEVDS9JoyXwMENRJIFi6
         xRHqx6gH7zal1f0uFwY2pSIYQq55VhK7TmznpdNJ3/4qePxQ031QpK1HyA+8MKQpBDFo
         Ew4g==
X-Forwarded-Encrypted: i=1; AL+hErFAoA6lwqdbUA+uKyIW5QGOCOg6hJD+SqBvR5THp+K6Cw3OAs7opKSI84sgZxbtEMjTs+kDbOwluaPW+ZTtTWnf@lists.infradead.org
X-Gm-Message-State: APuU4Z8+ePNSbro9bP1mDnqC6/xDvMKC9Rj9pBE7BfKnfnAwNZsDVhH/
	Vt82gAZ8fbCMHBH4tLmOeqpKP6rPybiJrm75vz5kl54+Lrkp0s5eCtW2
X-Gm-Gg: AZFdTZfQUw4OisxllTyE7bo1gJC+XOjl27beo6TgbtKEzkfjas7qIhHg/dINCAg98j1
	mI9mljZyDRrDcM1aYrvEpDDxXe/upUErU3KR2ylTeimHq+iyRcnXLe3HcULQggvx9Co0ttTUqK9
	urt/ru8Jlp7DeO6/4bv2/4wsy5LzPt24OTgqaQ1fyECYxaggPQlHU+jMTcIjxg2I037wCC/7F5J
	a4hJ38d3GHOGMDW+k21u4MeckFFsCiOP4ZNQ/Q0Q0K/b3iXQ7DtHoHkysSFFXKfBVXAylG3CUhF
	CvC7LoQ2LEmJEkwH8O9b1N3rDzJ4ni1KFW3GEI6x+xng2vgx1qBKe0rPbVrhphH0k9qPcyb/tn8
	pGFrXU95V8v6w+mmx8NfXcbiEtVgALUd6jnsPGiVnVVOZRUGBkRmzBY5uujJMjRc1nAVzuBZnZ/
	oOO1x5PziceAxN/Pf+iTkZj2QHoaBr2mM1X9pH5mLMyGj+TZNwRzGeoA7aIMOaJJNxekVWN/A85
	VBIy3iekGyTeudhXbCz6WHXOx37RCattbncaZZwvhPXea5u4cVgac7QFAhyA/iVFauCFM8moJ0C
	WhOP/sOssMNzuUKkYDG4BBdTJxiIzuXi5OS2x71W205i1sCgyirAJkpgHe8rEWX2Wwk=
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr495180995e9.32.1795721585086;
        Thu, 26 Nov 2026 11:33:05 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:04 -0800 (PST)
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
Subject: [PATCH v13 04/25] crypto: amlogic - Add platform data
Date: Thu, 26 Nov 2026 20:32:20 +0100
Message-ID: <20261126193241.1471372-5-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113307_035757_FD132300 
X-CRM114-Status: GOOD (  20.28  )
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

To support other Amlogic SoC's we have to
use platform data: descriptors and status registers
offsets are individual for each SoC series.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 22 +++++++++++++++++----
 drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index bcaed2f413d3..c458548f29b2 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -234,7 +234,7 @@ static int meson_cipher(struct skcipher_request *areq)
 
 	reinit_completion(&mc->chanlist[flow].complete);
 	mc->chanlist[flow].status = 0;
-	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
+	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
 	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
 						  msecs_to_jiffies(500));
 	if (mc->chanlist[flow].status == 0) {
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b6933be39a37..24ef7d5a5607 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "amlogic-gxl.h"
@@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
-			p = readl(mc->base + ((0x04 + flow) << 2));
+			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
 			if (p) {
-				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
+				writel_relaxed(0xF, mc->base +
+					      ((mc->pdata->status_reg + flow) << 2));
 				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
@@ -254,6 +256,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (!mc)
 		return -ENOMEM;
 
+	mc->pdata = of_device_get_match_data(&pdev->dev);
+	if (!mc->pdata)
+		return -EINVAL;
+
 	mc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, mc);
 
@@ -307,9 +313,17 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
 }
 
+static const struct meson_pdata meson_gxl_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x4,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
-	{ .compatible = "amlogic,gxl-crypto", },
-	{}
+	{
+		.compatible = "amlogic,gxl-crypto",
+		.data = &meson_gxl_pdata,
+	},
+	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 9f1ef87333ae..e0bc5c39bf2c 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -78,6 +78,16 @@ struct meson_flow {
 #endif
 };
 
+/*
+ * struct meson_pdata - SoC series dependent data.
+ * @reg_descs:	offset to descriptors register
+ * @reg_status:	offset to status register
+ */
+struct meson_pdata {
+	u32 descs_reg;
+	u32 status_reg;
+};
+
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
@@ -93,6 +103,7 @@ struct meson_dev {
 	void __iomem *base;
 	struct clk *busclk;
 	struct device *dev;
+	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
 	atomic_t flow;
 	int flow_cnt;
-- 
2.47.3


