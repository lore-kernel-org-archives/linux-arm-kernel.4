Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A61606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=unibsrMd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDO+nu15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=; b=unibsrMde9Pc0o
	hlFn7GJf5aRZFcoopT0J4QefODmkyXFiSFecYyUEbrn5Y0GoxWkFkyFK96//Ymrj+iAsoSCM9jbAn
	6PFKcDhRkvXhECjl/tEry4BoYGoHgfpJaetYW/zYT0tD3irv4/dcX7Gb/9GCGj0dOJ0ZTIPSeVmhp
	KxCoY1SlhB0h3O/+mBaPJAc/dFakTDcgDOl+lV9o9TROFttn//8C41aDUyznQhPkGDFfGf8EgEvgv
	HWAA0g1FvJQ0dFPHxcRfEH3kKE8OfIOL3m57lgPVbx3m5+fn0g82IHxeGziZHUiTJ18beoCYZmnCc
	FkZ3wE1An6rGwPr6xC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceN-00000008Wjy-0lmr;
	Wed, 18 Nov 2026 10:12:23 +0000
Received: from mail-ed2-x07.google.com ([2a00:1450:4864:33::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceH-00000008Whm-3dMV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:12:18 +0000
Received: by mail-ed2-x07.google.com with SMTP id 4fb4d7f45d1cf-6b85f086202so391027a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996736; x=1795601536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=lDO+nu15FtX0dNyVf3MUlEosDUPJ0NAs+jX2YMixMmi4WiIDHcTplaT2kuYerEr8Lf
         V5IyPiXlCzifYT4G0lMbK70oJE6e+vofox6y8QDOpc8WftnS9KrsnRDz/AEtWJnXvXja
         19dxglFjrza+BfrDK57Z+z2hkSMHlX7EwvANwt3wdi5UB2QmNwvTDu+Jam2ubC2DmA8S
         1d0+b+zxsfsEYvGqBEmbbDSkP4JyeY1sV/lcTpXxaDeeH7/NTaLRfRQTD91MDkrXIGTr
         shfA359l+Too0a9NiH/8J3t+dJo2hbyppNEno/MwOpKRd1VdFDwWunRorb+/qD5XajD0
         pkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996736; x=1795601536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=lfWA5Or6fqGPusnqPasgsvQfk+51lKOBaH/NjVOw7IyDDajDoMfFobe+9yN5onMn1k
         BNbCCv0sAMqBaSXkfpRm1mknh0Iqk9xi9qv0NC6osfVf7MP15U80kbDT2pNwKLNU6kzH
         paBQ2DDEIYlLkHftslcy2te/Og5BHMnVxptlvTG/IGKsAqYQb/Q5B22HknmJrhMJGNAc
         HtwqCraoIf8tb9S7SJyYygJ4r6HNCm28BsReU9plIfMyw6HUECO2euZ8uFTyW15vIZRS
         UiNZujHWcnwpzFeFtP6KE4tmOjbAOSXTsrKOmHZmHQHDnZOK+YP6ndH8bEdon5R38h4r
         YhGA==
X-Gm-Message-State: APuU4Z8wTGj+M1C26UPvJPAgv48Ci11s1lRSAmg3uPGG4IMNLiL2fqCn
	i9ROEFG3H7LQhu/Cq1MnEhgVtkylI8E20zOA+7Xx9kc7cnMB0T+DWO2E
X-Gm-Gg: AYBFou30aqqZFmJ3w0VAESqwskNLne4ICTIj8J66DTkG+YmxSlQd7xIVJqAhi4GwZz6
	afE+D63UKhOocBVJzRK+qAXYFMBTPFp6TIyeLLJjVgJA1EY+wWxOJhcDtDYdk3AjNbea70+n84Q
	17YGoOSx5llspeB+EAi8mfjoN+MckcwZIbgO9gPfSKCJbbzuqKvuGWhNrGIVIZwR6F89E2dRrRm
	PxPqBIXmgeAnxBZuLtRsAKiI36mAsLNKjnMyzseN0tTVdowtwuQ8j2NBvVrn/6m0Spc35cFix8s
	coP0+que5Cj1/mJM9fZFOAwXLa7UuC4hbAGEOA9vWYYIDyrTKrGZZpO7I8p01qO6dSUwgNx8aAs
	Alru9jqkU/ze3nRRDQhCYEphnzH37huak9ZA8+4zBYU4sGzOBbCQLD74KD5hOfqFulISRg2Kjor
	4uT7q1GreOnNv/buIdpEC6eKMjj1q024BJWrWFl8hfsb3KuJRvLpV5YCdMKVVZCHjDVvHVZc/Oj
	lbThlAnOPThxe8QZDXBnD4uJhnf4uh2DZY7zIDlmLsSX+kkFexmZIkUD50E8eUCpGQl7p2UaNmP
	rBX2gv5dtAmC1QXcdolwDbiidQwHkSfnYyptGsk1QExPmBtJhSR9VPigB2U7OfNht/d1XSgp76+
	IW1ED0zDZup+xasSnUGn5dOIpxors1+PIa9aD0IJMiyb74r319ljOIEit
X-Received: by 2002:a17:906:f5a5:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c510e5024c3mr167941566b.39.1794996736224;
        Wed, 18 Nov 2026 02:12:16 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:15 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Wed, 18 Nov 2026 11:11:47 +0100
Message-ID: <20261118101147.3350796-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021217_919850_EEEF325E 
X-CRM114-Status: GOOD (  13.69  )
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

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e68e17bdf0ba..6bb8d66e8969 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+/* timeout waiting for the controller to respond in micro seconds */
+#define XIIC_I2C_TIMEOUT_US	1000000
 /* timeout waiting for the controller finish transfers */
 #define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
 /* timeout waiting for the controller finish transfers in micro seconds */
@@ -359,16 +361,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }

+static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
+{
+	if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
+	    XIIC_SR_RX_FIFO_EMPTY_MASK)
+		return 1;
+
+	xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	return 0;
+}
+
 static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
-	u8 sr;
+	int rx_empty;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_poll_rx_empty,
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT_US,
+				0, i2c);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
-	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
-		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
-		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	while (!xiic_poll_rx_empty(i2c)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
 			return -ETIMEDOUT;
@@ -383,6 +397,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;

+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT_US, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
--
2.43.0


