Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F46606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wX0oWxp;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=I6NsCKXB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=; b=2wX0oWxpBCEXv6
	D6oZ/rhTAO0e9YJ5IRH66MLdZCeHM/xFh/cVSaROGEO4/NwAwz/b7N9jRRNZ4fZvhN9SVMXyXyfrN
	rgSij+mW7A4RCzmXhb4THy89l0aTyzpTYOVEPfKNsUzLh4x8aLCHqEnHhczl87W0TvLPnNM2n4+Il
	0HQBmSBZ6GtvaeOHFPj88t3h0T0sY94zfAqm6F+5WbQxekioxP6r2Kx/SkCOgMS8FYqnW6mvqREvK
	PB15dFNdEU5a2Ctq+GT1rQfVwnyn0OXSNqu30AG6HU92L6Yem0PbIUPKLgxl94pQygubL8AJ8VTrY
	qCjb5SJ8euSAqBWOCqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFh-0000000Cnah-0Hnb;
	Thu, 26 Nov 2026 11:02:57 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFd-0000000CnYc-2VNN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=; t=1795690973; x=1796900573; 
	b=I6NsCKXBNglFhdemV7H2eQNlSevWhksiaA3dfGT0kQlIhBPPJEFPbefjswmv7pTztt9I/a7y5Ve
	sOGFyCXqviwH/NONZt296QUyfRIDkJlsqrJDDDvX9eTl55LVvoluZd6DQMC+yCMGmhsKyIOlm71Al
	4HI33+9PKIaxQ3vDUGAlbhnXIHTwEBwaGLZcX1I6muIEZwWhzz/Z3ZWfUvxGceHhkn2+yhu7+HKYS
	i9LAkyuIjmIk37Rr+6t6NgjSY9e36EARO9465kgB+GxdPf+kPikz9D2bE5+Nq0EbbMeJ3Hz61yf+X
	SpAY7Q/hhfTeVBlUE4lkPFK5qlRAnzO4WjHA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:56 +0100
Subject: [PATCH v2 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-imx6-idlestop-v2-3-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=TE2zpYr7D6tueCqMdj/GlDbIYgtArbHlYHvdQ6KtMC4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBHACZkPmg2RebgXVzb9oxwY7kNO9vpCvk9e4
 DI9TVXITWqJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRwAAKCRCEYUX6QCjc
 8eZQD/0e8M6REzMmZyyXSvymM+PQe/nS/UjoGIOIEB9BallaCRMqYC77PF7vxvFHyKK8Kq77idi
 8uFehEYpLVt8dN1uYiCNiffj/97d5Klj5chOspRgIlIsBhgFPUXYFeaKJk4bPgtvfRBVu8K4zgy
 YXYgNYsKDnC5nfGJtHSJQAHdD+GxEh1v9g6MQvnnM4/4IQk3Zz6ycuSMlbbk4b8EQ3vqmpDrKZu
 uCgkI6KcXCNELPErz1dS2M7nAxorewA5Z4mU53G6Qsgr+cFXRBszLnQeQXufrH23zD+h/Fflggo
 vsKPN3wqyA9cEvRsDUuA9/eUJfHQwYSm5G91Rsk1b3ftSwMIDANEe4yD5aKe9pBo2FkyBOnp91K
 BOv8NxYTYKsiN4Kxuxik7zc4j501nUwUnmzEYe/Z4qnmIUrw1UPS23rnxlPhzsXGfsagF7rAn+R
 kx8BSh7Px9whWhoOc2UyXuXuCCyJTYnI3sUxK5ZtY3FM1ll0Zj349a3SZlDwvg2cFB26r75dGlm
 qwZsrTsWtnfWICe7IxizEDQ/VwUW4M7rRfzzLcfXgocC9bgEJM/kgCi2nvicLl5rxtaNgTFIfCq
 65II4o9QoBFIMqtb395KTmBjp96MZLDYgt/gYA9/kHtOWnaRc8t7Rb9iMO3SLy0J4h6gD24ItKK
 85IvCKUwg+F1Nwg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030253_663613_96D1B245 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

To avoid depending on PLL infrastructure for timekeeping, use 32K clock
for the timer. Avoid changing the clock globally since other boards
might not profit from a slower clock in the same way.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 1000ee8b807aa..2e907c4163629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -46,6 +46,11 @@ &gpio_keys {
 	pinctrl-0 = <&pinctrl_gpio_keys>;
 };
 
+&gpt1 {
+	clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+		 <&clks IMX6SLL_CLK_CKIL>;
+};
+
 &i2c1 {
 	pinctrl-names = "default","sleep";
 	pinctrl-0 = <&pinctrl_i2c1>;

-- 
2.47.3


