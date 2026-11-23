Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65405606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uSEI93/y;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=GR5R87Ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=; b=uSEI93/yjYrKCT
	0TR/2ztlOObjGmDsPoT7KlRl0J4nDbBO93xscadzJZnRRbyPLILNTRB7waXCtDwLDfAx36qrPsbUJ
	bkHW5/UM+20KkGjDLR+XjWAMYLHrKb1VkOstdwfiQjlfBIeWRB7wkjtGghKyic4iZfUN0TVFr6oJY
	RUWjJkrAHhdTvO0YMgr46PKUX0OLakKnNmaiNi0wxyKgU19yaQiI1kXTj9HZmK6MQ/51FNJ2iJb6n
	MXLI4s0uiiHr6W/BjC8ZIrAhw9K8dUls7SY6fCiDE/o9ZRcN9ok09g/ILPQAU1POaxMx29HDmpKuB
	bpx5hm5lFdp70bF03xRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5X-000000041MA-0NTo;
	Mon, 23 Nov 2026 15:36:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5D-0000000411o-43RJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:35:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2751677f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448154; x=1796052954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=;
        b=GR5R87YmWDkNi3yaeMvTJ8glAzCaG4oCBspdG19czBnmBybh1LteZ3184RBvKZFgzl
         XdATR6uljJr5ascDQEBLp/ZL+L2RJZ4VpmIQNe2J1bvMorTHT7FHnYSvEQ2yLUZqIVt0
         48Qeha4xMhd/WMJ+g3BZ9+8pAqouJ5U5wgP60QZrQLLnPg4Od0NlRrPfgBmyi3YW0F+r
         ZnFfa33/CC0y/9Jj8f5YD32Ve4dAwCSmqXdV0B97kBKKFtlr2gVOuGsZx0jQhy0/l4P6
         ZZJnyndyrJR427/nzQvuJ+53pUz5BXZND6aflcchOpsRV9y5BOi5ysGIL31FCCOZ6mPY
         gYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448154; x=1796052954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=;
        b=JGMCPemD5H7dLO56uMFq+/3eNUuBirPIL5TmE60IhVdtkEQcsn7NZ1lzQNY1ApNR2J
         tT/MT9Mvv1lQkjeXhLjNFtZb2XPTT6idMhmUj58WYsI8WFlQmE+vcX08EyQwy3fhT+7Z
         C0KSXpWvSqP3dy7OvGc6jFJVepcaC9/UBvkCHUWsqLcirMF5WF9awTg2yy6njNFt8WM/
         XG+p5mPVjfNAFiLOgE4/tr6ghbnrd5z+pPdJ6upPB4cbvqpFrWRk7hsnXh199w8+R5mg
         kTzNvaNYylrX5CADUWPiorqi3T8rG6xW0gXuh4beLVB0Jb7Pe/hCSB1AR3WA4eCkEtWg
         mmLA==
X-Forwarded-Encrypted: i=1; AL+hErEY+ul+pXr0oCXv1HwnIp7C6yxG5BXNZgG7k+tISxtFahmQVJz7FvCAWRKxOHX7Ix3vo7CPxf1eUllY6vBFnuGA@lists.infradead.org
X-Gm-Message-State: APuU4Z/oBIsAsY3Ckfkl0lgncZKiQc9JkshBNegy61inziuu8/5Rtqou
	a/iBO6x/6S1l4s8oP00N+RcydWIDh1oyARAXA15crGoUzO5LHwAsEGXBC+doKnmiV3A=
X-Gm-Gg: AZFdTZeD/0IEyu6Njo+F1dvU1960VbWRCyh9/fNe7UV11Yedm2qNDImVb/9VJyqas1P
	bRokz3qfI4fAblpLpL94pq8ONsYB0MTzbnL9kPiJ1ICmihSWd7JjCHLwGG2lWnM82xe6LA+mQrR
	fDnbDrQzo+XgdvV4d0Q2bQRxrSjyNVTP/YePN9jCGG4Aw2Ojo4/ipLbc+7MxMs3jAiL2shiGaRq
	Rz/9QtEv2hqb+KGLHQL593StCc8o+zQ0kBQsNtWGqJfFR4SQcZknMax/JXJbppgGIBdiqoRFrNV
	iMModT6ItZ5nAM4keVRmXNmgYGMwgxwoegmo+97YBIdVYLK7MTEYZuzpGqOoSZeRHZuJyyKzKQZ
	229ioCKjJLJ1ibUh/rWR5bbVKIc+8kTw/NuwZRvlodajC07WNz+7fs3o/BGTFf2sMm8/4n2eYfF
	enY8xBpwt6ZWovNaAV894/hULEBXXqHD2Hq8MWOudBMarTx3SlPVNcSNRSJRvqHfWsSbhDhU6+d
	kyox6yYCeJ78XD4W9PUBGZ8W/RQSWrKlMRjQd0zxdYaivTdEmiMTl3SnUQz0OVqKnKlJJoegNOS
	FkFkA1mHamUhWfy9ceogTHpxNJsWIKsj5gQI16DUwsqdJdMAE6EsXCgv2Knx2S005JP4dJ1l/AO
	RPxVJ3w8WDy0csMprbgUq5Q0XdHiACxQ=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr227256985e9.11.1795448153865;
        Mon, 23 Nov 2026 07:35:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:53 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:38 +0400
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-4-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Y3Bw7NplLdotIeyq8DxbQXfi9QyNK60bhdpYvFiFdO0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHr9v1nCn/FUVfRj0tlAhtfTphs3SRcUb5NbPNnO7
 P9RiUCVjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6gJeR4ey7le0xbkstHy6+UvhWbMM1QevjS3cum716uZtCwvR7O60YGe5c18y
 71/vUnI9f5/wr00fOCeu9Yo72GPkkbvB+uuLkDhYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073556_098028_C292942A 
