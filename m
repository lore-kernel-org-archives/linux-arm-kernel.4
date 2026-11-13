Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC7606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sBIvhcoz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCV3qyxS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=; b=sBIvhcozq7djzjNmHmnqQ7LImR
	3W4ACiFdsryWHSk4TfP/7cRtQwmUc5TY1adCkghQHosamPlXWTzA8FRLR0IbsgIxGjqyqCyo2qpz5
	QJLeTWhiTsX+3dm0QtSA+3ximvHdXFf2xBZaqumYktAnUBQYA+EYs/a7JCjSWZHmVENL9+uoJkfsp
	H3/KMb5zBtXQy4VKVUhhLguUSYjs9uUeuqtUIBQFvLA6vUayDqkN+DMt+kN7j4s4xraiFDgZAEeOV
	FOxAYINsQX7Y/tsFkJq+8eliMsGaycJ8tiMGVZymqdVhNtiLj2NsjNzpqWlnQu3kySpbROBMLAdJ+
	7lczIOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwP4-0000000E15N-0VFf;
	Fri, 13 Nov 2026 18:53:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwP2-0000000E13K-022P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:53:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQqXZ074657
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0Yc
	AmiGkyHs=; b=KX3Su90H6zNk/whbgSOKrnl9q9niXstvLfV+dkJIx2xWM+EnwAx
	G1fTGg+o+T+jz7kUWrtAvMX6Z/kd1Oon5TbYSlQnjQgbkB+huAQjiTZLV0smTTEs
	m3K5v2PX0Llu0qRr/DkLPWWff2H3FBHAcHgm4U1AeiTRQ1971M76ZAa5y6GTrP+w
	k6cnFcJaZoqmC8iERmkz8xvA/UzC15aN80Y0D7X4oaksuAzf2edKgONva5tBqlv3
	iPGlYfzPp1u6z+YYkxFUUC2E1z7TQ5hFCEjsF1AkGNXu9tzjr00G0lzGnmlukpx/
	S9auHcz7LkkVgxUVCLfr7Lowcl/AdJBbMuQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so1115277137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596014; x=1795200814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=FCV3qyxSZF5A4tHv5K50id5/8CpnSvoz3TRZxOC53L8Kw5rkN1ZX8YNRDSms8vc4BX
         NtnTtT2HTlogDF/rrC1Fat2Wc+gw0c3hy27vfsA2Sn3yzPMHz6s3zNENCbF8LqAkYEDn
         6ndGp75Ixj1r34PnUBW31QxIorqGSqN1Z/kz2BWt3DoUObD7q/0Ycw14Pk+FR8YXAUim
         qFoBhUiVp+jim88RQv0pMf90zfHcZl0zXsn1uybIsdzEhezrUA29eDbl2EaiboYJc/dN
         lD84ZbRwrC3wO4GZnFRPzRt++wHwwjvZ9LFCHW2g5i15gniPAqva1+UVeXetIMPzFiod
         Ykgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596014; x=1795200814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=fpDKkfzAZhDiAZyLlVdOkviAs0I82Q2aj2HIfahq0hQfnqVkdW3EDZ3IJFCzQvXzbp
         tOII4ZuuG5aZxy6cuZuGaBnTMPuf6kZS2KcHpX/L2vf8FlDqrvvVuayDqM6XcEkhvwGn
         Uo1roVV+VMsiklybSwkJVuVMdP8HeFqqtFr8zpvJDRPDcRaHBamED0tim/vIg6nvl2wg
         r8X3Ofbt2nrW9ARoJlQ4cYag5k97JLYelks5AhKRbSPZAUG/IDnAjAMVonDYtzmPrdQi
         0GYKG6ET7FmT2Ao0MgQiBbqc7eLLnUIS8UKHMkeOy1FzdxS+/G8ase9EBn33iXO1h/2w
         PJ8Q==
X-Forwarded-Encrypted: i=1; AL+hErFjEd5AZ0pMMfmikcc7rx1KDsPDSJIjGgUztUOQj4FMCTBkA74lb6xD1fhflgFRriEJ8ZYx7U6Q7dY1GSiVs8KU@lists.infradead.org
X-Gm-Message-State: APuU4Z8OF1j6lCgPmYxGx3kkKohXgbf2YszLz7j79JAhlnlWaX3GXt3b
	T5HqyshzpIh74E1qKYH8XCuX8P9Ui5Ln8WnCnc8fUI3mz49bijidug9IxlpbH4MPnXlb4PrQVm9
	PWhD4KS0wVCCI5rdNlVMW347hzS1vZOnKXjqKdmBwrpL0Ju77A0cHjzgVRsKMVtOWR+kByhuXpp
	I/KQ==
