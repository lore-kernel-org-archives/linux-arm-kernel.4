Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B92606A884
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F9iJzg9H;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLkXgHm3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eOs9+zKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=; b=F9iJzg9H8j4r/E
	c2lKs3iXbElK/P+DZv7QBtSB7dD2tIkojcqZJ3kVokI8zupbuSR8UbHt3T017Hku+HFHdVpcdGVNM
	V7tg8rI/aX1igCpWVMKke0vZhxNaeVv9neN8y78Kopnm8uCecFeggM3dL4i/+k6zZywJYs7nwmoem
	s4TqYHgk+datEU1rSqqnQqrZUj516UGmQj2JQ/9nv28nibn5rICftaHOaZafdQFAOJSRY/27OQBel
	qxZFfgNlBTo3wEbzStO78CXN6vKo40vinJli+pXkI2+uoppOx5rLoRL87W32cW4Wh2KuI16ZVs1lk
	cYnSOvLmeYZNyNypQV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqT-00000004we8-3Gyu;
	Tue, 17 Nov 2026 08:47:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqP-00000004wao-15Nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:47:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NOdu721699
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=; b=lLkXgHm3k4woliRv
	2hW7+wmcv439q5CFaB6tpO1Tk8vus/KHagA9u0U02zYAcz1CiHIzXrB+6SLU6xfL
	YAyThxtwwimX8+8zW9BphQR68TtLRfgGWwJ7U+jl4Yd9EkJHC+A/rFqSAJWoycdV
	rdF1WqwwIdUE0pz1K85wNy9RWi4oHjpCGrggufAosog5yCjF4ex3oNRbkhV6Vi5I
	PrnztpeXXXGoXjSy9njLM8Z6JEFQcqLIOdb4lHOsKNz+ChJbNhfdhU2xwnls7pOV
	7G8bFcufb7Kado+m+4vIGFoYtVT8P9qBB4rVo6hSiVxwFZpVH/G0F1V3Wu7wg1ib
	j3q0rA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc836a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so4293900b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905231; x=1795510031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=eOs9+zKA3cL804avafyCg53URU+XqQBuT++hMgzl0UUxocs01hagY5McyFP5PfSBOy
         kXJ5HGR4E2BT0OSj11EcxdV49LRVqYgT2lqL0PoYVUlFuskI40XjQcoPQ/NLbj/mOj4e
         mp+3VGpUDVEf8MQgLkN36meHj6Z0aIGjIRnd47tHrMBipNTf4SIB2ijyId4dTb8qpiQm
         I1pDfXs9n9SgC9uL5NEW3I9TnX+KaXLQfyzOYJorT0dyOdbVJc91At5g3UU8mvjQRNox
         /xqb15BLVQcFcC1TilTwGL5W/CV2AONeWbkPyr5m7zUjv/b2S2TM3ISKLlhXm8jvvQ4d
         Njwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905231; x=1795510031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=utxIkhDHBU7LCokaHAVW3V+26MNKFnQoDOcmMfGVXXMwPFc52rIet8PqzNqdp8vwGo
         KLbnp3/dhICGaBXfo3ABlAIN/5fmU44iKZFsfPKw4jLwSvvyDSetnyzxTFUvwN1+FDi5
         hZvWOJP53Y6vHBrhbUcpIXz+Ihfuhbv9H49gu+yMNRVpoBlUXslC6JN02jkhR+ANLnN4
         z8mWp9tFTS1W8243TGJQyWpZ8vKwneeC9fCD5sE8HGcWQ+qMiJi6aT/PPzj14VjYtc7p
         9grKuIAPV2DxXTeZv7vVNossabhk7pB65zDfs0+6UUmuApSQSwZ741Ul4gaJDPSRpXf0
         VyeA==
X-Forwarded-Encrypted: i=1; AL+hErECCzOg+WmMlEU8beFe/HNKRDxUroxXfOkAfrZOprv0QYhfeUHNBy+W+CS9OocMdbhjuk9JuBft7xi3uUwR8bic@lists.infradead.org
X-Gm-Message-State: APuU4Z9WCtep5sMeVePv+7LxDlAjJcX8A/JL7CUvCYt4HctRDnfFBV8J
	OINQ07Et5Ck1aBf4CjwGdYgPoHse5GqOm+XTX2ui1T6CELlGGfooNoGXKYSB7Whdt88sxEKlS1H
	SZOGF8qTWU/MuzaV/gTCKZuixtUIPlicBbe53FRriyZNGwoRr5N0L4pDANpyaj6LMxpnHWXLJJW
	r29w==
