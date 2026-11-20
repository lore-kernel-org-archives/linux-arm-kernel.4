Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889C8606A6EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jmusUmuJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JAgyUQYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=; b=jmusUmuJFs+6gA
	9mlZvSTC34dL7Nl2VQCvRQZ/PSlimFaZumwwyYy9PFZngoPeHebxHWJ19ui9uLsbTU3cn8MUNXbHY
	Hsb66lM2Iv+i+8K21a6fcxrzLSWSGL7UZxk7+EIyjHukT8gCFuHxXsAj5PwuZf8oVHeoRaEnCixUj
	o5nVw9E2JpVLRycPy6TElUuj3U/Vt/2unEjPS+m4dHXxFeWm3zUBKNKveVmqUnMnF2UNRyK8vJqta
	oUb9wHTYCh2OcHX0+N7V2t+fiPQO3pnQqYSGKndP6H3y9QfhitCz9GmP+XcYeSu4Niha0f1QmwMW9
	t6d+toC5PAnca8iiWcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUBT-0000000G48T-2Yjd;
	Fri, 20 Nov 2026 19:22:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAr-0000000G3wq-2avu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso622123f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202488; x=1795807288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=;
        b=JAgyUQYz+j0CPjdDgUozI7VIYLjmUD1fHGRx39rlSNiRrS8znL4F8v7wZeDlcm4ZjZ
         5kVNIlAVUtUyggKni/Cfx6GfrsXZiHExoWYpG4iyGyvjnpzDq3PBIvxBVaNXuCVeyFVC
         +dqV4DTQ6WVsj+6z1B+KIEXWXQ4ayV6VTTbeUostAeJuRef+pdAAAJ9LDclIRWeb1N0g
         WCTeHmVQ1Y8hH9eOEQQFIPq2Nojz1QnPxdkv1gdkF7EHDHQLlsYpoiUYXIAbZLWbL8DI
         JTrV5SqbRRlUrH7sOS9FSllKIfsUZ90F4c3u5CM8ANReqIAMgdx4g78m3NSCVpC1eUbh
         Imug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202488; x=1795807288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=;
        b=QgepjTHRelGvRgnmXSVA+s9ylZ4aWQbJFrospn2+X4hhP9Pib4+A6inkirScN4DuDG
         d/dOz3yMd0hBcuHV9zCqfbMBkgvcPxxB6oPGQClrSeTeGYGm9WSkzYUChdLIgZSfDq8u
         YyuBxejZX81vv6R7PugKJITG/SV5eCMzo32F7BOoPENBC+5928vml1Nun40p1zC7Gl/h
         xpD2HWpgM2wKkPBYJYXrJN69kayVS0TWV18aF6pdVob6kn/AYE1XkpksMqGfFROGa31n
         AJcfCljxOMd6FRWYToLXX3ZHmbExTEZ48CQCwzszNKBa0yDOgath5HpEkPJIT12G/s0n
         +UDg==
X-Forwarded-Encrypted: i=1; AL+hErEO9yGR4l2rXCmJMVw43KS01qaGMsSTNnZ9vNJDuFplpat6r952Chirsj15pNDGlBigqu2mVcgY6t3MoZutEYrN@lists.infradead.org
X-Gm-Message-State: APuU4Z9DLRe/9BnhPZcn/ykhj0SfMchZKQTPLJIxc0+HiZtLVoFC4zEx
	RAbIR2tP7ucIV285bvkYqgWGriRJg81prUw8rrfKXb4OtbiGSH4qdHZ8b4WbxJr+v+c=
X-Gm-Gg: AZFdTZeQvVpk6Na5FcMvLGraNbWFBZsD386W8LITm5DH/4GSoHk/6L1F2xmQyKqaj7o
	mNjmzxSNxPUz1bhxIzq2mGLicvnvj93rPwAyh7uuy7iqEuQhzyAgF3+5JaPcUmEL2+1VJ8LqeOB
	MAjwa1pSG6GU+iWrEEE3FUygEPru3LY0TuB6rLGy/nnmk6GPeJ80gMNNOzAtZ/jJw7+ZS8RuIlT
	xtuELI4fb1DGnI/z0u5aQBWTN60tb86rE6rJjHx6GUyDf9hqCvZlEi30NbqwHUG76wYEPY94FsI
	N3Vv5mLi3V7T/50G7ZIn5FoVjl3T8rQDSXsMDG3TMM/5D21XUhx431rDuJy4b/baZ1O5ste6DIC
	KeCAw6saGRIe2TwwsN4pFif3+cTTH1U250RHaGMHdpIesqINaoQS0HANSjwfhngZygo8xd266tr
	bD4IeJhU4f/Zy7Kv4MrRB+sPw/22kVl3Df1ad+MNiTRmL3v//lcoYpu1rO1frgEjAwX59/my0S5
	eFIIhdxcRTS++VvYRlos0K8ZjpXjn1hjedHCQmRegtd85cV1MJzI7S3h3XYBxrxDvGRxxi0cWKp
	Oj5jo3oh7ayDEdsYB18YJD6tZ26Mc7LVt5Nh7+bu
