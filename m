Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F1606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LtnwLlm1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYMiKAAH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=; b=LtnwLlm1o8fXxK
	BsbtgYpVGqJuLd14eb0XEL9JraoGL+V6qqFjjDG8keHZylVxw0BKWn6qU2NFIiZUnJuUHTtfQOkx2
	YndnRsGjpoQ+xjehD0E63mv+5ox2pJkXRtjLD9QOXHLPAWPG0KF1KJKjVwmvdmpQqSEDZXYPz2liz
	lHvhRnsSBR74bF4oSHxUFy0dEay1qkR3PwcxTsFKTXf9mFpyvEjf9N02fSUDiUMyinGxRIBLWjkN8
	cDTHx1xEWDx4GlSemhHZTAK97A7g66VkgSdHJC6isQfl7kLgwe94kXZ/HduK2y0FrxHaLudaie137
	jLCwIeremnFe/67WJLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1K6-00000003W5U-395n;
	Mon, 16 Nov 2026 18:20:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1K0-00000003W3T-1PkT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:20:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so17701605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853251; x=1795458051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=;
        b=uYMiKAAHIDbR1a2vOkjwqaZ489YHg6VNGBw0XBfx/guXQzLYqGQ4/uJjR+Td7yJ8NB
         F2PqJXicAGSbISitlFSdhvulxqLPiynRjqS3TqC6O6FBQIrDtapbmMmMBzsGPIBBXE8L
         n+08B6iIenCJ4x7Aph7R+pzBrC3RcLQnQqAd+3QVUAP1RcYw/zDXJEpCtXSRiHi+GYJS
         FOKu5Rs9Xq7RUxxzAxfuMc2U0CNyjs+CggvxIOvjW9I7SWcwbO+PbnbfF8ezkN/Fkdrm
         b8OpFKRasbvyZjxa3FmH0QBDdSRPyn2KgCkfgZ0YcO3mfvCIwTBTBZ7yvfPYn8HxM4yu
         2Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853251; x=1795458051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=;
        b=P8wE4FRixeJX7h73M6T8qCafCXnnJ57T535a5UGIWJ3N0ATRvqYvmGyzK0NYz9KkNn
         GopoQcykXvFaM+elHVIYDpXymceLhhRUPKnVRkM8YyoNwJm+PlRzvgiGExZfcFXuDoOa
         WsrHkh4I+BGpWWEftta38efTHa7dDRRnojcDMjR7dBsJTjDPbXyPF8SpvqBjHHC0YJ/d
         K0Fw4HiV1XouzYogdY9o1u6Dslw/VFi6K+YzfY2hV0X/BEpgxmaQahwg3eb623QfVIg4
         smu31l9LOO+YcMCkK7yBdi7psGGPpyDJhu6EgoHX9/1ckp9maaXgiv0kXPxSDhs/feBJ
         2Kbg==
X-Gm-Message-State: APuU4Z884OYtw87OL46hSWGpdmSrzcV3A4uh87bxZP212Gm/w9I9Xlec
	/AD1asIDCDKDbudykP2zbaNYJCsMit1w8bCpROiKUf8MiVYN91QxgjOw
X-Gm-Gg: AZFdTZczYKTGxx70GsfPtD4taeQZPkTXOEFi9cAJxJkR8q7egH7D3OWe0KZ+MVQuVev
	ZHAYhhzWB0PALWhEyDZu7FmP+grQabxXbS7O2Aka4H1b5/ptKUmvZkzUmpwHoYXjDUv/RoGg51o
	G0b1uuYp5jmZC8BIsWIHTO15i3AbfPwGKxNIZKVYyJhraxMMqBMxD1rL+uIvo7IlVV3Nw0kB02y
	xiTWn4A07K7VW0n0NFM6SEkyEXum6dPIQE4iNSJl5fHD/yuBe9jhoXkPQTtoFptL61aPdT59OmU
	KJ9MHvaU7+SzsvOUgnkJIya6PJsu6CBQLx5lN0UcBwkbkaqIH0zTOZcC2DfegtS317PNLG5gHNg
	rCRdTcFSnQjrLJnsLakdIZrg8xZN+bxSSiTg4Kqk+HbXkN9UvVOMEY/0LpDRrd0+eBpy/fGlC4a
	5gPHSwQItDcjT+4s4BfyPwS6DbKrJySeT+3voxsATZThXtViYts6uj3Q3f4ejKUdxJ+TlQpVMDI
	tY6M0HeKdncDpFhD36HpjQvImWsHWTjrAL6GSzuHfeaAYGToe7Tghv56/NtevXznbnbYWdTIM77
	PUbxFfKiMHQLMI93lfNZXIQdYY3edaSdE6YKg6Cndn4QFaDsbRottZa95iQEUHbhdwnmIStlbHx
	cy/1NhR8sRcUR5f1387SEi2m7o/hrIqP8atvEsJJRFkZM+Thw51RBqZrlHA==
X-Received: by 2002:a17:903:3886:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ee0dfb0832mr95471945ad.40.1794853251181;
        Mon, 16 Nov 2026 10:20:51 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a5877bsm2871775ad.48.2026.11.16.10.20.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:50 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	richardcochran@gmail.com
Subject: [PATCH net-next v3 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Mon, 16 Nov 2026 10:20:48 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102052_385178_9CB0B535 
X-CRM114-Status: GOOD (  22.65  )
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
The WiWi ptp_ocp change later in this series is the first user: it sets
the flag in the platform data for the card's XIIC child.

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
index ab7916745..edb5e271c 100644
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

