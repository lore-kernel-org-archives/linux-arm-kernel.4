Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EC6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXgTyS6m;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ac7AvRaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=; b=EXgTyS6mBDJThD
	BVTh6xcyqOxPa642wrB1BaZB59GfTh+cP6MBo5RrLvG5qTQfF2/D+JS7tE/rVLeB2Ago6FrK2CMwO
	v4Efh1Z0roG7p/ubfuRgKRsBejqh8V+qiJgZ7z88dvd19unemfKO+ZYkOKwKBSobHxJk26Y+hVjQF
	4xRAM/fij9HLpuiokqW0rBEgHGYAwVFsdaoxqXxE4E2Bwfkptl0iWFEBYOqePt07X2h/Qf18Be7Dg
	yClWLP7qiJmMMc2P4gmU9olIAkJ1bNckbTdQ+RJRoNl/RGd0gXszJUzaE+FZ8XexgIiO/w+yTsKZS
	Cv4GdLtzZ1qUZ9k+yF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIoA-0000000BAOH-1UEw;
	Wed, 25 Nov 2026 19:37:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInk-0000000BA1t-3aLi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:37:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490d59c3edaso4231958f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635427; x=1796240227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=ac7AvRaQ7V2kEzDTl+4i/yVyQHa+yxh/zmyx7sQ1iLGgzlKZmhDyFk/biIgc5kWzd0
         5bmWTGTN0GaE5bJG9xV0Uvn33bIDgpvKGnoflZWF1Zt/yNwXgIo857lYBr6g5usAbIhy
         vNnNBtv2pUs8QsntWl4fcKY8ZbTl2E9DNHTqNMLCQhT1KFUWl+yHdAVlmYGsfsYERAD8
         HVQ7k37ufHdZKDq1RN6eUu6+kcaXHQLNs5lzsfuovAryu5u/8yqJJMu5eTkxRWQLe7K7
         +z7cf0Tw4x8XmK4ncjYeqeta/7LgfLpVWNDzX3ZiBDQjZq1Qgv2HoN51J51h9rRbWEGD
         /Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635427; x=1796240227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=lHvHW/afa8UKqmi1OrGRYoFo7UjUQ/Stm6fcYCcKTCwumKp2/zHDmkZoJGd7uzG/nz
         opdFYfjRLudJdl7hX1G2K9Wqi0n83zYKoKtfuboohyGDDqsmy8IDvRZsVdvT1DNgzvk0
         6LEVBvchV2tYb5vjKEY8m0IpE9her8FGH7x5wsJH8F4QvK39+W/PjFRSQlyrBfU4OfpK
         t/g/KeJVEFrri06Ig1K4b32+epB0hOft0W602w0NXAz6m1bgFQACOq1YZ4n/Y6q+hthN
         naaXk0VHTfFg8S5zv2gfB1uusnVpHi7i/K5H0gzdutOkufHRxJoMQ/88f1u89kqABlwt
         zmgA==
X-Forwarded-Encrypted: i=1; AL+hErEp4uHPRmPEf4zYtqOIJwP9cZSzH5Ze9DPDwJsUDRxUStvp4/XVqwNqJ9Wn0KXphyryemBL305H1WZ3Hxja+eEb@lists.infradead.org
X-Gm-Message-State: APuU4Z/M0Y1gjXbCkX5cqHU/SAehMHR/kRWyWe1ehyw5BRUMoTk8FdSn
	4J+1uysUEb4Accsnq8p5vlUgVFOgPToAhYYwxIWELpusfIVfLF//AGypNzS/CC77gJc=
X-Gm-Gg: AZFdTZcrO9fAXPoIjUr0AqQSCXgzQXXZaE7iqVPiWVxswaQlebfOyIah4jo/eSJjh7m
	ymp/umwovNlFekjRgklfyRfaeejW7tdX1mWBf5qmjuV9ns1Ugsud/ASTUF1tTNQJmLHmNyVvSyd
	IYl5XC4eA7Gy+CiOOAYEY4n6goUdlgDfGrlWnXTb6jFkzevXdt+piLLu0Iayp5a0NOGscCxi/Pn
	vnzohkyQrqXUVitP5Peho2WYjiRVy9zlTDLZ7FziblOq3BlkUtAAgA1bfWbKfrL7/oMla2gAybM
	QIwjNaznlQViQ5mSfzfgPbHh5h9NpBcyXx8HE/KT/smjl6mfffJKuxDLjOaG9Cl6rhij9K4H6Vv
	i0YdEAEtXOX0wrJWmH8iLiTGGr7FFiV4DoHd56XByljMUoeJhNkAgC5EdCrj8bOmgqwbwKaDATd
	1GOd0yYNH8sKxio8wtNyVHLTBdgDrwJzzCCtq1JQl0XVWwBltsVPrBF5rhBLcF0i47rH01Hbmnl
	aBmqA43gu2osXKztMiFaQLIQkcFhlrqD6l3hbiNGePoM/ImfEqjXiBn8TSi8rBOjG/Y74VUjYpR
	X29Aqn+M+/XrnUR35174o4sOrj0DrTDYIzwwxiBc2Iw0OUw2GsTl3L9j/pcDYn/C195nvi//HG6
	vW/jA5I3UiA==
X-Received: by 2002:a05:6000:188a:b0:4a4:da59:aa60 with SMTP id ffacd0b85a97d-4abab4f5aaamr36933216f8f.3.1795635426983;
        Wed, 25 Nov 2026 11:37:06 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:37:06 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:41 +0400
Subject: [PATCH v5 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-4-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXkReYjuRBJJEs/g0N/aMbEdzVAIdJ9dL3E3A7d18o4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5xVaDb6V/mwdXXj4g3C817vE1xzUJyLs/rkPpG0z
 7sSDK6v75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJzYw/C+1sbB2ad93Sdpo57mgtQeW37eODV++MbLXuGMyc85BphUMv1n/RBY
 viI8NXqDlb8XNWs7KvdBreTcj7x0P3yaN+movNgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113709_039941_BA8B0100 
X-CRM114-Status: GOOD (  12.14  )
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
index 6f5780af4192..2e83a73ddbb2 100644
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


