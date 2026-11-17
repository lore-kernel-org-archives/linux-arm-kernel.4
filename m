Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD34606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0v0gIxAZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBBRBnJm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=; b=0v0gIxAZve25/P3RfdUPI/6Wq1
	l8hv1YXuYY6rAXsEluv1Y+d2gGvXji53vuoPmx22CCyGPOty+23EVFXZ3TcnNxH//rQcOXew7QLh8
	3Lm3WUvI4MDUnrOvhlFjqd2lW7b4upIPeBxWIHI1fdliZIB2CSee4zgWeKVibiTlYyp8wgzi31IrB
	rCZPPGHTLBXkQ0GTKVhxnLGVsSa5Z1F+oYBC38npmB2Nkp1JkEwdfHdzBqX7hYLukFT4vaC62etM2
	0xiXv4KT8XbIKlqrwk2/XMBhHkXJBrlobfwQbyV6z1URqA1aJ4TG7xVtGtxYRMDUUssS1C8TXukLt
	6Im8dmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIt4-00000005p6c-0MqK;
	Tue, 17 Nov 2026 13:06:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIt0-00000005p5k-1Azb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:06:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1Qig467013
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=werp+leniNoWoVq75RHzy2154GOYJfG48Jz
	VEy4bJ6A=; b=oUJogxAMZln83g9iN2+29I1+sQ7inyqOcEuTtGiTvTofZfuXzfj
	kHfQQ30DSMBwH7QfbCU3+UP43rJdjF9wPEnT6uZrwREWeJeqVvlicBEr0tXoy4zt
	MTacoo47z8b7AXPVgR5rxCO4Jorfpm6Wp0WKI0sOyvmoGIBcLDSvuMVvZeJcOs9a
	GDcUveMK+NtE2BBLr5pVRrYmzTxEFo2ZPW7PwkiuCETYex2XfyKay3fxh0faGzTD
	7Vj+e0E+jDHpFZ7BlALcw91Wbb/pg4yOTEZisaafA+bFIzbJfywvQ5PU1DIFwbBd
	oJIw7hAoZYk8+mFIfYJf4HF2tbVgxK45lvg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htk7mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:06:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99081ea787eso1864899241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920768; x=1795525568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=TBBRBnJmBIb1sk+6ElZz9OtVs5Bb2Tlu9pLcnyIUZUzYmYnieZHepsVMtC42z8Atiu
         SCZpFxVmd88W60d2kwPhpG6Akiws3jvqBCgmwGUsItT5Xm6UiiIkdDTc+3D7/QCvQHX7
         nUNwUl+p4gYolGtz0zVl2pi/oyogvTJt+t8xt1daNtl4ICLgu3DqGcGf53ArPnIsJWq5
         GKBLBtEmei0dWU+M3EC5OTTAfoJw8r3jxnA3A1NkYBDC/boJiI+rogl+mcQOonjz1QW+
         VC7JLX6yvd4ieHwAXo+uMXx+MUaAEYOMsMIqMaiQ9vWHaMFB5qJtGnJsYo7D6tLaiUMh
         b9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920768; x=1795525568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=1vvD4znwc3fJBNzo/9ixzaSPFkdpOCx/9rh5eq3IVX5gGgtAgkbnk15lGGUjzrqNxR
         RVMqrAQfiNWFA6NI2pu8j+MH+uRO+Qj2QLzfqu7hk2U2u6SfJSnl7cI+8MNzlekvDCwJ
         i2udg8g8Q2A/feamABouqsY4lHJCRESSwoLvogEKyeYj9QAEuk9koILKMuC23ujzADok
         5DuawSjWsoxFyKmozWpCKphxoipadQgs4GHLhMpLQkk+VWnUnettb/T+cvnvmZ4VSzlk
         uymzXTSHynZU8egGYG/ChMd3qvxzkfO8uZ6gG6l5/UVLQMmaytthznDEIbMo62/5FgfG
         DW2A==
