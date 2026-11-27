Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C9606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yDYdtTre;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=IwpDUpX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=; b=yDYdtTrezU2PM5
	XSngsl7INt+gyJAXXk0kCorphj2q7W/vssStmwCwREyBR5ENCPyV163M7Pg0RdrdEoYwMoqAEIiQF
	AeEeZyNckdM7God00OE/Z3VB+N6kFo3dYu0aVM0dIv023F1q2Gb3NlGA/xc2RQ7BZjAiQ0L0DYfvo
	/DsgYw9Q9LIhe7JC3b7t3tFA7s/NYRVnGhl6MUl5USBfQmRX5FcCPOL3p8nmK34ADQ5cS09sgAiRf
	ZX/v7TVxvSeMQ6xkopy59Nwis4mWwXy12VADlJpeXF2x1Wh09QjpnMQLj5GVPdxgSmClIjdDsYMhT
	4UkiEEP5hQO2af298Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtOE-0000000Fdlm-3MNM;
	Fri, 27 Nov 2026 10:41:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtO7-0000000Fdc3-1W9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:41:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3601240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776066; x=1796380866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=IwpDUpX1fnE5WBFd8lUDl8E/s+gY2WWASaNzdQmTzQcaJe/S7TiZmhpbBpoGtkRvcF
         sKREUOlv+88FseJTV/fEPT9En9rQskEb/5D2lVBBp7swb5mOx2mdxhFVIksmpPbyfZqz
         LX6GqPPUvfLvxpq8m6LHYXyChCvmVdr1VBpdv4jXYnHEDx/MOt9XMm/vXbAjO0B5vpqO
         V6aU7ez7xIFa4dDQzp8Qh05MsTRQyRtP2dOna8DfrT1j1eKJOX6gxYgZONTOxrx5t5wr
         Q/ORkwvlTDk2i2dmRY8hn1jST5IDzaRbe1W9sJEp+rn7atv7mVEEShB3fJ1qM7gJr9QC
         SQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776066; x=1796380866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=aJ87+xarwf5roVfn3NHj1bhdLnYFnoLrsOJcam1nbxe941A81jcLFp52MCRF9KNopx
         LC/5mSF7484RxMNOXtA/yyJzTG4OvMaQcszQpnShBRKrpHu49wNcOL7d+HZw4XHnEwCi
         ipIY+IaQV++9bwPILEeyYLa9Yug450foUFnjnHROY8YSUqVfXstnIQXEU2kBMwGZAM8c
         g8Ns+M+DXXzc8zi+/7blyur5523Kb56i0misJbAzuvl3zDhCn7oo3ccTjdTepmjq/5f0
         I6n0tj1zwuWkYUwgDD0p7rttfg/0v6a1G9ZkVNSlp838WL0USLrzGfjralf3RpmJNEn8
         04rg==
X-Forwarded-Encrypted: i=1; AL+hErG8j2fAOkoGix8zG+7kuUnDgSYCeDEljeivLuLz6or9JF1F1uBdmKNTNOFlgLmiOmi1eb1SeICjGSPFwh2NYioe@lists.infradead.org
X-Gm-Message-State: APuU4Z/Jdug/f9hBbWbGfs9ZMRUdbYLdeQWbtwzAtJAUqPZ8B8egxdxN
	6w0TFkj51pEXmA7LD8VtaBQ3jQdXP8xZsBGJBCIHFOocnuvwKEGbdVPeloPDFYPlXSc=
