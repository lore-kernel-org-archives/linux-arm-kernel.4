Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89382606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/+ZxLBm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hRTRieTb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h36Cl6xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=; b=K/+ZxLBmgxmPYu
	MSwLytbEunP4OAvj3wADHsiq4+u0pDLzQt2CyV0/cLvFIQi6P/tHGkI1nFHECBZGTOoE3PM3RWUYj
	/pDEXjU6PRjGiVMRv54l07AbRzsT+WpC6lRutGRl/Ztbh7qgmvh1YnoV9WFAyKT1FkVt1T6dPknKO
	8i3ebXK+ROinwmjw0XzP2waDCletPXFmVwlv46ZUKF/uB1WIY4yqi7N1w5JEut342ogXxODkrh/bk
	XGoxxFLTJ1POHdOctI005Xz5M9AbvdfwCl1xZIiIOvB0y6mhCEHO/0EBia3TpxTIoENnB24l+YNtp
	a6HtZOkH8VP8NcI+U5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqZ-00000004wjT-1enn;
	Tue, 17 Nov 2026 08:47:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqW-00000004wh1-2tum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:47:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8HjMY1800719
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=; b=hRTRieTbN2H71Hcz
	NetHHMXDVeqveZSMQpuoRLzIRQRjusqvuhVwBBbO+zLnMbHfITksAejBbs7je2XI
	dZuCmKSe/LoqBnVhuWGXsQbCgPsoYAyEPSWPnhIMCoO2RxmJXu4L9j2gK39iyev5
	dp3R4AdsH2yqBUyQXFnKYLodioXRTx1Uh9fN/VOluLwurG7pdEIP+AR7OrBZwubq
	Oanb57PZPRFT/4Evn5lpykIEL4hpJL9fWCANcXS8Ruq6+BPNTBxo6TCb5Stkjfi3
	gSM5IHUATEQS3gMD4FT1gYSaceAkaPQtq7grWRnZas0pAXqNEcUYIzTfUnPPgD0I
	17bWrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3xqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2566156a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905239; x=1795510039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=h36Cl6xlEotoz6fXLGNvGH4MCuS9m5J/oFqBZ6adt1rZYMbNYgBlJh+A/o9KEGa+jF
         CJUtZp1AdjIrLQaiy3HTpP1fAiIn+uxph4SwfD29HIjBuAposft00tToQkpT8xcTCYQW
         Pu/3cpaSi4Tss5DGS+nw22Z72ZQUA+0cishqsCisfzynqdlnsYSanRQg8Vu7lt+hm1T2
         V/dGGV9ydHI5sqTgkpuVmWt+17syntYugPWvrWJ8odHoz+ZFQ9m+yc/dJtjGvUsJcKGo
         mOreTY715CHx88g+Tika4akpCsvlKEhzeyeCLYq/2+pea6qmRlXEFVW19GeNBvAozdQc
         WPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905239; x=1795510039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlnZcf5WGlV/0XScJzhW2hb8hYkrrF83WmIeGI+EWBQ=;
        b=gch/Ncm2zn5bUwe0I3wgp3Bj+vSlWub4Vu/ZXuINB3fSquFBNqRD6RwuTernfV1LeT
         UeNflb99/N7NpHWNAffaiJ5ykw/QaBT1vKLJwYpabdJ3xKZf1+lfjoLfGPsrWDhDUoz1
         AlYnqGxZ58QZ+hMfMsLaYw+xKvD2KlTfWrhrLhUhtjcTN98MC3YgC7cj5N7Rtya70O4O
         BavWHAvttPQumzwXasAQLA3O6kGJRwVih7F1IOr0RTWMtF91L27hoa7f+aqVBOBSwitB
         pKe12bjQ+62Hk0za55invRIrEWOYt1wgSLsKKIpRimVwlUuJctjXigj/q1x8cu496PrK
         ZmWw==
X-Forwarded-Encrypted: i=1; AL+hErFWzPKOagnaGAsK3f0khzCymXwi6YYLyRT5wqmbgKYgFtq+PFRVGtYB8QBAUA4aPnoRBf6wpaLKyAB3XhztyA+q@lists.infradead.org
X-Gm-Message-State: APuU4Z/bE/tf4OsFTlxAEqhJ11XKJkLAUttDypyhdDvuDdbBSsbZC36e
	/eymWVCdTkij4CwFn4oKJamv0lG7QpgWaNAPqtK0I9E3btIB8QP7YnxE/gj8/KkDMdH0ufoTkWT
	okdEKqtCTpEbL5k3WNJUnLKLAc0AT8LxSYn7bOYxS+saxlerf6K/6UC4caz25NTTqKK33EjC1R7
	gstw==
