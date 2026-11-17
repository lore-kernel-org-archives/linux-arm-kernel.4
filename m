Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7118606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rk5LzKV7;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORyrDY50;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOolzih2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=; b=rk5LzKV7DDifV0GtBhWoeyhB1j
	upWcO+24i4BG1TcvL3DW1s6h7VEQP0QdjCC9VOzoeSiyp3ejnxkoyLEgjU0ioyY4PYg1fqJ7+gTDb
	MZFyJpqCvLSxvyUhhNkMyQrwRlMP8tkO6QXJMuMvva8PgeiG6r5Xi8c7JC1lkt3npSzXxEiBUyVs3
	30FFvWlTk95tYRK7Q1pWtk9dH0YBre9yBC2NSe2QV2pD3z7DJrvVeus9J4joUuNjh5h0aBpaao0w7
	sURuBb9quK//E0HFNJ7hacBnd2d9V3KfuwEHBAbm+7v9DJ5gRXy6cPR81feoyY9sv/Sgw42V0VcCB
	u/qfeUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOn-00000005zFq-1UuT;
	Tue, 17 Nov 2026 13:39:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOh-00000005zBl-200X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:38:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1EnD198465
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrW
	NmU2ZASE=; b=ORyrDY50SWYvgMTZehL76oVezNq9eyfaXW928tJardHIF3FHmwP
	4iEJO5B0YNE5/ksTfUru6hZIL4k7OAkzABNPVnhN9SRnjh8b2LN5FNketEXSgvoi
	MrzV0zn5q+Rd2z19YVFCKJwe2Mm3fL/WC3MJ28VyHH7jc3ToyF9QUsvyiZwiG5ss
	nLAY/IdRYrN4QJbB4EzZJkKF7nfPixjtjt4L9PvSIXwDtWmb/Ij2xkZLQlKYDJ57
	LEsqimllkVdQWFOHBWw1eVuedevRBxR8CsXXJf2Cp1fIPXrOjWQT1v3Y2qAw9eck
	qr9xIF447HeWb/8u6SSwOXyUHknzDf+BxcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9yu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:38:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so530892685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922734; x=1795527534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=ZOolzih2Z+gToVsCtXcvPJrHgohkEx/LSiG3gLT5v8O32h0BxdCgWo+mMwibLwnQMp
         qDr1f269gA9g//AwS9Mkk9/vrHAgo7PHccmNF4j7oOxZuurNQ82x851FIzN0eIjlCjkc
         aH//dVYSQR7ICTulekLnfS+ENUJ2jhccKjoJx1IUmgVVAwb8SdXmt8awo/jSKBUSeqI7
         ezTK2PsSF3jssMZtBXKFC0/I4+yWK+jPpmYot29O9+x3FJGkxyP1HI2yhBRO9vs6KA0+
         DHeSxQRd0kHSSQE7nZv0yF+XDtUUBZJ89q0rUfgTCAM73huHwu9tejwSXkQu+aM1Qz/G
         TwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922734; x=1795527534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=Vgzcyof/MVroIXb3NRv4Cll7mivy3LhVTwv8MJria00YDrDnFTY2/k9K5m8ZHAtKkQ
         0pdPSq/mdC728Cl2E50yKk11+eTcnexDjr/WbLRS5/ci1N6rK4wNShsJ80p0T8Yob4pi
         zHgyoycc251102aUV5m3ZnT2hpzzjktancjgUfeSAmY+8lt7459BdX84CnrLfpELhKTq
         i0Ep/d3oa9dZFsPjOCDWPBM+OKSKv8LT//X+tR6OzCyNncEI7N/DbHnlylioICkQrsoQ
         Vw3F6eE8mnPSrfra5pqb7jk/YvCw3PI0VV5AjunZkrAFKPI/l8KoMD2u7BoirHHm7QCw
         Ai6A==
