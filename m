Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2840606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4QiRnjsZ;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tF8pX2y7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x6CnKCcRFlmFGMoJSdid1DPb05KDzJFKcZoIQ+AcWA0=; b=4QiRnjsZsRzOUr
	WSovBDvq0M5yNF2Kx/8FcgZRALm/+4ABCZkwQ6fxUsodf0xvoXEe7hP1H+vWULC6gQ8hHYxVUx1zQ
	B8eXdfiJZBYORNWlUBVvJyn686zykqmLcECCzWDxReMTaQvTf30yeKD/ZW2czEUC2gOdNRXDTqrfe
	bcyGL/zTzO8EJ4WCoODRHZK5xJUdvsSKk5TzpUR4IQ7qquGO1myfmB6Lqj90ahY1t2KfAUIM7B4bI
	dXUe1fSofZ9yz1+r4+NtCZFGhTs+Fw4eKyrflQlEBS22LBfmoyowvuu0hweSiEkPtiAu7VAVmWkXW
	ZjOOMpCMpjH6pe0HNNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtOK-0000000FdxM-3GWQ;
	Fri, 27 Nov 2026 10:41:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtOA-0000000FdeB-3YWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:41:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4968870f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776069; x=1796380869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6CnKCcRFlmFGMoJSdid1DPb05KDzJFKcZoIQ+AcWA0=;
        b=tF8pX2y7bFk31/OgFtgVR77GYOuWm1KivizkFZVoabWskWEiQCcwlR2LwCXCY1OU7j
         fJlfxpgD8tH4rhY4/lddg1WPJuxFenwoF9BF6cg4cnjzRZCHNQw3QZbb6kAnNarqms0x
         Fy+MB2LkXipRH4LPC5mD2HAfE57yejH1mfQU7JHyQkPzTEZF67+tAkcezvBO2wYykgf/
         Wh+28g+kk9jLehAcQcn/aiSCGvAcLjmq1hBtxWCdENExKdfqL3nySx/JBqKhjlTBEhJZ
         wMPocLXFUHI0OpLKMp0MXOP30ksBwM3fV8Fq2SSwdt4PoF7t40DoyIkRIREeCyBmHgbo
         nMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776069; x=1796380869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6CnKCcRFlmFGMoJSdid1DPb05KDzJFKcZoIQ+AcWA0=;
        b=0w9xfPLexruy07P8srVWm9mjBdeFyOb2f4GIgRIajcZbm0EGMpyMcACELRW8HoOZnz
         Oc3QyvTOe5uY3xk6KxCotKDcY1t1B3Fy3LzoCR/AwHxTHxIkBD2d1IgNvmCiB2WEamYW
         oaPo+auOFo2DRES/cdbtOgbcg+znVHb1VJNQlB8F7xoWL6z1S9zKiAaznccdrvfNeOkO
         fiZFnOV2hokLC7us171YLdnl/tSmPQutyg8zfzA7YtCllno2y16BfEJOjXm+PycmY447
         jKsCc3JV7iY0v2zWeFDSavvMTC/Bau8t5R3FkwdrYj5JuHgS9mMKedw1d43ndUnB5pxz
         gmNQ==
X-Forwarded-Encrypted: i=1; AL+hErE043IzNL91ZPo2ziYLO8XhpUKMKrzOS5JRkx9T32EpfE68aw2u6xVqIwYtQzFHOGEYKXbt/alW8VDe/bLwyED6@lists.infradead.org
X-Gm-Message-State: APuU4Z+oFBMkDgOjIVW0YpjL34bUhlFfhD5kLufM70pp8KKN6Q+AGlSO
	rx+dO7s8YvsUYcoNGE1Emu9TcMdkdP7exWhcT1QY/doB3NU7CikObK1aS+HxeGbDGZI=