X-Gm-Gg: AZFdTZdAMrV/KE0Kul5Ek/GXfxrb9lv+RseF6Ar+RDdNLBYdJgKLE98bQrzDZlFHKJc
	NrD9D2ryV0J5JcKsGME40W0qJPW0yKt8sXLHSxVTc3U/XkazWz6ybp97YDifFrtBEmxf8E77ge0
	ZfAP4SHTl3TQ7TZBBFn7TAN7PdV7r+vB9bwmnFuNQ73bMyZW+66lZZNqy0iGZQ9tnr05T+LFzHe
	8KTQLxhm2R+etU1NuQhwI1MuVoPcwY42CJFn7BgdYo11USQceXKaS3RFJP0X4PQxUPQicj8eCey
	mEbQ+4/OwBBV46Fqm+YzSPdDoRyA81ptt73Cc9mB8WCTqsUFUJdONAHyRhmvql+C/EgjO4g7TF5
	W1Xhst3xPmmL61fPHMt4e4plyIiMBAXv3Iaua2EZVioUf2BHkv+e8RFQjQmHmCpTj9nKS5M5hP1
	joBr9i/ffyrXfUck/E7WoGrBiXOTY++pvo/pO9ia5pQMuE7ApqNkSaTOwB2oCmatMyIZh8cJYWo
	oReuy776Evu+CAONH9xa4WWx5aaLCFugJ4itOASp93ZK3Vrvjf1rnKPaY4sB0Kl0cluTzPYEiSK
	ljCkMZx6ZYUaI3A7HFuo/uVQJ8PKBp0OIZrxboobWvK1JRzi9f6QPz3Ofv7NYOuJXJYmoWFc/sA
	hbBvtQQHS
X-Received: by 2002:a05:6000:2503:b0:4b7:8178:f7ea with SMTP id ffacd0b85a97d-4b78178f825mr23002295f8f.51.1795776065640;
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:49 +0400
Subject: [PATCH v2 4/6] usb: typec: fusb302: Handle interrupts in the IRQ
 thread
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-4-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6105; i=alchark@flipper.net;
 h=from:subject:message-id; bh=kTIPW2yAFNq3399UJRyEGQQJQ5Ot4JrKKJTWUyt7UvY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpkx56cU58Ux7cg9c23RskXlTEI34j6femrz6dZPM
 YU32XOmdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV17QY/optnctQtbZrwu4yFWaX09O+Pet7YDUncWdBrF7xjRUPtC0Y/hkV3+u
 fOzd5nU1fvmIk6+6cb+HPeB6k5xhc/vwsa8c1cyYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024107_469761_DC9C9A83 
X-CRM114-Status: GOOD (  20.81  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The threaded IRQ handler only disables the IRQ and queues irq_work, which
then does all the handling. The extra hop costs a context switch, and
leaves the handling at normal priority behind whatever else shares the
system workqueue.

Handle the interrupt in the IRQ thread instead, as suggested in review of
the switch to a threaded handler [1]. IRQF_ONESHOT keeps the line masked
meanwhile. Before resume, the I2C adapter may still be suspended: disable
the IRQ then, and have resume handle it before enabling it again, so that
nothing handles it twice at once and it stays a wakeup source. Make
irq_lock a mutex for that, as disabling an IRQ behind an I2C GPIO
expander may sleep.

Verified both at runtime and across suspend on a Rockchip RK3576 board.

Link: https://lore.kernel.org/r/20260312120418.99U0NPWL@linutronix.de [1]
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 5cf1b78e7669..aa0e4dbe31db 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -87,9 +87,13 @@ struct fusb302_chip {
 
 	struct regulator *vbus;
 
-	spinlock_t irq_lock;
-	struct work_struct irq_work;
+	/*
+	 * A mutex, as disabling an IRQ behind an I2C GPIO expander, which
+	 * fusb302_irq_intn() does under it, may sleep
+	 */
+	struct mutex irq_lock;
 	bool irq_suspended;
+	/* The IRQ came before resume, which handles it and enables it again */
 	bool irq_while_suspended;
 	struct gpio_desc *gpio_int_n;
 	int gpio_int_n_irq;
@@ -1943,24 +1947,6 @@ static int fusb302_pd_rx_start(struct fusb302_chip *chip)
 	return ret;
 }
 
-static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
-{
-	struct fusb302_chip *chip = dev_id;
-	unsigned long flags;
-
-	/* Disable our level triggered IRQ until our irq_work has cleared it */
-	disable_irq_nosync(chip->gpio_int_n_irq);
-
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_suspended)
-		chip->irq_while_suspended = true;
-	else
-		schedule_work(&chip->irq_work);
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
 /*
  * Reading an interrupt register clears its flags in the chip, so keep them
  * pending until handled: a bus error on a later read would otherwise lose
@@ -1998,10 +1984,8 @@ static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
 	return ret;
 }
 
-static void fusb302_irq_work(struct work_struct *work)
+static void fusb302_irq_handle(struct fusb302_chip *chip)
 {
-	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
-						 irq_work);
 	int ret = 0;
 	u8 interrupt;
 	u8 interrupta;
@@ -2128,7 +2112,26 @@ static void fusb302_irq_work(struct work_struct *work)
 	}
 done:
 	mutex_unlock(&chip->lock);
-	enable_irq(chip->gpio_int_n_irq);
+}
+
+static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
+{
+	struct fusb302_chip *chip = dev_id;
+
+	mutex_lock(&chip->irq_lock);
+	if (chip->irq_suspended) {
+		/* Only once, as resume enables it once */
+		if (!chip->irq_while_suspended)
+			disable_irq_nosync(chip->gpio_int_n_irq);
+		chip->irq_while_suspended = true;
+		mutex_unlock(&chip->irq_lock);
+		return IRQ_HANDLED;
+	}
+	mutex_unlock(&chip->irq_lock);
+
+	fusb302_irq_handle(chip);
+
+	return IRQ_HANDLED;
 }
 
 static int init_gpio(struct fusb302_chip *chip)
