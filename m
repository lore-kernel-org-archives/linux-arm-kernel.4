Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYiO7Wsh;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=EDGnCIGL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R8TYyQ8IZ5ABioVXSDrXTDtdF2LkWCuPyKGqXG+cDgQ=; b=qYiO7WshZvyC0I
	BfsFIHuZ3skzViqIGSM93x/lPfY8IULCWF4ddwUdd0zDDjQxT3b3ZWMphYgBZMRPicuHBQRi/tmuG
	1obkb0wkQDlPIF08R9tJNvUwlfhw/O4jRtoRyhVPxde2UFMj1scHfSRWIQh5m/pgvGid+P4P9sQBR
	j3RNPeq6RAMIqB16viXYtX0S+IkZ1EOZoEh5QP4e86Ai2AzK/qm5eZtUIvh11BZig8ozqWIdx+B7Q
	LGPVtUkUXCnfrHdnMdCsE50i3H1LFGLAYKD6p4pG9s0N+Ag3/zsMdaxt8pTLd36AJ1yY+d9RjMVXn
	O8nUM5e2swAYJtCqnRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtOA-0000000FdfB-0rzD;
	Fri, 27 Nov 2026 10:41:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtO2-0000000FdY9-0U6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:41:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5652082f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776060; x=1796380860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8TYyQ8IZ5ABioVXSDrXTDtdF2LkWCuPyKGqXG+cDgQ=;
        b=EDGnCIGLA4JY32OXzLxCmsGBXSP18k6TVO10ERbdX3JlGv1qUXP2ndJirIzGuFgQcF
         QlIwJve2RB4rGLvBFa3y+B6JUh79XPA1cdHqgHUMsjSX7q0X7YijuDwJ65I9YxvqJC8O
         NUx2yp2JKDu1BTkyC1yjdwycfpjyA2/qNIqOgBYGsIovPAQzCEhZl+seUctMwShAAaQW
         spNflFzHhMjNW5cB5awZYsmBv7/H9tnzeTs1q2XdN0x+4enNuk+a5BBw4Mi04Qw6Ujc2
         AiQihHIWBDGuWPAu4sIPBt2KEy8PpWMzqT5KcZ2ECNEYsYW1LGLwJV5bp5rJSlAQ+SvW
         p4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776060; x=1796380860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8TYyQ8IZ5ABioVXSDrXTDtdF2LkWCuPyKGqXG+cDgQ=;
        b=Pj5o+XENMW4uGbizw8dJxpabuD6yRsqXLIcbIx9V6jc4UABTVLCtMZbLmS4moMRlNt
         Jh2I+X5xPkA/mCCWjhjsdVHp6If+4QeMUA3mXmNZ+6PRCw/aPd9X/rMFYKJFImcQCTF6
         3Gjr7R/huHB/0mmIcam3nX6uHwwpbCpUnaBaX1596rVDU85zG4TSGBq8ad1ZvYgygC68
         wRUGfEtdE/mSeRhJ3WmgwnnMdZmsIKIorUPRFl8v8Kv/XL0mFJKYRYwGQZ4szS1DODoy
         E4+TFc0RfsHB0d+dzkj/jAArm+XybvH3MtmwfEmabqpoTJvDnwMpUriZyR4/82iAl/6o
         vHoQ==
X-Forwarded-Encrypted: i=1; AL+hErFx3nmA0fsVpRrymyIdyHma+tXqxsN7LUAlYhf0slqtoZvfJGXHVQAIQryL3NqzuS1ufUq2AhB03Rl+6LCVBgOb@lists.infradead.org
X-Gm-Message-State: APuU4Z9EhBrBNHXZ82+M8A+fC40gL9UGppWNxex1CbqJDesTqm7a2Zeb
	P9jeIw1yQo5BJkeJ7Tugk0lID9u2ZCVdb3ZWYvSr3BEY/K22hUifoskdf+35zYhYCgDzp69RBVZ
	R3QxeyeY=