X-Forwarded-Encrypted: i=1; AL+hErGTMgF4NjFNw9RuX+VbbVYyuEhGXn4VfjtcY3FHn+Uo6FBGUuTtQcdrjbDnzYQqnvn0U5F5yyK4TC+2vKXHwvmS@lists.infradead.org
X-Gm-Message-State: APuU4Z8jnkdrAOAyKOHD9jW3yeUM1oKztnRHmGStAgUniaNgmJYjtPZX
	nhye1LEQge74U3FXUOifybaqA4oaAg4HnR1VgVixTtvKYhrU0BLIsWo+mRxGB2zXWXP+2FqApq7
	sCA2Ov6ceVgU7x/hZs/9KTgExXLjQQ/h+AdjBa8vQewuInRpYOI7cmSxVHk+sHwHznkHCciBiSX
	A+CA==
X-Gm-Gg: AYBFou3tIQuktaeSloN3jmDj/kjb+Xd3kq/vsp68My3LqwWuGQAvIQNR0dy5c8H0yyI
	28kKOJ3i9beUH2KsfustdmgaTMhoH9f8l0pdO3vtjlE2SP7yJ8dARFlkwPzPMnRWifF0gnBRLrT
	e5AM8TuM+BsUzg7AKyZ0gvSnxBDsO9lH5NlHu+9+7EgHElliO9hXFFj1KKy9JShR/mFsCZlJQ3k
	jskhSXqqD6EaUMpopi7sU6w3HzVslURLYMUwjBVRWkoub0752no22dyiFGjTC/z4aYe35bY5zuJ
	hdI7sAa5SGfQNmYurdI62R6boILoY9N4kQmjcbVrWDK2BVXNlNZajshx77y9BJ77g9sYX6/dMkU
	+IrcGQmmR6Zdq8adFy8iPUHJFrcJy13QbwwZfdUY3PJEiZDHN+LWbEj4Eb/UtIQ==
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984485785a.30.1794922733796;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984480785a.30.1794922733259;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: freescale: fsl: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:43 +0100
Message-ID: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jtq/IDlygP/FprCTQ5i3pNz0nbgIOtQrQssp7bLL7N4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/Fji22HTKu+W5BUFpD5KKd4WB6zt4bXBDx/Fi
 SunzOCnT6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4gAKCRDBN2bmhouD
 10yqD/9Sb7oad8D2swCZnW5cV1c8dL9ndvdVHdESXvlykpZUYTP1KeLcdz0avWe148cpbIfJLnx
 USjlpQXwlMUJd8RH9qqhr4pLYP9Uenpm4WZ2OOJgNPiz8t6Oi8B3Z/mKC03iIcng/gTFrWdExKE
 YD6k1xM9XrYhaZ6mD03T3OF14Kg28DoSqOgLdfVz7Brs5DpVFu4+I1jB7lkSIqUOQMyRSqKfVgp
 HQNb9+mM+b5OtefbF8mQNEmQMZtMsc+9Mu79HjNR4TmILrB51Qlr2ELyS6LFOf4UPWkzWwpJLgO
 LrHj94Gw5DU5GLgEhCQcdJqe8VlcFJ1IjtampKtn5u1xzbMggIeESHm0XnK3Nu4C7KB2UbVqfDv
 +MbP21NxWuifS/WElkye2yV2uKWesTkxVAb7a3mTekCPrGQ7h2GfozwQrPZLAqc+aVB+tge+lSK
 PIp3gNQTX9g9Z4W0s1gb2+Vb/xJg6mBJx4e/JKnC/RXla1yP/w0yF614A5z3Izink2gB7JRKEbg
 U+eWImoLq4Jv4itWhEGS32bKXscvyocIRqHky3rsT0ZR1f6l+astu1XqdT+L/wNXBWoQTTgsuin
 HHny+Z2BR75wWNorXQjmtz/6C2t6cSz3er88WM0XBruSklLYBU5//6tKrFy0O7wfoOtXskikFNn 5qYBbMzesNkYcdg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8dK1UtirvVjTVMje9RJE7qYcViDPhAs9
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc58ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MF8-bgRzfeo1eCVTD2gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8dK1UtirvVjTVMje9RJE7qYcViDPhAs9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX1u7QblcMWBhm
 J3IQ7eB6bvh8zQcYpGZWcX3++unZjRA8yfKbTxiniaWI3ue9fAOT+hqKCTsPpFKhcxxlBdQaabo
 bVpbAulYsdq1G+kpiXTST7CKgToXwbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXxdJwWdgcQH0m
 PafBBc5GVJlA6RrJGBeq89kGo3MIIevqqkA2HWtT++9VjmjfOkJ0AmjeYINvr/kk5EvEN6RSVvy
 8Q7DqGwU0BKN/UO1tl1XjmHPCSXsFU0NezL9zty6mzvWvzlZiNjvkLAsT9kL1oa08O8FfPjgckL
 FlJRmoYeFh+rF3otUV2z3RpX5Zi/Zo2VhtUeT7MQKZBqUAGTv8C+4H+zLmlmDRJibWBS/zs+q67
 m+EQcC6E+2A05QVtBYGfL+jKrfjvbmYpu2mtVdhZYoZjm7QOV/yYQClyDSa6Az36xtxYaLcxdr8
 AGmxn9iT9f2WtYScmbqOVK7lYtu6UyoObP7FbBKeROd9/eOqbVBAnrzPR4AeBvLXhVRyJgYPNdX
 X38Up2P2EyLQBxTRFN67VNLyJlbUVDvTkU1e43Uz0LGz+g6uE55gqevKOIUkS+jLcbpgo/UcjLi
 YnM7kq8qLQ7vU8Mswww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053855_654990_CFB483F1 