@@ -2226,8 +2229,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (!chip->wq)
 		return -ENOMEM;
 
-	spin_lock_init(&chip->irq_lock);
-	INIT_WORK(&chip->irq_work, fusb302_irq_work);
+	mutex_init(&chip->irq_lock);
 	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
 	INIT_DELAYED_WORK(&chip->rx_recheck, fusb302_pd_rx_recheck_work);
 	init_tcpc_dev(&chip->tcpc_dev);
@@ -2294,7 +2296,6 @@ static void fusb302_remove(struct i2c_client *client)
 
 	disable_irq_wake(chip->gpio_int_n_irq);
 	free_irq(chip->gpio_int_n_irq, chip);
-	cancel_work_sync(&chip->irq_work);
 	cancel_delayed_work_sync(&chip->bc_lvl_handler);
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	tcpm_unregister_port(chip->tcpm_port);
@@ -2306,14 +2307,13 @@ static void fusb302_remove(struct i2c_client *client)
 static int fusb302_pm_suspend(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
+	mutex_lock(&chip->irq_lock);
 	chip->irq_suspended = true;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
 
-	/* Make sure any pending irq_work is finished before the bus suspends */
-	flush_work(&chip->irq_work);
+	/* Let an IRQ being handled finish before the bus suspends */
+	synchronize_irq(chip->gpio_int_n_irq);
 	/* No RX FIFO recheck may run until the bus is back either */
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	return 0;
@@ -2322,15 +2322,19 @@ static int fusb302_pm_suspend(struct device *dev)
 static int fusb302_pm_resume(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
+	bool pending;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_while_suspended) {
-		schedule_work(&chip->irq_work);
-		chip->irq_while_suspended = false;
-	}
+	mutex_lock(&chip->irq_lock);
+	pending = chip->irq_while_suspended;
+	chip->irq_while_suspended = false;
 	chip->irq_suspended = false;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
+
+	/* The IRQ stays disabled until then, so nothing else handles it */
+	if (pending) {
+		fusb302_irq_handle(chip);
+		enable_irq(chip->gpio_int_n_irq);
+	}
 
 	/* Look at the RX FIFO again, in case suspend cut a recheck short */
 	mutex_lock(&chip->lock);

-- 
2.56.0


