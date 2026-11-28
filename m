Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6GV+yAh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+Kcu4y4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=; b=D6GV+yAhnMvUJxFrHyRGnbgQU7
	/bvQNwEGz997egwiEWMOPwK9NOmIJ9uxd1Y/EvYZPWAqRP/9dEjLrt1zcmxu23nc9H2cb24RaIwlD
	J2ohGfr18duRtu1EuIG2F4h2XI0XEgGtTrI5BV2Nr74/nZWeyzU51SLbySfuM9zbW8/LzAg5nl4XZ
	KfIsN7kZ58Z5DvjEGbiyLi2wGFRCQZdY26DBb72eSNlQqMzjdlJOP15s3gRy2CAZoO5QRfIsAR4DF
	DPlZABjOK4c2A8vw9jYq9ygdXlGi+PIfDZ1ojHVjvfFi7Z7dizY+mVxa9RginDGp/4yBJfrulA+qB
	CK+pVdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHVQ-00000000kVh-0WI9;
	Sat, 28 Nov 2026 12:26:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHVN-00000000kUz-0qN8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 12:26:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso82741875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868771; x=1796473571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=S+Kcu4y4KCqCCmgIeCItuxc6YV17Lbkn7r0rf/WhIu5v8mDUdydIeDQive5kUuoF9W
         s8Y+RlLqVesoIdm83o6fGat/rVBOaQ/i+aJm9b14cBET0AQ30fiV7XtNvy5F0XHcJm9W
         wh8g9qdZuuXIv1WaEJEeRav/QyOgmtCCDhLmZFxAy1POTl628cJHduqOmMK7MIjz1XBT
         6rcp1q2aekjWhMBOD70wWr1Ru134xgIac9StahPxWP6eFoQz2GFVaFwJ70BHOi0AZahs
         1Bt3KjQlWel4IaF7JDdI0K1NXlGTmtpN3gpJSV2a4zKmNB9wylmJt36OaEkpqvdPpIN2
         PkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868771; x=1796473571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=qUm9/JOWfmfsAcqNTnrns9BH/7/YAnVk3msXgn0QnuMeXtvVIUOPyfbDcDmFFCF7MA
         ucggZKe00F3e+xiw49J1idMUcR/9brn1Q4YpCeAkXQV2jZJDvevuNu1CHHg8vuorbTtH
         X2kawTXexHDe1mcUn8XkOx61dy41234NwfG38RkfWCzLsto6L0Dn0uJQtZh8msQK7mXr
         JnXRX8RcwwKdjz5N5Ue9ISKW/s9SWNnRRStlLimWe7QrxVfKySI8MieJ59/4OxBgSjH+
         foUkFA8an5H3dSCMJtAUJNlcSN7NPe5qcUtu4NNwdZPp/huxg43HU3Sz/Q3DJjEVchzH
         iatw==
X-Forwarded-Encrypted: i=1; AL+hErEhgukHn2T6XMUs+VDrQoCziQuRCgx9rLZ3rcJLbmsgRsIIAoUbuoJ0FYrZTPsdZAacVuplvODLfflWcDjADm9M@lists.infradead.org
X-Gm-Message-State: APuU4Z//65o/MYII1qIiMf+0bO+HuegEEod072g7JgYCQ2sPwKDoGizo
	f6vauOokGsiysXTBAfXxi5h0g8umT9g3hQD+NGIAFy5oPyEArgQfaNaN
