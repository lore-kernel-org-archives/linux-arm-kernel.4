Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A454606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZL3q96Qb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRU7ee0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=; b=ZL3q96Qb1uFGJ0
	IduJMXjkKXNkV2h+oH3dIWyXCzLNXZsBPqiqhDvNXUcD1+TCQjTEvxXsFHQbHT8KyOmM9cOHyFc9S
	kbpl9FA18RSJK0W+xYuQmxJMD1wmW8Ak4RJp4mN9v8hJJmXRM4oEEruT+OxMCZaXO/Qikp886JPkb
	mntJSP5SA4mdeQDRAaKMuFpXYPZxMlnjzbGI7ZqSV26cBuHKxxBwqCG++horO2Y7yTJ/mUIJ3zyIA
	pWmC+1aB4AARP9n2PNEtbODlHHiy7DlnQHcIU5UqOml4p54rSp9Bp9APKUQtm0kQB86POlrtUNEgt
	v/cccKhoDanWjUwRWKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJhe-06XE;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDN-0000000EJOb-31X0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75634415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721584; x=1796326384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=oRU7ee0sw51PMwDHnizgdHOZf4uBr2N2tIJFZg8VH+mFG1e1/K8pQ0fO9PuEpQeC6X
         iLj/9S5DDHqg/Ck8wprKaubVV9gPGYpQQlQx5Ti+8qND+Yq3kIiEZywqrQQAdwgP6jFl
         6Bi8J2Y7NUYsV1LxZshauFf1HB0Lz8OdhR2Px3L//heh73HP9zGxLVrobmnue62e0ZtH
         OUt0qXd1ctaiWqGaZMdCL/beUV3AoWboLv+lO/lEexpk/n++pG2bQHeAMe3rxCQmo1eX
         yXgaNM2pRn1bkJ2q2OFbKUpunHpuhP0dFUFmu7DKqXxuPAGX6YiRN4+6HqGsXlg17VCn
         IFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721584; x=1796326384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=rqgvVwo59M12Q/w1eYvAjPtYao6H+eci9I4tBs85eD2gwx+XTzB2SGAvp85Ri1/QVM
         93IIpXZGQrKPeArJ4TjDf2CM+txNceIY6Z/cfwXkih0Epccc8TFtPrGrHq2IfhNJEFzz
         oqXyhOEHpo3KE9sDoY0dINIR4xOY9tKL/v4GJaA/WZKDz7YThh0z4dH83jCyua5HpyD8
         5D5qjyS16Qs1a0qLIEuvZzttT7MFQs8i7CFAfdMZdRU8454lC9fkgTpJJVTLMnQc3Vsl
         07AziU4gvjyrsK62hsytxhMuYB24u0nbmoVc0u6ZDWH2BmY1RAkd0sKbPgzXba3yc7Nl
         gwvg==
X-Forwarded-Encrypted: i=1; AL+hErFyEpjOwmGD5fbhcyFDZRQG2i/DnGM0VlIBz1p7seyiJwNa4kzrPGe7OVl0X9qyLG0SEwlZ+qTLOipAqrhis9i6@lists.infradead.org
X-Gm-Message-State: APuU4Z9XkMPx/B9G9XSgXtMkwdHlw9DathSTbH92baVFgkYzgvqQnUOR
	d96DRq5S+cKglFL7s0ztTpmeCk5gfhBY0lh7nApxZxlV5N76D845s4Eh
X-Gm-Gg: AZFdTZfgugHbio2ujHVI/jweYMdADztcSEFaLzMjwshJLr8+RSa6M9Amj2JX4Tr0Ab2
	y+6HpXAUbMnuBK6VzZv0Ebaz2Ij94Mit9qH9tfQ1oYPJo8g0jUroZRhfznKoEOWrNsTeeNmv8dk
	7hUd1/bSt0JzjzVOM3G7Sqw+cUYNGfIlA/rnQyIP1ERL0HYxf0v1c6u4kH4PyMN1w5rohM4faS7
	bqMIF7LleeYc0kRohrENR8M8gfwu7tFWKTzlZFQ1598rq1ml6jmgVGJFHEv33gWPp1ellf4hn+Q
	rs/w8eQvL/WGNiXcYCoVyTeen4nOsz9qxjkO/3zjsOuPROEpoEbLm/0yan92zEHUrd1l9A9kUNk
	Knln1v8D8SVkR/qC9o/IjD6i8xjgquoTEwiBArgqIGAPoAS02BlWVrR6RrexOaEEK/Ikerjyrr9
	HIrORsUIMdqG6NXfqlDNAvKiOopOEacLiru2d80YtdpxGN9fiF1PfH+X+MCCNpv3TFD2JHXCC5b
	v9w/pWh44w3yj9TwUCirNN78bhzlu9Sse17zJy45HPpRm8yTzGCHLa6ZmbQJ1nxmc95xDg/ftXR
	2amqySBl/JaDKc8BiF0AvGMdgk6TmyLx1I3redpln/LHTQ==
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr439873885e9.17.1795721583733;
        Thu, 26 Nov 2026 11:33:03 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:03 -0800 (PST)
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
Subject: [PATCH v13 03/25] crypto: amlogic - Don't hardcode IRQ count
Date: Thu, 26 Nov 2026 20:32:19 +0100
Message-ID: <20261126193241.1471372-4-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113305_858898_478ED1E4 
X-CRM114-Status: GOOD (  24.24  )
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