X-Forwarded-Encrypted: i=1; AL+hErHJgC+Ks65V+IHEdDT8SRPnlKtK9ddOVLGYS4fcZueZRONd4MJ8ISB9Sj8AOHPndnaGwLvnYA09v7OiYyu6xWvX@lists.infradead.org
X-Gm-Message-State: APuU4Z8fqg3FqPJ6k3Huw/VttASo6h1HQt/EVyznW69zoOmJYzS4ylKm
	MVNPE78Bn8TX6SqeGL2YjfEsfEGrUspIylLPF9oMaL/FJUyIySb176qlDiR7wR9nAYw2YlmqYGR
	Hv7IfnKpSlVkK34ySZGG2X1VJrVzsk3R7GVHmqzH+H4bRB+v/3AzkUTtETKpYJWljvXIePJiLMD
	xnAA==
X-Gm-Gg: AZFdTZck+xh9JO4zzoOxtQ+olw8SnSWQVro7WYKrOAdC5VanJS67L5U1jCJbSDeSjlu
	B69gsTv0QFQenm+/S9K1fvfBpRRlh4GQQ0YeDpDs33jks3d/0R6h4quHZSTfNg/daoMLL5Kt8ff
	9wBv4YpnqmbiskwqruL4gt6W14sAZIqeX+tQn2xzJle8fvvKLsdytPSKDlbaN/C6z1yKHVt9wH6
	U7LoFvyKk0tiwcd172ZrHvWAvJsNnKC3mfVnK9IkKFKTjLVVWDT/JLeCj1PtpEDiDDUdyQEhAur
	rKGd5GITF14br4u0zL4/vqq91Bag1MuPRTUW+VL/KFLmpqYpOh+wDcTndw84igXEHTPBxN6aL5P
	pSmU7q7FJ5uW9OTCTaLyjO9N4JE/mHtpha+RjPh2jC2i+wRW2BmEFYpe0VN5rIA==
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929160e0c.21.1794920767887;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929113e0c.21.1794920767336;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm534082166b.56.2026.11.17.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:05:57 +0100
Message-ID: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhAQKSi0UHwGaRwXw9Ozbf6HX68wW/ZtNlGPzsJLQPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FE05ytbYP2204OYIuT2UmPNOZgaD/fErFnqn
 Yehi09tgqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRNAAKCRDBN2bmhouD
 12y+D/4/5qerQxe/BEAJkh8aESGtkmL0OcZVuM3sOQgqovDF88ovrnq67BZoRD+ZOenW68asV5t
 uLd5WnWNL/naLPXAwBgivabqWoY+CnkfnPkMbDAqhbXuvGV1xL5XNcGhMc0iElFhS94biszOgds
 NRQlYPKCYEZoEuEBbleG2vXdARzecRe4NSDQo7cjX85X0gSy5mcjqEGJuwa52CGOsflhtsFmE5Z
 vQZPFy0Ffqu0ZdjItDPr4u+b8HZfHu/u2AgxSPGw5l67u5D+Ir8MXPr42YvfpLkhSmlS30Y43RX
 PBW4cKZ8XMQfYEXVhU5PSZyEDgZF53u57IR7TO7jOXklQm2mMZu6hsM1G5J8Fv5O4bKL7QcmST3
 V3AiqRHZ9KRp8oPuPVclwIOxdK7cAA5w4xPNb6y7ZbGo0+JKsz0UeU+RopVx5UHyNusSSzY3Z82
 GIkj06gwBQPdWcOPdcpKr11R7QqrlLlXLZSuNcVZQMj6AMqfA/RBeyYz1+610GyNOQuJdgRre+a
 3VPqAJEZto9ASmnUs1Y7Q7hjiArQzim6ewz5vmb+URjaNboRswzapn37mJQLng0f0wNlhkvFYz2
 XWdDJTL343s+bS94gfF8Wi1ADmuR53MrjwysN18+Qz2y33wR2MDuYt2dpnw2reKJdmka/j5jckn sXVVx3Ey+/h4nVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX3Q/WQ57ryxV1
 jr05LGRwrB5Iys2qgCg1PaFAOj4pq9jUExfk7wftl1Gk+vMFBLBD7zRATbXQjslPDhrzsbQQkgb
 tkkGRmp0nK7J5acXZO0jn0FO78vxgkc=
