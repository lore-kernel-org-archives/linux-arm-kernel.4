Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3860A2620
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qk6l2A3x;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoqWAn3Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdU8vYEv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=; b=qk6l2A3xXg/HcS
	13xbWuTDdih83BafueGAl8+zAaz9Txm6H6dmP/77wlePGMPUHWgZ9BkM4ZZmpy46dz0rkW+AXbVtI
	UUofFMq3oIn/aDZDQxqNNlWF8ySejlizcQ5pUjtm8tM+tYt/5qiwH3M6t4KQ1QGou2McJIDX9BcFv
	2kX1e6n7BQSsBl3AfCQAEam6ffb03VicVHC9AtMLgknDIRgyAqr3eFJ8fClr6NrNrnJ1uGgc6+XAp
	g2XazJdhcp2fSfs9AnXtMuBF3MYUtzO03uInwWSK96DSVnszRHVFawM7Ie1k2XZYNGUW5QPJ5FgLT
	3gxU/DE4Va07OjmMekCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpu-00000004wFK-3yZD;
	Tue, 17 Nov 2026 08:46:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpr-00000004wCF-0j9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH533CW3457899
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=; b=MoqWAn3QvKWC9nmT
	drdvHl0VZOZmUhXL1/U/pZeT7cpOSAMjzgMb32oZ27H1ofLYt4KKkK27zA8RzrgT
	pvZFRoXbjIiRjhmd7zGvMQxzlDdefNKt8iqOOdbrPzl6Q9ypixpyTH8DsTt9jfnD
	wvF794AmFllujsfiEgrm28fzl0K40iPRXPpmaPpdsX6BNax+LGxAdJWSW086GAjP
	XfTp2pSFtM9CZ4p0LwzJs1sglXMnDZoR0nugsASYz3uVH8cgNZHqgzEW0gjrSXnj
	otHXv108+AyrvlwE3dip2urA+7KRmZ2zrUHVxKBiK4luTF9xsafokUErUpmKcjWl
	cYiBxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8sh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2961922a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905197; x=1795509997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=AdU8vYEvsLqCNS5Vd2v40QpydxnbI0HE1AMQrksdmrPU9xcXgAfgbVbw8deU5fnxxp
         WMirwF+N0xVoaKknaKOXfx8abyGfNiA+WNnk1qkD9sh+jskM3Nasuw/zfRunAm0Fojke
         uFGg23H9XDf29FSjhHMRDWbA5RCrZxpMT+jXLUMgWnnIuRIueaxMyvkX8JOTSoav9fms
         UxItk46QzabTSil0yv7Ia3YsEtJZb5gQBM5rMU2URnBYskVAB25kxcmthvPk5xZKqHWz
         1peLK5MwHxStjm1+p/JbX26j4PBaV3dmB38KptTpSmHN8rKWDxAyNa0MydXLR8GiH/q+
         5yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905197; x=1795509997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=OZPnnRw+/jdRQoLnLcVFftSI0Uj3ZLDPbmzgRhOB9DXyoTIuj6FE6bxICHOPvuMnsL
         2BAUxdXsaUuF6L7GRAx5ssNiSb96KovHDpuCVs5NswPuTOY9Z2G5qzteRShTbtQBAJDN
         MPA7dJcIbORxvuUViobpRc/zH2SbUUzpr2o2e1CM6A+nim8O+cPcfjoIFX5d61Z5v5I9
         vyFhCJKX/056aIMumGBeEpQ40LwrfqgnA6nAnvIDPbYCq0snyJDVgHVuz5I60S7kwMZz
         fk2iBbRrwTf70y/4+5FIS0Qsc86uk6y0S1+rJ0ivgXtqdCFjEDvM7YJnfgIBEfBAprRa
         UPSg==
X-Forwarded-Encrypted: i=1; AL+hErEUj9GX1fTdU15gCyownu4E2e9JY9GD+o+QHwZBy1vkHPyTGt7DxMcloRR9y5g1vH42wLQc6+PUL5PKH1THnrc5@lists.infradead.org
X-Gm-Message-State: APuU4Z+eQg6i3q4ZbDrkb12EuTox0gW14Gi6+eP1nlbja79trjMMFL1z
	Ko/iN81TCIaALidis/UXN5MPQzcxQnsPi9qiImJ+lrRsyQjvp/qv4y/iO2D9p1NNZxgS6mmetar
	ytUEfqKKhUI/oKR2cxsURYMhnLY8weIWCgDgYcigFJfs4dq3Cs5QynzFS8SKv+sNn+8xNRpZMB4
	r1ew==
