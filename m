Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82E606A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d0PuHFYD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHYlY6DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=d0PuHFYDqz1PWD
	KezNwvZlG8G8Z0gSxKP5bKxN7XZDSA5vaLIKH1Wdwiov12X/YNdA81Nx4H5DEe27QLxTaFsqzBVW2
	42IuztT4qqUdkbMmwrCpS8AmiEiJptpGJkPjoWzZ0u6mcFwhbjrPmqJ/zoOnFLk5paxWhzrZsE1jq
	0zQG6kUqLrbFlrf3U1cOgDHOM0rCWEm9NaBwW9Xczukmc7jhx649ZB35w6jzayyR17XqSeluVSQH4
	4TbHgS5zlkpdysiTrJSGogtgMTRfZnTwGgfuZBnaVAAYGfItqT5OaZ6sK2MJie2Zs0/MWXhBg1898
	zyCT313UVFITA7D/uOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqC-00000004wRa-1KG3;
	Tue, 17 Nov 2026 08:47:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEq6-00000004wNf-3vLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f1Wn2998623
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=NrY26mzQEiC4p5OS
	QrlLTzR7eu+G0a6BDStDdlA6yyJWltOfruzJ5X9OsWQi/RdQaUxQ3GSY93axuTN9
	xOHelC4J0oZ5xhUiool4Uude2cu6gT0HWJ9um6drPk0y+4gHAHKyBl92cXAsr6sO
	gaHSnuvgB0ha8P9MyjqsuCX/zCJPmbDVIRnvkvqbhmH4SIiW16ASEcXlWq+u28+A
	9ojJOzNMro5o3ojWSuUhM/z37achDooJVyJ6N8tYBjf6r2ajKg0MgsEvusWwXbth
	SdMyEAJ274Ix5Uwzt3oxBjg2nt6+JF/TkYeVkF5756I6dzi5Sx1mpkHD+m+l6i1Z
	s2w25g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0g3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4605560a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905214; x=1795510014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=SHYlY6DCBvRBoZnZxOuGToUbetzIdcg5ylwiic2cdhL2iP3INT13V9P6uySMDmU5FD
         sRpzZDDj6qldFTlDPkG4yP1O9LvBE+EAIHl3tJbamYCuwmjAgZPuBjWs1YDjQKV8IUA1
         Qbhw4p9tIDxDalmbuepaPMkTiseE3srypdNjYqQGH5zGU2Tdock4c9IcFjG4MKuXHJUX
         AVoJuUOxTv7yTxNAQvdTNO2cc8ZMNpZNHNrgEE+kDylvdXH+nX6cvtQo+A0T62vBed4P
         xdfYuylnBQMYE+9Y2+pWVI1kb1zlvhVeeqz3Au12/FCJb4OR8/7HV/8oGV4zaVXV6YwM
         2pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905214; x=1795510014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=K4GufDPF8lHk5IRXdN8V00Yckq7277kt5vktuf7hxRvJqAyI4zYuan9PDzcl2Rcux6
         0Ruc9nhHS/X14p21BX4lprRJ6VV0KbmQxUdrNNRveHWJ/XfHcFK8id4l07+IiuQqE3vB
         yLDmyCVl6e0/d3Ry6/U6FYaIBcrIkNWkh2WN096AgOp2jsVNGpJ21bWlOWY3fMURD8zt
         0BsOASNImHZeSNjit5+6oh1wpog1tCCVnXENJvwaS8FbeF9TPpc4UismpvVEdlHp8Yes
         WniN3VubNj1X5l/fvP3AowDScNfPDvz0yPtfLpmo4MZtxvFC+MfmqaIzLwhVCGJhMV6B
         ftrA==
X-Forwarded-Encrypted: i=1; AL+hErH8cQPyItOj4QSMe2ahQ5b2t/d/2LiOxvtN5alegq9O8AD+0RbSZ9vNgKZotBYEti1FCh06whtAfr3STvKXxZ6W@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZZ0inMU7L26bDjFfsW5f1H8QUAjMW0WvMi8/tMxueYE4UJD65
	B7XMUWmJg6C32faiuMFx+zfCdOAWbsGK4ntKKn5KfYAaxBltoZuDEfISEXu97dGNtjsL9pi04mt
	gNkOzIXQaxs3jj50Q9VZZhoV4l2pBztOChOzC/WK9VhACueh/i7dma7UaTstwMKs/GazUwgCIz+
	tQxg==
