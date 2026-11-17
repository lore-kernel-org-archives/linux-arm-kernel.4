Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27A7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbA/PExz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSUV6kj+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UV0bUcFz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=; b=EbA/PExzdOmV5K
	yvh09Dbl782LxTJaBgj7jJP/Vda+RBYH/Bvo/ekrOkmiS7sEx91ktHABcOPQvXEP4vM8God4pk7Zb
	RXVtYbjVEL+oavN6xOwZhX6A/IpIKASEJKob7SlIFkGryMjwix1+FCKHUOA0XUPhk77Bgw0mD/f4e
	oli6pTKH8mj46FOdxGNZsgm4XwYpv/YxzH/uLjFnvdF06V0wFaJvh5GXqq1SqzBlKDO03CbjzG0NJ
	s97lzEYMCZEjS6vS637nI/2z7n02ByMSmJXE5DB1jfJo/pCb4Rym930Mg059JjRxbye4YF76btTJ7
	vrlX8jB1zhqOFVQwjdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqJ-00000004wX2-2chE;
	Tue, 17 Nov 2026 08:47:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEqF-00000004wUb-3S4A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:47:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6ex2k2998571
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=; b=dSUV6kj+gygW2NVZ
	AL+MOFizMxnkrzsXpa1s/Mg2ksd9/DLQn6cATmbzC0KlIKjPtjuMlZQQdSqPC6VF
	EcNBKkWWgqRs8nctPmQQ6+aaurHjs8pvLd9UI+HxrmPVA7T9TfKxBk/8vEPT5Mzh
	GIOCh28DBk/tmyjJxZg2G/ovI8JmHUIFM7XADEWYqXtCmtnwsYKHAtMRbwmBwquO
	rhZ3zxN+Ox8ynWnmAMlzAqk+gOrVjHuaZmRL35RLrI1VA8rGbHMw7UqjAWSuewfz
	iVclF50QzZf/3HmtneF6pNvuRrvG+34ipFJiwR1TeaGSTubB3om9dU+qFZWxGxrf
	mDAhDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0g4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:47:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3177914a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905223; x=1795510023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=UV0bUcFzv+BvUaDe7mHl0Xk72bdTKAAICXJXUcgXShzC9qvnLKHIk62isvz9X1dU0l
         qA4yYI1QcbGFTJLOL21KFrBrYLoU6A/gFC2YQk/cX7VKVimVVR5dWLHwIF8CnEHJjZGs
         kho+3G8g6XJQFfJa01AjWKXOHLXLLEzg4djYjFt+TZCY0hc4kzTYVL6hpQzcWhBtCF82
         Kq7+zbpUvDyg0LBIOk8ie33LAp8/w+P5CUpB8X7h86QHbj33r9iLUVF+IaHa8yplT/z/
         QkFfkJJ8kGXVmn2W3lc1OBljBbIrusoNJcS6IfPN5exrpRXdKAZ95/e1I1UHhISJ03+Z
         FChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905223; x=1795510023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=lfPTiY/Fkuj591DbHTZFn/8nUtcHK089fb2u/gpK12JVTCOnDPLwGqbqXirWfyLM7U
         +h7YD6+y19qDpxfJNIZY36/Hkqv2BZHsTWL2WXLPX+uXcV+AG1KjcF5GFAvdjMG6fHco
         ZTad30v4dwlKm6iBkrrlgjX/s/vlpKrCqC7Ik9iF0nrFzuckr0YguvdF1DA+9HsM8qMr
         P93zFzpKptuT3VEAryk//N1cghRS1AXDrEfN+CJnjXYdT6YLIKC7dHANb5gfhLrUOZi2
         nWbmukuv9E7n6I7faOzrs+Ksn4+MvRfS7fY1OnzeWFcM3V4tOoCYl7owpgrZlr6Pop43
         Jc5w==
X-Forwarded-Encrypted: i=1; AL+hErFkOJy4NYyKxwo/e8IJPRadmUfK6YhXnQpO2Vcx5O1qkZym3ZzE6/WPPvBsjBkD4sNhj5R8cV2hWzNxKnxqQbeh@lists.infradead.org
X-Gm-Message-State: APuU4Z8UAISvE4VkeTGMzPEIFMkKh/d5BQefYfONs5iwQ7Vwd5W8Q6Hs
	aJCoq5XigAt2Lv6sk7rJZG9yLsXeNMc1wwhe1r4WolHUuI3lfV6+E0MP677Dyz/hmBGcltwUl1K
	lJUbQI73OiKMnDrUEE6CFbKy5wwoDhVV62qmo/EEu4S0sAHza4657riTihh/SefQ/J1RxSvnra3
	lafA==