X-CRM114-Status: GOOD (  11.42  )
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

The RK3576 OTP describes its cells as direct children of the OTP node,
which is the deprecated syntax predating NVMEM layouts. It does not
allow a compatible on a cell, which describing the CPU ID cell needs.

Move the cells into a fixed layout, as already done for RK3528, RK3562
and RK356x. Labels and node names stay the same, so the cells keep their
names and existing references keep working.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 105 ++++++++++++++++---------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 7828736bf9ac..6f9fd73d24d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2298,63 +2298,66 @@ rng: rng@2a410000 {
 		otp: otp@2a580000 {
 			compatible = "rockchip,rk3576-otp";
 			reg = <0x0 0x2a580000 0x0 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
 				 <&cru CLK_OTP_PHY_G>;
 			clock-names = "otp", "apb_pclk", "phy";
 			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
 			reset-names = "otp", "apb";
 
-			/* Data cells */
-			cpu_code: cpu-code@2 {
-				reg = <0x02 0x2>;
-			};
-			otp_cpu_version: cpu-version@5 {
-				reg = <0x05 0x1>;
-				bits = <3 3>;
-			};
-			otp_id: id@a {
-				reg = <0x0a 0x10>;
-			};
-			cpub_leakage: cpub-leakage@1e {
-				reg = <0x1e 0x1>;
-			};
-			cpul_leakage: cpul-leakage@1f {
-				reg = <0x1f 0x1>;
-			};
-			npu_leakage: npu-leakage@20 {
-				reg = <0x20 0x1>;
-			};
-			gpu_leakage: gpu-leakage@21 {
-				reg = <0x21 0x1>;
-			};
-			log_leakage: log-leakage@22 {
-				reg = <0x22 0x1>;
-			};
-			bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
-				reg = <0x24 0x2>;
-				bits = <0 10>;
-			};
-			litcore_tsadc_trim: litcore-tsadc-trim@26 {
-				reg = <0x26 0x2>;
-				bits = <0 10>;
-			};
-			ddr_tsadc_trim: ddr-tsadc-trim@28 {
-				reg = <0x28 0x2>;
-				bits = <0 10>;
-			};
-			npu_tsadc_trim: npu-tsadc-trim@2a {
-				reg = <0x2a 0x2>;
-				bits = <0 10>;
-			};
-			gpu_tsadc_trim: gpu-tsadc-trim@2c {
-				reg = <0x2c 0x2>;
-				bits = <0 10>;
-			};
-			soc_tsadc_trim: soc-tsadc-trim@64 {
-				reg = <0x64 0x2>;
-				bits = <0 10>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+				otp_cpu_version: cpu-version@5 {
+					reg = <0x05 0x1>;
+					bits = <3 3>;
+				};
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+				cpub_leakage: cpub-leakage@1e {
+					reg = <0x1e 0x1>;
+				};
+				cpul_leakage: cpul-leakage@1f {
+					reg = <0x1f 0x1>;
+				};
+				npu_leakage: npu-leakage@20 {
+					reg = <0x20 0x1>;
+				};
+				gpu_leakage: gpu-leakage@21 {
+					reg = <0x21 0x1>;
+				};
+				log_leakage: log-leakage@22 {
+					reg = <0x22 0x1>;
+				};
+				bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
+					reg = <0x24 0x2>;
+					bits = <0 10>;
+				};
+				litcore_tsadc_trim: litcore-tsadc-trim@26 {
+					reg = <0x26 0x2>;
+					bits = <0 10>;
+				};
+				ddr_tsadc_trim: ddr-tsadc-trim@28 {
+					reg = <0x28 0x2>;
+					bits = <0 10>;
+				};
+				npu_tsadc_trim: npu-tsadc-trim@2a {
+					reg = <0x2a 0x2>;
+					bits = <0 10>;
+				};
+				gpu_tsadc_trim: gpu-tsadc-trim@2c {
+					reg = <0x2c 0x2>;
+					bits = <0 10>;
+				};
+				soc_tsadc_trim: soc-tsadc-trim@64 {
+					reg = <0x64 0x2>;
+					bits = <0 10>;
+				};
 			};
 		};
 

-- 
2.56.0