X-Gm-Gg: AZFdTZduGzKRP9T8t0U4v6nw+KQbpUuc51n38AyrhTh4XBRk32atYoSCsAH6DKDEe+w
	Gz6i039d8Lls4HbbSrHErikIGkb9GJ4alxXg1mYWDgwIGJmpJss77+HW/wI884JCq/Ouv/XX6pe
	4XheHgTOuYQyPgrwV/K9niqzp2AcBDJED871jXGtSUoYRmPMz4VOiN4xtFEb45ztt0L8om/xzB2
	ChZJbb5x3jRtkhRkXHRCDyVpT88VkQ1KIRu+Wqj11d7hVJmcWU96ZM8B7JjXcxjIbzgfnxGtpvZ
	yvV5s5Z/xbCWE77kwCjCQ7k771I8qiQtK9vkXwK/hufPz1WgeBnBp1kCc9f10r4Xvq6PNoXVJYC
	XkIWITHZunTZWC+wtxu1+dyArlbrSPKzxrsj5ogEZtwmNMaaVK95DPawceSpGgjqNdDQrnvZQ18
	sgtBDtnjo/EGUvZ/2k9ZzXLwQoeMbxbd8KaYp237Y+rp+P9TwlOWpeH1duqIxhabXRQyQBV6i8q
	U8WW1pzm82nr0vAMP9+9LJhYWaXW8qCQl23UjfidRepM03lwGetf/+n/9a2fs6Z7rc6d+NASQcI
	ZkSv0OPOZ9vNjYrv/JV7oO6/I/wPeFSpPQWiwrPqUFiQYFFWGQ4EZDCsCPqluBKG/E50Qmk3tQ=
	=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr553027325e9.0.1795868770988;
        Sat, 28 Nov 2026 04:26:10 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-112-86.web.vodafone.de. [109.41.112.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm502815995e9.2.2026.11.28.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:26:09 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: do not mask negative MCU command ids
Date: Sat, 28 Nov 2026 13:25:41 +0100
Message-ID: <20261128122541.6670-1-scherbaoleg4@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_042613_261928_44D5B89C 
X-CRM114-Status: GOOD (  13.56  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
clears BIT(30) of every command id before it reaches the driver. mt7603
sends its legacy commands as negative ids, and a small negative int has
bit 30 set by its sign. Clearing it turns -MCU_CMD_FW_SCATTER (0xffffff12)
into 0xbfffff12, so mt7603_mcu_skb_send_msg() no longer matches it and
queues the firmware image to MCU_PORT_QUEUE instead of MCU_PORT_QUEUE_FW.
The firmware never starts and probe fails:

  mt76_wmac 10300000.wmac: Timeout waiting for firmware to initialize
  mt76_wmac 10300000.wmac: probe with driver mt76_wmac failed with error -5

Only handle the READ flag of non-negative command ids.

Fixes: 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 4f3471b..4dc287e 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -59,7 +59,7 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 	struct sk_buff *skb;
 
 	if (dev->mcu_ops->mcu_send_msg)
-		return dev->mcu_ops->mcu_send_msg(dev, cmd & ~MT76_MCU_CMD_READ,
+		return dev->mcu_ops->mcu_send_msg(dev, mt76_mcu_cmd_strip(cmd),
 						  data, len, wait_resp);
 
 	skb = mt76_mcu_msg_alloc(dev, data, len);
@@ -74,14 +74,14 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 				  int cmd, bool wait_resp,
 				  struct sk_buff **ret_skb)
 {
-	bool read = cmd & MT76_MCU_CMD_READ;
+	bool read = cmd >= 0 && (cmd & MT76_MCU_CMD_READ);
 	unsigned int retry = 0;
 	struct sk_buff *orig_skb = NULL;
 	unsigned long expires;
 	bool lost = false;
 	int ret, seq;
 
-	cmd &= ~MT76_MCU_CMD_READ;
+	cmd = mt76_mcu_cmd_strip(cmd);
 
 	if (ret_skb)
 		*ret_skb = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d635df2..237057c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -272,6 +272,12 @@ struct mt76_queue {
  */
 #define MT76_MCU_CMD_READ	BIT(30)
 
+/* mt7603 uses negative command ids, do not mask them */
+static inline int mt76_mcu_cmd_strip(int cmd)
+{
+	return cmd < 0 ? cmd : cmd & ~MT76_MCU_CMD_READ;
+}
+
 struct mt76_mcu_ops {
 	unsigned int max_retry;
 	u32 headroom;
-- 
2.43.0


