Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B748606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRCG3+J+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dprufoQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=; b=CRCG3+J+ex1wZp
	KWmQk4ssZomCQ8D6rz++POK0Rbyc1OJUGu8ydoNqkjSJA//FqlDwf2i4pI3YkAbA7lxJGKsxippca
	Hciso8N1SIx7afUC4evfvfoyUrh5aGK9FgP4la7qC3bQiAAfAwqkzGDTN2SQdIZuBL5Hr/RHFd4XB
	fEP98PPWuDfMja95sfEWkruou4DyrozVkeLfBvoLFROHTc29NqO9JAv0UA9uXmlciQYw+qekoHZBv
	GSfM8ieJju6n4oVScRDmlHxJuyl8v4cZNqO792CxPm0DGjN8pVD81qFjasjHJBP6Adf+d6lxdYgra
	FibXVBy3GdPgdoDEyuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceN-00000008Wje-0OuG;
	Wed, 18 Nov 2026 10:12:23 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceG-00000008WhO-3adj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:12:18 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c5119f642fdso22601366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996735; x=1795601535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=;
        b=dprufoQWx030M23bfCbU3zu1sVaECNVLTTXuXaiEZuPuBXeLR7PGtCK1kPGgenEcb6
         FKC1cMc5F33xWdtLNqhO01RQZxvNYTL8R8UvuXXy6HYrfojNoaelcdoml4dWvx7hFqrJ
         w773rzk+aX+1XM9e2WpoXe0AZi/2xbGj3Qfr9/PGLOwpDv8dedu4Zd66S0TY0czarbhr
         XK27C9IulyRwRq9z0Bm4O5ddN9P+BveIqXTqzcWnoCjbmRrUajBxT2rRvFSogsgr++2g
         aSzcOb42dU1yZLkXAkjNmxtI02qqQqHJVGrxdMg1qILucDp4PmzuIrbIvIF5CcCz/uTv
         7OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996735; x=1795601535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=;
        b=KSyMSJgUT4UdN42VdmLBxjH3vwfg6R4b40/lYzx9yTPja12+aiPYnX8rKm0UA6J6Jy
         IFiN2aGrItlZNaZ2+oxE6/xkpF+X1ImERXeXyl+4pkVF/ylQtIJsRDQNyz3dUMmqH3CG
         9POPHD/Bn19IAdHmEG7n3BzhS930nYwEYAzrD4RSK1+Lb0Ou+B0gE0uR0IOu3W3f4Q7+
         HlT9MZxPshDFC6VvsHbpQ+c2E0h/4u7+JYd3dKpBEMeq7KuZCypcXMDnwVc8OEubmMIQ
         Q9rNKRhoy5ZOFuj/uZIs24LBWYgQ87tt9QjJqlMfmdI9LDRkZZNUp4sToVS4IrmwW4iu
         Tx+Q==
X-Gm-Message-State: APuU4Z9ZJDqkCmAd5IgMWwEH+3/3WNorDGh5NzNh0R9KjIsem4BFSMC4
	q8aOEO57k5aeJYKPbJKQsk8t/3b3A6py7jSE+zDuffGfrQCos2Spo5m3
X-Gm-Gg: AYBFou1S1OZeCbtb1AOs7fNvHOsGcA83PGAbUUbwFs26urLSPOMLYIaNPW4RaFwrLwF
	biFH1KBc0jiwDZ8jQ4s6YYPqhODmZe8DZvf21z/gZn2B1nV/2kSimL1h/GYzfZQ2Fhi3g7bkaTI
	D01bLTDIc3Ts0oxfVOZSNJTeB63sObu6/hxOGsqISm1ISWE0b/vLZWks9ooWf1WCue8/nqaKbZK
	m1sIdop/VYm501xYhc+HA9C0k2BkHa3xYjd1PID7DEl3LkbdbF4p/G5ePTWGAZLZFvT3BFdhKos
	B+Kyu+3Ki+qdvIO23N43HhrngcAyD6fmyFPahySGQdqfMTiC2Nhh/O3eh5j28NDLSQqwUZVVVKr
	78NUoxtat+YKyMZL2ZHHb3XDjNCfq6Zix/8splqj0CEJysJ63SV0MLQhvY5v37e5TveD5mQk0pI
	BE/BN8T/fp7xkPDH5mk98RH+QV1MvsKyeadqTKODIKEtr/ZUJnqbhCWhcMvbNqFFuwzjyRMcJ45
	wJED/B9D+WihLsAoCuA1fvIsP+4+bLJ1VHd1PBRNPtV9A/hxWfbRlSVB1bSyAGVYORU90YnmsBF
	m8D1FpidQV0iZbbs/KCNy7zjUtwsDPnCml4QUVE3AFIyo0xXxnatmhp3DafSOkTDw18EZLtUxTk
	K3BqgNYcAixiA/QI38adscFCgk64wPTNkdXidM/RknSWBojX5PfFSZTGr
X-Received: by 2002:a17:907:d406:b0:c49:cfcf:8d7f with SMTP id a640c23a62f3a-c510e3bd593mr169522666b.46.1794996734526;
        Wed, 18 Nov 2026 02:12:14 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:14 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Wed, 18 Nov 2026 11:11:46 +0100
Message-ID: <20261118101147.3350796-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021216_913385_DD2847D4 
X-CRM114-Status: GOOD (  17.74  )
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

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL

 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }

+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}

 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);

@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);

-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);

 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));

 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)

 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}

 	i2c->prev_msg_tx = true;
--
2.43.0


