Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MYTxRJvJ;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VY1+KbZ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=; b=MYTxRJvJJZxBJG
	MCBZlJjQV4D7kP7uENHxQQNBCXW4daTDjnKw+P2iseddSGUmCdP0RJgLakx8tD/rTXi1F7V9jkHrE
	pPFfJdoCVd6YLxfiSH9p2WGln2KBo2G6JutggODtczRA6UUfV9k7pOBWBVP+bMPz4P8DIPppHKKm0
	iXF77AZyUNN1UF52gYJ28DloHaQ30BypPVht8NWoNjHItOo6J1PNBAMpIiD8NyoDcduNYd38A9UeA
	yZ+ziJnAg+riRHcO8nw80XdDoc+C/chsIzyP9bKIGGWYxTVuS4BgDkYE8Y+iuKCYiAe//mM9xKzD/
	RzckXtbefMTCTMO+zCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGx-00000006T3Z-3mYP;
	Tue, 24 Nov 2026 12:05:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGf-00000006SqI-3cIX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:05:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so40269825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521900; x=1796126700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=VY1+KbZ2Pp/iQFpJ0ode5PRL4Lypm3jbu3ndETY2nJA2TWzgD4Tk7ttBwgf5DnWMWA
         3zYRgqQKy8tY8ufTEzF/WviCQ+wWMgOy5UIp3dnp5pitbGiNJJy+B/xtBhmhrZHa5ZhQ
         KL8khJruvQ4tqT8tUURsBTNNyDanTq7S8sj0OPDOlTSUxSFUjlKimHnLLB8ezCps7li1
         MjD6Z8bJJhoIS3kuX0igZoF0wlKlmAwZipJbggyFulm8ZXY1888GPGYvzaP42dkapFlS
         6W4zTwNpWpOcz9ycIqLkhWT4L77gGYgt5g5bfm+Hs9UEG8MZDCo1s+NrVxhaKYsGQhGT
         FCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521900; x=1796126700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr5AGl2n5OMdlwfzUx+Xnt2cvomNzozcQctK34Lni/M=;
        b=WcelZJVFbf0RRjjLRz32iZEuuGossgYnLscHySR2SeUVQ+IJM3L4FRQ2DlLuqUBIqv
         ouzCbxm4BmYvI8jenca/7kvySLgyynPwZb4ZaNGyA6/w8BxLqn+i8GGB9O6ef/JIRDWh
         TQvuZDoB9INf+k13X0GvK0QgLWbZEUEVEuzfve+SKuUIx34q3T8BAVRIua7g5VaJLyzh
         FN2cQrBtwJZI70AEbwlgz+NN6enDq9buHvQ5jhrVJJcB4j2LRpbWW0BA4i2fjtH9bET+
         cQwWShgi+Gh8Jzq73FqOdP2tpyhuXMEfedAKuwREjoxwLuNbszsK5vCgn9Qpj6HkJi9y
         Lu5w==
X-Forwarded-Encrypted: i=1; AL+hErFo88T6ehkmcBP971qMV2alIuKporC4fvNbIwny+sjngsts7SarLJ4rWoo+fPRhlGXGWxMzIEu3Gv6fKcbZ1otE@lists.infradead.org
X-Gm-Message-State: APuU4Z/8yH7e40p9wLDTRuhU4aVmm9hlN446tJL6PsmsBL/1oFMoQPlf
	LlW5wZIwaGSj6v1g0Id6xwKV2RTtRC/n325dbP3k3G79fObv6Z+KxKsqUeKIIg6VLfo=
X-Gm-Gg: AZFdTZcEqNJrWWaDptztHhxCVo592TnTXyvRejcowfBqKn254Ff1j6rTtDCfDDU2zA7
	YCqQnPAgqx84w7K7e0fl13RQkee5xXexWk2Uw/+ojQGbcfl4ESsGzZti26qHrJj7CSnK8okeyGx
	io4tBfaF6Pua/69+JyGDOU1Lse2aUomUI8Zu062TE48qe1D8tfjUWScbgiRXEiLutwtMskEOgYW
	EjHa4Xn4H6b05Kj4tmxRq08L9b2odlgVPHYTK1SDDIIWaYHUqBgC2O0YIm1YB4mzJTf07757sn+
	a3uMDflk3DBGtSats/PYh2lKjAK+5kpIoiU5VfaMZN4CxDUNbk8wUdjKSaMZFRbJ20akM65Yafu
	mpKXuPNgTNkf1QQ2IeMkVgqDWQNAo3k3J2Z8cVtli96YfBm2Wdw5798BkrGZHC7F59INiOGcZqm
	5K8akBQxlhEz5SeHYl+DGQl6IUYuFeQnj+j1NdXh4FVhdyRkVqeTmEZwjjzSuXLjxDD6Zn2Dxbo
	hyvTKffdnSuGf4Hl6DszsawYBppF8w6eJwChUue+AYQ+zidVDjYvrs3O+TnX4l/WY1VcAJi/4g4
	TK8ye0GjC6abpGiwo5jNBRmQ15gSA0U+cD+tBmZH9P0uPgaDkFiX76uonXOv+W3ivJhbC5v5CzJ
	AR5VDEsAo
X-Received: by 2002:a05:600c:45d4:b0:4bb:5df4:685b with SMTP id 5b1f17b1804b1-4bb88926da4mr301154315e9.23.1795521899974;
        Tue, 24 Nov 2026 04:04:59 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:59 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:34 +0400
Subject: [PATCH v4 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-4-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=oXkReYjuRBJJEs/g0N/aMbEdzVAIdJ9dL3E3A7d18o4=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGsFfVOivOfscoMHqoi9KdDtun95SdREb82PVCcEFUOY64Zhf
 4iRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmsFfVMbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlQGYBANJXAsoV80XhmY0ABFCPYE+3R+pLNdhp9kiVyFXxZkK
 kAQD78SkyhCxzire0aGFcntiaEg674+eFEuXsC9xIsic2Cw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040501_986346_D70FA93D 
X-CRM114-Status: GOOD (  12.09  )
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


