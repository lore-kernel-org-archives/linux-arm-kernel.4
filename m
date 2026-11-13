Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E1606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oS6d3UZs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=; b=oS6d3UZsedmaVp
	E623j5+LVXNqr7ouxNEKiUBtRAuQo59nmc41yYAxVYqMX+VHcXmOEHyFNkNojPhH4iqi7flWituZw
	k4Xa5t9zBBTbpMXaJpQGab/pV+Ua2CuE/q0M40oFiJl6iyyKcGqQejBCsH6OqBX1DX0zOAVxQTlhj
	2jkWVjrUVcjqLpgSL6Zy+F/bpxlyDPwQi45vZ9FRAK5m+29fC8Ztc/uMkGRa8QzIOihgZ7oJvqaJ8
	jSD8xz9RJ7SBa/f+XGkQlVsjiZmFjz+wa0K7IPFUic1AACxJjjS/MeU0ZcAoo/HldIW6UgIZJjLCT
	/GlVJqDupKShRDEQQ07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKl-0000000CjDE-3T5X;
	Fri, 13 Nov 2026 12:24:50 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKe-0000000Cj9H-3vSd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:24:43 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1157425e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572679; x=1795177479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
        b=CKpj4qQyd9bZXcBHoIHjFrda4zfUz8sYoJSWBGagIOmPg2YG+KKZeFvS9WfO1uhqd0
         sFa5Aa7SusaeI9K5J5lahMGkULgBOZacZRnLcysgesi8XIOmj8RVlZRf7+pBT60Mx9f+
         v+N2PjVlf1ag4lFbcS5WWW/k1FZ61HCwb60iaVdDiS5iWO9zQpY0zye/GhiZddCtH8tC
         zh+qrZzWyalfC9dp+za0rKHMN+daqFMxtOppgKvczqOkRi8MUYIuNYoqkBq6jiY4I4GO
         Dqv0Y14KDqJxKcYYDG6E6dscLEppolbAb6TZRJoWV6Dt/x1MM2uKoDZszhKm64rdTG3p
         OoYQ==
X-Forwarded-Encrypted: i=1; AL+hErGJi1RaK9ncs9PuaE1FpZh6KTpW6PDX1913NpTdmDwsElpEDvuJReitSKD4dtyCGA9mLdkuFr1ybDu8U8Uf4noO@lists.infradead.org
X-Gm-Message-State: APuU4Z/KGvX/V6HQD9mSAaNwaQDznuqghcjqCDzr+Lz2NWjCGjoRpHMp
	7ha4lGhPSpZgTvBcj23Y00O/s5xZIgsY+Nlyo6K0md8hmeOeLgGwl1bhD59Vy7qOzSi6Xg==
X-Gm-Gg: AYBFou0Q4rBAYBNZAhF/7fTmCkE8f7BoBRkBo8rY4/ZXqSAlJSbe5ZTUmyrdIqDZTjZ
	CNRIG+Ae0EF0zr5bLDbiLzH7rW+IqUSAhWlBBAJ2Gv93wCd2nOOxyxL0j6X1+aXPW4uF2svhn2J
	CQAUGh0AO0THtTypwCk2M7ZCcpGccSuI3RgqabhY5521hJvX3M/wZGsji3MnpE5iKOo25eT1c3I
	ZYN6NK0kYs0/oqIIShbyfUcowSeHSfoukbGpkkxikKghtJSkXtvG8L+zdHbWB1ClKhJZ73BmxU3
	yCI2bdRDy9lqGDSJC38BcQsdFlvBgR50SEM61rF/Ni+YGfXlUmtTu/duS4iTyCvEvlHUkQVrsUJ
	fTYHk3n3flNPkld8AFiWW7l17t0EtjVIjX3yFlRPMa2MOHH6CQ66FDYxKIuv5/btZaMPidKf6CW
	TrrOg45pksvuJPhGcq8m8V9Rkg5xtBnHmqXlJCVZ365u6euBdoy6E1OPAV5p/nePECcpW5JJYpG
	XfjG6sw0F91/skuuvBYHUNQ0+AZn5SGeHHBrf60oMvILzGDc+L4QdTQlyoAbvG2/c1n0c0VGBBD
	8tdPZ3yt3yLsCrZdDHmICUxiwPwDoyEaxDpj5ox8k576mfsl4Z7oCKYKF3vo2MKVqHvL56LhR05
	J2pJvwalARZErdRd3sxJBt8Km
X-Received: by 2002:a05:6000:2c04:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-49c72c9c049mr5208825f8f.37.1794572338269;
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Fri, 13 Nov 2026 12:18:50 +0000
Message-ID: <20261113121852.334604-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_042441_067075_CC46AF54 
X-CRM114-Status: GOOD (  10.55  )
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
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
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


