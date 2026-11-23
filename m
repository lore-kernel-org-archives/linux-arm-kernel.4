Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E104D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDpm65Gf;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIuBBZlq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hVGdPabj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=; b=jDpm65Gf8cwwd6
	YkzVYNIc/4o5mvGL8S94qui8nq1+7FPd/zlskBoBMWJMq3+Nr05hbofcQ4cfumUoryoigBn+8rqIL
	aJFr3vcwu1QyMTTUjA/syp8KBNFSi3k6NQItU/omYGsobxXpotqSjN1EOjMS3+aS8CbsWcNsQYWIb
	DOE4wxhtegriDiqMcibE6dnPbv6Eyjj0K156snForTVl42+LOKXmdcXorQi7U9FWzl8NRi0WWFGNx
	QvXgyX/1fz20igUEqmw6JwhsD4az+gYfpuBb/YXOcs/Be4ZAzBsn0rd0D2ww13/81jZraMms0t1W1
	boUMVinjmhFIPABr9UFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ05-00000004XBm-0BD7;
	Mon, 23 Nov 2026 18:42:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYza-00000004Wi3-0thg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHxml236102
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=; b=iIuBBZlqDjeUeJLx
	VzJE/2NGa3n9eGsHohiCG6D4Eb9GjHh9ZipO1MF4siXpONxaq9eTS/HYnmpjKt8k
	80kX2W47Op+MVK+R3f1m3ZpLVY/kS7M6OW22SYnPcsQWMcUPeRr04AsHdZZXl5c+
	9gz+1cUd3WscsLA0kD9GGtSFR67O1RiA2zwyveMD2zZi+aBYyfSGY2fOuLm1xVg/
	nZ6nFOMcArTnmXo4WRSifJnd0OmugNqkUH9Ulhfkmk1RL6MrHB6eyI7hAXXcA4hv
	Mm7ArZKJXRKbvR2gf4YlAs+RykQKa7X3OQsOMMcUb+PhhtuxSY9c/P4siOkFpnep
	XGZf+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsk4ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:42:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0a5868265so9351265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459336; x=1796064136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=hVGdPabj5FgPPd2X9+u5Tleq2uRHlLOyWiGMVcMC1sjwViqeQUQsCeqOkxi5LnMf/9
         PfvY9+Q6q24BBC+MeAyn93wkrsXddIm7joyycnjh4Ofq0RmqEoMk8E3x9ML76945CjOt
         wwYKJMVyRR6TyJVXOOsJerQKEpzv7Ys6HlPQdvgIwNYJ5l7f70L+p1982h6eDriUNNs/
         Yma8LzwsTeDCmozvTmI0Mwdr//l8sokqfuzdQZh8gH68PKIUvjHjepx2G8PdzpwijrLN
         jEMfmlh2ieblL3gIiV3YTyrqHmsTszFp/HUvCLrs6PxK5p/+DCm/rx2vbppoozivyMcH
         unoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459336; x=1796064136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=hgfp8MgNzKM4U009s0QDGVZL4+j6Og2xDSlng8k0SBLp4X32Di2TWV/x7pJhquY2Yr
         KO2K0lh/nYbFlWwsO8jfdX2TId8PcZqtgCMdKY7EHB7wMxEv++hjOWae+fIo7WdRPc0E
         XgoNqyXkMzSnkSuhflwGfkcCCIBxdZcHHS8KPs/TnppTKq0VVQRwME5bLsgFj0YKvWS6
         ICe6l9oJu/ulBut1P/FT5m1V+5g/uHBTqtulePq72i4XTktxJmscx+9jfAKSy3FTaq5M
         OM6G/xetb+zgKuT5hFosyMuc8zH971a+VE2F9EHHp9FPl7tlpoTOpkcrpV32ovAiqoUm
         yUXg==
X-Forwarded-Encrypted: i=1; AL+hErGrTrg7YzdvASxcHLjJfobzvVnZWhd9e4vNEZXKeIsr2gXCYEnrRdH2HthToW/dAWScHzXVJsdq5JB9CM7gsnzF@lists.infradead.org
X-Gm-Message-State: APuU4Z+Do9G7HEHXbLkzCQpyq9V4kTLUpCXXDxCO6+ScqN9LLKXWrjAE
	AL1Ts9rXVx3QcM6ht4+hCHFYdWsmIJd82nwIaCL7WtCfgEjTgf6odUqpKMgjjKfdcP9sgzv6kLi
	2XSrVkVCiVs2mgsQWvxPa5tANMxQAd3n/HsleY2/WMNsjZnTAKIs3LN+L3xQYBWr189MeyAC7jX
	puOw==
