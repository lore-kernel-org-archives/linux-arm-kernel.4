Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FIXYq3yM;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=TA2UmHFH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=; b=FIXYq3yMTtTA9r
	vGukZaIBoP+WiJ46fAYNIahMbrWqGMLHk3gODRFtFl7bt/In03cgu0CeRWH/dub95OoCtUOHXjneP
	1T5jca91WzcY1OkO7TcDPp8WbbpkTtxeiI4qLVrt8PryW/kTBKIyUaGW4SwgF/nrzF4RcMs6IvfIT
	YYZLjIyj7lxrtCSQ/MmiazLUfmz3JfMfCBI1d2ObwB5zUcCnkzTXJGHDAeFL87im09K2lroOVDidl
	uZM6thHc1t7tGkXXh6MZMuU1biAoRXYc8PgMKb/AmGcWB/H8oXnFoLCPoMOwYA5wVcnTqdIV+AYml
	UD5QCtmeaheMtJSQiIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5W-000000041Lw-3lDh;
	Mon, 23 Nov 2026 15:36:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5A-000000040z2-2HZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:35:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so33435165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448150; x=1796052950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=;
        b=TA2UmHFHS+HDwbMgcfuQ99Q9y/+o/bM0bgq3Sj1LqTKHpS8pC7sGnWrwNAK78HVctb
         nRDtc9k51t8rbDLS8smWMC1FEyhEKlgQIFo+5Nw42orR3AtJVO5TXvvmpvcYDbJKzJJQ
         vLjSeH0ZRCDoKP0JQU2+2miXlcQpxtSjBs0nQQ0gyif6pYfKLEKvW74FKDlKTPEJjiS5
         MMO0fuXZ0Eqmo5FNua0osSMMD361FrzD0uj4WQ/potykd4XC7Evo+RfKWtgaDDYxUrAz
         BPagxnB658LIewXliU7bdKb6ufeG0tuNtkhnbKcd1l0Rfe3qS8gBYRRT8a9LkxMsN0vM
         KQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448150; x=1796052950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=;
        b=0QnWuL2Mm5osqTxjed1ARVZNt2HJQljNRDNe11v1cG/wYQbcT4RSEk/eVmn5y+MkNF
         kqgw5gbfYisTpHro99NsjRyZc9gALTKm0nkm7RWAsIZJ0ksfmjYE9FDjyKWgjJTYoD5g
         KI0e2qnnsfl7eWFMb3RSogghCGlB2AVn8HaXNMSH4qdw9J1Q5aVAIIM2S2Q52g5TVzMT
         N/TuNLcFrSmLXbqCrVFAEqUm8BlqM2vkOytkJf1FXDzZzxh4bEFKG+Jutt/9iPzLXrMa
         Sf0CdqhmM5pCpHtMOQ4mkoOQE09vfpil/iTbPn9F+lZ6O/uLnwCTikzVYDxdxt6efrLf
         Qhww==
X-Forwarded-Encrypted: i=1; AL+hErEXHHzKAN2xqt0GhuQtGqs2LzAPjN1bYLQr9WrnHA2f/JYYecXQlwMXNsYnpjb3T9FWxVIm/9ulgGZbOMzpoYTM@lists.infradead.org
X-Gm-Message-State: APuU4Z/BSPTKRUeynYow1ysSJgHymLRpinm/n+qW5rBVxbV5jg8yG8gT
	c/Bf0a12s/iaBSXJ7KWlPgr5o2ODpdJJ4LgYgZDHCSv1ViKC/gJI9jLCEa2OaRJLLRExUW9PFeR
	arhiSeIk=
X-Gm-Gg: AZFdTZeqSgYfi7vUFUiJ2RSl8SL7SDl1jno4JMRu+68UVofu5F2Pu3+ZROUaXC/C0Vy
	pWSZjDZxL2f/n2SJlW27WOo97D+yZiGviZ9Fj+l612dMr5g5lodo07evSe32hHpgJjDVBbP5spQ
	9W3ci2zxUaqD8TAtQTEs4krKh6NM/TC8yl7T4F+vvoBD8afBHYYZhQwaHgvxqZ0qdFjal8EJMsW
	HLMYh+OI7DV5nLY47JUqADKgq2P2egDTn8QWfkB+PVuKHX7H1j1HIntylxO3kTkmq37Yfjyl1t6
	j45KqF+Q4Y+tFB21V0C7wQVQaAv/JC3wnwbW7gATel2X7ak7gi7z3d3wyjAOgx4LAUQhCX7UzUZ
	/XWlB31U8orZB97FNaByczVAg7JN3BXcICas48nStqh9yrRefyPH1DkYcWGKLwQIBDcdhAXlWII
	LXK3sm5Xdfd1zPoWfACfzVZ7IZKvYIGsBET9lydgOI5SFIcbltpbeVXOr7N0Zwcp22x9NrprjHf
	7SPN7IO3YQy8UJOJicVVMyOnFnbpFO4XKFVblV5khwITPO8SqpcRvihMiH/zhe4YlewdZ9p/9+R
	DCR5ceLFBbJ6e6SWUEsHGtjvQ2NT3qVBhduxwEGZGWBsfDepLB7njbLN/pnyMz1Px3bTg+kzdUN
	km8cIrc0xew==
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr250483325e9.25.1795448150650;
        Mon, 23 Nov 2026 07:35:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:50 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:37 +0400
Subject: [PATCH v3 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-3-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4534; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Z7QZS1DoRcR6OqeFUfvFEEWGwZQRoyygyNK/LxTYDrk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHp9sFp4ZuvlwG1RL5qmePaxqO1ufVIik1ZckV2hc
 y9M2rK3YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+oM3I8FmjJcDHaPrEB868BXpXlWW3ak/YzcwcecMgSs1k6hWBOQz/UyPfVaS
 mfK7lsZDmOHygeZ1eybbt6lM0FR2uNkkozFnIAQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073552_639847_D74AE893 
X-CRM114-Status: GOOD (  24.23  )
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

Hooking the derivation into the OTP provider rather than a separate
layout means it works with any fixed layout of the OTP cells, and needs
no per-SoC knowledge, as the cell already gives the CPU ID's location.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/Kconfig        |  4 +++-
 drivers/nvmem/rockchip-otp.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

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
index 7eb834516ab4..82c87380b2c0 100644
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
@@ -319,6 +324,45 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+/*
+ * Derive a MAC address from the CPU ID the same way Rockchip bootloaders do
+ * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/board.c),
+ * for consumers asking for one. Everyone else gets the CPU ID unchanged.
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
+	return ETH_ALEN;
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
@@ -328,6 +372,7 @@ static struct nvmem_config otp_config = {
 	.stride = 1,
 	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
+	.fixup_dt_cell_info = rockchip_otp_fixup_dt_cell_info,
 };
 
 static const char * const px30_otp_clocks[] = {

-- 
2.56.0


