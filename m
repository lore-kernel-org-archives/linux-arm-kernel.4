Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E09606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VEbZB0Ps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=; b=VEbZB0Psm89to0
	RvJAoyvz+/2rxmd+bF4I3/qJ7QwAKycDbA9Cv/zIDqISsiXd58s14K0EjTzmIFeEfj/4N0npxZh0X
	ior+wtpuY3p5TbgQ5nBbe0QeTpZndau60ehpmRYR4NKCXb7jYYFOM9QrMQsl2lOGVHeUTwcDPI/Ny
	8bRxRIz0dqA9qnpWIIApYFNoN4bjUB9rYjOqGwd8hRbCDlyJ6uqBj7/XTrOkj+Bu7HMgVwUg7L49o
	wGBx8sJ6ctkBcZVvwJQFwsghFsiYhpj2yVBlrc8d2NSwFrqIN+jHpiceS0aqPc6D6m/X3a1+Z/93u
	Q0Tnl2KgJXb63TswAmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCgN-00000000RXE-2kcC;
	Sat, 28 Nov 2026 07:17:15 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfQ-00000000RKt-1JKx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:17 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so61239745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 23:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850174; x=1796454974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=UX0OLshzuTxoNBIB3dXmDDhybb0lrh1o1s7AOJ6Nj9vy6CCSiH3WDN0szbyQ+6o9pm
         tde6U/x0GG1YrZnfn3b316mJIuDSm9o6FKZKorsJ4H7H1We6q6IBN0/hJ/r5DD6TUkIe
         Gp+H2vKREDbuIizxP1TK5GwXPayc8dSlk5qcaRflDKQ+Gt4/QD+oQACjYYYUUHW7n96s
         uis0nWKiTZ9Jo3fWYp0Os4EbMWYjBUHhMQavef0ACUe4YZp2xW3ml0Bb9DLwLVaQHXUw
         mOHsI7t0ThmUnmjhjTMJvEbGvH220nAS6o2fjQQPFvDxmnzvEm1dhWJKAXjegjd6vA54
         PBtA==
X-Forwarded-Encrypted: i=1; AL+hErFKUOa0rND1w/yTgFot6xDJxLuXXPmHgmmYKp/ic/rIcm/Hq4tXoYnr2EUSfkX+QdOh7WqJKiWtfMrILhyeNgPZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9lUuYgY50/Iz+usJkYLss9combDueIe4bp382dAPf3FoApLeK5
	7noVCG+TnHsUVgiiWDqOo2jiOSkVh3K6ZJEaghagGjbr1TVjQ7l6xu8V
X-Gm-Gg: AZFdTZc5FUNtLWocoruMPelTPdurSCuvj7BUrf66ob2YIljcNs2d5zfaAqAPVQ2QSrt
	gwIWHeI+c2pNCBDecWOwneM5FvMT32QGoe4cih6cizQ6dDR0Wh314kxUR8cXTxmFHuI6CLsu7tv
	TrsTZwvulmwDm0nCJQT5jFiUZG492IMFSOO8PjbU7cOOvSyEc3RvJduoMVFkZuDmKENTbXgzuq9
	RVD14i6ZaWC8eFagMm/xjARdLU8GNDTw08dmDfH/qZKyKXcSQqCTBXr50xkkbLfrCMSKJr3WJJO
	FQv78Jc11KG3VvnOhU4GyH4CxOp6/wf9wBLPGOwNSyBCPG32u1tUgmtPa3ONsdfWb4tdY7X9iNN
	yP+roY0KZ3vyO63tMg/C1sM25A1Ge1B8/te1ZxJrCz9i+6I4kPnRrKsPfYSsg3aKaqI/6yUBiSY
	iVWcfmPH7rijEi8+rkSJDzNLhG37e4IooGyNnmcWWYJLW0Dxarhg3ZmDnm0SewMTbfT5AcNgXN0
	N5Wm0Dt+O+GsS7hL6Sa5yEupVPxTYIUqojg086Cg14iHKhLcHD+Gu60vhJyMXzN9Z+y4SICqdum
	XkFIqlbm1z9dq9CvDt5hetKnWZKhG8MWxspORGoGiMdCSt6xRTtq48PJJtta8Wp6uaZmB42MpPl
	ArD0/qOaXQ1MGpEdWY6CauRKXAHf1GBfLpxPf7tCHPJgh
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr570429285e9.4.1795850174257;
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:13 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 28 Nov 2026 07:16:08 +0000
Message-ID: <20261128071610.27855-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231616_401318_DF2D78BF 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1


