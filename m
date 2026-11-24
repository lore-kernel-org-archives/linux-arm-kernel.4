Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bo/lLTag;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=b7gJ35Ho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=; b=Bo/lLTagq3OhLY
	81EyWg5zOhndyzHIVMWTr1PmREPFaIQ9l7/Kyc/MuszrSOI23sSLtvfSD/40sJpchSxW0ov/j2jsW
	qu3xG+4D3PtLQyIk4iHyIozHhPMtWkzesIOlELa5uNaFDVBygKHSuzwbWgVjT1JGJG7Bk9W18+i1q
	l8p4clT5j80Ag8Vk7BLteIZCnys4OLxPbIkDUBI/UpmRxM/wN2WeKjb6DlHv5/Use1y8lXBDgupPW
	m3s7sTH7mrAdb3W/MfTpXRb/cDLDlrHlY2pNJYLJ8TDIZj4RMtauyXm2PgMVYLP031PLWZOoZPe1c
	UinbabaCShEwHULb66SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGx-00000006T2k-1xvs;
	Tue, 24 Nov 2026 12:05:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGc-00000006SnK-0qVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:05:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2842750f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521896; x=1796126696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=;
        b=b7gJ35HoyvoyUzg3uhvPzGNlIC7tYXuS50Ni/DPy38NN+5P1/Mn8gODg1x3aDUTY2j
         tJ43IjB2tzjymJgXyovO85YNyocxNk1QdA3a+ih5GOO2s2FxkfHzHtF4vz0npJ2wdBb0
         448k9rfd2+vLJ7TlvCZw2v/XLhz5XW5TZauStibCWOSP2EmkSQ3qoaPpM2Luev34VaK4
         2Ky2TWUAWIfOkKPEBfhjL2BoJWeuD65zz57Omz52h5WsmKsJbAmRBFxf5pvwjAkhxR+z
         LWTBrD3jPzDfe2vTft7b2cd6MbXB1my2kWgzDyKaQa9fgq3SKXwdERPrgMS8+r/JlYpu
         7fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521896; x=1796126696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=;
        b=NTgnlqxRNhhTGDZE1wiSxUI38DB5DQBMMloFQRQKXF80c4bidPjVCYpf+w9FMmV9GK
         0foDvGYZw5DAY8ZtFK9gFMejGcZNbXcrMcOLDdhzm3krYnnOMH0/KGoYhwsEHeC9Th1U
         hdB/T8y+TiGRA1wuq8fsyL6Svbq3kUWNFHNOsP8TsYzlt0rIW1rl0ZLo6z3W9nUCv8Io
         gxjMbAFjS3d0A4tfnIwSLckRuWitCaclh17sbZEvA4NJxJnspybXhKv36TNkCQo8sW+6
         0atZzRfOMYyDhzd4CGogcG/PRQtLrrxyOSXZr6zUUzfknif/TVDe13G6auGd/RRmHao5
         T1kw==
X-Forwarded-Encrypted: i=1; AL+hErEQo47AueEKtmUMINikKrup+JJ4mb7mtmxvaNHbDZ/3jUb7+dob4NOtLk+YwhI1C9gTorIP8Y8avzVmlofjavfW@lists.infradead.org
X-Gm-Message-State: APuU4Z9OPq/jkd5jE31dqzcEm7R79xf+TWKqLxFHPhAwx4gKhyPy+aTn
	dFAn3chgyeJDGNjJ/3U0/RrdA4//8pIXmtl/u1ZEVPz00CEuWxiC1Eh45vqzEkimtEI=
X-Gm-Gg: AZFdTZc19tcbeNmBnEY3AznPdlmG2VhLe6FxBSWTdGPXh7K1CnWiJO4W1d99A0XGJ3Q
	D0XjwOKMw7XlZq5DUvvj8XETEukpyWhG1rQgXg7XMkFJhREvtW8UV9djrTuG7FxHI1Aqe0FhQe8
	keDtod7aBM2NozQffiZot3WfMnEAqkGhmu4LYNC7/PC1xrILR3P+905cA77IShDL5YDfWB5HbVi
	n4axK9kVDJREiVvxdWgMiHQpTL9qR5fB0RS9Jhzdv8eBN84ph3Rd8rTLgai8nVSULHS7yaTEOwY
	/7Qo/EvCafvLFodwJWglJvYvmg/cBwW/CkEh4JJy6QldlvLncGhqawaFE+raYxYqew6IeFA9oSS
	ZKfg3sFyIir5LsvF8GYrqlF5i3mUbzHW25fUWe7I+Egc6PDUNWolhfzKEJXXDmWygRQl++GHfCQ
	KmcWP1M5ErXT93FuQHvqz3dpGx16McTMy5fCzTSicvIacGn7q3scmj/6ndhrbbNYlmznW5QlP5i
	/zhBmfR04cuR8WHgQZqjzlZK1Gd4ueC5KQibjLy62tLxg0j9PRMDoq3Q3INR8JaZ8cYu5eFjFS1
	bl2HOlmWpmh/xUHQfGHOyumOEB4pgklLafeweDuyyhni0stmGVnitQ/o+eGvDI0UBd2HTwhg6wO
	af9cgr2bO2w==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr344006135e9.29.1795521896168;
        Tue, 24 Nov 2026 04:04:56 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:55 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:33 +0400