X-Gm-Gg: AYBFou0CBn5BtsMBDgsTNibvfCRCP54gSGIHhnmlgn+h7l0XU3Ra7/5JiDmHI8+vPOr
	a7QxGJy/upQldAppM1+Rk0ptOqt0kRRLhY+b1YRRvoHn3J9g5mkzD4gAgfgS+eI058o0Ma5w1qb
	PaFiJB2OVW618a9qozpCY+bELg0NQJy0kMZZ6C+7SvMKnl/WZryGZzpO09/TmK0Nc2Nhy3qDq8z
	cAZYfQaB20xbsUxlwYkH6b3SKSA3BA7GyIW2nHSUI50L7WtpNdGi/lh5KSX9COLVJmDSizUsjWW
	mqy3HKIyE1Db8AFGF9Jv4bAR80pP+BIB8tWxoHlFwQb6LkabNRK09VGUKh7P8bF3qGN0sKH/Nz6
	HUqUnqzFVxyzI2J09yNgE3H/BpMw5WSJSgiAT+x9bizLqATVSRhCTYxGxkD2g4MG38aJVYb9QBm
	eUug==
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092198637.56.1794905213718;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092149637.56.1794905213189;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:27 +0530
Subject: [PATCH net-next v4 07/10] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-7-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=n+OVBcpYDnfu1RAZNpTORwUsJk5/4Iz/XkRVvIn0LX8=;
 b=U0W33hjrN/xoSEpZUs1mBMAieyrO6ADIruqEMBfhJQAtg9FHals35UP7LllUCRBIJs2QGASlA
 BADkHSDqHYcDqu/Vh0Cgae7f6aUXUnWpw6HwAu6F4RhjdjIjqI8XA8h
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxMGTx/P4qpEM
 UutRiESflxc0OJyJo6KPRNM0aer1qXVBEhprYktMD50vNlm2RpKmp7zYbzhbTbs+tdzFzo/9JN8
 tIRYYELl+2McPcBK+6F5pXM4DLtOrhM=
X-Proofpoint-GUID: xa3KzR-_y79iGZSDz-S_u_qufOzP7erH
X-Proofpoint-ORIG-GUID: xa3KzR-_y79iGZSDz-S_u_qufOzP7erH
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc147e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2iTJAsdSr+Ar
 kVVc+KdeJSYc4Mo8alLK/iTsU43O7jGCr7l/sXqpOi/yLY2a7EN1vAFv9cUxRdvCnPXMrqZOP8p
 EuzMTGGt4WssHaBF+FQkJcgj82vblx0pMmXs/j9AJJolyrNZmYLHPmHO6ezuWdSHlYWv2/nGjhL
 ij+Gtein09DBy1yUR7kvJ6oeeu/7y45PgvtskIS2OFFVK/Yk9l5Zbprb6lwcvh2sb+VfTJZiFe3
 qqYg2E1maRvdOYEa3RYgjfLsZGFOgLEjDlBi9iA17PoV7yRRz5sOoQnaXjg+WUg16PMotKUWWNk
 iYs5rrdkafze4OOanQjMXQqZ+soYcmp/EQeBB84Oubenv+2t2EuAqB/h2xWmewahBQ2fDKW0dg6
 1wbiZamQaHhC4VkhvHNzi2a9BZSngoudqcpz2iqGsJJGuQL/L8/hOl/krBojWWtDrHciG75+FvZ
 IyxtpDMGyaJroi60KOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004655_043690_FBAD8114 
X-CRM114-Status: GOOD (  17.43  )
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

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 74 +++++++---------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192788e00dfa..bc443793539b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
@@ -262,6 +262,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -276,22 +293,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -312,22 +314,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -336,22 +323,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.ptp_clk_rate = 230400000,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_scmi_setup,
 };
 
@@ -999,8 +971,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (data->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1


