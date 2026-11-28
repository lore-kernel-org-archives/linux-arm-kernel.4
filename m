Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DNcCtZhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=; b=DNcCtZhhfcQyxI
	9k3enPjwLtQM8ZsCTAyZipetFWTdCA55qAK6/LdcnDrW0HlQz2EvU4pJaiZRQDAg+U+eCnG3G/svM
	xK/eFyk+oO/c1cSpYHHmnFCXyZ3PH5noYcpsZMH098OesuMhG+1KtB6odwmYVjhktIO/cXC2EhXEz
	tcdmprMDJq7Acwy/4n3QHw0ledmTCWomrJ8+6CTnBlI4G/8kX7YbS4Tn5EuumROJJ0HKFmQG+cdBJ
	MX/4qJ+oeerQ09vXPSVHkhyRESL8hViDY1qzuCwynj425RyoHZQCjaLVGFylCIFgFvqWHVkaSj4xN
	Qf6VcFlenJftXKU+uGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXChc-00000000RoB-3vpE;
	Sat, 28 Nov 2026 07:18:33 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfS-00000000RLe-2Qoe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:21 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso67640785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 23:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850177; x=1796454977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=ZkJJs7zgR5JMZ1hTizUMZ8DiKYob6B31M31Ipd/FPKuMFOmM5qs0aISBUsfzOWjwPJ
         PdR7AmTJwlZ599Gw9MOyDWXGPx8XJAJt0fIHtAXPnF702uigln0DtQGLAuN4BNsTKtUV
         zn+Twq/MhdXtoGCM4HypGpqDugggiQphqg+HTPr1QtHv65csjWW2R9s5KeHo094H2r9Y
         F7/5320CmOyQNQlDMjG3YkENm9vhnBmrnECyU/B6ZCZr9pEB+R1ODgQj5NoOQryrXe/s
         8oEkI0jLqIMycJALmiB7Zi5XQjrXcgn5PPYkw18w2N8Jqkhsr3Y0WrsDhk4GRlWKplJM
         UMbg==
X-Forwarded-Encrypted: i=1; AL+hErEisQECHDgGO0J6wE6zeYDwk2GySCSsWn6ffkbZiA98ATN+MMSLUIQJuxbGRCvxzoOrKLlY9e8KvTYTd+MV8elq@lists.infradead.org
X-Gm-Message-State: APuU4Z8qsAKXl81dVoiDL5UBLsnHIZ3C8+0bnfnAhSEMZusIO9hYXyDM
	VsTWhy+YyrWFGkfuMnyTWGuoFULAo3LWDr/a4m61RPMkoSENut3h9oLl
X-Gm-Gg: AZFdTZd8aSSkpM++cnn0cc4OUfkNKzUH895kQM4/2PJ3tJrbR0QiDPlV6uVG72vsdUh
	zi9/ukoVwa35aTWj5aC8s5LVuFhF0YExFa9V8IB7fNo0WhKtVWfP8tJMt3unlRSQHqz8Eg4va4F
	Cvk2zlOAMnqLJR0+n2c8kNfy9vpj1HakoLm3Rtc7a5yojNEATxeUUTjZyvYaRtrcQQr/kPnwhCr
	mD6+ORAbd//mefnPX38TYa4IIfoy0rRTCvAtUsmkK1tC1713Qc/+vxoLQW2u6zAeQFrwG1eNrrL
	0wHh3DhtGcMAccWzlGtT1BnZUVR6UuFObYnTPp87ROLThk/ChEZ0HIhYPcFNglNrwYsc/hqXuAj
	Tb0PeqSfWTIhVafrbSb4UE0LGAwpBO49CTGgxQ0KcH3rKIkdJ+QYH6KqGUY90fNRMsPsKo2rkQx
	2l10j6wtqD3wm+wgBNAKIlFdBFnw+YI+TPqPCK4Z0w0v87Gcxy+1R18NbaEdHV62PrZvTPAQOUH
	UJKJBUcYsS0s5646RRszt0Nma1Eqdo59ytCmfl0e/OUFqWJblU1h/C7Epbt9Z5PM7wNh7eK502F
	jZJGNmQP6js1r7kMolJUy3d98jHDbdFkFLtilUE4ifs/3wAJ4zaZ2YYUOSoTE4NKMuyRzA5lqYR
	r+Fpuh2uk30ba+t3xCC1E4cg=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr615051875e9.29.1795850176695;
        Fri, 27 Nov 2026 23:16:16 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
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
Subject: [PATCH v9 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 28 Nov 2026 07:16:10 +0000
Message-ID: <20261128071610.27855-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231619_248213_702D00C4 
X-CRM114-Status: GOOD (  11.70  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1


