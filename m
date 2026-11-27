Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/OiLxjn;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=l4NzTcWb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVvljxRJFWTX1Of7BMq7tBbEcyKcnjbgUy5aROkMRo4=; b=d/OiLxjn2narAN
	P9hvvZH7ExpkiGvBWR9VlYdkl0wtUYl9ZmDJ4/Q1GAUVjRJ1BxdsSwv0lM/K4I3IBfXc8PW5cMRfT
	nmvZGVRa4Qzn8oSoTFpbh6EEJFaiiTXnGDzxi9FiecuC71CJANULNenplaPIbji5Gq6xAehmTPjsS
	BVShkK1xuTVAUGu1Bc+9cU5oS2lza7P2dw7T9Ulg1it6saAwoot/l1jWz3Y0jA3iRaN/l3LPcJFAw
	LntWGo2V1j9i4WbRROo0LYDUTRETzOG/loklQqjZFmmd/pQDPsKk1rnZf0CPKmVtBSFULtKBIBSlR
	LQhn7G2JnVg5ghpt2L4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtO9-0000000Fdep-3qB6;
	Fri, 27 Nov 2026 10:41:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNz-0000000FdWI-3XfZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:41:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-49412eb1474so5223367f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776058; x=1796380858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVvljxRJFWTX1Of7BMq7tBbEcyKcnjbgUy5aROkMRo4=;
        b=l4NzTcWbV+yutZhLV0shBzUpmLEYn/4qszDT5DVKOTQg8GRDd6JJ9XV2VhLQuOhY6q
         YYG9rugT1sX0vg3FMvjKVhUOl4XxXGoCga61fSok6xV/hplKICqXSXzJLPDrmdx5QTjm
         q6kcVFPGS+0cYpw+5YbQ6XHGb1DPIyUQeCZhM5hWRRMkyEYHHzjI5ymJ+0KsGfpLswnm
         0DRTajMTBjEpjz2UX9f35NOyDKg4avofbhHpWW4msgnrt8EcwQzfZOvjD2Cp94Dd/Ywl
         KQfCQh11iipDusijwSvMNYOtRh4rfX3Co6A3mP9DLzAzW52PFnSLGLI0Ni+a37m6zKVV
         U1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776058; x=1796380858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVvljxRJFWTX1Of7BMq7tBbEcyKcnjbgUy5aROkMRo4=;
        b=mRiq+LIJ8eLGxE/+RCTCYY2Zu2WFE0dUODnDRUG85kfG3fszX0h9Sj64kkta7Ixw2b
         qQVGdGfqjxeU7nw0IXlQFi/BeJGPYKeWDRcneF1jV3BdDxHoKWmHAOty11fyQ/79XAGZ
         C/8qwexY8FnT6+vPtsyZM+6xTFRmqfT2C3BjV54OfMC92JrInGNhThxd4Pz3fVsjhy0V
         rS5ifleocRLAk/x6UPvJqoSUv0bM6lDvZ7Ml30jWmw7oKC5xAX8B9KasVEXGqYV2SX3J
         kags/DPF6by/RgL+B0y6vpRrg9gEVydqjV05Iyc6EJ+qc5CquYoSHf8YOHQvc/dhjN1G
         ZUQg==
X-Forwarded-Encrypted: i=1; AL+hErEgQwUiDz0a3y4+gM4+6/YDhN2tGGFSznQ/uqFf3HLTWm+YAbxMima3WvZsDVdnnOW4dZEBTzcpujPug4pS/ekn@lists.infradead.org
X-Gm-Message-State: APuU4Z8sU7Bf7MjRECHh/P7Kxuza1yFJeMSTpzz7bUZTJIO1yOfLzrTJ
	2/tGonKcTpIJZ7smPSUtjw3VGT021Kj9WEmsefks4XbaZBMVgnTG7trexRwQdrtEKAM=
X-Gm-Gg: AZFdTZcTZIq1MRPCeEj967kVR3TeiV12PvxjbLUPMcxEekiNnC2BQcOk6TCFKP9u5/T
	nTanFSF0pqWicndaS8IIWIigte/dwfIsU97EmdGUDT6u/fan5LA+2H0gWqsdXtGpU/GhESESBkk
	XV7je5auCYdqHRJM3BVi6xTtcbA3utGn9jftZsYfsQwW1jWiDlFFBWJq9sA7YDmdkkBrtMfvk9J
	LG2VRW3yWZyG8gLJpRLnGmzqYlFQjvFQ1bbFKIJztG5/z0gIFL0hSKEN2CF4RRhs+37AgIM7Wuc
	i5fr6VnNLTT0NSSjsG2pg9dcoS70HUrWp9W3oWTcbWkd1lrPW/jzsMzweXJdrd39ABNrsu0nBb7
	5RtLZmcCf20fR8FKkHMiqhlKk4NbErwz7Z/4SdTRIFbdK31PPjp3wSWYJCYwnf3tpdSh+QE7aeJ
	Ae2ZuqvbnZ6L1TNiDMsGZIC0mmKeIe3PZjm19ZA8krwMpUhd0PYtHavnJTja4hxx7fITi30gFIz
	X45UR68Z4NegarZoIMC5DAxXlERZ2fPf4TDePQPGvKa1x+0sro9BAfuUT33EracBxSYZkNHTQ/d
	us7plle1QRvS1kh97/0FL6z4gHouxhJS0XkUE3LQrZoWsTp8QsKYD7OElzxet/959fHrkyGmzBL
	yN/zM8pdeDA==