X-Received: by 2002:a05:6000:46cb:b0:4a7:f35a:5f97 with SMTP id ffacd0b85a97d-4abb4b85b7dmr6559867f8f.52.1795202487831;
        Fri, 20 Nov 2026 11:21:27 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:27 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:53 +0300
Subject: [PATCH 4/6] phy: zte: Add a zx29 USB PHY driver.
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-4-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9160;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7XGAKP/u0GbzZCcgeEO6bPBl2TU8fS3aHFtWQRJOwl4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2W1HckV/rfYaqvXirfmSoxSbuudpx0nQq2C
 eHOOXsd3C2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLsbRAAhdCtkEwBOlgEeAOCdAckLAPpsEE0WAg
 pfu4FWdpNrye7+4zN75Wyc4vnxe4Sk5+wwPNgAM6RAIojMVJKX3SOt+dXb9RVl60XhViu+J/nOn
 4lh0issMLOnCYGgBpgnhicqIHa6tJy5aN7/B/723axH+am0EmLqS66Ba9u2bjfpu0wwCc4me4Kl
 R8/bRwkf3fI1k576MfVjEmsG3TgJK6cVm6b2xW6vXncIhlBZZn6B6uUvhc0GvhyIDMms4fG00RG
 x4B9ivoAxuXPENCjnJwgMs4JA/MjpJBV0ZC2Vt1Uoa4JbvhwXVllYlPz3+2lVEbO03DPAWz0hHV
 VQHKwJckTRLPh8AABjRTK+dJpJsdqLRGsqUBD2IADoYLXdPswlyeQq2rG2gvk8YuoQEpoBt0/l5
 ukIT/Y6gWfp313i0q8n6Amk8O0VEWGfzvqd+FY9RZyc6XjbIftiEpeCJb7sAHMOLzX7W6RGOpWX
 jvgTVLrsPQko207y8WEES5eRrmapFnGWpz4UPugkMKp/K1l5n8ur3GJOlNc92CeNEpADX8BjxMe
 rtEI55OQt4iNZmyhX31XYXJesTXgW8MCzq4Lip4uSOVk1lJ89N4qL0BFh6hoNV68Ntm1nlCyOdL
 EeJdKkwuvJF7DSkjh7BGjmZvkPK5/lALxxVFw6hO8Tye7EHI+G9E=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112134_456759_CAEE7D59 
X-CRM114-Status: GOOD (  33.32  )
X-Spam-Score: 1.2 (+)
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

This driver's responsibility is the correct reset sequencing of the USB
and HSIC PHYs. Before the ready flag is set in topcrm+0x84, the dwc2
controller mmio space reads zeroes. Waiting for them is therefore
necessary to avoid race conditions on boot.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Possible future features are host mode support and adjusting the USB PHY
to mpll over/underclocking. But both are unlikely to have productive use
on this platform. None of the zx29 boards I have seen so far can provide
power on VBUS.

The PHY driver reuses the topcrm node for the MFD child device because
the PHY subsystem enforces that the device either matches the of_node or
is a parent of the of_node (__of_phy_provider_register). Krzysztof
rejected a PHY child node [0] for the purpose of satisfying the check.

One issue - and that's possibly the reason for the PHY subsystem's
behavior - is that nothing prevents the phy driver from being unbound
because the DT producer-consumer relationship targets the MFD parent. I
have set suppress_bind_attrs = true, but that feels ugly and only solves
half the problem. The module can still be unloaded without first
releasing the USB consumer.

0:
https://lore.kernel.org/linux-arm-kernel/20260717-uncovered-feathered-groundhog-eab16e@quoll/
---
 MAINTAINERS                |   1 +
 drivers/phy/Kconfig        |  11 +++
 drivers/phy/Makefile       |   1 +
 drivers/phy/phy-zx29-usb.c | 183 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 196 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e394e0044f1f..1d47080b2290 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4038,6 +4038,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/phy/phy-zx29-usb.c
 F:	drivers/pmdomain/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index d151c05297d7..c4829038bfeb 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -169,6 +169,17 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+config PHY_ZTE_ZX29_USB
