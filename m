Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HiytmkFt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lm/6J2bS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFSNLzEU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=; b=HiytmkFto2481BN6daTNk142Zi
	hsPp3OcC98FzHUcJ/jy+jbKkTgWiTWqAsPUvTQFQp5PPUPxm/w8gvpMnjhW2u9TNYAV5YPsLUsOPD
	cRlIP3ynQjG2boH5AmrmS8+F2kupmBlf0jU6l5ncwQgiCUd3rjQi6M9s0mwF5Dh6ebxiPIP+EVhD/
	GLOtz9xPDhoyA1Xf27L+/gW+qNP0cwBzL/xcSunAfTF7Dx+1gTDwzkt0/EC01Xrzi7GXEvUWlNKWJ
	7D0rHej85rfcqpLhmLAQAR2ejMkMAHeMpzmjGd2+UL/FQDZ9wP9aJc/FBpQ7jcFQk+pPIPhclnvtM
	NXE3OASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOd-0000000E0oB-1CLK;
	Fri, 13 Nov 2026 18:53:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOa-0000000E0ly-1PG8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:53:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXKIX2808722
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbV
	iJr9j8Gc=; b=Lm/6J2bS39mi/8jY2nPG2dm3lnkbva2OlyFU5v5htN7Z+k1UFWq
	+SMZzkYnIBHErHV+xx9G6r7BwGbGaQ3k8veI5kUPN7Y0wWaEMSl58K8GNb89kkJl
	HdjlH9WRysOTCUGt0U7kqFPsV3W7n7T7ENO51W+v5e2UhU7rPC5CG0u3ilCTzduN
	tSV09vVpzYf6IuhhrhyLLTl3vqmdsiJF1NPJOUzZkEdYxhkVCaF1gF87pUVZNnY7
	147r2RaElUoiprfO1tUyxfd2G8J33KocaS0Svp0bB38k4zPSqtbCs5adH5M1WUco
	NwAvy34cS1cCEq999jwla1M2bXLPnRwjz/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rgcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so141922585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595979; x=1795200779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=FFSNLzEUhSTJStQ0kBemGLxS+w5dfgnQ810Hz6KyKCb7VLQT3yAHBDRjAF7QuJsbIE
         xZrPFaFLYOzy+Kjxf303YY+t+XYi5VDDb+kOyO+jYd9KykVLMG7tJ64LJ5bQb7zXz07W
         8WnE49MOIKPiuLqBa/z485t/CZ+LKQFXJskOKL+VZfmDAapjXBxxeTfB/g6Qn0uk2ZfL
         h6GCyvRqLCYpD7S4QUG6CzkxzApGJ2M705GOqVOCDG67yYdMfKpIBcwgIxNtqT5iUYPM
         pWbNj7bhjgUtk+V03Des8dnHKr/qgQqZsX0vZk3O/C9GfvQrA4Lh/PBabHnG/MAV3H7N
         I8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595979; x=1795200779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=wgUhRkSqin3/VobN+Sc7qcwna946RtlA4WJX8vVvmGASC/o4ZFlMQrXEdueymLHLjd
         J8dQ+hN/1Itk7ObJFidahbGko7+vIUvsbJVqpADwzFJI4HOFaqHjM9WY/gjiTJyuuThK
         7XQUUW/89YAX0IU/3ZJVWFmqfpOQ3WuPP/sx8NMlI/dNv9XT4VNPF121K6ofQQB4W9bH
         HscVGJfRq0uSpCDfxX8uMQq1JMhXfhiylcJAOszgwoJtJ1+BmW48Bc+uFqAP3teasmQ1
         09RbLxrJBbfe0OiBPM1wUEyR8kUkPpnmU2X/In6TJ8CJvTrVL+yl8dgCQLmc9IEpgFiz
         Sexw==
X-Forwarded-Encrypted: i=1; AL+hErHkDspBcbMPG8LY3NYGpRnwHjDGT+hPaAY7Z9BCjzfOWlfgh/h1LLbQ+PJlXjKrRBMvVTEgw4RZ+HnjIcs8TkWM@lists.infradead.org
X-Gm-Message-State: APuU4Z9Suym+ra2XJsPuV0t5yecjntS9Wj+n7eoVE+GP7iLpj458fJP2
	6Nc1nHiGvin7OWXMdS/OkXvBg4+8B3CkOjNE1MekemhiE4cArViOJuO1BC34KwqTK9wfxz2JPr1
	HIkOhDeT2SGDZZnOZMcT9CTx+ANFIESajlhG6SM9qHAE3qmRstSo55N4P51kTlkcSEzrRcoMpeR
	WA8g==