X-Gm-Gg: AZFdTZeyOx4+UvQKydCZVslcWX3XTBPmd3u+1SNZrC7rHGKyT2XPCRIGoEEPdcrmV+j
	cP1U2O/pF9jaYG2Yc3UqJwLh8jSf4Rzg6KdUPIjszVCjdPB8OVKiMaR0CM3DN/onNvCOKjEleRk
	hClzrp41mVLqFROZrVyK2sm8ZCZ7yFoLyLofspm2v9w2GSbBfY7hCCAt52gLLJ/xzHVHEFLg0hL
	cf/YxBj9gDQmV30DvNaTHpCZbYGWeIm7SFQ5zuizlILIBFNptN7d10Nvx3jGaxL7il2KdFR0BlU
	t4mFc/YX/7SVlrRjLAulZ2Wfk4RbRcWidaU50qXAVyVpssea4tPy8ycxZGozRvdkva2n9C3hBPI
	5v1N3Kluc/kiYVB4pwBpVVjARzJ2hvoV+CgSfGTCyC/IKy7s4n3zO73M8QNPRpSomQrxoCgYk3x
	tltJKoyfaiFYyJ1Jj6henQDDTtgWp5vb331dZY5UENpPef6JHzNvwOskJmdqnqzntoH/qhHkmif
	qHIH125lD426mVouXc1QaGTStCBO8PxpCDCJ7SQ7WNxKkumpTfRGmUkpR+1XW6i1UsPAjKEyHXr
	6q2FL/x1383w3hWMxhWWUeWFsskqyUL8AKLsOJD7V/eanvC9kQwALtxMx0riwDrrDqtpwNKc/VN
	ZQTskvj86
X-Received: by 2002:adf:e186:0:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-4abb3a4d37dmr48804786f8f.34.1795776068653;
        Fri, 27 Nov 2026 02:41:08 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:08 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:50 +0400
Subject: [PATCH v2 5/6] usb: typec: fusb302: Acknowledge
 Get_Source_Cap_Extended from the driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-5-6770eb1e7945@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13656; i=alchark@flipper.net;
 h=from:subject:message-id; bh=+EiLmfbwp2gS/KdLyt4fuAjUMNY2FeAAM1Q+xqJ0G4I=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpkpTbTxXXNZ54XKg1eaCUzv/xw5pLPlNm/Ofp3V/
 +fW/HgzuWMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpZtNmZNifVFnL8tdYRuv8Rd8L29fcfS584GvgLi6NU/tj1f5t+CPP8E8psrr
 y/r7Z7yZ+bbvrF2Ah0HDrXtQJv/cb89TfsXxWT2ICAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024114_030249_5B0482B9 
X-CRM114-Status: GOOD (  34.13  )
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

The chip implements PD 2.0, whose Message Type field is four bits wide, so
it decodes the PD 3.0 Get_Source_Cap_Extended (0x11) as a GoodCRC (0x1)
and never acknowledges it. A PD 3.0 partner asking for the extended source
capabilities then never sees the message delivered: an Apple Studio
Display retries it, soft resets, and asks again after the new contract,
every 94ms, so it never gets as far as DisplayPort.

Send the GoodCRC from the driver once the message is read and its CRC
checks out, and read the FIFO on CRC_CHK, which such a message still
raises. Over a 400kHz I2C bus that takes 2ms and more, far beyond 195us
(tTransmit), but the partner retries with the same MessageID and may
accept a GoodCRC that comes while it waits for the one to a retry. That
display sends its retries 0.97ms after each attempt ends, which puts most
such late GoodCRCs within the window of its second or third attempt. As
the FIFO is only read while CC is idle, the GoodCRC follows a retry
already under way rather than colliding with it. Pass the message on to
TCPM too, so the partner gets an answer rather than asking again.

