Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqkD7+p3;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=d+uptWjn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qlQdCJMYhVhhZd0BHVxc3cBCltza9hXfEIy5JAAXwrc=; b=jqkD7+p3RmCmep
	Uhn8OVJryFdXKd2U1rUOrCbjy6QIUVpnVBGJDmDZqGaOr2aDH/64ZFpyeR/R852UZb7YgR8RyiRKX
	nX6sNHQWBE5a+eZ8LEcEUHBMeudFym97gdwhaK/wCVMMTXg0V6OpX6B7FG8k6QOlN6LQ/JFlocSrQ
	/Y4doy5eZ96JRs4xaQ51oWqSWzDXbgg03scr87cCtcUYKSXY177uhIV7cHHlc/VzunmwUg7Psqhzp
	q472p/a1cSK2gohwBDvJ/kvI9AtVjKGqGB5uQGKVc7VZgbxDF6M7QcJXm8IlfC/y5+Acp1rQotLjy
	2Rv25tZ7GBEaBWYC7G3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2Z-0000000DpEX-2zGF;
	Fri, 06 Nov 2026 23:08:11 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2O-0000000DpBI-1jvU;
	Fri, 06 Nov 2026 23:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794006476; x=1794611276; i=wahrenst@gmx.net;
	bh=qlQdCJMYhVhhZd0BHVxc3cBCltza9hXfEIy5JAAXwrc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d+uptWjnLbnhIP4aOd+Ui2h6D5Licp+ndxP610SAoqaRqKV92qBDI2yiLo7eO2na
	 csnd201WsWoWKtzmQoTuekeGJt5emqRLI9ieCUPN4m1H0mbjnGePksx6y/SjPCW1U
	 2BV0EXrEk5HEsxPkyCFbB2iUrTsv9EtIsKHcml4YbfjqIvLwXhf0KGxsoD74HNcH5
	 m5/gp04Awji4+kSzLdoh9xAkughOyFTf9yIkPwV07/z0TqJV9AU9lvwNLhUcqf0ck
	 n3bWI/MKiTJb1FW31w9eG4+GO23XHekR4tXiroY29NpcrGk4pEADTj8KFU7p4dxGk
	 dVhpgQApvbVZ8kTfhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO6C-1wjodX3gD2-00dmsU; Sat, 07
 Nov 2026 00:07:56 +0100
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
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/5] dt-bindings: arm: fsl: support chargebyte EVAcharge SE
Date: Sat,  7 Nov 2026 00:07:41 +0100
Message-ID: <20261106230746.21954-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106230746.21954-1-wahrenst@gmx.net>
References: <20261106230746.21954-1-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O5gM+NfdVqU8xGxAA+ty7QRb0Ya0C4gtoso8fjUW/vZE5eeHi0D
 DI3xEkS19ckJo2ywa72gBMdrEum285+yDdWrXF+L7Vy3HrY9/7PeK/QYVwigmcZpJSf9klc
 zVElifdF0WFmXIdVPmiMp84nrZ7/KJZ3G6m75ZVATfzErmLMEJVxO0V6fLTUxWK4FxsUPw0
 TdghXTts8ZfkvbOCMyd9g==
UI-OutboundReport: notjunk:1;M01:P0:/4RV1bT50U8=;QkjbAnfeXvtHA63Q6HG/RSM9t5D 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_150801_405538_F99BA15E 
X-CRM114-Status: UNSURE (   7.98  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add devicetree bindings for chargebyte EVAcharge SE board.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentatio=
n/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..2982f5d4b02f 100644
=2D-- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -92,6 +92,7 @@ properties:
               - amarula,imx28-rmm
               - armadeus,imx28-apf28      # APF28 SoM
               - bluegiga,apx4devkit       # Bluegiga APx4 SoM on dev boar=
d
+              - chargebyte,imx28-evachargese
               - crystalfontz,cfa10036     # Crystalfontz CFA-10036 SoM
               - eukrea,mbmx28lc
               - fsl,imx28-evk
=2D-=20
2.53.0