X-Gm-Gg: AZFdTZeCMhVa7m5nVe8w095nh3Go5p5XW1WnAB9OYH2M4Wy6WH7NlATVUhpSFzX43e+
	88VpD0xA1M9Z6XatGtsBp0lT+Uuf7sB9MS/y/svsdR850oOld88IInSDAFiIjvG9Jmsm2tx0lHn
	Ger/8LjTSDXPU6w8XyWmq/bIjCqykFvwk6nhBAZAz2Tly5DC7woqXbSpMK4MEM65HqE15oVaVlm
	uLGiwZBnwV15a8tunkjjKz2l2p8UIacUpPqLSEz4/U0PF9Hzd2682KGOoOobUQRWV3VlUy38rRu
	vwXjNkVQWUrWQMbQWUjtOLOWDECs7WlwUOaoVKIGbEopi5uk5sXwPN/tFS76x1xSOIx5K/qqYBT
	zTfS0lt+Rr7BNbZvQ56rHvmMmYuigs6A9Hn91KzBWwBPSJV/GcvGTqG/WhKETVdZDVuRknrYA5h
	ezQA==
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754421a91.24.1794905222428;
        Tue, 17 Nov 2026 00:47:02 -0800 (PST)
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754401a91.24.1794905221742;
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:28 +0530
Subject: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=6563;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ydVlH1qQv29heCiLhOkMA2wLLBxXjI79R7JegvlpMfw=;
 b=S/5GLz8zAvWfZjdeL4Y7hB6T3Un+F6NsDm++mtLCc4Thra+HtC1v7ZXu6nD5gB++5SjJzuUT5
 COIwI8lD57CAITdb8xnFUigaVPzEgyr7gFO6r44/6kDKLzqV1ZoDwFF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXyWeBNOc9UPCE
 pFx6If5eTIjGculISkbEly0gcMQ6ZBu+51YNxZPCdn4bLRFh1It0PbAYfk8aT6VMVYTUpga75R9
 XnJddGkZU7qYndZUw5aaMAIawZHvdgY=
X-Proofpoint-GUID: 3F5OXu2IV5Qkb2uu9OC2fSZ6BUGJUl3P
X-Proofpoint-ORIG-GUID: 3F5OXu2IV5Qkb2uu9OC2fSZ6BUGJUl3P
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1487 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6_iyOJkiw1WCeSr2jkoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX8zd52MCiToTT
 5tNKTHuGbk7JTkvZNw//AKSlXohBUH8Fj5NX2ksJq221kiGHV+lRB3rtOzj/qgnNHuxTMfhdkwC
 iZ1juggSfp8eDVGepyxnMbpghpVftNjzt2GQMmI/7tMBmng4dOsUTaHw6rG7s1jMQoKZNmjv0O1
 YfxuoCCCPaLnKoE9P+YFK/6uUOyBibo72OlO8in8+B6nxS69/v8XW42TqwLsIazHiHejxspO7GE
 shY1TQGm7QghtDBjUzzGKwYUghW2+mGaR7Qll/eQnWvPZITpEHqvaXsaT99hBBLZMS0PRnUpZrx
 zqWBYtinVyk99UmxBjzqrL1JDsKuCDjnF+LaA2g+JQLMc49Fglyc+RjNKjrVj0bFTs7t5nl+J9M
 M+O1j05jTmRkT2NDqqVu2crdRlndirzU1o7O+OV14v9EABDOMsN5N2Cx+KldENDe7K2XLm8oU/i
 F+6GocyvkkLavLPTZ7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004703_892272_BEA42D64 
X-CRM114-Status: GOOD (  25.78  )
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

Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
per-platform clock-name lists and configure them as a single
multi-clock OPP. The OPP core programs every clock rate and propagates
the required power state.

Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
compatibles that describe AXI OPP clocks.

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c6559e749c0c..15639666e837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select PM_OPP
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bc443793539b..15385750b3e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const char * const *noc_clk_names;
+	unsigned int num_noc_clks;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
 	 * query it.
@@ -119,6 +122,8 @@ struct qcom_ethqos {
 	phy_interface_t phy_mode;
 	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
+	struct clk_bulk_data *noc_clks;
+	unsigned int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned long freq = ULONG_MAX;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
+
+	return ret;
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = qcom_ethqos_set_opp(ethqos);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP set failed: %d\n", ret);
+				return ret;
+			}
+		}
+
 		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
+			if (ethqos->num_noc_clks)
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
+		if (ethqos->num_noc_clks)
+			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 	}
 
 	return ret;
@@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static void qcom_ethqos_noc_opp_cleanup(void *dev)
+{
+	dev_pm_opp_set_rate(dev, 0);
+}
+
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * and set up an OPP table to vote for the required rate and power.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct dev_pm_opp_config config = {
+		.clk_names = data->noc_clk_names,
+		.config_clks = dev_pm_opp_config_clks_simple,
+	};
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	ethqos->noc_clks = devm_kcalloc(dev, data->num_noc_clks,
+					sizeof(*ethqos->noc_clks), GFP_KERNEL);
+	if (!ethqos->noc_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_names[i];
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_config(dev, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
+}
+
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat)
 {
@@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	ret = qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
+	if (ret)
+		return ret;
+
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),

-- 
2.34.1