X-Gm-Gg: AZFdTZdVDM+YpXlfYa3qEN7uRwSBUozjq4fyaAxR8CkMIl0+dWXCpyd5e0vEq831Dbs
	glu1/ZvBkLIIhkrqqiwHr1KhABVc4hZp87sCq2v65OC80OZ6FHBGmgb+Yhj7d+Owp6mj+hPWhoY
	dqx9YdIQMHxF3OIhcObYbguf0jywuK2AHBw0OUdj/aZQTio7R9wBSC//h8U4GcQY6TAdakGCVEf
	rPJ6X0fAL8fcxB2aTJY9VRb/ZkRQfMIaN/LQmNvRUF/YKr1YuthZoniSBkMjUjD1HhNWMXTTgR8
	PmBbEgib7jZLrZfF1XfCxFF6SmgHqXCB0xAJAR5GIK7tsi0eakDzWGN93bl6727IeTivIpJlBpU
	99F0tFOJvRQIHwJ/cX9GZc6BX22A9rEyziRPGdPtL+KMA4eO0NtLw2p4bbADESOBeekZZxrUWIK
	Df635Zjf/NH22lB6z7rLK/Xw5h8t5vryHfP2TC6hGbGHnnqhD7LkzxhsQ038CyvL2ICvYJJilv6
	3sj/jtepuBKRgeeBCFKr5Y49sDc/llCZ324/e/xSwiYrmixZnm8dLAIlnEEs8CaBk5JOWibTpjd
	AuH77rlfjg7J7kUPfod/MWKv3gDCK0xJTEYXyZRZhBb0GPiG0zlASvqS0vMzdtZepjiXYTpQA8r
	WaN/edM62
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr46938763f8f.56.1795776060437;
        Fri, 27 Nov 2026 02:41:00 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:00 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:47 +0400
Subject: [PATCH v2 2/6] usb: typec: fusb302: Drain the RX FIFO on each PD
 interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-2-6770eb1e7945@flipper.net>
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
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10121; i=alchark@flipper.net;
 h=from:subject:message-id; bh=UqBeANwy5ETx7pp5dtffrbDTydhjRY8QXErFfQqNfPc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpn9cJu0pia/0UZB7s+3lTrN5g15qumeydIm+XbKj
 VI7Xes6JrIwiHExWIopssz9tsR2qhHfrF0eHl9h5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOq8D4wMZ/X2+S+LOc7+76RMaqdez86SHe9Y377blPikevnbO3pbexn+R05eei+
 67dmjn49KPmlsZ1ng+meT/jXzmK+bokT0ehsKmQE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024102_227082_97BD7FBF 
X-CRM114-Status: GOOD (  35.91  )
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

The driver reads one message from the RX FIFO per GCRCSENT or TX_SUCCESS
interrupt, assuming every queued message raises one. The chip, however,
queues some messages without acknowledging them or raising any interrupt,
e.g. it decodes only the low four bits of the message type and mistakes
Get_Source_Cap_Extended (0x11) for a GoodCRC (0x1). From then on every read
returns the message queued before the one that raised the interrupt, so
replies answer the wrong message and a Soft_Reset is never seen. The
partner escalates to a Hard Reset, which an Apple Studio Display repeats
every 1.5s.

Furthermore, two different messages received in quick succession may be
queued without raising separate interrupts, causing all subsequent PD
communications to be permanently out of sync, which usually also leads to
a hard reset eventually.

Read messages until the FIFO reports empty, so that each one is handled on
the event it arrived with, whatever the chip left unannounced before it.

Draining reads past the message that raised the interrupt, though, and may
reach one still coming in: STATUS1.RX_EMPTY clears as soon as the token of
a packet lands in the RX FIFO, with the rest of the packet still on CC,
whereas the driver reads a whole message in one go once it has the header.
Reading ahead of the bytes still to come returns 0x00 for each, as
measured on the FUSB302B of a Flipper One, and those bytes then land with
no token in front, so the message is lost although the chip acknowledges
it. A partner's retry of a message whose GoodCRC it missed, about 1ms
after the first attempt, is one such packet.