X-Gm-Gg: AYBFou1qG7G7YGHcZZuOS8O0VZjsRvAXhkwGX1176F92BGn6x2/s4gaNHRTiPIvpKtD
	z1fIcKzNPJxaQbvvr+2V5XyWHhf89M14KOHfz3gfort7Xs3F8zPaGEuH7SCafXF12yeXKrFRLTF
	O/mTUh71jZHAImBOVZQ7+C64NvHbPSovysGyU/r2ivmScR7IgnH1Myr9Gvd6DJlHOnXyzsMZylM
	N6aHe9rUI+EgygykyrHgukm/yAFXoolOj+u/B57pymnTooSu3JdxobXQv1iJBno5uDWXtaVEgQg
	osN0vIFMwKfANfItQ6WYonreL/BE+eIieFAyrI2GXMdNTkk6/wypiWws2mA7sFccdk7Zhb9GfAZ
	hl5D4V+6LlmbQ7jkuvXcyoqBBVRGCTvyWt9FflyFwXgf69kHL3zbsND31NEtWcXyGhd0QNhkJZU
	W6ew==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337463637.26.1794905239362;
        Tue, 17 Nov 2026 00:47:19 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10337427637.26.1794905238817;
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:30 +0530
Subject: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2190;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=CFQDYIAl3U52nN9LE0obd03q0TxKqjDn7YTLgvYGBHc=;
 b=fAch74fvJse1lz8Pb00vNJqw+5n6bQH0vo490NO3MVqTDE54OpN0lMvZ607uPvmPjMjjngfa3
 gUWhheLbt9RBHNf+sBwp+FG0Ls3EbFzzZkRAIpHhpTy/lUoczip7j14
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: qku8CbyrGAqPrF8K8ZWVzZmJtbfern1b
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1498 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hVEubRZtVI2ybN1AIPMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qku8CbyrGAqPrF8K8ZWVzZmJtbfern1b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2vk2P3dIHy+f
 NAP12m2mGvK8OVd6UlnR0Anj3CM5wTlB7+UMYmimwxD+uE7Fb1bwtBHsdKRQRl9fwBslWvIlkyE
 EuW3CyjUKvl04gnPzXQEmP+ohdhRiaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX76bzf1751aPD
 xDb67waukoo9Dplqlket1xjxPA074OlWSWjeqcoJlkjG/diTb2XRB86Sdmu2tbyt95pS1FAZ+Jm
 rZusU8pAO2fgN4ju9b1S82JeCMr0wJBT/o82fiSgbv5GNJjyF7wSNcAyzN2VEO4Ha1iyrafhCEE
 el6CCnUShJY7KI3jLvVOjEFuVcYN2q5GDB2ln8tMTiWfC7z/QE8jkbU+WtPi7D38+leAHvL9aNt
 s12jiRRoD2LfbdR41BldKBZMHC7Z9FqfhAu+9OtV4HvY/Ya5xhyq3LUFYWj4byakSQgv03KDtYY
 ppjzNK41NkWKfpqf4q2TMzFtQ2522TTdkGufIXxsTghvFt2cw4BEdSHt0BV+1d1FxL9IiPggqpH
 WPua0e0ANbZXm1yC+EdTVviwrDn9z3QCeVTdhbEVRlRk7C4uHzxcpgOj5Iw1trOqs6ji8S89r+e
 FI6UMNEKJM8rgWbfetA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004720_784769_6AE4B3A6 
X-CRM114-Status: GOOD (  17.25  )
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

QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
the QCS404 version, but unlike QCS404 its RGMII clock source supports
the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
delays.

Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
phy_managed_delays so rgmii-id uses the DLL-bypass configuration.

The bypass sequence has been tested on three QCS615 board designs,
two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
existing compatible binding and qcom,qcs404-ethqos fallback remain
unchanged.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: this is a new commit which ensures that the phy managed delays only
affect actually tested hardware (Shikra and QCS615).
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a7fdba73da2b..790159ae1be7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data qcs615_data = {
+	.rgmii_config_loopback_en = true,
+	.phy_managed_delays = true,
+	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,qcs615-ethqos", .data = &qcs615_data},
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},

-- 
2.34.1


