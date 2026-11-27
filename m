Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0CA606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFULPtq8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1OpMaYR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=; b=DFULPtq8BkQnsa
	ySMH48Ngb3jbidxrRsYqTGmMWfmtIMtmF1YNfKBgRuOLxv7fexMrmRkW4tGvzI7CnCRT3KhDENV/4
	Hin/mspl5LvkTFTxf8xr7nWNiwgurc9wPeeSer3sGb5ye9de0Bn1YEXi0/8LonSCaAT4wItvEkx6E
	MllZuT1q01KedzUAFO3TdvlRRwldkyej1DR7t4Eb6cxqsdJNdP0X9fzXlcmg1lOjiILyYywfltJVY
	u+kO9V+IqXvjdi6IdRAz3aybMqI/O1g8UC784YhG7nKiGsdtyNdO1geBlIQ0nwiya7+Bq/WxlRniw
	ioRuDjl3Ku1G1mo+hEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueC-0000000FwM3-0apM;
	Fri, 27 Nov 2026 12:01:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudi-0000000Fw0h-2bya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so81957555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780876; x=1796385676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=L1OpMaYRRRyIoKdIS9nG4p3n3+nD7kUx9Pj6YMLPVszj6mqcPi9Sg/loRia6eJF3vu
         Ba2rTUkyXkANmw60YUnBjeKmpcCPTv3fEV70lZigoid2r0eJ/V7FFY9OABw/ZDsL5x8l
         EvNveE72EZJHvqhl3wrnDvWsXl4F9Zxj3RTpJHfLn+9Ut1o/AvrGEBLB8B/2cyVf6qUR
         sI2r5BQgbE7puNiURTlWy2jJqEYJuaj1WeaDt21ADWfEIaaZyL3REjCsrAbelRNPYp1a
         wHpmgNyDHGvMCCWRit1oLlkHIE1Aop0gOPq5NM6jcafPjpBD6cbqHVl+tPipLdtgi1vk
         LcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780877; x=1796385677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=2WXHs0ew+0kY2H6vASoyBi1Igbi43/i79tqz6/cw9CueeL/E1JGGVaUpWN20VdPnmU
         bMGl4KSEJMjxyn/BYJayFj5xGxiCHRG7tSzHiybvHJWAe12nyBQYqOyqTjpgLcZVEYgP
         jw5ydMg6htxXJ+MM5s7BcQNhsAFpB2CuGRk28oF1S4mLUnLWoDf8oby5OGNwIC3VVHRX
         FG+YYJBsnSIV2h/6Dn6aS2/e0xHQmQkVHxoRFrrYx1VbXH7qTKPPXp+KOGFt/w3XS60y
         3IKM3tvIW3j16esmAKk2j3Pm07oUIARbFGEL1xra2elvEEuu7NWfSK88dcqKJiHIVqRh
         dE5g==
X-Forwarded-Encrypted: i=1; AL+hErF23XJQKRsR2WVSsLogFbEbwyElH5UBTnp4bvUztT2ppiSVmXnf/8LxN8/K2TgkAvV3zx7qbRV0Igjz2dID4roN@lists.infradead.org
X-Gm-Message-State: APuU4Z9SXJ8QyPJO8HES76jCkOEWSze/2FFz2+4th6jVRz2I/owB8V9u
	/RL5Y5qif0fa/fqgY6JwLwg7rE1drHeXxpAu9hvhBHkduqgzZ8kzUERq
X-Gm-Gg: AZFdTZdSP6T/XFimF7CwG3Bbi0mc6zpZK3kiSK3dGSwBHbDGJxdIV24sh30vq0tdHYk
	pLzst5PazI2+eIXffytP5Ji6pccesCUHAaoHdiihxWVBGdjdy9nu77k/gVx1LuaM22wn29wHcpq
	9FBxkOmPegbJD2/akeAv6IVxZaSKmuzSm/FbEnN1Aj2iHd+utHKMRKfsH5JCPB0MciQLABMzY3B
	I2zfwtus+V3YzJ9SrVbSSY1BMJZSkhpvmkknLyLhZcKRVMLQWjsUD+0Pr4r/rMypt+n077OdRTZ
	FkPTt7DMc8OET6S4k/QQ3OQYioG1XGoNixA1NWvwBZcXDR4is3D9nanpK7t2QkGNOX2uFk71G3u
	Rkyv8P286J/gqNEdYsy3G2FrIWQJuVlrbRYNV+LgaoNPRglq552MNhVV4USHMFsfzenkQzXRkkM
	TIlhVXYUuWQWqV3hZ1bxILkMEnh+9ONPR/TZP7+yBsxnUbfsJFOkb5rwuQG3nv4l0BWmRACg55q
	cdzbSJuk65WrV82A97qppdoiAFK5wEOwuGOI+Np/CFfyK1XsWhJ+r2uQpBoLYlXT2odzPPdysbd
	D1sqaEuQLYJN0zDBk0dchlguIVlrH8d7DMNwfJ035Hl/HDU=
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr366615295e9.10.1795780876315;
        Fri, 27 Nov 2026 04:01:16 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:15 -0800 (PST)
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
Subject: [PATCH v14 03/30] crypto: amlogic - Don't hardcode IRQ count
Date: Fri, 27 Nov 2026 13:00:36 +0100
Message-ID: <20261127120103.1532882-4-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040118_737771_8DB82154 
X-CRM114-Status: GOOD (  24.03  )
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