X-Gm-Gg: AYBFou1KFeC5koYmFqGoKQdYj33B+RwerkLh4zF9q11iNAgLBIhK9rHWg/KeaTj11s1
	QvmgBu04HNeaZWhB7Vzf/T3+lU/QVc3g8Uu/KFZjEXAU7Avr7KXh4Wj95Py2vi5R4g/vPe1AbGt
	NsPOpP6j4AO2JGgxfDfTTzngaH9Qka28h073qpLWNVZCQrdkdTEvawXwI9V4UAaOWg3fzePYwXN
	KSCGqYh+L2aAulYnH8qZhiexxcY6zyDRxOvysBdr9QdCeTLlqYOLVUogETb/5ciU1+jGyk4rp1d
	x+P76w0dVDa5qHkjpXAqIDr2U95lmNoG9+s7AgWOqsHPwzxgcAAetDo4bY19K+FG8VQEEwTXA/P
	1cYrhcbzNe5pXPbPxhrUKW/go9CKx9SuotMylRnBCTlyDeHWR3GpvRL4FhlObiKW4Bfg8TgMLkS
	q2ZQ==
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052466637.65.1794905230850;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052430637.65.1794905230269;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:29 +0530
Subject: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2688;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LmuklvsOLR/r7//hiFZqjpLls6fBHeuS30WVohG1EGA=;
 b=NfMTTvibJR3V/sBQTsSWiWlUhRk02rFjcgYQ4c8QIJvCBToeew1dVgAOB3072Sjor39HLf/r7
 uC1cHtl7qB9BOleyFTAe9ZEVacRFORSL9I/LuHK7Sq47guXnOaGZhUC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+5DaK7ABrfIF
 t4IX8VWPJU8BloVtVjyY0hP3d3wyqY51zXFwPT4K18L/XVIzUy7zVgLpRvFFevQVA6jJXKCEVKi
 A0d58oo61lAL25pFFaeUHaWoGXbTNC4=
X-Proofpoint-ORIG-GUID: ncUsRuOUCFCgpTnUAbUgnNHtoU3sw-5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXzWopYIYxx9Qo
 whjjGDJFFSP+ujucc26jjAOOnFt5rGmSIF1NrbfI+vOR1QV028PNtyAHcCzPUb+IoJZ9+hJFZVB
 6cqpYkyoz6ag6D709bxEO5d83ZvSyv5rqKz8Psjiu8X0BCtypQJJGeU+SFrivej2YU2zytH1Hwp
 SzgQWeoqf+EtVkACrPZxlOSLlxUmat9MdJZHrhAkcbxdUSHybAQ9m5fTifEWlRQpdUMCGheyGGp
 4Il+ihoX7uDD/c367dGarxB8YkAJVFwEpRWhuDHM1/jOSOhG73jV+HGzL9V0EDL0PwslJIQwP5W
 pFLIAgbtWYFUHF+TqGFtailptlfSX00FXDa1ab6WXfkG0bTVIxhMy/9/+H26129l0Oj43tDalr+
 IzCPpfFcfDoI+pvixTNPtjfjEkpVu0Q1auRBuhNTUJOQlYgmXYy6rEvf/+YHsdGp08tY8aj7Wjf
 NZRNVFBLtedlnfqJ/Og==
X-Proofpoint-GUID: ncUsRuOUCFCgpTnUAbUgnNHtoU3sw-5k
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc148f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tY1s7WPN8UR3DqbNSpoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004713_457162_2BF5D9C7 
X-CRM114-Status: GOOD (  17.80  )
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

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
and the 36-bit DMA address width.

Set the NOC clock rates through an OPP table to ensure proper voting of
the VDD_CX power domain. The stmmac core enables stmmaceth before the
glue driver applies the OPP vote, both at probe and on resume. This is
safe because VDD_CX only needs to be voted while DMA traffic is
ongoing, which cannot start until the glue driver applies the vote.

Shikra's intended rgmii-id configuration supplies both TX and RX delays
in the PHY. Therefore, enable phy_managed_delays to select the
DLL-bypass sequence. No POR table is needed for this intended bypass
operation.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: set phy_managed_delays to true for Shikra and reworded the commit
message to clarify concerns raised by Sashiko.
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 15385750b3e6..a7fdba73da2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.setup = ethqos_scmi_setup,
 };
 
+static const char * const shikra_noc_clk_names[] = {
+	"stmmaceth",
+	"axi-noc",
+	"pcie-tile-axi-noc",
+	NULL,
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_names = shikra_noc_clk_names,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
+	.rgmii_config_loopback_en = false,
+	.phy_managed_delays = true,
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+	.setup = ethqos_hlos_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