IRQ count is no longer hardcoded, and make it part of
struct meson_flow. We need this for extend driver support for
other Amlogic SoC's.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 48 +++++++++++----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  8 ++--
 3 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index d78815b0547d..bcaed2f413d3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -19,7 +19,7 @@
 
 static int get_engine_number(struct meson_dev *mc)
 {
-	return atomic_inc_return(&mc->flow) % MAXFLOW;
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
 }
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 48dbdf452034..b6933be39a37 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -28,8 +28,8 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	int flow;
 	u32 p;
 
-	for (flow = 0; flow < MAXFLOW; flow++) {
-		if (mc->irqs[flow] == irq) {
+	for (flow = 0; flow < mc->flow_cnt; flow++) {
+		if (mc->chanlist[flow].irq == irq) {
 			p = readl(mc->base + ((0x04 + flow) << 2));
 			if (p) {
 				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
@@ -111,7 +111,7 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 	struct meson_dev *mc __maybe_unused = seq->private;
 	int i;
 
-	for (i = 0; i < MAXFLOW; i++)
+	for (i = 0; i < mc->flow_cnt; i++)
 		seq_printf(seq, "Channel %d: nreq %lu\n", i,
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 			   mc->chanlist[i].stat_req);
@@ -154,13 +154,31 @@ static void meson_free_chanlist(struct meson_dev *mc, int i)
  */
 static int meson_allocate_chanlist(struct meson_dev *mc)
 {
+	struct platform_device *pdev = to_platform_device(mc->dev);
 	int i, err;
 
-	mc->chanlist = devm_kzalloc_objs(mc->dev, struct meson_flow, MAXFLOW);
+	mc->flow_cnt = platform_irq_count(pdev);
+	if (mc->flow_cnt <= 0) {
+		dev_err(mc->dev, "No IRQs defined\n");
+		return -ENODEV;
+	}
+
+	mc->chanlist = devm_kzalloc_objs(mc->dev, struct meson_flow, mc->flow_cnt);
 	if (!mc->chanlist)
 		return -ENOMEM;
 
-	for (i = 0; i < MAXFLOW; i++) {
+	for (i = 0; i < mc->flow_cnt; i++) {
+		mc->chanlist[i].irq = platform_get_irq(pdev, i);
+		if (mc->chanlist[i].irq < 0)
+			return mc->chanlist[i].irq;
+
+		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
+				       meson_irq_handler, 0, "aml-crypto", mc);
+		if (err < 0) {
+			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
+			return err;
+		}
+
 		init_completion(&mc->chanlist[i].complete);
 
 		mc->chanlist[i].engine = crypto_engine_alloc_init(mc->dev, true);
@@ -230,7 +248,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
 static int meson_crypto_probe(struct platform_device *pdev)
 {
 	struct meson_dev *mc;
-	int err, i;
+	int err;
 
 	mc = devm_kzalloc_obj(&pdev->dev, *mc);
 	if (!mc)
@@ -254,19 +272,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	for (i = 0; i < MAXFLOW; i++) {
-		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0) {
-			err = mc->irqs[i];
-			goto error_chanlist;
-		}
-
-		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
-				       "gxl-crypto", mc);
-		if (err < 0)
-			goto error_chanlist;
-	}
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
@@ -285,8 +290,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
-error_chanlist:
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	return err;
 }
 
@@ -300,7 +304,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 
 	meson_unregister_algs(mc);
 
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index d68094ffb70a..9f1ef87333ae 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -22,8 +22,6 @@
 #define MESON_OPMODE_ECB 0
 #define MESON_OPMODE_CBC 1
 
-#define MAXFLOW 2
-
 #define MAXDESC 64
 
 #define DESC_LAST BIT(18)
@@ -62,6 +60,7 @@ struct meson_desc {
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @status:	set to 1 by interrupt if task is done
+ * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
  * @stat_req:	number of request done by this flow
@@ -70,6 +69,7 @@ struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int status;
+	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
@@ -85,7 +85,7 @@ struct meson_flow {
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
- * @irqs:	IRQ numbers for amlogic-crypto
+ * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
  * @dbgfs_stats: Debugfs dentry for statistic counters
  */
@@ -95,7 +95,7 @@ struct meson_dev {
 	struct device *dev;
 	struct meson_flow *chanlist;
 	atomic_t flow;
-	int irqs[MAXFLOW];
+	int flow_cnt;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct dentry *dbgfs_dir;
 #endif
-- 
2.47.3


