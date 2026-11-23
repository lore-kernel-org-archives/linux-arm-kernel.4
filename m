Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAqK0Jay;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=USAeoKvv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=; b=XAqK0JayCYHFXA
	sw1u0gwo9/rs6J4kmlDawsV/dzGMjDpqdov5Ivnxq7HFwCZDzYXDiTc6HmXZXNFOsXp78W9rz7joy
	Yia8K8fTtihQVzM36JgnlpQ67x3YK+dwhmfizVjYYORHJb3JGoM7Jm/QD7Xd9S2HngsakVOsdtz4G
	6i8kaCpgbVyBowf3qMffB5+yeUGuLL0NHF6RGceP9qzJNJAHu4qQEMg1fpOdSa2X3DWJW4Qd4lv61
	MLFrCBBKn6NzBW+tk8H/ghvp0DTpqR5Bsk5pHTqZRtoPtRbqtTE0wwm7wAi6a3A9uKeZYTanbkkFw
	FLP2bB6bxTion0etkBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVajt-00000004rNz-0qyu;
	Mon, 23 Nov 2026 20:34:13 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVajY-00000004qdl-20mQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=; t=1795466032; x=1796675632; 
	b=USAeoKvvZKbwpxxRXIgkd8kadMG6helwX4TX3mka0/wpsjzuHZwl+FcKiEwxeul/b5+ctIxj5QN
	CNP4VnGO0vIQ/YZEZ9MqbaBjYTSpenzMRUK3VqTkLjZkNTCBwVCStcHM1CD9h5L/lxQFURjjMzP4E
	5KBApvg8Wf9nofId1j6OIXudlYTb5lUBKEv+oHuDArj2WrTdQ0asZfNnPUUsioKvvAYj+dtIhtGsq
	5qlrar+yPdfDyTK9D76D0vWazDwJF+JoD4yBpoEgZuAbZ5sTYgwzZbA2TxxdUI21u2S9Qj8Bn7JH0
	mMCR9i6NOEX7yThv25MWwbTekUilpKXT7LCg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:21 +0100
Subject: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
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
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=AUY2ja8XxCirP2QoDjD5UZpqa/ZPfxBH7gIhNFVOPf4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKK0QCYfavdLJiHacwCF3628Roxkq5L1tBpwA
 IkILqTHqnmJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSitAAKCRCEYUX6QCjc
 8RGZD/oDT5Vqyz3h36XS4BnWBmGsEdpxDgFKSJKMsw430YzrtJY43d5tIhwGYQ7pWjR3nQx5qQC
 2ODVYtMEMbMU8TX2GQGG5QLxaBJgJ+ElTlsSREw88q7+bRYOcqha2KodbeyhceTvJbHdH8FUYKL
 n4Z8aUUWwPSNSNg7yr42Z574PnykDPWSdkp9+RPxIJG1IJo2cMmQbjeeQ+AkgqcIx/HN9bkPzZu
 g28wglabWaoqjsRG9WO4ZIIylBrRH++pfrD+y0jAhnsRjQyx96PztMnW5Zn+V5AYfRxRVIs7w9G
 IWvfxJYu51R7/uDFf6bRwjmIyRXx49T3g8ViV+dEyfugYBm3pJKqNcZgCzpT4DhhNCP4ahLnoGP
 k06An7xFxK/vnrPfbaIygo5xgHRCJNc1l5cFhjQx76l3HbRrfqtTfL96OYfzVh2+viaBbBPO8TL
 i+SrXYSRBcTuAx7VPKbbH7tKu4ioFHQ4D8MTvUvQO/N+B9c/e1/YB9xg/IbWbuTp93Y1LV6k6GN
 eOWBbNi2nErNTX7/rNY5Jrn7McErllyVL917YgyssUsY9K4+vWSjik2WGRIhqpdV3EYVdM+uSV0
 Q2PwiqSO5n1+gBQbcaOPsn1EyiPBaR48bIB2wjHL+ExmrNeDiJ4NOICN376yjqIyUVOd21pmQz/
 NIr6AuJdxq4rykg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_123352_527922_E6670714 
X-CRM114-Status: UNSURE (   8.55  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To avoid depending on PLL infrastructure for timekeeping, use 32K timer
for the timer.
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


