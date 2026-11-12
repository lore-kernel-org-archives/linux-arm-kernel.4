Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F651606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2cCCzL/U;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMoiZYdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=; b=2cCCzL/U0JSoYt
	HUW6QREf4Rfg1DPUdXlwkF27Ok9xYZLm2t/uhLYZ6V6fIaNVbfK2nFLLxz4/USr5xNRfFsQ5jiULp
	lWP7ZaO3KCKJqtU2khwl82SXVHNjnt0BTv1KiVRlKh0cQhTfQSvhq9X8gtmv5yiCAxYi4M8eU4obw
	JnZ/EAfuErjR5B6kqlXw4zqDDLAZZwVfjxA/MUaefeLGKUXHPXuINB4j9Drc6PxOYmbUlH00Wjivb
	AhoBBH0ZO8CvVk4+xTDbT+VX/4ZZwugEM5C02R/VBZGg4CRwkUImDyqRS9o513tndL5xCLoKbq3lo
	L0hGXQkxV/ZuohStczKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXkH-0000000AbEt-2zOF;
	Thu, 12 Nov 2026 16:33:53 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXk9-0000000AbAo-0vwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:33:50 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b3ada81853so4186602c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501224; x=1795106024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=;
        b=XMoiZYdKgBXupr7VHLGfUJWqVvSi5mpU+kiKYOhj8w78tWtuwxBql5kMz5s5X1/13l
         cDiI2Vm56y56ieNQvIFmvXyDPe6eg6YR7GK0Do+BROTJLHVX79DV5M5nET/YpHmtLERW
         OBmqpL+uuvqQqfRaGIA8JWpP7ynOM66lQH6PinnDhI5BIEjc3m5nTLT1FVi0oXG3cC5g
         h+PB2+KHgpPVzXYYnZxA8eiK1jEnvYB3jShKWnJ22xvOcvfDVNr4fzos5kG9h2wXLYQp
         Lhskk4/3s9pGlspApgMIJlSAJlIkYihtgeZEiCoxGp3RvvVq2wPo8zPcZXDIM8io7f4G
         Gqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501224; x=1795106024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=;
        b=FeV/ttavlHOlMitglqULEzc8E4tArRvS95P3qnjnM1XErM/osaVtja9TvWZnzwfP5m
         LeDQsaX2g59rGR7D6ki+5ycVo6H1ErTFZ1blRAu9bdtuctjrX0nL1WJv9IL+Dc2YnJve
         ZATcGUGlT0+aPRlCWwF2i0H+7wDCtpgckr0hBdPC3ADlmwG36bOwhpVuIAyNanKhxi5h
         TYx1VpPwF3V+gIKG9N6AG4RpzecfjndVBz+00RIIU5KCR2Gvf0UucnSeppS2zKRsx6HT
         Tqf1QJ0MUB18w52I6DZuHSg+/EoDz+cQqgi4P8bmG5RbHQ8ePZGRG8NiZAQKkrWioSh4
         07CA==
X-Forwarded-Encrypted: i=1; AL+hErHK6BpmVaYwWvdPxP1s/uUmxQchhDZQ7bbpeDH7VJX8MpcXXZq/7nGGFUOjmkaxuCyDNCwhiUf77Y2EUas3GGcx@lists.infradead.org
X-Gm-Message-State: APuU4Z/K5Y3Fb7nycdqRzYWDkkej+59JsPFe0zvBd2oJgVYOCEPL74zj
	jL8bklQJOcH/ig5pCappuuyC5yEvka6H7YyI+3Kx+qrazK7xVeVwJsWK
X-Gm-Gg: AYBFou1+MyuoLzbtYjf6FHbotfLdhkZQL35an6VunbklS7s9lMDZ6fJYaNhDEjipUgP
	l2Y3Sk0IN6DcwpFCHYjhSlNehkGemnHTvblzz/2z+yivxYnzMgTy/WnjYtxSTyw51RqhuCPFAV+
	jvfAF2HxW8VUTfHTVioS/G/VawmcBgHCBJbcny2FBwX7NHQbSCN3k2GNa8tNQfB95ybmfKaOMoV
	rgrMGGwNcVzhqJ9lilU5mjFEABkbLMzolx515tnCKiMj5u+jCdndb0fXRwEGebgaOITEqCTEaOJ
	79hRTkIKq0vhX0XxtXWiR9I9H4f/Tpypmf3i8J3F5e9358ES/2yz66Qzw1GURGg1FIvBIOB0Q4O
	FjfCdkVOt0sDyZ6WWYPt8Z+rq3OSdTT5EW4U9bOAe0Fl196ZBcChs0kpkJmVdVL9OZuaP1qJu9O
	KioMeL2Hr1xv4Io+uMGhimimlyJ6gliUakGBfsU0gDo1rqqzgpNfaJH11vluA4WTpuy1mHvAfXn
	FeTi/rA7QyHi6pEGxtkB0kDXFGDn+dsKFocq9Iz+LwgfYzyw6At+J0DRGULqTV2QfWkbV/qiCz6
	MOL61XHu6OXbXaotDqQ1YEIfFp/pgdKQgEtb9wwPOc/5GuE0jbLYM5hiJKHoGQ2WKrQ5ipBGmsx
	mWvO+ic7SpkZZ4MqlJTSpGiJ4iTm5g+yRwi/fwH8Ucxuk1DUZvI9UV2pin5AkxTwzeIwlEo8u
X-Received: by 2002:a05:7022:f20f:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5031003e7mr96230c88.21.1794501224164;
        Thu, 12 Nov 2026 08:33:44 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:43 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Thu, 12 Nov 2026 08:33:30 -0800
Message-ID: <20261112163333.12523-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112163333.12523-1-ahmadexp@gmail.com>
References: <20261112163333.12523-1-ahmadexp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083345_666765_A271714D 
X-CRM114-Status: GOOD (  22.26  )
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
index ba560462d..8425a540f 100644
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
+static void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
 {
 	if (i2c->endianness == LITTLE)
-		iowrite8(value, i2c->base + reg);
+		iowrite32(value, i2c->base + reg);
 	else
-		iowrite8(value, i2c->base + reg + 3);
+		iowrite32be(value, i2c->base + reg);
 }
 
-static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
+static int xiic_getreg32(struct xiic_i2c *i2c, int reg)
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
+static void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
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
+static u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
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
+static void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
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
index 2e3683c23..afad9a49c 100644
--- a/include/linux/platform_data/i2c-xiic.h
+++ b/include/linux/platform_data/i2c-xiic.h
@@ -16,6 +16,8 @@
  * @num_devices:	Number of devices that shall be added when the driver
  *			is probed.
  * @devices:		The actuall devices to add.
+ * @force_32bit_access:	Use aligned 32-bit accesses even for byte and
+ *			halfword payloads on bridges without subword I/O.
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