+	tristate "ZTE zx29 USB phy"
+	depends on MFD_SYSCON && OF && (ARCH_ZTE || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  This option enables support for ZTE zx29 USB PHYs. You will need this
+	  if you have a ZTE zx29 board and want to use its external USB
+	  connector for data transfer. This driver is not required purely for
+	  providing power to the board. If M is selected, the module will be
+	  called phy-zx29-usb.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c6dd02003bbe..e135e96b4930 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_PHY_NXP_TJA1145)		+= phy-nxp-tja1145.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_PHY_ZTE_ZX29_USB)		+= phy-zx29-usb.o
 
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   amlogic/	\
diff --git a/drivers/phy/phy-zx29-usb.c b/drivers/phy/phy-zx29-usb.c
new file mode 100644
index 000000000000..8dfbcb468c26
--- /dev/null
+++ b/drivers/phy/phy-zx29-usb.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx29 USB2 PHY driver
+ *
+ * Copyright (C) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* This driver controls the PHY reset bits found in zx297520v3-topcrm register 0x80 and waits for
+ * the ready bits in 0x84.
+ *
+ * More USB related controls can be found in zx297520v3-socsys+0x20 and 0x24:
+ *
+ * Bit 0: Limits the PHY to USB 1
+ * Bit 1: Unknown
+ * Bit 2: DWC2 controller endianness
+ * Bit 3: DWC2 DMA endianness
+ * Bits 7:4: PHY clock adjustments. Adjusting these is necessary if mpll is changed from its default
+ *           624 MHz.
+ * Bits 9:8: PHY electrical configuration. Setting them both to 1 allows operating in host mode.
+ *
+ * They are a fairly useless curiosity though. So far no zx297520v3 based device has a working 5v
+ * VBUS supply, so host mode only works when injecting power externally. The clock bits are too
+ * coarse to be of much use. The default value is 2 (0b0010). Setting it to 1 allows lowering mpll
+ * from 624 to about 530 MHz. The next higher setting might be around mpll=718 MHz, but the SoC is
+ * not able to operate stably at that frequency anyway.
+ */
+
+struct phy_zx29_drv_priv;
+
+struct phy_zx29_phy_priv {
+	struct phy_zx29_drv_priv	*drv;
+	struct phy			*phy;
+	u32				resetflag;
+	u32				waitflag;
+};
+
+struct phy_zx29_drv_priv {
+	struct regmap			*regmap;
+	struct phy_zx29_phy_priv	phy[2];
+};
+
+static const struct {
+	const char			*name;
+	u32				resetflag;
+	u32				waitflag;
+} phy_data[] = {
+	{"usb",		0x8, 0x2},
+	{"hsic",	0x1, 0x1},
+};
+
+#define PHY_ADDR_ZX297520V3		0x80
+
+static int phy_zx29_init(struct phy *phy)
+{
+	struct phy_zx29_phy_priv *phypriv = phy_get_drvdata(phy);
+	struct phy_zx29_drv_priv *priv = phypriv->drv;
+	int res;
+	u32 val;
+
+	dev_dbg(&phy->dev, "Initializing, reset 0x%x, wait 0x%x\n",
+		phypriv->resetflag, phypriv->waitflag);
+
+	/* If the bootloader used the USB device it sometimes fails to re-initialize without a
+	 * reset.
+	 */
+	res = regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	if (res)
+		return res;
+
+	fsleep(10);
+
+	res = regmap_set_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	if (res)
+		return res;
+
+	/* The wait time is usually in the single digit microsecond range, but it can be
+	 * considerably longer in some situations. The upper ceiling isn't clear though - 50 us is
+	 * not reliably enough, but every time I add timing, the usb wakeup time goes back below 10
+	 * us.
+	 */
+	res = regmap_read_poll_timeout(priv->regmap, PHY_ADDR_ZX297520V3 + 0x4, val,
+				       val & phypriv->waitflag, 10, 500);
+	if (res) {
+		dev_err(&phy->dev, "PHY reset failed: %d\n", res);
+		regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	}
+
+	return res;
+}
+
+static int phy_zx29_exit(struct phy *phy)
+{
+	struct phy_zx29_phy_priv *phypriv = phy_get_drvdata(phy);
+	struct phy_zx29_drv_priv *priv = phypriv->drv;
+
+	return regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+}
+
+static const struct phy_ops phy_zx29_ops = {
+	.init		= phy_zx29_init,
+	.exit		= phy_zx29_exit,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *phy_zx29_xlate(struct device *dev,
+				const struct of_phandle_args *args)
+{
+	struct phy_zx29_drv_priv *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+	if (args->args[0] >= ARRAY_SIZE(priv->phy))
+		return ERR_PTR(-EINVAL);
+
+	return priv->phy[args->args[0]].phy;
+}
+
+static int phy_zx29_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy_zx29_drv_priv *priv;
+	unsigned int i;
+
+	device_set_of_node_from_dev(dev, dev->parent);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, priv);
+
+	priv->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(priv->regmap)) {
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to get regmap\n");
+	}
+
+	for (i = 0; i < ARRAY_SIZE(phy_data); ++i) {
+		priv->phy[i].drv = priv;
+		priv->phy[i].waitflag = phy_data[i].waitflag;
+		priv->phy[i].resetflag = phy_data[i].resetflag;
+
+		priv->phy[i].phy = devm_phy_create(dev, NULL, &phy_zx29_ops);
+		if (IS_ERR(priv->phy[i].phy))
+			return dev_err_probe(dev, PTR_ERR(priv->phy[i].phy),
+					"failed to create %s PHY\n", phy_data[i].name);
+
+		phy_set_drvdata(priv->phy[i].phy, &priv->phy[i]);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, phy_zx29_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct platform_device_id phy_zx29_ids[] = {
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, phy_zx29_ids);
+
+static struct platform_driver phy_zx29_driver = {
+	.probe	= phy_zx29_probe,
+	.driver	= {
+		.name		= "zx297520v3-usb-phy",
+		.suppress_bind_attrs = true,
+	},
+	.id_table = phy_zx29_ids,
+};
+module_platform_driver(phy_zx29_driver);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx29 USB2 PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.56.1