Hold the GoodCRC back while TCPM waits for the outcome of a transmission
of its own, which that of the GoodCRC would pass for, unless TCPM has
given up on it already. Keep a collision of the GoodCRC apart from one of
the next transmission TCPM makes, so that the one does not fail that
transmission and the other is not lost, also when the GoodCRC goes out
from outside the IRQ thread, which then handles the interrupt flags read
to tell them apart. Use revision 2.0 in the header, as the chip does for
its own GoodCRCs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 175 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 170 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index aa0e4dbe31db..c98a74fc7a2a 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -124,12 +124,19 @@ struct fusb302_chip {
 	bool vbus_on;
 	bool charge_on;
 	bool pd_rx_on;
+	/* TCPM waits for the outcome of a transmission, started at tx_start */
+	bool tx_pending;
+	ktime_t tx_start;
+	/* The driver sent a GoodCRC, for fusb302_pd_check_ack() */
+	bool ack_check;
 	/*
 	 * Bytes read from the RX FIFO but not handled yet: the start of a
 	 * message to read on, or bytes to find the next message in
 	 */
 	u8 rx_buf[FUSB302_RX_MSG_MAX];
 	u8 rx_len;
+	/* The driver sent a GoodCRC to the message starting rx_buf */
+	bool rx_acked;
 	/*
 	 * The next message may not be at the start of the buffer.
 	 * Look for its start first before processing.
@@ -143,6 +150,9 @@ struct fusb302_chip {
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
 	enum typec_cc_status cc2;
+	/* for a GoodCRC sent by the driver, as the chip does for its own */
+	enum typec_role pwr_role;
+	enum typec_data_role data_role;
 	u32 snk_pdo[PDO_MAX_OBJECTS];
 
 #ifdef CONFIG_DEBUG_FS
@@ -869,6 +879,7 @@ static void fusb302_pd_rx_reset(struct fusb302_chip *chip, bool cut_short)
 {
 	chip->rx_len = 0;
 	chip->rx_resync = cut_short;
+	chip->rx_acked = false;
 }
 
 static int fusb302_pd_set_auto_goodcrc(struct fusb302_chip *chip, bool on)
@@ -883,7 +894,8 @@ static int fusb302_pd_set_auto_goodcrc(struct fusb302_chip *chip, bool on)
 static int fusb302_pd_set_interrupts(struct fusb302_chip *chip, bool on)
 {
 	int ret = 0;
-	u8 mask_interrupts = FUSB_REG_MASK_COLLISION;
+	/* See fusb302_pd_rx_ack() for CRC_CHK */
+	u8 mask_interrupts = FUSB_REG_MASK_COLLISION | FUSB_REG_MASK_CRC_CHK;
 	u8 maska_interrupts = FUSB_REG_MASKA_RETRYFAIL |
 			      FUSB_REG_MASKA_HARDSENT |
 			      FUSB_REG_MASKA_TX_SUCCESS |
@@ -907,6 +919,7 @@ static int fusb302_pd_set_interrupts(struct fusb302_chip *chip, bool on)
 }
 
 static int fusb302_pd_rx_start(struct fusb302_chip *chip);
+static void fusb302_pd_check_ack_async(struct fusb302_chip *chip);
 
 static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 {
@@ -936,6 +949,8 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 		fusb302_log(chip, "cannot flush pd tx buffer, ret=%d", ret);
 		goto done;
 	}
+	/* Nothing flushed reports its outcome */
+	chip->tx_pending = false;
 	ret = on ? fusb302_pd_rx_start(chip) :
 		   fusb302_pd_set_auto_goodcrc(chip, false);
 	if (ret < 0) {
@@ -994,6 +1009,8 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
 			    ret);
 		goto done;
 	}
+	chip->pwr_role = pwr;
+	chip->data_role = data;
 	fusb302_log(chip, "pd header := %s, %s", typec_role_name[pwr],
 		    typec_data_role_name[data]);
 done:
@@ -1128,6 +1145,13 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
+	/*
+	 * See whether a GoodCRC from the driver collided before this goes out:
+	 * a COLLISION from now on is this transmission's, even should the
+	 * check fail
+	 */
+	fusb302_pd_check_ack_async(chip);
+	chip->ack_check = false;
 	switch (type) {
 	case TCPC_TX_SOP:
 	case TCPC_TX_SOP_PRIME:
@@ -1154,6 +1178,10 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 			    transmit_type_name[type]);
 		ret = -EINVAL;
 	}
+	if (ret >= 0) {
+		chip->tx_pending = true;
+		chip->tx_start = ktime_get();
+	}
 	mutex_unlock(&chip->lock);
 
 	return ret;
@@ -1531,10 +1559,110 @@ static int fusb302_pd_reset(struct fusb302_chip *chip)
 				    FUSB_REG_RESET_PD_RESET);
 }
 
