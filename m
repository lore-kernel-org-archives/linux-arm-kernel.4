Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eUkA+d5+;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=AeDYq+44
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cm/CJD/gYt9QlVkp5IudTxx8hQBfl6+NF/k9mP6AOAw=; b=eUkA+d5+XGdqJskV6V9/gPCiRr
	NJvKpAvO6S97qcYiQQrrvTacjmzNKx2swr+cExwizCJCpqr/RdFsEOV7EPNeeUywF+uuEk92GMC0Y
	iHQ94Tv4uN3roJNYl1OSQp2GziJnKvPBUGHjRPVi9w2Wz/wiRKeFJllsG9J4QqZSjNLfmMqi9kuNJ
	iBvxDEloMh6uMe13Zcs1JDE0Cc2cJ7ZE/YL2x2kzGEYKtFSezlVnBwopd78Xt1iT/hdQc6coTfVjn
	sk4BJHGa0+o7h9CsbKJoMaT2w+eRPQKtsNNYs/UyCdERiAbqK8gsv67IXA5zh2SCsbmph7sYMViHd
	GcZs4LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUUm-00000009xGY-3RXR;
	Thu, 12 Nov 2026 13:05:40 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUUj-00000009xFE-0FTa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:05:38 +0000
DKIM2-Signature: i=1; m=1; t=1794488734;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:O1WTyjghV6WYV0brZzeMdgNHohzV
   eBnJ4iK/FJXhvAtKC8hBV5IhXc4UtAOfgUlxBYh2rdg+jonGTxQtaAmZN77VuR4jB608EXUicLW
   Waovnqh3eY8HOlqEUbJ02hM9+BegqJbDVhQ8vYdmNrddsfe1NDoaEO/VL4hI8JKzSDTq2/Z/B6Q
   0OPQQz/gnYormFtw3WiJSvmUKYwZERCLivjzUZIlK9LSNW6/gabYhTzRB6OZtMNdnsMO5CTEyWc
   KSdEGrpAJjpzV1aUpBTz4Ur0s26NDz5JpMbezNEe9ZDW/bfAW7SLMlRj6F4VfQDJ7rjHTbM3FpT
   Gbv5h1yzGPr9qw==;
Message-Instance: m=1;
 h=sha256:
   n9W6cQrIaeF4LFWZhxK5qAwLewbr8r7efK+cohxjhn8=:
   N7IIzZ8uHhKfeU9hdA2mf/whVs6F+2ufEA71jkU0cg8=,
  sha512:
   5V98BCEM7s8huQPK/bAsyBuge90QYEeTGcLJUNM4bE7y8ZG3MJu+P+KJuBw3uZZeGofuimf6IJ1u2+MMnsSRNw==:
   zDH3+lvv1aLbPeLB56hDoxCDDps5WfuvY+sKwNJugqutTUC1IdFl211hx+z4xV31esovKAxeNuIuIng+t5GbgA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794488731; x=1795093531; i=wahrenst@gmx.net;
	bh=cm/CJD/gYt9QlVkp5IudTxx8hQBfl6+NF/k9mP6AOAw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AeDYq+440OqEYUngerjYBKGCZiMv30RIpFEpozprAl1VC7AoA6E4FM0YajooUIXf
	 t/RJW8JL9OWYifXe9EjD56k9/yRNzxAL6NxjCvePoNw6KaGZ6Xy7sKK5vfG+lFJ54
	 k9PfOtsmZbux0I+a9GZe2Jb5+7SMmxaqCc1yKQPBOH+12eJ0MmTbNcdymA2wtjpq3
	 0kdRuhZBnYdNIS1bpYnJoSL3OrfIMuBsahRnpnePRGh0CYd+q3/NN1t1q5HMJOg6m
	 KS6eFoaqDnXU7Zy+KVB7qngz1gjsfnn5CA7gTYIaePX4qUuHqMtdIYla22MjC3OtK
	 qak2pzj8zGlipW/8Fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof57-1wgosM2D6X-00pk6J; Thu, 12
 Nov 2026 14:05:31 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/6] ARM: mxs: add EVAchargeSE board support
Date: Thu, 12 Nov 2026 14:04:59 +0100
Message-ID: <20261112130506.12823-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hCNvVusAbzHTonvPIZCO1jALX3FJsVy9qfR8X4wV72Z7obQFhcD
 ViwdC8+PEgVnqvjjcPmyNqyzo/RHRRIUN9scy2LoVbRFbirrDh5cqA1lgeC0jOoEJyWZHNJ
 7I+FI4jde1wsPYU783tuEaFIqgRjJVZPAkU6ZAFNossB6LxWEenOgwJZTf4Ml3jAanwsvFl
 6vaXI+iJ7dVA6gsJykckg==
UI-OutboundReport: notjunk:1;M01:P0:rjL3rNuuovI=;2XfDIgGya1qnkE5EI/8eq7Uw4xb 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 W35jnxRp0pw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_050537_397172_136AC6CF 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the chargebyte EVAcharge SE, which is a
ISO 15118 compliant controller for electric vehicle & charging stations.

Changes in V2:
- add Krzysztof's Acked-by to Patches 1-3
- align writing of EVAcharge SE (reported by sashiko)
- add "dts:" to subject of Patch 5 (reported by Andrew)
- add PHY ID of LAN8720Ai (reported by sashiko)
- move enet_out clock to MAC node as in imx28-btt3.dtsi
- adjust IRQ type of PHY (reported by Andrew)
- add new patch to enable EVAcharge SE peripherals in mxs_defconfig

Stefan Wahren (6):
  dt-bindings: arm: fsl: support chargebyte EVAcharge SE
  dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2562
  dt-bindings: gpio: mxs: Allow gpio-line-names to be set
  ARM: dts: imx28: add alternative pinmux for CAN1
  ARM: dts: mxs: add EVAchargeSE board support
  ARM: mxs_defconfig: Enable EVAcharge SE peripherals

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |   4 +
 .../bindings/phy/ti,tcan104x-can.yaml         |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-evachargese.dts    | 295 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  11 +
 arch/arm/configs/mxs_defconfig                |   2 +
 7 files changed, 315 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-evachargese.dts

=2D-=20
2.53.0