X-Proofpoint-ORIG-GUID: HUvSeVKgVWHYODGRuPDh6gO7UGfjZUOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX0cC5B6Ve12Py
 r9jDwrnWXVG7RaXNXqAKDjskHlh+DdFFIDl6fPnp+yI7hWHoZTSQTKTvdvpLtuVFg8K05pu2MDD
 XckURNjo+2dxInsXvZ4m/0Ed91zBTkZrlqf69KdgTqGQVArZpWWlbBXnEYRjo5ZD1pTUnuY2Uoo
 jmCkPy5+0/WoLkZkgwQrHL8ppg7LouzBpEAtthFpuCXVL+6CaIUkQYzaNjxE6CU4EYLnlTULOyp
 srgY+tcpAF/SptBR+XTgHwjIiHZSEhem40SXCGXovgeq4cKUA+LSk5vkshKOlYFcwlW5F/3gysT
 BN4PDCf/Q9DUCEJgi0Sm6efvsh4gEPIsPTyBNQGiJIri0GRKytYxBsp5vmD0E9KjWyuJpNtEJeb
 la+t1OQF3Dgo8mL2SpvREPYI3OCEEVnER+cpJXY9EKJMaRTzbsFWDM8TLrUprKzMvmtk36V0DiH
 egsH5SbRUH2/PcF0Adw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc5141 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MmkPf4a8AFjUc3_LGQoA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: HUvSeVKgVWHYODGRuPDh6gO7UGfjZUOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050610_322639_4780C633 
X-CRM114-Status: GOOD (  15.31  )
X-Spam-Score: -2.8 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
approved by Devicetree maintainers, because they were never documented
as actual ABI.  Drop them, because no new custom aliases are allowed for
years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
 11 files changed, 126 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 6dd706b27830..971fb19e95df 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -21,23 +21,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6ec50125cea0..868b0fb84449 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -22,22 +22,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-		mdp-rdma0 = &mdp_rdma0;
-		mdp-rdma1 = &mdp_rdma1;
 		mdp-rsz0 = &mdp_rsz0;
 		mdp-rsz1 = &mdp_rsz1;
 		mdp-rsz2 = &mdp_rsz2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7414c10ee664..2c3836555e55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -35,11 +35,6 @@ aliases {
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l1 = &ovl_2l1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
 	};
 
 	cluster0_opp: opp-table-cluster0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 621408439ffa..2f82eb532f30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -22,13 +22,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	fhctl: fhctl@1000ce00 {
 		compatible = "mediatek,mt8186-fhctl";
 		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..883141d8a6d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -9,7 +9,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70c..f14b23dd57aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,39 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		dsc0 = &dsc0;
-		ethdr0 = &ethdr0;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		merge0 = &merge0;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		mutex0 = &mutex0;
-		mutex1 = &mutex1;
-		padding0 = &padding0;
-		padding1 = &padding1;
-		padding2 = &padding2;
-		padding3 = &padding3;
-		padding4 = &padding4;
-		padding5 = &padding5;
-		padding6 = &padding6;
-		padding7 = &padding7;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 898953acdb61..bf5893e3002b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -23,14 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l2 = &ovl_2l2;
-		rdma0 = &rdma0;
-		rdma4 = &rdma4;
-	};
-
 	clk13m: fixed-factor-clock-13m {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..389fb9d7ea89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -23,30 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		hdmi0 = &hdmi;
-		ethdr0 = &ethdr0;
-		mutex0 = &mutex;
-		mutex1 = &mutex1;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..4b05f6a864d4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,19 +20,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		aal0 = &aal0;
-		ccorr0 = &ccorr0;
-		color0 = &color0;
-		dither0 = &dither0;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		gamma0 = &gamma0;
-		ovl0 = &ovl0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..a938539c92b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -21,7 +21,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index f2ad9265be31..d70bed80274b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -16,7 +16,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
-- 
2.53.0