+static void fusb302_pd_tx_complete(struct fusb302_chip *chip,
+				   enum tcpm_transmit_status status)
+{
+	chip->tx_pending = false;
+	tcpm_pd_transmit_complete(chip->tcpm_port, status);
+}
+
+/*
+ * See whether a GoodCRC the driver sent collided before releasing chip->lock:
+ * by the next interrupt, TCPM may have started a transmission, and the
+ * COLLISION would then be reported against it. The chip sets COLLISION when
+ * TXON finds CC busy, so it is there to see by now. Keep the other bits, which
+ * reading the register clears, pending for fusb302_irq_handle().
+ */
+static int fusb302_pd_check_ack(struct fusb302_chip *chip)
+{
+	u8 interrupt;
+	int ret;
+
+	/* Left set on an error, for fusb302_irq_handle() to tell COLLISION */
+	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
+	if (ret < 0)
+		return ret;
+	chip->ack_check = false;
+	if (interrupt & FUSB_REG_INTERRUPT_COLLISION)
+		fusb302_log(chip, "GoodCRC sent by the driver collided");
+	chip->pending_interrupt |= interrupt & ~FUSB_REG_INTERRUPT_COLLISION;
+
+	return 0;
+}
+
+/*
+ * As fusb302_pd_check_ack(), outside the IRQ thread: reading INTERRUPT clears
+ * the flags that raise the IRQ, so have the IRQ thread handle what it read
+ */
+static void fusb302_pd_check_ack_async(struct fusb302_chip *chip)
+{
+	if (!chip->ack_check || fusb302_pd_check_ack(chip) < 0)
+		return;
+	if (chip->pending_interrupt)
+		irq_wake_thread(chip->gpio_int_n_irq, chip);
+}
+
+/*
+ * TCPM waits for the outcome of its last transmission, unless it gave up after
+ * PD_T_TCPC_TX_TIMEOUT, which it does without telling the driver
+ */
+static bool fusb302_pd_tx_waiting(struct fusb302_chip *chip)
+{
+	return chip->tx_pending &&
+	       ktime_ms_delta(ktime_get(), chip->tx_start) <
+	       PD_T_TCPC_TX_TIMEOUT;
+}
+
+/*
+ * The chip only decodes the low four bits of the message type, so it mistakes
+ * Get_Source_Cap_Extended (0x11) for a GoodCRC (0x1): it neither acknowledges
+ * it nor raises GCRCSENT, only CRC_CHK, yet still queues it in the RX FIFO.
+ * Send the GoodCRC from here once the message checks out. It goes out well
+ * after 195us (tTransmit), but the partner retries with the same MessageID and
+ * usually accepts it then, rather than soft reset over and over.
+ */
+static void fusb302_pd_rx_ack(struct fusb302_chip *chip)
+{
+	u16 header = get_unaligned_le16(chip->rx_buf + 1);
+	struct pd_message ack = {};
+	int ret;
+
+	if (chip->rx_discard || chip->rx_acked || pd_header_cnt(header) ||
+	    pd_header_type(header) != PD_CTRL_GET_SOURCE_CAP_EXT ||
+	    (chip->rx_buf[0] & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
+		return;
+	chip->rx_acked = true;
+
+	/*
+	 * The outcome of a GoodCRC sent now would pass for that of the
+	 * transmission TCPM waits for, so leave the partner to retry then
+	 */
+	if (fusb302_pd_tx_waiting(chip)) {
+		fusb302_log(chip, "not acknowledging PD message, TX pending");
+		return;
+	}
+
+	/*
+	 * The chip's own GoodCRCs go out as revision 2.0. As it decodes only
+	 * the low four bits of the message type, it treats any GoodCRC it
+	 * sends as one that needs no GoodCRC in return, so it sends this one
+	 * once, without retries or RETRYFAIL, whatever the retry count is.
+	 */
+	ack.header = PD_HEADER_LE(PD_CTRL_GOOD_CRC, chip->pwr_role,
+				  chip->data_role, PD_REV20,
+				  pd_header_msgid(header), 0);
+	ret = fusb302_pd_send_message(chip, TCPC_TX_SOP, &ack);
+	if (ret >= 0)
+		chip->ack_check = true;
+	else
+		fusb302_log(chip, "cannot acknowledge PD message, ret=%d", ret);
+}
+
 static void fusb302_pd_rx_drop(struct fusb302_chip *chip, int n)
 {
 	chip->rx_len -= n;
 	memmove(chip->rx_buf, chip->rx_buf + n, chip->rx_len);
+	chip->rx_acked = false;
 }
 
 static bool fusb302_pd_rx_is_token(u8 byte)
@@ -1680,6 +1808,8 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 		dropped++;
 	}
 
+	/* The CRC checks out: acknowledge it, should the chip not have */
+	fusb302_pd_rx_ack(chip);
 	chip->rx_resync = false;
 	token = chip->rx_buf[0];
 	memcpy(&msg, chip->rx_buf + 1, len - 5);
@@ -1705,7 +1835,7 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 	 * to check the message type to ensure correct reporting to TCPM.
 	 */
 	if (!len && pd_header_type_le(msg.header) == PD_CTRL_GOOD_CRC)
-		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
+		fusb302_pd_tx_complete(chip, TCPC_TX_SUCCESS);
 	else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
 		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP_PRIME);
 	else