X-Gm-Gg: AYBFou209UsIb7KMpNDdozhlKMZA0F2env7iG2h7VPgZUNT3EzfkeZWrKTSX0J5Vs/9
	n/2mCrcdeVxe7v/j4ZtXWQydDqoxwQ+bxN1+YL1up7zJ5SrNHxVO/BZ4upZO/CM9UJtSOS5PbnN
	J3EoUbuBFs73UwGum6uv1Cpp5xRmJP+bFJ2AOy8vqJW6AOaWwe63y0cPiclTCx4sKclxRn1L1Vy
	JWN8Opyu+ygnDoaIntaVWyAzBiERUAWu8Wjimm0rQlgZhWW7Ixl5AcP+YOrxHQv6dA8w11QOwug
	Wcmu9XSaweFnoMC0NSkjmegL0a9if4W4Eku5FhdJ4hI8AX7rVylBRdsEBL6LPS3sO/u+9M79x1l
	3Gxa3vWtIefDcMnDKYwLWFY4RutfpDzAOmWfVLWvFOZQsySjTFCPYgvKkLgGrqg==
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538295585a.49.1794595978768;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538292385a.49.1794595978290;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm6535092f8f.58.2026.11.13.10.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-var-som: Correct missing space
Date: Fri, 13 Nov 2026 19:52:50 +0100
Message-ID: <20261113185249.182956-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1VcRjShmzCQ/6Cz2ewufNPyK79L8y/bvbj5XBbIuRWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yB9mfjVxuCnjLFqn/EQtVvQdrxrUog+SeF6
 LpX4Zt2kqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcgQAKCRDBN2bmhouD
 1/noD/9qIfUIFf2Jy0gYgD3G0FQh6Gfhyes/OIXK6GH3K00hUzaCnLx2sOdcB7X/eGaE/DGCI2Q
 ueVPJjh0aeW9e0b39t28To19w6h91BMmWQs7QXdMw57eHoblL5XuiZhWdpEArk8T1OwtpPi7UBd
 G65yi9OxENzJFD/39n7uQuT5yyEh/iImHT+Lb3KRe4IWYG50OSTWaTif4kVHZpIbt6GPU/ZVzeV
 O0crC6INkqL/sM9yRb7R1se7XGfL1hkWb0Xgm6vDPK89gYS2BdFpuf/SB1pF1xz6ktjlsNCQYl7
 UZbL1dIxe+4ClpdqY2iSnWl58QTQ8Lqr1ouRe9BpJYtoN+G3DMGkyOACfwPTHBqbBq/FK28QUEh
 6pMwA1I6tvmcuoSEgoxIckg3EZSSrGhDliEsP3SEHl/W90CqLAIjkpkW5Fa3ejODyktRqMR4XMb
 5pBqZSC5+ZB1GRYH5b30jgsed606JXrhzm9OjDsx+UFIdzk0BvlwBwPpqdCJ8RqN8jGo+uvhZ6M
 nreKwd/rUcAmfcMSgAgrOiqyIwiRfEUSOAe6Eon4VpU4yz5tjB13o41xZ0NOgvgAGqKLN8HFPWP
 CSf9GbQGFrFYTBl6bGDh26G3j+qxef5UN2eVOPvcoBpsSRoqYmnUPazZFk/JZBG06FqaXu01VEf mK8gKp76XYPsL5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lg1Qg_TOPXZBcO6KXf55UV9vTfj9HO7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/JwGbCBVPU7M
 RP+t3SpvC/ADth0dO/gytLRp7Rpimbq1qtn/79F0EGgXZpuvASZ3znoziUpLRdhD5kc3dHnZ/6X
 jg/PcJPmOgDeHKJ+0dOMoHjvNd1WC7TEyuIWhb74dA22jD/pWMGfMS+pEk3eGSBl9GZWXF7woKL
 arS84ylYUfuU1yVkGBEvVTIzfkjK8WOQpO70DiV+Nwtm+tKDnWJTf93QSttiRRb9sm7sxVoPOmy
 yg9RUhlybhUs1Q8hy0zjB5Ymob4gfRwhXu0XWUXnS7fmpgRxDfpbDoJGDbit9uzU4g00apeUSD4
 hVb14hJDnPN5FMmppqswVMBF95SNZ4hs6/kl4c0O+Tj4xiTITl7S2jM2Ilord//i36tmw+/Qv/k
 ImXvfR6+CYk/lJV44H5cogZmn0TaDas8hWzjq2ok3f37+fFF5rZN1zUd0wodSgLG6+mHCyw9qVm
 8pucHW4A+CxGnqCWYKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX4ZngV1jbKIk8
 cBzU58ay6FD9/daVWSz0wnItOcuRcS8hnzwKd/Xub+fahlCHHz9ZbNVwhkbP3Ya571bnY/cxfA8
 IRa/udGOeA2MiqdSLFyR3/TAH0FNIM8=
X-Proofpoint-GUID: lg1Qg_TOPXZBcO6KXf55UV9vTfj9HO7_
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af75c92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qLckm0-AbUOrYe2-mA8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105308_505655_538CE0A4 
X-CRM114-Status: GOOD (  13.45  )
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

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
index c23b6a90b8b1..373188911e8e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -421,7 +421,7 @@ &sdhci0 {
 	disable-wp;
 	mmc-pwrseq = <&mmc_pwrseq>;
 	non-removable;
-	status="okay";
+	status = "okay";
 };
 
 /* On-module Wi-Fi */
-- 
2.53.0