X-Received: by 2002:a05:6000:4a0e:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-4abb7971c1dmr45358032f8f.51.1795776057820;
        Fri, 27 Nov 2026 02:40:57 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:57 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:46 +0400
Subject: [PATCH v2 1/6] usb: typec: fusb302: Find the next message when the
 RX FIFO is out of step
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-1-6770eb1e7945@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12171; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8FqjcSdoBj2gZZl7Z82yfPvjmeuPF0tJnGWe6Lh9qE4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpmplHa/uesk9uD8s3p2tRmcFq21yQ3fZhWfvvhZ6
 0LN6hsnOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqLE1Ghs8e2yQ3PtZtn/Hk71nzVTJPrYwup3NPnfaH3/5uAqefvDLD/+LHE95
 IME04enFCzI29zwu0pu1I/ZawbpPyXDvGGn7XXfwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024059_967400_4F272295 
X-CRM114-Status: GOOD (  37.03  )
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

The chip writes each byte into the RX FIFO as it comes off CC, so a
flush in the middle of a packet leaves the rest of that packet in the
FIFO with no token in front, and the driver reads that tail, padded with
zeros where the FIFO runs dry, as a message. TCPM acts on the junk
header. On a Flipper One attaching as a sink, the flush that turns PD RX
on raced the partner's first message in 2 of about 35 attaches: a
"message" with header 0 made TCPM see a data role mismatch and go to
ERROR_RECOVERY. With the FIFO flushed on purpose 27 times while the
partner sent a Ping every 20ms, 98 junk messages reached TCPM, and it
reset 17 times.

Flushing the FIFO again once the junk is spotted is no cure, as any
message behind the tail may have been acknowledged already, and the
partner never sends it again.

Keep the bytes read from the FIFO in a buffer instead, and scan for a full
valid message, including a CRC that checks out, to avoid interpreting junk
bytes as a start of a message.

In the same test, no junk reaches TCPM now, and only the Pings that the
forced flushes cut short go missing.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/Kconfig   |   1 +
 drivers/usb/typec/tcpm/fusb302.c | 222 +++++++++++++++++++++++++++++++++------
 2 files changed, 190 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 00baa7503d45..e551cb63a775 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -59,6 +59,7 @@ config TYPEC_FUSB302
 	depends on I2C
 	depends on EXTCON || !EXTCON
 	depends on DRM || DRM=n
+	select CRC32
 	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  The Fairchild FUSB302 Type-C chip driver that works with
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 1cbe272ad686..d2d0e8ffc308 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -6,6 +6,7 @@
  */
 
 #include <drm/bridge/aux-bridge.h>
+#include <linux/crc32.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -27,6 +28,7 @@
 #include <linux/string.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/tcpm.h>