@@ -1847,6 +1977,7 @@ static void fusb302_pd_rx_recheck_work(struct work_struct *work)
 		if (ret < 0)
 			fusb302_log(chip, "cannot read in PD message, ret=%d",
 				    ret);
+		fusb302_pd_check_ack_async(chip);
 	}
 	mutex_unlock(&chip->lock);
 }
@@ -1943,6 +2074,11 @@ static int fusb302_pd_rx_start(struct fusb302_chip *chip)
 	if (ret < 0 && gcrc_on)
 		fusb302_pd_set_auto_goodcrc(chip, false);
 	chip->rx_discard = false;
+	/*
+	 * A GoodCRC sent while reading the FIFO out: see whether it collided
+	 * before TCPM may start a transmission the collision would pass for
+	 */
+	fusb302_pd_check_ack_async(chip);
 
 	return ret;
 }
@@ -1998,6 +2134,7 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 	bool intr_comp_chng;
 
 	mutex_lock(&chip->lock);
+again:
 	/* grab a snapshot of intr flags */
 	intr_togdone = chip->intr_togdone;
 	intr_bc_lvl = chip->intr_bc_lvl;
@@ -2014,6 +2151,22 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 	chip->pending_interrupt = 0;
 	chip->pending_interrupta = 0;
 	chip->pending_interruptb = 0;
+
+	/*
+	 * A message the chip didn't acknowledge raises CRC_CHK alone: read it
+	 * out first thing, as its GoodCRC is past due already. Those that came
+	 * before PD was on, which nothing acknowledged, were dropped then.
+	 */
+	if (chip->pd_rx_on && (interrupt & FUSB_REG_INTERRUPT_CRC_CHK) &&
+	    !(interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) &&
+	    !(interruptb & FUSB_REG_INTERRUPTB_GCRCSENT)) {
+		/* Still handle the other events then */
+		ret = fusb302_pd_rx_drain(chip);
+		if (ret < 0)
+			fusb302_log(chip,
+				    "cannot read in PD message, ret=%d", ret);
+	}
+
 	fusb302_log(chip,
 		    "IRQ: 0x%02x, a: 0x%02x, b: 0x%02x, status0: 0x%02x",
 		    interrupt, interrupta, interruptb, status0);
@@ -2061,14 +2214,19 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 		}
 	}
 
+	/* Not for TCPM if it came from a GoodCRC the driver sent */
 	if (interrupt & FUSB_REG_INTERRUPT_COLLISION) {
 		fusb302_log(chip, "IRQ: PD collision");
-		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_FAILED);
+		if (chip->ack_check)
+			chip->ack_check = false;
+		else if (chip->tx_pending)
+			fusb302_pd_tx_complete(chip, TCPC_TX_FAILED);
 	}
 
 	if (interrupta & FUSB_REG_INTERRUPTA_RETRYFAIL) {
 		fusb302_log(chip, "IRQ: PD retry failed");
-		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_FAILED);
+		if (chip->tx_pending)
+			fusb302_pd_tx_complete(chip, TCPC_TX_FAILED);
 	}
 
 	if (interrupta & FUSB_REG_INTERRUPTA_HARDSENT) {
@@ -2078,7 +2236,7 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 			fusb302_log(chip, "cannot PD reset, ret=%d", ret);
 			goto done;
 		}
-		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
+		fusb302_pd_tx_complete(chip, TCPC_TX_SUCCESS);
 	}
 
 	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
@@ -2111,6 +2269,13 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 		}
 	}
 done:
+	/*
+	 * Not right after the GoodCRC, which would hold up the next one to a
+	 * retry queued meanwhile. Then handle what the check read.
+	 */
+	if (chip->ack_check && fusb302_pd_check_ack(chip) >= 0 &&
+	    chip->pending_interrupt)
+		goto again;
 	mutex_unlock(&chip->lock);
 }
 

-- 
2.56.0


