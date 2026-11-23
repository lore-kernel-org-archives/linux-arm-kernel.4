Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C2606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DeZlnQZ3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gp/UJJn0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0yvdWBeIrU265b2SHajtvEKLgNwE4xzZHnqqC+Ij8lU=; b=DeZlnQZ3DjVFR1
	ZlxD8EnBROgi/q/g2mFIPrJ7zUpAOvqQCqQFTbmNCl5LWrY3XelU8Jwa3/sD7pQrME8nBxRxkKJnX
	Ibb0hZOvFF1oGmsquOFPMizt0qcKC49oPOYzjUlk/12l/rV73lAbQpEmqnJvETtZEa/Yw6PWLt8Fd
	AELHi5Jvzy8y+HNZDy9S++l2+il2RwHlVj1bK+9rlk07PRqk3lbM4BLr+UmwPPKD+7SAxGQEf2sYH
	YZ87lz9y5lsvkV1hARpm+LUGorc+NimkrVbSA/iUzar0puPCybzK4tp9Ga1q/uhqoljRypB2LTvpX
	thIJYNXSkfrWZ0gdh5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPpL-00000002c9I-09PX;
	Mon, 23 Nov 2026 08:55:07 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPom-00000002c0n-0JIp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:54:43 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c5093617c7aso123763366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424070; x=1796028870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yvdWBeIrU265b2SHajtvEKLgNwE4xzZHnqqC+Ij8lU=;
        b=gp/UJJn0WAMekBCyPOBcHWPpK/yn72CiIYmj6X/dZP1Z3mvzfDoJEV1bEi6VxIpY04
         HaVTfwsdiUkSQb3C4uyKeJ3itXzooSBfqZ32Dbfy4ddqQLSNJUVZYUWTA1mV4v78JA5m
         vPQPf0kRAsgxTmS9CqEH5+4GAISBm4kF5hXa1WdlyzpXOvCftdbhfs0vVcJ9zs+6Y8ww
         1Uj+OHWM4W8vVYx4AqDaHsLWQcgmAWT8b5F9UL6F6ePg26MWu6axMhtcWcmIHmejauBp
         av9/DKYNWmVg85iQ3uLw255X3nm3QmtJu99I9H5Nya/4L9bepOmFv3+IZvXddabf/YgV
         dwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424070; x=1796028870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yvdWBeIrU265b2SHajtvEKLgNwE4xzZHnqqC+Ij8lU=;
        b=dJlcL9qAuNqiByXldoT0sSjs3ISZPi6qC6GtEjXVC4fxckWA6b9G76Z9SfIFzYcLFB
         T89xf/jddCXBnXKaiO60P38srWLq6pycZL4GSI+LC6st2FEV8J5W/lxy2GmbtIqcdU6E
         SOowe1vwZb9vargpcpBGUNnoj/mUqoSlkhC07J2rL5sd1cuB7OcsEZp8AB92c8xJalCv
         h/fy49R9k4js8yXUF4E+zHzRKYdUSEgMt3a66diT3smzkds0n+IT7Cp3Q/oBCnUYBec5
         nSNRpvApsfgPTuWKJYLB/gdFOElQex+uaRH718BuZaFqF/imYhsH/6lOqD8FRhSJpn5X
         nc8Q==
X-Gm-Message-State: APuU4Z8UH51KCTqQ45ejWroMvZTQsgu+YLzhcqyOC0qZ8kazHBX/huYs
	bOyfYZ6/aejsxodaxqjCt7ym71xVdnUqadzQlmv6jGsc5tLLDHf1fqxn
X-Gm-Gg: AZFdTZed2hcbScYcuxDPEf9ZfSRFXYGABrx2138s6OyUW0HScbirBkW1oWpvJXCefXP
	3RJgHVMUNv7NQhVRKkDRyuZ/n2FRHXE1cT+m/GWaYG8eyFH3ZLyAW73TCi32WU5r7TAakWMwfTa
	zr6JobmnolCzzmoDUu5MSAzGSZPuFDuBnpcPee20aWQYePodqpCu6/isskOUIfrMxM4+k5+EPIs
	SIRpuk5F/Uz2V9371G4SpBAargU31UEHzkb03gmsgOJfEVcz3ZjAnUX9Wx9LrxGkhsfdHYxh2+v
	i6P32qmYhdFAXMjmEjuxnWhkZy+T535F+b9zB9A4OgmzU9QgKgqq+carOxy/ahOUge7fcaogSvz
	H0/pmKLXbn4Ic/4qCq9Cl7RtUg543uffu2vBWnnl563O8ESnu5jfpDElSabFdkdOwvfjc9m/9GA
	hx6ro3xNklsHSA1XTteJUUPPqu0AxBPVNwD+kOrZcoIjiaNqyYUT0AhNER6EUFRveRjnQFVWrIT
	MNpUnjg8hAwhCt1232Nj7j36MdeZv96KNGhiH+4JBSqMkEp1GWLKpKdFjI7FScqwdwtomR1TvSL
	kRwuY5Ws9T9S1IOO1bRH7/nBZVEERlprb2OcXKkefvHgVyfVLYU2glNoaKa2VgrDBev5UgJl8wK
	Pwk0sJnTY5Jba5HDRYI5vbafyegIXXW0N6k0TN62ywKixUxcE4X/7x14=
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr569690766b.13.1795424069989;
        Mon, 23 Nov 2026 00:54:29 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-092-047.092.076.pools.vodafone-ip.de. [92.76.92.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm377880166b.67.2026.11.23.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:54:29 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v5 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Mon, 23 Nov 2026 09:53:51 +0100
Message-ID: <20261123085351.3415122-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
References: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005432_126081_2EEE5B46 
X-CRM114-Status: GOOD (  18.81  )
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

Add a function to clear the bnb bit. It waits until all preconditions
are met before clearing the bit, or times out. The maximum timeout
is set to the minimum I2C start-condition hold time in standard mode,
which is the upper bound for when the bnb bit should become set.

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..c5693135d820 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL
 
 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	4
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
+			sr & XIIC_SR_BUS_BUSY_MASK, 1, XIIC_BB_TIMEOUT_US, 0,
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


