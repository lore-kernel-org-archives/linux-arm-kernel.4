Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8760A262B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3CYdbjoi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lepd5ivU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=; b=3CYdbjoizSSxth
	Qi2xBy6JreQYziFAMPiOThtxgnH+fIAgv992kPE0eGVgsDAI6MVdPDSNDCWeHWXuXZ8FYR5F4FXtM
	f2ZJMtqgFWCHYJRJz6HcmfEELhWRtM7yEojXGXEFHOB+ZZfyR34JavYE6dzIzIVW/4L7zWDCZkJvT
	2i3rZ2r7iED0AiqzESFX+o0O9GxFqDuffl2kCNmCunGsOTvCSjJKNYr9nCE+oGSDSBTSXFSBQ6r6R
	6fMTgOp9tXWhAOA6q3kA8K3WYOQvPnz8JC4UCvr3SdgpDvFKRK580m3dPRx25BMrppP9tPR8qdaQ1
	ocArwKsHcCIrkqmJr2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQznq-00000005bIO-1dYo;
	Wed, 11 Nov 2026 04:19:18 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQznn-00000005bHM-3o8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:19:17 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36e795af1d4so2333800eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 20:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370755; x=1794975555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=;
        b=Lepd5ivUgyE/tdsDc0g0jmfyy5+6DeddogazwYf9V+JKgAQ29IqeCA7+BNz7NO6VwS
         KgPixPSUIwDELgiLLVP58uUY1felhTjLKZA3Dsrw1YztbtO6JbYbmK0YbSvJbwJawfgK
         AjEqbxoFm4AIvdZlDYvNJHJ8Sf9ACFpM61gVkE9XNDKVlI8ZhF5gesari2+6A76A/IV+
         xavQ2/o9rHuyhsQ0cjMAt/G9U8cvrALhdSJT2SONalsdnSpG1T2R7ndgtUGvFK8S2tyk
         3yhZKqDPzw4QMGeIoiOgPE4fTbjQP1twoSvw2TvipcpgrI3bbFTeBnB5nBCCBWRRbZ9E
         ThnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370755; x=1794975555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=;
        b=eYn5lGQSXwcacKj85PBbX2ILSCNC0YTT6BTS1GMZJkCnWbILZQfaGZKjrWzp2da4sy
         Gobkt5J5izrn3V8xfC4qAS0QUuA+7IWi5Xs3ZiOvGv9ZVeOwGkVulmRpxXH25DB1Xzj6
         Eh82nD2oPNVxyBRveckXlBsad8IAmnQ+ffSu5I3WM2PmtLT4C0yEWxG6Hvsx1UWgzDLq
         6D5OXYNthOoqO6f4pMI0oW5gSkksxH63HuXRLy+rSDhJFFbX7WlgW/owC552mEQj0bKT
         7suoFQ0aEvx5V2R5ElkVr9ZrbnFADpZZhfRjMkJFFC4JST9EbFFFNX09fLwOwfCHCSgf
         Jc2A==
X-Forwarded-Encrypted: i=1; AL+hErG5dAHR58kvzQKFltoZIxyrURSfEt2o/aXuPJ2nJZEt3Eaw3OvLyxD+Ka7Evnmrtaso8aZRXh5i2Tx9BLXPLj0u@lists.infradead.org
X-Gm-Message-State: APuU4Z8C5/lyMrLiCflrwHNuJpZ6HOTIz/6FDPz4vgCFi/Xlacz9T5EH
	S27NH+mwQx8gD1QrWVX/fvlbZeieI2H+ezlE/RVUkvqymxDD4nWUIpw9
X-Gm-Gg: AYBFou12Gsg1q/lE4FKVPy+/7wcANuAdotHdHNhm8wK89brPKSrKn6GMTz76iUGZtc1
	ac++UsoZ464usHau6Opd0hwEeLRmPSbaKfIZzn+jCEi9aii2pRxBrcJEkzng0MsfCjhTu8BBI5J
	Lq9ZfCvaoHIQZYSUBPYnzg1JG4FvqGJnXdkU9xFxqUCYd7eipwXmFTARj0xBjzf5C4cpLT2P19c
	NpnMKTqchvnPaZ2Yk4acJWFEBJgnf03KXJDEyyTBRhww//9aBrtM5CnZT6exJoupF26W7q0WUpt
	ugHrYUR+po104OuFYzw229l4u4oqqiNTKW9HeF95qZ1owPgRxZATVPyNEauLfDGUbW4COPQwipT
	q4nI6IWAktVacVgYwn2jEBhOvXoSfbPFKklQglETgiHb8GEeL/k8wvh2L2BBU1sxKtIEvOTOWPX
	IlBKoQbAx5ZroakiQwliuK3vtHPNDQWbB2jPm29crNbawiZj0riVJFWjBfFmW7hDZvCRNiGpv0L
	yOTFPUPKp+vC6SP/iVOw5qKvlacG/xKbN7msBN2S52/0Oxe/1bpOva/9OROIwtM9+TKd1x+VGag
	O6dSrmSi/uzFtxJNsb02scLk6YVedvOwnEKPziZIeeJCj+w1HlWbxuEd9Dv1gZn+Yv4qNSNylvI
	UyxeYSZHK83o+QQVZkZDp37yU/vUFfLQjUCiGcKFeKnopg4oinTstTc+4dYKb2JE0/VCmZst9
X-Received: by 2002:a05:7301:488a:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-37686b42aabmr1877422eec.11.1794370754436;
        Tue, 10 Nov 2026 20:19:14 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm11820704eec.15.2026.11.10.20.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 20:19:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Tue, 10 Nov 2026 20:19:01 -0800