X-CRM114-Status: GOOD (  13.35  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The dpmac, rtic-, qsgmii-, rgmii-s and other aliases were never approved
by Devicetree maintainers, because they were never documented as actual
ABI.  There is no in-kernel user of these, although there might be
U-Boot.  External DTS users cannot rely on undocumented ABI, thus these
are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  4 ----
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    | 16 ---------------
 .../fsl-ls1043a-tqmls1043a-mbls10xxa.dts      |  8 --------
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  4 ----
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      |  8 --------
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      | 20 -------------------
 6 files changed, 60 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index b07022e3b6d5..7e455600f8d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -20,10 +20,6 @@ / {
 	aliases {
 		crypto = &crypto;
 		rtc1 = &ftm_alarm0;
-		rtic-a = &rtic_a;
-		rtic-b = &rtic_b;
-		rtic-c = &rtic_c;
-		rtic-d = &rtic_d;
 		sec-mon = &sec_mon;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index e850551b16ac..ea4863c9686c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -24,22 +24,6 @@ aliases {
 		serial1 = &duart1;
 		serial2 = &duart2;
 		serial3 = &duart3;
-		sgmii-riser-s1-p1 = &sgmii_phy_s1_p1;
-		sgmii-riser-s2-p1 = &sgmii_phy_s2_p1;
-		sgmii-riser-s3-p1 = &sgmii_phy_s3_p1;
-		sgmii-riser-s4-p1 = &sgmii_phy_s4_p1;
-		qsgmii-s1-p1 = &qsgmii_phy_s1_p1;
-		qsgmii-s1-p2 = &qsgmii_phy_s1_p2;
-		qsgmii-s1-p3 = &qsgmii_phy_s1_p3;
-		qsgmii-s1-p4 = &qsgmii_phy_s1_p4;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
-		emi1-slot1 = &ls1043mdio_s1;
-		emi1-slot2 = &ls1043mdio_s2;
-		emi1-slot3 = &ls1043mdio_s3;
-		emi1-slot4 = &ls1043mdio_s4;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
index e04483fdb908..76a07a0030ae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
@@ -19,14 +19,6 @@ / {
 		     "fsl,ls1043a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 48a6c08fcea8..8c095aafd596 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -24,10 +24,6 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 		serial2 = &duart2;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
index 43261cda3fcf..e50469c61482 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
@@ -18,14 +18,6 @@ / {
 		     "fsl,ls1046a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
index 181eeab55aa0..d704aac8d9b9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
@@ -19,26 +19,6 @@ / {
 		     "fsl,ls1088a";
 
 	aliases {
-		dpmac1 = &dpmac1;
-		dpmac2 = &dpmac2;
-		dpmac3 = &dpmac3;
-		dpmac4 = &dpmac4;
-		dpmac5 = &dpmac5;
-		dpmac6 = &dpmac6;
-		dpmac7 = &dpmac7;
-		dpmac8 = &dpmac8;
-		dpmac9 = &dpmac9;
-		dpmac10 = &dpmac10;
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
-		rgmii-s1 = &rgmii_phy1;
-		rgmii-s2 = &rgmii_phy2;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
-- 
2.53.0