X-Gm-Gg: AZFdTZfY70CR8VHGC81PM7zzy3VI9WCOWS3JvFmEJx87Wez8lOmUE6YerIeq4wHlwkY
	KlJrK3eFn9noWUxS+MFqE0tytW7Ffa3MkhbapObr/6i5JEXluNUzDa1TQwjn5XJr7dC9JIAdieS
	XIEInwAnLOKUjSJCiXEcuyYWGFHwo7xTv4+ElhgCAgVxTAzP9VFXFgJ68HXAkk61sPka1d4vaIe
	nIHT0xdusx3EsEGkUNAxXMWYyruMcTBAS5mWJnH1QeuaYnB/w546aTwgrvzkS8EN9+W4vYTIGVI
	dUi8MPaw75w13xrXQVzxGkNAUPY/UBj4P/g56vMgJkReHoi7QoqhSiqhnjn9lJZV0PKCsGcgSpf
	hDqIeqTkLNvJjBJIwohALMrjNsEcZlpT03uQ2KJ0Lu70cEHFU5nACBbrDtotHDJoA/Rz7TSCvBP
	a7hzs=
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107675ad.4.1795459335959;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107375ad.4.1795459335372;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:46 +0530
Subject: [PATCH RFC net-next 2/2] net: stmmac: qcom-ethqos: add RMII
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ethqos_rmii-v1-2-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=4504;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=kRxGmpwxWiUKde3lWav3sfKZe4+naAB+GV/j9yR3r+0=;
 b=Pdfz7iFpCQkw9TBsYCpYS/k5mJLtRjDjxLB/IUsCxPioLlsre71Li5Y2Kv4ilRh9E8OSSFXTi
 6qCFxJvmEnlBd+ZnizPKBDyZh2nvBJPnINaHmBt5YuprQcwFvoY4bVr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b048909 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DEAQ98Un7x_38zuDVC4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gmq63o5RLhogRHAvzL0E4BmtNt6hpCzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX+IrAphfJNw6Q
 RGYcG3vZtiYGA3lxYzBmroFto6E7PQAz1cBxqbsPmwt6BH1Ub78/Z6FR3D9hZYok3jDJ4WkDBRS
 4UPxR9OtBIA+H4Lc0SJ23QKtHmwPs5BMKFts5OM1Ta4Lt+0X5uJJav86aqoqHPcSVsA4LdaC5ze
 xqouYIK70ZM2nPI9JyLbVug/ivw7Q7t9SpEmxKqcnJbOg9kW/VxzjmCUTGGbIpdMNHdAJaThvKj
 2C9rqnjB7i5mCP+WjwGdKdTHlk+/6kOWkewTfdDaoElYF8mgYdquSQkd6tf3EcduVi13/PO0+6i
 yBBXoVxouv3Qq89me9mAcb2nTdZEhjr2jaEFegzgczBQwJynkQOn64Yv/We5ndZUIu9vif7spee
 nBNel+V2Y1YdbaKHstMvvnAhA5OFeYUvDHBoOlMQXhHgYgGqnrQ9qVAkM6RZ3yj08dy/3ov+mH3
 nLaJxcXtxE592WfvVpA==
X-Proofpoint-GUID: gmq63o5RLhogRHAvzL0E4BmtNt6hpCzS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfXwduoylS0jJep
 R7+bkglmMgqamM9FgxlmI+AIbZ/jvvimmuC2hb9FFa/hTqxze96Rnu7ZI3fpI4eItIDsV9YRVUu
 pkMwDPMWFo0R2zzf3VCZQJIr5Tj0zXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_104218_576411_DE2722AB 
X-CRM114-Status: GOOD (  19.68  )
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

The Qualcomm ETHQOS core supports RMII in MAC master mode. Add support
for it by programming the required IO_MACRO registers and running its
link clock at the 50 MHz reference rate required by RMII.

A brief explanation of the programmed IO_MACRO bitfield configurations:
 - INTF_SEL = 1 selects the RMII interface rather than RGMII (00) /
   MII (10).
 - DDR_MODE = 0 selects SDR rather than DDR.
 - CLK_DIVIDE_SEL = 1 selects TX_CLK as the divider source.
 - TX_CLK_PHASE_SHIFT_EN = 0 implies the use of normal divided clock
   instead of the phase-shifted clock.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..683c6c3f3f37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -71,6 +71,7 @@
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
+#define RGMII_CONFIG2_RGMII_CFG_REV1		BIT(15)
 #define RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN	BIT(13)
 #define RGMII_CONFIG2_CLK_DIVIDE_SEL		BIT(12)
 #define RGMII_CONFIG2_RX_PROG_SWAP		BIT(7)
@@ -81,6 +82,7 @@
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
+#define RMII_REF_CLK_RATE			50000000
 
 struct qcom_ethqos;
 
@@ -182,6 +184,9 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
+	if (interface == PHY_INTERFACE_MODE_RMII)
+		return clk_set_rate(ethqos->link_clk, RMII_REF_CLK_RATE);
+
 	if (!phy_interface_mode_is_rgmii(interface))
 		return 0;
 
@@ -523,6 +528,38 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static void ethqos_rmii_macro_init(struct qcom_ethqos *ethqos)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
+		      FIELD_PREP(RGMII_CONFIG_INTF_SEL, 1),
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CFG_REV1,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_setmask(ethqos, RGMII_CONFIG2_CLK_DIVIDE_SEL,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_fix_mac_speed_rmii(void *bsp_priv,
+				      phy_interface_t interface, int speed,
+				      unsigned int mode)
+{
+	struct qcom_ethqos *ethqos = bsp_priv;
+
+	ethqos_rmii_macro_init(ethqos);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -710,6 +747,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
+
+		/* The RMII PHY has no clock until the I/O macro drives the
+		 * 50 MHz reference, so it needs to be programmed during probe
+		 * itself.
+		 */
+		if (ethqos->phy_mode == PHY_INTERFACE_MODE_RMII)
+			ethqos_rmii_macro_init(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
 	}
@@ -771,6 +815,9 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	ethqos_set_func_clk_en(ethqos);
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rmii;
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
@@ -897,6 +944,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:

-- 
2.34.1