Message-ID: <20261111041904.48916-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111041904.48916-1-ahmadexp@gmail.com>
References: <20261111041904.48916-1-ahmadexp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_201915_952288_97EE6759 
X-CRM114-Status: GOOD (  22.82  )
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

The LitePCIe bridge in the WiWi Time Card production image cannot safely
service subword MMIO accesses. Bringing up its AXI IIC controller with the
existing byte accessors caused a fatal machine check. Two crash dumps
placed the faulting access in ioread8(), called by xiic_clear_rx_fifo()
during xiic_reinit(). The affected register was the IIC status register.

Add a platform-data flag to use aligned 32-bit accesses for registers
carrying byte or halfword values. Keep the detected register endianness
and use a single transaction, not read-modify-write, for FIFO accesses.
Platforms that do not request this mode retain their existing accessors.

With these accessors on a WiWi card, the controller probed and at24
registered the board and MAC EEPROMs. Repeated EEPROM reads and I2C
interrupt delivery were tested separately on an earlier Ubuntu port.

Tool-origin disclosure, as required by generated-content.rst: Codex was
used to analyze the supplied crash evidence, implement the accessors,
prepare tests and draft this changelog. The request was to support the
WiWi card while retaining the existing behavior on other platforms.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c          | 56 +++++++++++++++++---------
 include/linux/platform_data/i2c-xiic.h |  3 ++
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d..d13cfb012 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -66,6 +66,7 @@ enum i2c_scl_freq {
  * @rx_msg: Current RX message
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
+ * @force_32bit_access: Bridge requires aligned 32-bit register accesses
  * @clk: Pointer to AXI4-lite input clock
  * @irq: Interrupt number
  * @state: See STATE_
@@ -95,6 +96,7 @@ struct xiic_i2c {
 	struct i2c_msg *rx_msg;
 	int rx_pos;
 	enum xiic_endian endianness;
+	bool force_32bit_access;
 	struct clk *clk;
 	int irq;
 	enum xilinx_i2c_state state;
@@ -282,52 +284,68 @@ static int xiic_i2c_runtime_resume(struct device *dev)
  * Only the least significant byte [doublet] of the register are ever
  * accessed. This requires an offset of 3 [2] from the base address for
  * big-endian systems.
+ * Some bridges only support aligned 32-bit accesses. For these, access the
+ * entire register in its detected byte order, without a read-modify-write:
+ * reading or writing a FIFO register must perform exactly one transaction.
  */
 
-static inline void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
+static inline void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
 {
 	if (i2c->endianness == LITTLE)
-		iowrite8(value, i2c->base + reg);
+		iowrite32(value, i2c->base + reg);
 	else
-		iowrite8(value, i2c->base + reg + 3);
+		iowrite32be(value, i2c->base + reg);
 }
 
-static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
+static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
 {
-	u8 ret;
+	u32 ret;
 
 	if (i2c->endianness == LITTLE)
-		ret = ioread8(i2c->base + reg);
+		ret = ioread32(i2c->base + reg);
 	else
-		ret = ioread8(i2c->base + reg + 3);
+		ret = ioread32be(i2c->base + reg);
 	return ret;
 }
 
-static inline void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
+static inline void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
 {
+	if (i2c->force_32bit_access) {
+		xiic_setreg32(i2c, reg, value);
+		return;
+	}
+
 	if (i2c->endianness == LITTLE)
-		iowrite16(value, i2c->base + reg);
+		iowrite8(value, i2c->base + reg);
 	else
-		iowrite16be(value, i2c->base + reg + 2);
+		iowrite8(value, i2c->base + reg + 3);
 }
 
-static inline void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
+static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
 {
+	u8 ret;
+
+	if (i2c->force_32bit_access)
+		return xiic_getreg32(i2c, reg);
+
 	if (i2c->endianness == LITTLE)
-		iowrite32(value, i2c->base + reg);
+		ret = ioread8(i2c->base + reg);
 	else
-		iowrite32be(value, i2c->base + reg);
+		ret = ioread8(i2c->base + reg + 3);
+	return ret;
 }
 
-static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
+static inline void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
 {
-	u32 ret;
+	if (i2c->force_32bit_access) {
+		xiic_setreg32(i2c, reg, value);
+		return;
+	}
 
 	if (i2c->endianness == LITTLE)
-		ret = ioread32(i2c->base + reg);
+		iowrite16(value, i2c->base + reg);
 	else
-		ret = ioread32be(i2c->base + reg);
-	return ret;
+		iowrite16be(value, i2c->base + reg + 2);
 }
 
 static inline void xiic_irq_dis(struct xiic_i2c *i2c, u32 mask)
@@ -1480,6 +1498,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return irq;
 
 	pdata = dev_get_platdata(dev);
+	if (pdata)
+		i2c->force_32bit_access = pdata->force_32bit_access;
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
diff --git a/include/linux/platform_data/i2c-xiic.h b/include/linux/platform_data/i2c-xiic.h
index 2e3683c23..df1aeb42c 100644
--- a/include/linux/platform_data/i2c-xiic.h
+++ b/include/linux/platform_data/i2c-xiic.h
@@ -16,6 +16,8 @@
  * @num_devices:	Number of devices that shall be added when the driver
  *			is probed.
  * @devices:		The actuall devices to add.
+ * @force_32bit_access:	Use aligned 32-bit accesses for all registers, including
+ *			byte and halfword payloads, on bridges without subword I/O.
  *
  * This purpose of this platform data struct is to be able to provide a number
  * of devices that should be added to the I2C bus. The reason is that sometimes
@@ -26,6 +28,7 @@
 struct xiic_i2c_platform_data {
 	u8				num_devices;
 	struct i2c_board_info const	*devices;
+	bool				force_32bit_access;
 };
 
 #endif /* _LINUX_I2C_XIIC_H */

