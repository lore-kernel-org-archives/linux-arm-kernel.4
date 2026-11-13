Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62751606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQaI6Xju;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XIK2w0qn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=; b=gQaI6XjuNzjPwu
	lFG1z+c3dpaFIVTQ8/rFWhIHZ2fLC1IDfAt2QEbsXTgLEH5WO02VNtgQUavRNKYFucaxwxqK1NriZ
	BbZ1PdZSeskPMgxeGbt8KqSs0RyLcqmPCwaUdw2npjXAuxYtqLc5dmw2b4FzaQSLt3uujq+Nw6pdR
	SHD5QBHtppEqetruv+BEcskHn+RnY+6/gMpYD3P+8eF2atjoYZiAq6HHPkUlN11kRFlyiSm5MFCDA
	jTof3wuF7bClhuIT7W2e9h8mPTRegh3mUz4fKbutyt2bDEUnpg2MsTgBae5gEvabVV2ARHWxcs8Lb
	6fY1AfRmwSqRmZJXztTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFc-0000000ChPB-2TDf;
	Fri, 13 Nov 2026 12:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFI-0000000ChDT-2kXB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=; b=XIK2w0qnHts1nHCrCZlvGcrjzS
	vE6q7A+mrMCxc+G9SqpK9t0B3rfThraw8k6HoPWhyJi0s+KOtYJNBpLG9gQkmoz0PGPvXM2NAQSNY
	wMakt1IZQJXI6ASS116Q41v2gAV7ivXZCb8YiSKHwW74jSq4mHDUXlZMhLcYNtv174RrJ/w6CzT9B
	4gzQ9+2r331JhYJL9pBK3p6oyYptDw3VXmk8g2HEe8emtjekcliOoBkOpq9B/G0V74RUr/A8UAHzN
	EOLhUez9+AwGp6kCCP8wC47Y0jEfQi3ys19wD6NVHGRYQM7OqUpoWCdV3MdDjXpZWpeI89TQi55nx
	Gy/5nHzw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFC-0000000BEL7-0C56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-49318428d98so314840f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572340; x=1795177140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
        b=djoSkncAfn37CeSWdB4iKWnRevnX2tzQe6xqtYTg395S5+QpEfpAWmE0avTc7oOThY
         6aiC/mmNroOa3vDqWYHvkLRyIBnk+Jo6WBuPVal7GhJnsqVjLVlVX3DGkq3JxoEu7QHv
         bnkIj6inKX7ozKSRkGcrnOuy2+pXESxTbOh7ILKSIeOm3ba2vXSgj994mHAHlvNVdxnX
         JJstDPhieISMWRPdLkWbyLCWOwNDC7233U6mGwMaHI/b5PWSK2TVa2BT1u7giMHTvdgu
         HSpZDBmeq88eVxqt0iWTv8I5u+0JeL8c5UC542ZaN2EFob6NpLKOAUe3vbYfI3cRmmRx
         yshA==
X-Forwarded-Encrypted: i=1; AL+hErFWfNpGgLkaFHAgIdnQUoaDyJDGu+OJVx7bFdv0HB5ZaQfephyVcOONvkRHZdxn+RZkICFWq91pDjj4468q/ecM@lists.infradead.org
X-Gm-Message-State: APuU4Z9/g3vnu68w6FP9eBllDrJ0mTcXitCWaWF707dDJbp03tR+1BM4
	esU61GR4eh8ZqzkRCcPZms8oIlLZ0IEq744joXMSQR18TCyl543N3Xed
X-Gm-Gg: AYBFou2P8pNbpZIryBEY/MNBw5T7/64T5AhuZ0I1LD6bLayVC43GYu6M2M/R8xYfQ3I
	nm/cji8mxONAvF/1Tz10IBIy+XYimM+JNAhQA/LdjSXyWvuSWp5/d7S3x9HntAezFRlZXD1tX+S
	noDvFQ+IIBW5DaIsQ9kXV0SqC7cnj5Yyhd6ZlF8urdKuasreixbA8rt/yM2aIR49MyvvWM3jX5Q
	UrjhfPrMXWh/yzhBiCso0oIC9uOibc8BZ8TAw9sQ1u6nLtMdGHnGO+T3Wo/dwxSq/4J/+4TA+eu
	QOTT+MExaB3mrrUSlB2tWajHde93sXMWDmTE57h86l2FUm1Z9D9rmj8fKmLqVPYr4ZP1gxlJIry
	pdzUSkqo7cJTMcJKR695zQd9aBYcO85ciDlOASidNfeE0rFsCjjpBO28T1QDuJvTCEM9riCvL38
	GvH1/B2SIMMvBt7W7oAqGXavQwaSzkWI9OdVKm66NhIAUgDOJrdKqrINHXKXP2aOTVttYdOVUgQ
	MQ01UcGHycYQc/D+/yUAxs8gvhuG712Bkk7ZYRuIa4JD+w+1+R3DhetxuP93Z/c1/nesCfC+kJg
	5hnargfT79Zsv+R4++AWtGXLrnER+t7eI8k4a1URi97Hba67fA75BC96QJcwF9tBYtFPxF14rs9
	oTmJ/aMFxI2Vgm1GmuJhrMkgdGA==
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr6076606f8f.51.1794572340085;
        Fri, 13 Nov 2026 04:19:00 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
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
Subject: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Fri, 13 Nov 2026 12:18:52 +0000
Message-ID: <20261113121852.334604-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121902_100985_4BEF90D5 
X-CRM114-Status: GOOD (  13.05  )
X-Spam-Score: 1.1 (+)
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
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
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
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
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