X-Gm-Gg: AYBFou1DWZfi37PTqizyPFnd95VEu66LXykto/gUAsDxjd7pcaRq4HSWai3jOGKASdK
	6Uo+G9qzRETvXaB+9hW2LQY8of8/OIZRxbX289GA1i1qPpQaMXaXldHYF2fTw8fVjD+kgbLOb32
	FXxK5MX5l8nYtgccUgegUwgY4NdgpOlm1ze5fWg6fEZPP6OgzLHeUWfW7zwYbnD57km8cOMfewq
	GcjNCj7yDlbRhtBlMmmepqXl2TPKqWw7yBdnX6k4zBQs7NYL1dF37/rpRZOlIExVAVZToMnhHNu
	3VOZVGBMC/K2nTMyyH5mKNk4efCa8TKa+J0H/0E77leiXhfTqXU/6WSrUJkDzHELd1CBcaTXcyr
	qro8QFv4b1tq+4sfvXg4YUyLsVaUmXlQa+vx6flFvqM//08KdrsjkM2RmM87a+A==
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455772137.17.1794596014414;
        Fri, 13 Nov 2026 10:53:34 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455751137.17.1794596013869;
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm172988585e9.15.2026.11.13.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-bsp@toradex.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: freescale: Correct white-space style
Date: Fri, 13 Nov 2026 19:53:30 +0100
Message-ID: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Akuw++ZUVXXh5XdKDs7G2azKQzusj232NcYmjWrfWVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91ypbZ7kYSkueWNwNYWavUzn8QEvcbWxnBjIM
 PjQ4q2VSx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcqQAKCRDBN2bmhouD
 1+YaD/wNQzJZ+dGmeqnE4K90ELgmA3GZPhP/jaw9F7jiIWd6nQucoDoP5I/P/OspFqkS3CG5tGf
 Fc3ZKVGzeTkZTdPNLFWldGWHCQJ8Jf5Spvg8YDirEXxdBWtlppBvvzW8242+mWoMzngjDb+9qhs
 LyWAKYjCs9IJINN49eICXgO7GAVu2s3lEYayCD/V+WZZsugZbnrT7pxlyR83LMGnnE0f5B4meKe
 Q+8bpJ1KuMq8r5Az9FasyFKHkNcbdc4znilhNKZuGFEtFeQLK/NZDXZ7vZS4RY2mWSrxkVtaF2Y
 ds05QNLoZikZSqrmbyTOtwxYhF6Blyw1b/TIHeI+HzIpYvafaUc6QqJ9uyENv+nzCze2j8Qz3sl
 e3LLxJPnNh7lLhoeLo7YRFDCMdyc2JkDZtDV4/wmaKX3UJXcUmMloroC9k/vMjeRFpu3iCOkfVJ
 PH46vtrfajc+05XBxxpOGFcsge3r6qDNnQ6KmIVCafrnWLX2jvQCvShNWVAzfwXOUa+SIb9dRcg
 JptOyT/LJ4cWrtbFKso1oQNzcqNE3BUaFhpFWTS/FoT3hOARCil+GJ6WnykjmH491T2GpYTT+sO
 +V/N6ZRmroFt5+Ex7hMXwyAefBi4L8+ouY4M43+Kh4HcNHHXKlESrGjZbDYFGY2bDC65Q8E7sm1 rRwIdMJTfbNaCSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8qmTjcOV4HaiqGb_GJ-CM6BtSS9cDrB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6GH5xxzCP8xE
 jkIXoUyPC/M5EBMJjGjQ7zXuzxkbAj8yFN65BvX8QwuDRhzTZZ4BIxVg0PaTergDyAfXdVNcBm0
 TJVh7MdHuK3bG/qk5hYYJnUWe5FC102LcwRoW33mEdeGvYkPtaOUra5QlwU1XSY40q4BXYph5vw
 jjKLBfHagrD9BqwUCQ7A6jx0EBTKyZN+l1GOnOlRHMufg6/2kLUBlv/T5cdpQJmoi6AngFUscy4
 9mGWPmiCKjSO1t1qrv79lJ+1JY9055hq047cbvdNFUSPLetMGFr3KI97qGQkfg8Z3cUcp55Llfg
 u0bFAkehxBbsik5RgE0SQ+nMXQ+zBdTxrpLOL7hOzi5hvpM2XNRtpLL9KEegFcQKkI/zzg025LO
 5C3ymAbLI9MzMtvyiFrttGN/zTZD17YaUSfk8fBzI6ivO7/iIzf91bq09BvcVjZ3Z6MN/UiHRvO
 IRCE0KaGeLCTcTfxKSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0pjflkWcwkJ6
 pt3M2xHOw8TjPKkEcIIj17egdLaOwvI1a6yVWbQERWgXC1m1wAHexZVULrZ8JNqWTFyEUgk286q
 Rrs10Qc/kigAuy91sGLVRu2lcTIY6GU=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75caf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cbNUTa_LnN-H9OvA4PwA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 8qmTjcOV4HaiqGb_GJ-CM6BtSS9cDrB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105336_053566_A8007627 
X-CRM114-Status: GOOD (  13.93  )
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

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket or colon) to fix dt-style-check
warnings like:

  imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx952-evk.dts         | 4 ++--
 arch/arm64/boot/dts/freescale/imx952.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
index a44351133428..666c0cbac94e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -163,7 +163,7 @@ &acm {
 };
 
 &asrc0 {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
index 9d990937fd8d..ee89e96ce1ba 100644
--- a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
@@ -72,7 +72,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX91_PAD_GPIO_IO00__GPIO2_IO0	0x139e>; /* OSM D17 */
 	};
 
@@ -122,7 +122,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX91_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
index ea5e6055e3f5..1fb49e06d2c8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
@@ -126,7 +126,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* OSM D17 */
 	};
 
@@ -176,7 +176,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..d98dc1358fd3 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -303,7 +303,7 @@ &asrc1 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
@@ -317,7 +317,7 @@ &asrc2 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 4930e09e0206..4a737d2620a2 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -904,7 +904,7 @@ asrc1: asrc@43000000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
@@ -945,7 +945,7 @@ asrc2: asrc@430f0000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
-- 
2.53.0


