Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC345606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcSs6JHI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UxUsnuIv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hu5ZELX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=; b=RcSs6JHIzIvWXP
	fh73LxEADttlM3DW2E6bR39a6JwIo1SemfMwKqok8lc78Dr9tqY9cn2tlsPdbip86JGesFwDXQDZi
	mTtqCcfaq0k9piWnVcTb8hxAarCV0Z8q5tCb3prWSk3mjSSxis9b8ORbsnVgPnO5jDFoEjfzB4+Uu
	jiM4AeNhhQCR6/AAHy2nB26KoRfJ41uvKjU4cQnlrqlMj5aMc2BDwCJwWviPAiOh2wfRdY1lwQrpe
	OzVo5s653IyDC8nH/+6TGTWinsHX3HrYjvBL04VqUkGehSAgMx3gUWAXZBr6tAySyYFxbu6wu3EEc
	N3Ub/0CcBuPWQJ37+Csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPow-00000002c3I-0rWH;
	Mon, 23 Nov 2026 08:54:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPos-00000002c2R-3qXb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 08:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=; b=UxUsnuIvz3bKkcFGoPk+B+6ZNm
	CH/xs0MwsfDhck3HLagSGwLa57r6FY3KXEGJYn1/d8uSin1F+7gGdXjtrlGv+hjCuwCTbLqJGmAsg
	++4z0wZW5deDLn8XGW2BkvQLFJ2DS5MoplbgJRHA4v3J7ZFoYv+FC0LIqC2ykXeLbEaVcAKfrTto/
	P7p6joLTM19jN4MfdKz+o6J3bOOCL89O8AuFZoJs4kZ9Y8tjRyCS1RmYuqelcGAlQkptTcIYen0IA
	ooGd++jOiNIhBOUgCXx+p6WMI69AS2JI8geKNNfu76aiXtg4kh1q36HdO42Dt8J1F3iWdSmPp+5ZX
	IDs5iEzw==;
Received: from mail-ej2-x04.google.com ([2a00:1450:4864:34::4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPoq-00000002spn-0ymF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:54:37 +0000
Received: by mail-ej2-x04.google.com with SMTP id a640c23a62f3a-c4d176c168cso119244966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424074; x=1796028874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=;
        b=Hu5ZELX1l9E2q9YtY9LNoXF4PkG9ulYDDUNi7vi4RM6YoukLgSMcjtldMQfDRx/ME2
         0jNL7SoRnrxeIh4iny1DAYHwYA8sc/FJeffT4zS2tZPhe8sKaJ5r/0O1s4LxmwfKF+Dy
         q4vYJH+LLe5JYp2IomN9+0nPTDu2CVqGtzjkJCdWPiXAagaZLNzDjeROXkktqawLF6jE
         80W5/STTZuQuFLlZvBRIGHZuVrR2jox/8CiqQ37NyTH7IqkEvmsa57YCao99A2qvGTyQ
         ktcbrar+NtZtmuyiGvn4rN5Xy1+xPdt8dPmvTShWFNZ9HBKfaIHG5Qiapwv8ABnZLkS1
         yY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424074; x=1796028874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=;
        b=B/bBssGkps2E67wAnBEVE7X4bS+HVFBl9wmf5q8h4xfJNw6lAqoysfQIfsP5KsxyYK
         H5L5UB6lajyHCvdxyNkNqTKdQu8D1Q4ry7NqKWVWFMSRtvxZ9ctuemXyg+UnB4DfpI7b
         cRf+Jhn7rj9+EqWistk24xVCN6IuQocngh2AruLLFMbWF5GnWTZqSac59PcLuiMB9PhQ
         kZwPUTdtJZeiSi4vbKYda7VUjmb/I7tW/xUGRLcINram0r0+ltVdAR5lacVgxBhOSiRP
         eprmnq3KVOLVGXwRw8HJi+Ln1DKGMO9d0A1cL9YQ4dvd3VgnacHtk6SpB1Nb2NvesRKE
         sEZw==
X-Gm-Message-State: APuU4Z/522YqJJXkMAKQ11Br6xKQsmWuP/ejSCLHaQVHZmhZfMjMofQA
	0WJS/jPuVr+67fD3asR2XioFj/epb0ogS5/R9jBVYR7wNEHXyrRGG5Ro
X-Gm-Gg: AZFdTZdk0luy7aPY4rKnLtP01tWvqUsjBGL1oxtwgrUi/39lXtY+vk7tl1Uiz9Msr4G
	LT1kZ/y1+KnszUP6VBQEwOVLT4rEkTIU1bNxCF1clIs4DwInDfT3iHHRdNrRE8mWBUxOZVZWuDT
	LHB2rQ3wppvbXpVM/N7BCzU+PvGiYuDtvqoxiuKsgTaociNBNGT0+NNuGjrBCX36nOU3GiKg4/G
	LDlCU8NK58V5ryjNejDLrRhwAOdS1L4j/jXnRP0F+NTQ9/A3Apv4m7KvGzBrfCx/fKLdJITrjNv
	O9nUaI/W3YrTUUuob9MxuYnvkBGzklVGAz0ynpZSYeLKBj5irhQQ61ogoVufBKQuJRhIhcYf9DL
	ALgHzVei/OxByp7Re/6Dg/s1MMbhrfST8Bu3Sfloj6XsOdKQ51fHdxtBBhkY+7P0XfJsotpxyWE
	7xpAhx/IAnDaJD9jaqjYCsjEsJ6bJksrXIZV2R3GdO+SwtjDXK164Mbkn7+/iP8ClB17LLB6Hqf
	Xo0jT979TdBcbKw2yEv9G9jcrYpov7QTyl0EBOuhrzuj1hjxQBZ9M+bHfQTMOZemKUXITPtLina
	HwHaRIQ06Dkxc7eW6NSMSRV+lPChQ1pVcHaxeIO7MEUGHEXd2xCbKdL7jjuIGacPoIt6XNTeKqh
	nBUljBo52bWXp6ThVCnr9/7VfZBTu9SCTJlFdjVQT7sUEUf86qsDpRKk/noJ8IaoLzKRNTMzZUz
	QU9w==
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id a640c23a62f3a-c513bdec070mr821979266b.47.1795424073497;
        Mon, 23 Nov 2026 00:54:33 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-092-047.092.076.pools.vodafone-ip.de. [92.76.92.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm377880166b.67.2026.11.23.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:54:33 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v5 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Mon, 23 Nov 2026 09:53:52 +0100
Message-ID: <20261123085351.3415122-4-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
References: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085436_290660_7C6AC4E2 
X-CRM114-Status: GOOD (  14.40  )
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

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c5693135d820..2f0aa341d89b 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	4
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