Subject: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4861; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Van/yrApyWlOlFkwgwXconrk/JcQD3PkoD5ILtTXY9o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gY7rLDcvNDlkPmrKWHeOYLPKvObWPL8OFji+11fu
 X5ZIS7YMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTX5DD8L7czzew/0PJhyRft5x+aV/gdtrRqj4nSEu2/JdA8Y7uoJSPD9bnf45T
 +5kQxp7ll1V+Nq4nYfVdXNX/9wqqnsQLRWQGcAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040458_273140_A8C7F317 
X-CRM114-Status: GOOD (  26.20  )
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

Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
ID in the OTP memory and patch them into the device tree they pass on.
Kernels started any other way, e.g. straight from the SPL in Falcon
mode, end up with random addresses which change on every boot, even
though the CPU ID is just as readable from Linux.

Implement the derivation for cells marked as "rockchip,cpuid", handing
the result to consumers which ask for the cell as "mac-address", such as
of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
so that the same cell keeps serving the ID itself.

Follow U-Boot's rockchip_setup_macaddr() exactly, so that both yield the
same addresses: hash the CPU ID's lowercase hex string with SHA-256,
take the first six octets as a unicast, locally administered address,
and XOR the cell argument into the last octet, which is how U-Boot gets
eth1addr from ethaddr.

Put the address in the first six octets and keep the cell at the size
of the CPU ID, as NVMEM cells have a fixed size and MAC address
consumers accept a longer cell.

Hooking the derivation into the OTP provider rather than a separate
layout means it works with any fixed layout of the OTP cells, and needs
no per-SoC knowledge, as the cell already gives the CPU ID's location.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/Kconfig        |  4 +++-
 drivers/nvmem/rockchip-otp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..5776d4e4b391 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -448,9 +448,11 @@ config NVMEM_ROCKCHIP_OTP
 	tristate "Rockchip OTP controller support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on HAS_IOMEM
+	select CRYPTO_LIB_SHA256
 	help
 	  This is a simple driver to dump specified values of Rockchip SoC
-	  from OTP, such as cpu-leakage.
+	  from OTP, such as cpu-leakage. It also derives stable Ethernet MAC
+	  addresses from the CPU ID, as Rockchip bootloaders do.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_rockchip_otp.
diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 7eb834516ab4..eb91e7a34051 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -6,9 +6,12 @@
  * Author: Finley Xiao <finley.xiao@rock-chips.com>
  */
 
+#include <crypto/sha2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -67,6 +70,8 @@
 #define RK3588_AUTO_EN			BIT(0)
 #define RK3588_RD_DONE			BIT(1)
 
+#define ROCKCHIP_CPUID_LEN		16
+
 struct rockchip_data {
 	int size;
 	int read_offset;
@@ -319,6 +324,48 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+/*
+ * Derive a MAC address from the CPU ID the same way Rockchip bootloaders do
+ * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/board.c),
+ * for consumers asking for one. Everyone else gets the CPU ID unchanged.
+ *
+ * The address takes the first six octets of the cell, which keeps the size of
+ * the CPU ID. Consumers only look at those, so the rest is left as it is.
+ *
+ * The cell argument is XORed into the last octet rather than added to the
+ * address, matching how U-Boot derives eth1addr from ethaddr.
+ */
+static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
+				 unsigned int offset, void *buf, size_t bytes)
+{
+	char cpuid[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+	u8 *mac = buf;
+
+	if (!id || strcmp(id, "mac-address"))
+		return 0;
+
+	if (bytes != ROCKCHIP_CPUID_LEN || index < 0 || index > U8_MAX)
+		return -EINVAL;
+
+	bin2hex(cpuid, buf, ROCKCHIP_CPUID_LEN);
+	sha256(cpuid, sizeof(cpuid), digest);
+
+	memcpy(mac, digest, ETH_ALEN);
+	mac[0] &= 0xfe;		/* clear the multicast bit */
+	mac[0] |= 0x02;		/* set the locally administered bit */
+	mac[5] ^= index;
+
+	return 0;
+}
+
+static void rockchip_otp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					    struct nvmem_cell_info *cell)
+{
+	if (of_device_is_compatible(cell->np, "rockchip,cpuid"))
+		cell->read_post_process = rockchip_otp_cpuid_pp;
+}
+
 static struct nvmem_config otp_config = {
 	.name = "rockchip-otp",
 	.owner = THIS_MODULE,
@@ -328,6 +375,7 @@ static struct nvmem_config otp_config = {
 	.stride = 1,
 	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
+	.fixup_dt_cell_info = rockchip_otp_fixup_dt_cell_info,
 };
 
 static const char * const px30_otp_clocks[] = {

-- 
2.56.0