X-Gm-Gg: AYBFou2qgR3gMu5rQvarYrM5gevEDaw6864WlncoFK2wpx0PEwdqA6FxR8pi3BfTXmj
	2LCAWPKmDRewiARoOmy6IA+ZaR6lNlcg/L8AGPsoHweASQ7wxfPDxoKy2TICFXC3nl9UkPPCAsl
	4mfahsLvDYVIhnNdF1G/wBIRV7e6bd4gSj+zRHbWX7jlgVxV5JGknY0tP3ueocOweSulFxJRkSv
	e+8o87Dq07iB0bNRGjQim3ATDrvb2RxdlQP+kYoudxl2e9MK07coH66Ra4J9WhjSF5MFtQ8D7Bk
	UbqkS22jn9qajPY3VrY6gz2lmpAmleuKCTx7tAS+/S4jQoM3jzz5bnhc4jiX8+kaoQ3iI0ck9FY
	7rjSaEYE0Y2WwZKmuSOuuiYRMJZ+Hig/9etTYMWexae8GrF4imdAuckEwTDA+OwEw5lwLRDEvbA
	NUcw==
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584031637.74.1794905196677;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584001637.74.1794905196124;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:35 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:25 +0530
Subject: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add DLL-bypass
 for PHY-managed RGMII delays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4950;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AX8IqlmtWAq6HQ6/PrPn+c05+xpAnEZUkXQ4nF3LiBM=;
 b=AJhNItooMl9eFcgP3TOPclVIuGNnQWG9k99zuECq6pbAQBDkgBbYaNiWH7AjWZxUbFpRFCcjR
 tTtLBl/Fue5CfSXNNvRX+1WWUwBq7wfQ1dNRGEvcPnAOkWvv+cm/pX8
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: S-M1VYKQ_oNP1MCzF7SfcoZXOvgmhq0b
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc146d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: S-M1VYKQ_oNP1MCzF7SfcoZXOvgmhq0b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX4Ev9J6NGHlPg
 mtHjyq5UQBureUc+J02kPqYQfVTWUboC3A/yIQQj9vJXBySOKdIzBda6DCe5AljLz+6m+2xsEtp
 uDVqIfYSEozTmGLDMy1KW+UO/ARb4Lc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX29TMJMhVjJN1
 PEoVDXeGg9pBsie1pRLddN3DemiG9ggQ5tDYuN386/lktT+WMBdrohjesxaD+5bYMf9JuxLNp9v
 e+jo+WaKv2Rx3/q/oojFHGBtuQSCo5QFsZjMQueQ2hCTRrevY2HvZudKZTNW7aYvyqoDe2/FjHC
 lWyOpYJ/svj5bbRykOhflPQWzUgaPukW+ngrR7y6ShnxnPNoe/86flVUWsJg4ZFkJMfsyo/5ANN
 Dfi7+RuPL813eWEJ3s4P4DPmPDKcz+ASM77WK7Ocny9A4ub1g10TGemkc/yknCQ3ce3gkncisZk
 8pIhBoIhgEOXXBTjwal2igSrnzmcLu0A4Y6VXYSTjO+i4GMX0s8LotqbIMDV4RtuCeOMUpqFy2S
 netJ6U5b1Aeat0PV3buqf4Qay5V7v+sxVQ+JbgtbXzqklwxui8hqdqdmFNHHWK6gXxjrt/EpCIB
 qn2FPbxxelZ66loYFOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004639_857511_17FDD4BD 
X-CRM114-Status: GOOD (  22.51  )
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

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M.

This new programming is guarded by a boolean set by the platform
descriptors. No change intended on existing platforms.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: protect this programming sequence by a boolean flag and reword the
commit message.
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 72 +++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f2428f0467bb..99ea7e0cfb00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -68,6 +68,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -93,6 +96,7 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
+	bool phy_managed_delays;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
@@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -515,6 +527,58 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->data->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (ethqos->data->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_configure_rgmii_id(struct qcom_ethqos *ethqos, int speed)
+{
+	ethqos_set_func_clk_en(ethqos);
+
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+	ethqos_rgmii_id_macro_init(ethqos, speed);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -524,6 +588,12 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	unsigned int i;
 	u32 val;
 
+	if (ethqos->data->phy_managed_delays &&
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		ethqos_configure_rgmii_id(ethqos, speed);
+		return;
+	}
+
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */

-- 
2.34.1