@@ -72,6 +74,11 @@ static const u8 rd_mda_value[] = {
 #define LOG_BUFFER_ENTRIES	1024
 #define LOG_BUFFER_ENTRY_SIZE	128
 
+/* An SOP* token, the header, up to seven data objects and the CRC */
+#define FUSB302_RX_MSG_MAX	(1 + 2 + PD_MAX_PAYLOAD * 4 + 4)
+/* The size of the RX FIFO */
+#define FUSB302_RX_FIFO_LEN	80
+
 struct fusb302_chip {
 	struct device *dev;
 	struct i2c_client *i2c_client;
@@ -110,6 +117,17 @@ struct fusb302_chip {
 	bool vbus_on;
 	bool charge_on;
 	bool pd_rx_on;
+	/*
+	 * Bytes read from the RX FIFO but not handled yet: the start of a
+	 * message to read on, or bytes to find the next message in
+	 */
+	u8 rx_buf[FUSB302_RX_MSG_MAX];
+	u8 rx_len;
+	/*
+	 * The next message may not be at the start of the buffer.
+	 * Look for its start first before processing.
+	 */
+	bool rx_resync;
 	bool vbus_present;
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
@@ -831,6 +849,17 @@ static int fusb302_pd_rx_flush(struct fusb302_chip *chip)
 				    FUSB_REG_CONTROL1_RX_FLUSH);
 }
 
+/*
+ * Forget whatever was read from the RX FIFO but not handled yet. After a flush
+ * or a reset, the FIFO may go on with the rest of a packet cut short, so look
+ * for the next message then, rather than read on from the first byte.
+ */
+static void fusb302_pd_rx_reset(struct fusb302_chip *chip, bool cut_short)
+{
+	chip->rx_len = 0;
+	chip->rx_resync = cut_short;
+}
+
 static int fusb302_pd_set_auto_goodcrc(struct fusb302_chip *chip, bool on)
 {
 	if (on)
@@ -885,6 +914,7 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 		fusb302_log(chip, "cannot flush pd rx buffer, ret=%d", ret);
 		goto done;
 	}
+	fusb302_pd_rx_reset(chip, true);
 	ret = fusb302_pd_tx_flush(chip);
 	if (ret < 0) {
 		fusb302_log(chip, "cannot flush pd tx buffer, ret=%d", ret);
@@ -1477,43 +1507,168 @@ static int fusb302_handle_togdone(struct fusb302_chip *chip)
 
 static int fusb302_pd_reset(struct fusb302_chip *chip)
 {
+	/* What was read of a message before the reset is of no use after it */
+	fusb302_pd_rx_reset(chip, true);
+
 	return fusb302_i2c_set_bits(chip, FUSB_REG_RESET,
 				    FUSB_REG_RESET_PD_RESET);
 }
 
-static int fusb302_pd_read_message(struct fusb302_chip *chip,
-				   struct pd_message *msg)
+static void fusb302_pd_rx_drop(struct fusb302_chip *chip, int n)
 {
-	int ret = 0;
-	u8 token;
-	u8 crc[4];
-	int len;
+	chip->rx_len -= n;
+	memmove(chip->rx_buf, chip->rx_buf + n, chip->rx_len);
+}
 
-	/* first SOP token */
-	ret = fusb302_i2c_read(chip, FUSB_REG_FIFOS, &token);
-	if (ret < 0)
-		return ret;
-	ret = fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, 2,
-				     (u8 *)&msg->header);
-	if (ret < 0)
-		return ret;
-	len = pd_header_cnt_le(msg->header) * 4;
-	/* add 4 to length to include the CRC */
-	if (len > PD_MAX_PAYLOAD * 4) {
-		fusb302_log(chip, "PD message too long %d", len);
-		return -EINVAL;
+static bool fusb302_pd_rx_is_token(u8 byte)
+{
+	byte &= FUSB302_RX_TKN_MASK;
+
+	return byte == FUSB302_RX_TKN_SOP || byte == FUSB302_RX_TKN_SOP1;
+}
+
+/* FIFO bytes taken by the message whose token is at rx_buf[off] */
+static int fusb302_pd_rx_msg_len(struct fusb302_chip *chip, int off)
+{
+	u16 header = get_unaligned_le16(chip->rx_buf + off + 1);
+
+	return 1 + 2 + pd_header_cnt(header) * 4 + 4;
+}
+
+/* The chip keeps the CRC it received after the header and data objects */
+static bool fusb302_pd_rx_crc_ok(struct fusb302_chip *chip, int off, int len)
+{
+	return ~crc32_le(~0U, chip->rx_buf + off + 1, len - 5) ==
+	       get_unaligned_le32(chip->rx_buf + off + len - 4);
+}
+
+/*
+ * Return the offset of the first message past the start of rx_buf that it
+ * holds in full, with its CRC checking out, or 0 if there is none
+ */
+static int fusb302_pd_rx_find(struct fusb302_chip *chip)
+{
+	int off, len;
+
+	for (off = 1; off + 3 <= chip->rx_len; off++) {
+		if (!fusb302_pd_rx_is_token(chip->rx_buf[off]))
+			continue;
+		len = fusb302_pd_rx_msg_len(chip, off);
+		if (off + len <= chip->rx_len &&
+		    fusb302_pd_rx_crc_ok(chip, off, len))
+			return off;
 	}
-	if (len > 0) {
-		ret = fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, len,
-					     (u8 *)msg->payload);
+
+	return 0;
+}
+
+/*
+ * Read up to n more bytes into rx_buf and return how many. When the FIFO is in
+ * step, rx_buf starts with a message the chip has received in full, so read the
+ * rest in one go. Otherwise read one byte at a time while the FIFO holds data,
+ * as a dried out FIFO starts returning zeros instead of received data, and real
+ * bytes will be returned to the next read instead once the device receives them
+ */
+static int fusb302_pd_rx_read(struct fusb302_chip *chip, int n)
+{
+	u8 status1;
+	int ret;
+
+	if (chip->rx_resync) {
+		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1);
 		if (ret < 0)
 			return ret;
+		if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
+			return 0;
+		n = 1;
 	}
-	/* another 4 bytes to read CRC out */
-	ret = fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, 4, crc);
-	if (ret < 0)
+	ret = fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, n,
+				     chip->rx_buf + chip->rx_len);
+	if (ret < 0) {
+		/* Some of it may have left the FIFO all the same */
+		chip->rx_resync = true;
 		return ret;
-	fusb302_log(chip, "PD message header: %x", msg->header);
+	}
+	chip->rx_len += n;
+
+	return n;
+}
+
+/*
+ * Read in and handle the next message in the RX FIFO. Return 1 if there was
+ * one, 0 if the FIFO ran out first, or a negative error code.
+ */
+static int fusb302_pd_read_message(struct fusb302_chip *chip)
+{
+	struct pd_message msg = {};
+	int dropped = 0;
+	int len, off, ret;
+	u8 token;
+
+	for (;;) {
+		/*
+		 * Already discarded a full FIFO's worth of junk - leave
+		 * whatever remains to another pass
+		 */
+		if (dropped >= FUSB302_RX_FIFO_LEN) {
+			ret = 0;
+			goto out;
+		}
+		/*
+		 * The chip writes each byte into the FIFO as it comes off CC,
+		 * so a flush in the middle of a packet leaves the rest of it
+		 * there with no token in front. Following bytes may look like a
+		 * valid token without being one, so only trust them if the CRC
+		 * of the resulting message checks out, too. If not, look on
+		 * from the next byte: there may be a next message that the chip
+		 * has already acknowledged, and we must not miss it.
+		 */
+		while (chip->rx_len &&
+		       !fusb302_pd_rx_is_token(chip->rx_buf[0])) {
+			chip->rx_resync = true;
+			fusb302_pd_rx_drop(chip, 1);
+			dropped++;
+		}
+		if (chip->rx_len < 3)
+			len = 3;
+		else
+			len = fusb302_pd_rx_msg_len(chip, 0);
+		if (chip->rx_len < len) {
+			ret = fusb302_pd_rx_read(chip, len - chip->rx_len);
+			if (ret < 0)
+				goto out;
+			if (ret)
+				continue;
+			/*
+			 * The FIFO ran dry, which may be due to a bogus token
+			 * claiming more bytes than will ever come. See if the
+			 * following bytes contain a complete valid message.
+			 */
+			off = fusb302_pd_rx_find(chip);
+			if (!off)
+				goto out;
+			fusb302_pd_rx_drop(chip, off);
+			dropped += off;
+			continue;
+		}
+		if (fusb302_pd_rx_crc_ok(chip, 0, len))
+			break;
+		if (!chip->rx_resync)
+			fusb302_log(chip, "PD message failed CRC check, header: %x",
+				    get_unaligned_le16(chip->rx_buf + 1));
+		chip->rx_resync = true;
+		fusb302_pd_rx_drop(chip, 1);
+		dropped++;
+	}
+
+	chip->rx_resync = false;
+	token = chip->rx_buf[0];
+	memcpy(&msg, chip->rx_buf + 1, len - 5);
+	fusb302_pd_rx_drop(chip, len);
+	len -= 7;
+	ret = 1;
+
+	fusb302_log(chip, "PD message header: %x", msg.header);
 	fusb302_log(chip, "PD message len: %d", len);
 
 	/*
@@ -1526,13 +1681,15 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	 * TX_SUCCESS and GCRCSENT events out of order on occasion, so we need
 	 * to check the message type to ensure correct reporting to TCPM.
 	 */
-	if ((!len) && (pd_header_type_le(msg->header) == PD_CTRL_GOOD_CRC))
+	if (!len && pd_header_type_le(msg.header) == PD_CTRL_GOOD_CRC)
 		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
 	else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
-		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP_PRIME);
+		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP_PRIME);
 	else
-		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
-
+		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP);
+out:
+	if (dropped)
+		fusb302_log(chip, "dropped %d bytes from the RX FIFO", dropped);
 	return ret;
 }
 
@@ -1605,7 +1762,6 @@ static void fusb302_irq_work(struct work_struct *work)
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
-	struct pd_message pd_msg;
 
 	mutex_lock(&chip->lock);
 	/* grab a snapshot of intr flags */
@@ -1693,7 +1849,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
 		fusb302_log(chip, "IRQ: PD tx success");
-		ret = fusb302_pd_read_message(chip, &pd_msg);
+		ret = fusb302_pd_read_message(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);
@@ -1713,7 +1869,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
 		fusb302_log(chip, "IRQ: PD sent good CRC");
-		ret = fusb302_pd_read_message(chip, &pd_msg);
+		ret = fusb302_pd_read_message(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);

-- 
2.56.0


