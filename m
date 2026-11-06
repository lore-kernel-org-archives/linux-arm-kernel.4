Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF08606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uAwVx4t5;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HijhD+7/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ReJVLYumEn9iWasnSyBGUIhaXWZBsODo5kqsWooUE/0=; b=uAwVx4t5Y1uaya
	gG0Fd6AAh5U89O2p5tPb6O+wicemHDDFhhtaMzOgroXwZtCTD7WnZjHXgVpLUSvwmT0iA4COzoo/E
	pSMXqVsngqQ+AFPwqOZgN0CIsp98lbRZQOmBWHS7JLtZ9YgV3yj4UQYRK5NhcPeo08487EVFfHQO3
	H573x7lTDJRA3xfHPkvIURTJkZeYSHW0Oa7lovuyi46C6Uw986eKYxDE460pffa16jkMAbaxK69iZ
	dntRDJJp8gWzA+UE6jZmWV78xZShwLgO0JuTrICqNqJYtcrna0NWhpn8ptZ9TkU8ueq9st7Ljcwd+
	bqDlgL0JojKld5/tyXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRw9-0000000DkKx-2WMo;
	Fri, 06 Nov 2026 21:57:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRw4-0000000DkFk-0f2f;
	Fri, 06 Nov 2026 21:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=yZcsj37g1wDaYHpaMHQC2ZVJ0rLcIWMu06mwv5p3B7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HijhD+7/jPNYT1fn5eC6PcPQ2DoEwvDfWCwpLJq8qLVfSWFj4hd7+5VXwjUo5zYV1
	 fGaGa6QYGnztOuo2McK787uiq66F0Jhs633mQcpuhDvtT+XVFLPRUrWClOk9jtg+iG
	 Ljv+raqiYZfw7Sc96JqlrgmxTEB5tr42Yy1fZj/4gVDuvfI60q34zHeBpjiq+NQ1HE
	 XEA0QYFONQkAQKL0dP4yrXjlT5+XNGMsU0EKdpFsKdqKmVPdNrVn9VfNp9XVlZDOOu
	 KGGtd9Pf9C4QafR2Q8oNzF/BfGWvZB7tHjSHwElY43sahJswr1dhRe2c4RTjKS+vvC
	 O/tpZvkypgzGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C05117E092C;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1413548002F; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:07 +0100
Subject: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yZcsj37g1wDaYHpaMHQC2ZVJ0rLcIWMu06mwv5p3B7g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT81gQ1jKj278e8o4UwdJsiBbOsUrL7mq
 h9I8htVfnYX8IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qaebgQAIwQyvBzXMtzSQdbLxacZUfOP6Vzw9WomWyYqHZOR/vCnASth1BcQEKepPeOtg5lxy0
 4qYgzFTO4LrP9TzJIP+KTd19QjmnkTukIpT5ulSQaR/yxa3wQvqgZ3FWaKFaGZEr3A/2W5VWp3w
 C6f//NlsGy8oTwuDCIJqG6O9q9HREWXqxCKGqT9Hm+hLe8a840eRDaLB+InRnq1VQE6mIezIHH2
 2Z7VoL/zVxZXGQZNHhcPsJAdGfelfCQIPna/qe4Z6NYyRpgFt3K5KbErCHoIsAIY3Tp9nyXm6QN
 PWtSuFtO6Gs3ZCq0qBQpsmHeSu9CvkTJ/Qs7RxKFGnJuwmRd0xSmpA8pkx3wIYItkDoLugOArdW
 rEVDJBtRU6BOFDpdqfhmXIbLQF7Z4gk9F4orUItBbMlApMeBcsQmFEzFsiSEKCKqFH2e86i6S+P
 7r+ulWMorjnuEQPGYTMLt6xlJeT7MRWitCSmRGhRzHuckMGqu0bqf1ctbQ1DFKmnIMhQgjGF1HN
 K78kLevgK+TRZfYpRG16H40yZmI2WID7CuKUTwVDwynKdsVzT4DXXjHY9gMpTDtAwyWYCk8XgFi
 J/uU8mMV8oW7lYIXsOYjGndc6FgmygJe0a/ZIDvrx3VC/bbkmefo+p/mJ/uP7c/p1e0Xicuh13E
 Kqn/YxpwlnzHWYYcLYNsoVw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_135724_358691_629501ED 
X-CRM114-Status: UNSURE (   9.87  )
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

Also enable the NPU on the RK3588 EVB1, which is very similar to
the QuartzPro64.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 87e624d1e094..6476d9e3be6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -578,6 +578,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pd_rkvdec0 {
 	domain-supply = <&vdd_vdenc_s0>;
 };
@@ -703,6 +707,36 @@ &pwm2 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.53.0