So wait for STATUS0.ACTIVITY to clear before reading each message,
reading STATUS1 along with it at the cost of the one register read. With
CC idle, the FIFO only holds packets received in full, and anything new
lands behind them: on the same chip, the token of a packet lands at least
250us after ACTIVITY rises. Once CC is idle and the FIFO is empty, no new
message can appear until the next transaction, so pass all fully validated
messages on to TCPM and discard whatever incomplete remains which might
trail them, because with nothing on CC they will never be completed. If CC
stays busy, look at the FIFO again shortly after so as not to miss a
packet which might not raise GCRCSENT.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 156 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index d2d0e8ffc308..d57f9ae6621d 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -97,6 +97,9 @@ struct fusb302_chip {
 
 	struct workqueue_struct *wq;
 	struct delayed_work bc_lvl_handler;
+	struct delayed_work rx_recheck;
+	/* Rechecks since the FIFO was last seen empty */
+	unsigned int rx_rechecks;
 
 	/* lock for sharing chip states */
 	struct mutex lock;
@@ -128,6 +131,8 @@ struct fusb302_chip {
 	 * Look for its start first before processing.
 	 */
 	bool rx_resync;
+	/* Only look in rx_buf, as the FIFO has nothing more of what it holds */
+	bool rx_buf_only;
 	bool vbus_present;
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
@@ -1574,6 +1579,8 @@ static int fusb302_pd_rx_read(struct fusb302_chip *chip, int n)
 	u8 status1;
 	int ret;
 
+	if (chip->rx_buf_only)
+		return 0;
 	if (chip->rx_resync) {
 		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1);
 		if (ret < 0)
@@ -1693,6 +1700,141 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 	return ret;
 }
 
+/* The 80-byte RX FIFO holds at most 11 messages without data objects */
+#define FUSB302_RX_FIFO_MAX_MSGS	11
+
+/* The longest packet with the GoodCRC to it, and then some */
+#define FUSB302_CC_BUSY_MAX_US		2000
+
+/*
+ * Wait for CC to go quiet, reading STATUS1 along with STATUS0. Return 0 once
+ * it has, 1 if it stays busy, or a negative error code.
+ */
+static int fusb302_wait_cc_idle(struct fusb302_chip *chip, u8 *status1)
+{
+	ktime_t start = ktime_get();
+	u8 status[2];
+	int ret;
+
+	for (;;) {
+		ret = fusb302_i2c_block_read(chip, FUSB_REG_STATUS0, 2, status);
+		if (ret < 0)
+			return ret;
+		if (!(status[0] & FUSB_REG_STATUS0_ACTIVITY))
+			break;
+		if (ktime_us_delta(ktime_get(), start) > FUSB302_CC_BUSY_MAX_US)
+			return 1;
+		/* Leave the I2C bus to others meanwhile */
+		usleep_range(100, 200);
+	}
+	*status1 = status[1];
+
+	return 0;
+}
+
+/*
+ * Read in and handle every message in the RX FIFO. Return 0 once it is empty,
+ * 1 if it may not be, as CC stayed busy or more messages came in meanwhile than
+ * the FIFO holds, or a negative error code.
+ */
+static int fusb302_pd_read_messages(struct fusb302_chip *chip)
+{
+	u8 status1;
+	int ret;
+	int i;
+
+	/*
+	 * Drain the whole RX FIFO rather than one message per interrupt:
+	 * messages the chip does not acknowledge raise no GCRCSENT, and
+	 * reading one message per event would then leave every later read
+	 * returning the message queued before the one that raised it.
+	 */
+	for (i = 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
+		/*
+		 * Wait for CC to go idle to ensure the FIFO only holds packets
+		 * received in full. Otherwise we may eat up the token opening
+		 * the next packet, which is still on the wire now.
+		 */
+		ret = fusb302_wait_cc_idle(chip, &status1);
+		if (ret) {
+			if (ret > 0)
+				fusb302_log(chip, "CC busy, RX FIFO left for later");
+			return ret;
+		}
+		if (status1 & FUSB_REG_STATUS1_RX_EMPTY) {
+			/*
+			 * Nothing more will come: pass on any message still
+			 * held in full, then drop what is left of another.
+			 * Read no further, as what lands in the FIFO from now
+			 * on starts a packet that is still on CC.
+			 */
+			chip->rx_buf_only = true;
+			while (chip->rx_len) {
+				chip->rx_resync = true;
+				ret = fusb302_pd_read_message(chip);
+				if (ret <= 0)
+					break;
+			}
+			chip->rx_buf_only = false;
+			if (ret < 0)
+				return ret;
+			if (chip->rx_len)
+				fusb302_log(chip, "dropped %d bytes from the RX FIFO",
+					    chip->rx_len);
+			fusb302_pd_rx_reset(chip, false);
+			return 0;
+		}
+		ret = fusb302_pd_read_message(chip);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+/* About 200ms of CC staying busy, longer than any PD traffic but noise */
+#define FUSB302_CC_BUSY_RECHECKS	50
+
+/*
+ * Drain the RX FIFO, and if it may not be empty, look again shortly after: a
+ * packet the chip does not acknowledge raises no interrupt for it to be read
+ * on. Leave CC that stays busy for longer to the next interrupt, rather than
+ * keep the I2C bus and chip->lock busy with it.
+ */
+static int fusb302_pd_rx_drain(struct fusb302_chip *chip)
+{
+	int ret;
+
+	ret = fusb302_pd_read_messages(chip);
+	if (ret <= 0) {
+		chip->rx_rechecks = 0;
+		return ret;
+	}
+	if (chip->rx_rechecks++ < FUSB302_CC_BUSY_RECHECKS)
+		mod_delayed_work(chip->wq, &chip->rx_recheck,
+				 usecs_to_jiffies(FUSB302_CC_BUSY_MAX_US));
+	else
+		fusb302_log(chip, "CC stays busy, RX FIFO left for the next interrupt");
+
+	return 0;
+}
+
+static void fusb302_pd_rx_recheck_work(struct work_struct *work)
+{
+	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
+						 rx_recheck.work);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	if (chip->pd_rx_on) {
+		ret = fusb302_pd_rx_drain(chip);
+		if (ret < 0)
+			fusb302_log(chip, "cannot read in PD message, ret=%d",
+				    ret);
+	}
+	mutex_unlock(&chip->lock);
+}
+
 static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 {
 	struct fusb302_chip *chip = dev_id;
@@ -1849,7 +1991,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
 		fusb302_log(chip, "IRQ: PD tx success");
-		ret = fusb302_pd_read_message(chip);
+		ret = fusb302_pd_rx_drain(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);
@@ -1869,7 +2011,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
 		fusb302_log(chip, "IRQ: PD sent good CRC");
-		ret = fusb302_pd_read_message(chip);
+		ret = fusb302_pd_rx_drain(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);
@@ -1979,6 +2121,7 @@ static int fusb302_probe(struct i2c_client *client)
 	spin_lock_init(&chip->irq_lock);
 	INIT_WORK(&chip->irq_work, fusb302_irq_work);
 	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
+	INIT_DELAYED_WORK(&chip->rx_recheck, fusb302_pd_rx_recheck_work);
 	init_tcpc_dev(&chip->tcpc_dev);
 	fusb302_debugfs_init(chip);
 
@@ -2045,6 +2188,7 @@ static void fusb302_remove(struct i2c_client *client)
 	free_irq(chip->gpio_int_n_irq, chip);
 	cancel_work_sync(&chip->irq_work);
 	cancel_delayed_work_sync(&chip->bc_lvl_handler);
+	cancel_delayed_work_sync(&chip->rx_recheck);
 	tcpm_unregister_port(chip->tcpm_port);
 	fwnode_handle_put(chip->tcpc_dev.fwnode);
 	destroy_workqueue(chip->wq);
@@ -2062,6 +2206,8 @@ static int fusb302_pm_suspend(struct device *dev)
 
 	/* Make sure any pending irq_work is finished before the bus suspends */
 	flush_work(&chip->irq_work);
+	/* No RX FIFO recheck may run until the bus is back either */
+	cancel_delayed_work_sync(&chip->rx_recheck);
 	return 0;
 }
 
@@ -2078,6 +2224,12 @@ static int fusb302_pm_resume(struct device *dev)
 	chip->irq_suspended = false;
 	spin_unlock_irqrestore(&chip->irq_lock, flags);
 
+	/* Look at the RX FIFO again, in case suspend cut a recheck short */
+	mutex_lock(&chip->lock);
+	if (chip->pd_rx_on)
+		mod_delayed_work(chip->wq, &chip->rx_recheck, 0);
+	mutex_unlock(&chip->lock);
+
 	return 0;
 }
 

-- 
2.56.0


