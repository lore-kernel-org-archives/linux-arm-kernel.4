Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2u9/jvY;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yc6dCfrT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=; b=n2u9/jvYsC5IDg
	Z3lLPmyks8Y8ThIlOYlJJGYSG6TWhuZIv5MFglh8vI3EZl7F8knKnbE4h0NQJF5qL8pUcyXLM2q9u
	cX6xed8zKdzMXPxSj5rXwE2l8MirtZTvXsLtZ+30JRTGKODasXlFme9xIMO9H4Pnqr7yvXpKvw0ql
	r3IAQBsIhxFUzwr4iI62cLc24d9bHW+RYgDWPXJcdxKzCc53r6DJZYUj7rQFKfxBxzMNFl5jMUAKh
	tgpGxCcncDa4Jn3jWEGYavYniplplaw9D6Ev4oxKMgp/HgJ912l9BNCZvPfVh4ps/7k6kkbiWnTFW
	T8bwNCikRZjMxsRQ4ZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBI-00000003AQi-12sO;
	Mon, 23 Nov 2026 11:25:56 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSB7-00000003AMT-2SKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:25:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A7802007BB;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Yc6dCfrTK0bDAynaw5DasLaCruMwWMep52YvHXOSb8rdSd9Y7Dy6oRB2fXJ8tFBOwuK5QY
	BeSOdGX+3EhA93poLKMDrlJI2u6Ly5GJP5QdNTSZ+BQBYpnz4sICMNBAKKDbdsNRTvWv8s
	gcL4R+9qDN2PUz7SMq05Sd5OVmSHSQD8pUwOl9TAQx4nOHyTnRnCc60dnxIpJWfuR1unC9
	c4YzIURMPo74ZbCr8YYk3vDwUXeV0ywotZrsm9c8yi6866Z7NU0WDjMoFxN50GyGfZ3p3/
	1gQrtQY+wJ3oUNGEnW2CqC1g0bl3YhmGSiKH7eGz+P5guBV2kgqTKSj6LLoQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Pz8TWViJ2WDmuPCAiX+m81fDtwn68LxbtUgNs8D8qYGvalF5l/0oRlOgTKU8gcYZFb/GLx
	9Qs8gWtgYHTngjpc7kgNxleznliCyiOCHDs2G6BY4K9sP/+8YjixxIHZdvScmGnuNJYWGZ
	+eIiwFfJ4wkQNUSxG6xErFPjlQa0kI2AGnmf6RGgs5ydTh/3OouqiLkl/NmzdLMC/w7GCB
	p4nDcQCt6epZh7zVHra/5kDc+fbczORVYVyI5EviNDTzCLwZecLu/uWNyrAxm1wg5v1X9O
	G3dcz9xxZGDUZVRn0eFnnYFR8CP+Azp/eWGKvWjak4lLw2oniS08OPGVFcyvoQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Vk1oo19Qs4zaSzjxCWqLcACwN2olbfH4WCnYxbW/qvDKIXZWjDVGLq9uCLGMB0OpSj+BSW
	cjUaYhgNQU46WSrB4VQ+aAm0XQUKeUOYWwXu7giSQFpejeygNNgiLQfMQY+Zfyu7EButPO
	Fr3WLMjFXohBb6QiSRpidibMqu5b4yshqkDbNeqGJ7V7xvpxHE7iy+4Eqgh4KSaSYvJdcj
	e1iKL+Dv2NmEvxyUN/XdYW0KNW/g+Q0IT62DGBHpyxhiT/aZvoWg+XCg3mAwCNSXkvY7+0
	U5Jzsz19zfrSgpC2PUlVgqCueU3x9VRg/eWa1xm1oKMhkE3yD1dM2ZTMYV5FGw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2h;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:15 +0100
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Enable I2C level shifter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032546_379152_1131E85E 
X-CRM114-Status: UNSURE (   9.26  )
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

Without the PMIC's I2C level translator enabled, probing the GPIO
expander fails with input/output error:

       pca953x 0-0020: failed writing register: -5
       pca953x 0-0020: probe with driver pca953x failed with error -5

So enable it.

The GPIO expander is connected to the level shifted I2C output of the PMIC.

Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..b3dfe516b1d55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -216,6 +216,7 @@ pmic@25 {
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		nxp,i2c-lt-enable;
 
 		regulators {
 

-- 
2.56.0


