Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF26606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cKUiTYPy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2CgdZAY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=; b=cKUiTYPygEX/PW
	ly9E3s2FmoJC1O6Py1vgeE+7Uulz87rDQJLz48sedDtNIfcTo0pVdZENRP20/+pcNpdA3VaAMcMs5
	hBBXuiRL1AUKk9Y+jNDL2x+27P3nvQdYZMrD43iLPmStE6GDNEZem+n/JvnBPWUE1q1KtwE4TAsZx
	W/np0XdtZ2JxM8RtkdEVkrQZLHgZfjXUO5d9Z2TKvF0POfd2s6Es+hRUUUdUQWVhsmsspDyqGXxiJ
	T+Z0ZO/syp49KLobhKdiuZuhaKhc/yW0Dwcx/HxWbQDERlgfQvukrxAxKExhynfBpF2MK81IjQTSI
	G5DVuQgRb9ebWfhieTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNCG-00000006d9x-3ckX;
	Tue, 17 Nov 2026 17:42:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC6-00000006d4l-3QY2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:42:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e3b22e971so9073f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937329; x=1795542129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=p2CgdZAYljTkzuHWnFJf45pGdHrXOUyM1XY8DxpYs4QK+mPDdbnetj01WQEV02Qq2T
         IJZuB39op30b0//NSeo1igrlHvKQZMRABGOHctytEwChXBEC/ASJjo7BB1faQhKoG3f/
         u0dn6Q1174cs890RFP68NBVPHHSmkI7ZKyYqydNw9WX9jnbADOib4u57otSJxFvp3YZ7
         MrGXLugNMBFSfHIuu8eZu0iNKKvNzLikfUw3bEsmaiA/WCzZsCbJnzvsHZbrmFctF/Lx
         a+s7pGEU5mU0tFbsoU4VnmZCqxaHBZKpd4yNAEja3AQnIrMaP6SOZExrTgGHEpcM8lza
         Gqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937329; x=1795542129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=iOf/CDsF2THwYZdV70FktnVHXcY/lYUi1pRgANUyV7aw9hYGCOVIXgTni4ZwADMItG
         E7ykrterv+c1RVDw8NCEwjPHD6ILqqE9O209nQk08Ci7X1h04t/FDL1T67fV6/sSfcNL
         QQlyb2kEQdG2ErmIBmZvrcZ/e8nlaa7NJb0zS21Izy8nYV4xCw08xRWXdB3t0RaRqt7W
         PsQvtdShRU72o7+Zbh1NLMBnwPcO9JkGJwtjVVglVd9xvZrdJMaMsbANLQPih+7lZ1H4
         8u11tbn8O/bZOQN0iDXmrk/hrKBCItXWiggLwd2aDnNHFLr7fXm9k2wxE9rUCoyBGkdQ
         krHw==
X-Forwarded-Encrypted: i=1; AL+hErGcGL5Tbhouhf1gJMGJyg4cmaR0kD0BOlnwUrAnisgO8N23SknRdGlSxBUakpTlGU1ujOmDCJk+4Osar3RB8EU7@lists.infradead.org
X-Gm-Message-State: APuU4Z/0YklQ+Y3LZcCuZ4WaXvGbhoyBBpSYdQ8ZOyajhqzSERpjxvxX
	cA53Fkic8zOophu0Nu7T/6UTskQaWxuwslF7LpfRvWh2Vk0wgnO4tAfk
X-Gm-Gg: AZFdTZcIKRMXHBigqJx4VptzYHexcPzoAd32W0YcJ0R3gzVM+XmFmnkxnFLcwNWf7LZ
	oRqWLB5HvL+AGSY7dGTUXUS6Ua0VgHTLRPJzuagAaTgYtGGqdErCoF2a/O9TuE5G8GgB4Esl2ep
	m8/ZJBeKedvCLEIdeXb4rRYovj5NWoCyBpGs2dJsXuSpOkdhx0UjCS4WLQ02nWdg0VYbgF30GeA
	ciAnBZ1aQhrsAQIAsAyDryFYtY4qljxS2pVFvDGkGd3+mxh1svQcOhrAFkcFfHd3fVJgzKvPjXT
	RUcKEX4Wn4HxQomZgZ3J9ug3y91V1OUVV0wY5pE2In4l2GhcBOB4WQ8OWPGGRGoaLJLANZZH+bM
	Qf4H5u4nBUFFU3iU10OQgMZEb36V/pheNQEL9yb51Ycq7VjneD/Ouf5s7Q2/fAO5ZhX2Iwg/S4p
	RlANn82twgmuj+vh/WUhAccTa9Ce/d/gAdm/QSr82oHGw+VZZNj5pMSLv/hzqNWVxLb2Qgrlabo
	a35azBrsXIWPpyx2Ly0J8XCvUz96xliZybYm8LHDCCc647IBJD0w3HPQAY2jd4Y9y0jgp7gXoM/
	Lob+L/xBC3T5PqByklPkx7olq/bMdqt6o0iXAPwNajWTtWqH06X3+AzKWg==
X-Received: by 2002:a05:6000:26c2:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-4a6332bc6c6mr464449f8f.6.1794937328672;
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant
Date: Tue, 17 Nov 2026 17:41:56 +0000
Message-ID: <20261117174154.549590-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094210_896883_B0089DF1 
X-CRM114-Status: GOOD (  11.57  )
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs,
and its board data also comes in variants for different regulatory
domains (US/EU/JP, UK/CA low and high). The IDs alone therefore
cannot identify the right board data.

Describe the Wi-Fi device behind the PCIE3 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index b6854acee8fe..62904e9bcc71 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1393,6 +1393,21 @@ &pcie3_rc {
 	reset-gpios = <&som_gpio_expander 4 GPIO_ACTIVE_HIGH>;
 	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 	status = "okay";
+
+	pci@0,0 {
+		device_type = "pci";
+		compatible = "pciclass,0604";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		ranges;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		wifi@0 {
+			compatible = "pci17cb,1107";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+		};
+	};
 };
 
 &serdes0 {
-- 
2.53.0


