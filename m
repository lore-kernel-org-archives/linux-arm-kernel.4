Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D585606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X85R2NFY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=; b=X85R2NFYU/UETv
	RU3hrVkVW2qd3Yn0xtRnfE4y0WZ1SHbxOzTWZmcFjGgiIrXgOMobKEdhK0dJgHt6Q0/PxMxgVb2rP
	pCJWiIjooQgJw/3D2Aqu8DWPFtZq1VGrQ8ifDjlPCPBmTWqOo3daFgyWgIOuR0XW1SMo8pCGfRjt6
	QPACg89ldemEKHJtC+GE5DqaIsVREu91xz+A7M8upCRzn6LzEOEdShDbGbI0PRJisJRjxsYC+2L/i
	39HGvje/Thg6twbesBMQzZfGx55EJ28MumeLshJC1ZyphSY7dach109cY+oRw30g5tVqzM1pEGX0B
	23Nte4L2g1s/k95cqhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsgK-00000000Lmi-0Cwv;
	Sat, 21 Nov 2026 21:31:36 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfu-00000000LUO-1te2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:11 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1383275f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296668; x=1795901468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=M3zc+HQKFxeAFgsEMh4LO4rhAPcCs+JIgCputHBtGWMqO5jvH9vsPwGfw2XwtIqMZ8
         peh7gNJlMUuJrLkzebXDJpM9rzpiXeKxZjkQjqf5rUAUE72kO13rBvSZm46+kZxWoRVu
         SB6bcK0WxTU9R+9nFh3uhpJMMT9aSreqb2dqLFj1+1MwtlQiF8awQaBTTWQI044vqcG0
         ncGW42VbADvBz+br84uveaasQL4UlcstZMlxRUpm2b89MPXn8BYw//5KjijEb7b+LDGc
         7nQHfkMQLFcbSG8XB67RFnHZZzKxjy0EJNX7GplKGbFLG+1cP4JXn5ONwdpRx6saC4r7
         +OrA==
X-Forwarded-Encrypted: i=1; AL+hErHxVZUJsXPwId6A4aKklM7NYFLHcen4rdCyul9E4dd93xTV81fiWQM6SlXvlR/7rteGkAEMKQN2LJ3a7qE9KXb6@lists.infradead.org
X-Gm-Message-State: APuU4Z+MEgHb+GtsgjTnQUAIPGyatkniEv6MtNukRkRZmyuprSbiz+ty
	jK/1B4B7lmHwacBvyWmrZopsb8Clj+zoUgzBP+0RN4SVzu5cPEUM9FcQ
X-Gm-Gg: AZFdTZcpPuyQuXsWskDb57MPQOZHonxc/UkcueOTZB9QDrEhgQgoA7YVq9BxhkMrw7t
	x1SnQyfyqHnYjxWoIIrRYODeg2c60+wTITmlybVB+vbd5vabScRf4q+eRqKbH3SfAnBkKYEkSdG
	Mx14E0OyNDDHmHNO+HH38p4efHH3y6y4pqP44KoHdnikUB0kgnfUUN8rtSTndrBEvpv2Qog2WvA
	dzffVwGEO6boFWJpS6F8WE5y7CEdJB/+QZQlPhQMskFcbWuI345MGv0CJzmFSZsz++oXxVZQpn2
	5iQyqZ5ayjjgxi20wrwJ/zTypDNY8sBYDTLWVthRiyKDHi3VxQkLD2Se8UOvLYYY40hsWbR/LIk
	bo9D39oRslAkauIxoafsbkFnbc/S3esNHoZaQNrH+UhGF48L7a9sY4rGtUF1gJyxRNrE5wbQf6q
	H8Bv9eIrS8/XSuTg9nDPvUKudO8hrcGnInBAM8Mi9eJDU+6ePVJoZbTfEgeUn0utKj5pvKutBot
	CZmjNoR3+shbEvzwY+CIeXi3bOXRd8VlK15240DklVlwN3tBByzkJ7rV+otkMHqoo9MeXeOPCH0
	6Qz9Wg9Rvk+tN0GSsHHzDhPZ3dlOQZiP9I/v+AitbOXF0EbPZe0jI+4iDxacmrida79fmjYGJqa
	n8dYR8xusE1eChgCLM1mIvXc=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr22665106f8f.26.1795296668557;
        Sat, 21 Nov 2026 13:31:08 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:07 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 21 Nov 2026 21:31:00 +0000
Message-ID: <20261121213102.143130-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133110_519349_9C209F5E 
X-CRM114-Status: GOOD (  10.17  )
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


