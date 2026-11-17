Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD8606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AviCtD7y;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U3RM6RkH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=; b=AviCtD7yppIdtJ
	/CdvXPPjFTPczBZ1fFYwJpzVtRi4LjgDNf3RpYNH5JHOYKB2j9OGYhm98jkfxpUnICcS9jfmBWusf
	P0DiHH0Om+Hy+L1SiXLI0nrdvRG0/y4rTnCF4fzZwcMuWBuWSWuuhGA1+qhKASnl1ys9Kegjhx5qp
	vkJ8sLQ3sgP9+e3TGqjWLx5ggx9+z+2/6lMTurm6lPWeZ2SuCLKX6I3m6ZErWzCal+2CV+5MYhPWA
	RP5h97ipT4b5sMEHXOXmcIINaa7y0LJe+w+SVngLpddQrW0uaacDr5rUxF7qy++pBxAFfZFRoU6Wj
	M6fvH/ISWJnzwFgKUkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpU-00000004w0g-1kcM;
	Tue, 17 Nov 2026 08:46:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpQ-00000004vz1-1WSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8jOww2934211
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=; b=M18rxBSSsEMhIqJr
	PXBfchimancq+y9b5XcD7PidRhr3x16OH5bDcp/ELGm9t6bM80gRzc2BdxEcQI6n
	pB+jLk7DbkclTK2SbrvG3/BYEq6w6H3lvbSlfCV8JvixxJ9h6ZZCIPAjgcZpycX1
	265BAY30empgxsZiZnud3g8EEBQVkSPVHs3xs/XYOyuaK4hp71FscYseeD52IfFu
	o6+mxmm/UDL8P0YkMuU0Hyu8Cks2shSchWkwhRGIs+krgO6fPieRm/swGK6sVBHM
	cDfSNj4ZmMa9vaewQmHwNerPHqP3Nt7m8z8pC4vp0ePkQ3FXnzkSPhfldn4lph0f
	G3Iisw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a6x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so3394347a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905171; x=1795509971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=U3RM6RkHWyRzwDpXixXKk4bdfh+RXDFmJEyeZQOIoIr8Ij9Zw69Agu1FNCl+E4eojS
         Xqh32s9JfQEttxrelMa5luZwbHk7BWOt3bQPXnpiNt2E1Ql4BLOJkFlaZ17//EpCII9h
         t+/gUeGkNPyuQqmQwNMUmhuKbZ5C9Rpsd8qkg4icx6YUOMSttBbTtpfpkU+YD9VMqyf0
         ODii+9shIapk35wwKRIl3tvu1tx/wF5Ti97siX9JB2LHfyHMj8MrcQebhatBABlePoNj
         kVw7ESdTTlpKTvhNUD9vBRcTl64fuyuISngC+j1opYpINZ4cuyeB7rWZQp6E7SxuzeLY
         DDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905171; x=1795509971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=QQ3kx08Gfbdwa+nlmtQkewZcELBmKcK8hRJhDlZ0Qa9utMS3xf1/KBMIDtyoxozS+Q
         EoBhJP1gBYMXlSU5fTtrP3Rc6u55ULSf+W2xsalR+9mamTvsw004RQwFprNfZM6UverN
         KzgQnwbEV4K3lk+6ahubFbTrUVtUls0HP6MvaLkfqV8uAFrwM8XZpu3rfbkd59Us/Z89
         ktRzCEmcuy9Sv+oWbb50GXLQl/Rgp8k1oDySpag712yDkmB1wSRMgOJLEDQBia3cLYVw
         K43K86iu9GM5pSFfn/HGcltzoJ12aBL5vun+khXDxQ3BZA7YUP9XU8zUvyRzkBxN9Pp+
         MeqQ==
X-Forwarded-Encrypted: i=1; AL+hErF0JehrI+jSnTfGVnCj8XV/LjhXrPaxFnwrVQLDTiwJn1t4mbTrQytjDNTLyxZx+HHAAOCfZ5qMrFeojk13g6EF@lists.infradead.org
X-Gm-Message-State: APuU4Z+rU33oWTIhvPN8wQtKaXS+5DGMBrWjAs72z7dVG1gxrChadsHM
	fop2SpImvqkTVWRRV7tRJfm4udBNQXGDkDClkHgUWKTxK5xoWaAUr0Xo/gXApUDpsm7ZE0P+Wiw
	aJKBgM22WAhEO3BEU7JMgcFx6az2KzwF+DkTMl0DhDcl1CkaIoiE4MjBmZK3DbX8+DUrVIEY87V
	i2/w==
X-Gm-Gg: AZFdTZcHJmfEtxkP9NaYdfzxVI1Etvv1SbIRmJ/TfgSCvkHkkFs8xuL7YI5zetqj0nq
	ENv2HrPnz0aNYyEHqqZURUeQYBP+PM2Tr89ht1YdNhBWURBBUdF6Xj0rz/bIqmm/khoCIV8kXXk
	wpZK7JvzD3g40mi4SAT7L59++jJiMeOLUopZy7Pw+oFPaof4SOhyn8mNciyt2EO1WcpeKJte/PE
	Zww/Kv6WR83Fi2pZc6ZrI+lR3ZDxEoE3SWV8uQ0/muoYUrE5C/P+HyrSPP4CZqNrEWY/utsF3tQ
	v4kBmRlUXsuYEPgZKlXvEPCJ+d+51NOPSxZDeq7Bu8c27PKZhFL01wqr1SAmdqjmPhdW2Y9kn79
	7MrE6cMbpcmALRZ/TeqiaWfbFh7uchzoceBBe5c8NuvTvxWmgkBwbnOA9GT5QhWaq8L6Cwj0OZv
	1Wmw==
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688264a91.14.1794905171033;
        Tue, 17 Nov 2026 00:46:11 -0800 (PST)
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688235a91.14.1794905170522;
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:22 +0530
Subject: [PATCH net-next v4 02/10] net: phy: dp83867: add regulator supply
 management
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2626;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YMQ5tDefjahp4F278sVpJOmFjvs9217PzQ14SbOl828=;
 b=9DYxR2LtiyVkshLd2XOkW8YZL+bGdidE43jGBndpxcLF7Y2Yr0ul8pgYXZ21EzTlUrEcetxJD
 sfHhXFgqkVMDGoUQqCaDh5KFdnJser9ZSG4dFXK3H3x6st2IkhTedBJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXx7Hm0n20iN41
 CsGDKnL+ac6P1yaNp8aVjqENaQUrAVKYMhZyM2YVmLwTZfGW7fVO8fnBr1wNUpziGHSM4L7tdjH
 2vxNN0C1Ey44MTbwN6m2+dS+g9yp4DQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6lbiGC+s3O2W
 1C+SEy7/sEcDlTNCpxm7lR51edPw+krQV4DDhT4CAQBdpdOva2GBrPnElalMAxgbTpOYf7mG8dU
 QtKe3eXIdMU3hiaLW04YCocbuMQUC/yyWHRKDREkyKrRFegtRx+GKwTJoUDCv43/XNVu5qa8yuA
 hCi35aJF2/SG1EbxH3KtJYv9fxmstExlrLgTEbloh8QRJKjed7O/ZJ1PNcZxaSxYahO5v8hGh/2
 FeCpHg20O/dtEUe6OCtEhm7DDsvXRFsSOwYMbhlXrzUPU0eBzw6tQYhiHc9Fd2yyII8B5UJ17Sh
 hth5FDSE0qZ5bdC498V2kth+nAL6W8dWd79l8V8yCfEzjEYod5176/g+Xu9HVFJr0ZnyujZfNvi
 lVzqBsAaLibwH79NcrfusoURbG1yDffm/pCZopvZ0XviB0VA4acM5HuAQdeaUax5eB2CcyFjYoX
 hGm78kPP1J26BDFBy3g==
X-Proofpoint-GUID: m3QG4mrIiz45WvjGDWVqXewZXXcN_HcV
X-Proofpoint-ORIG-GUID: m3QG4mrIiz45WvjGDWVqXewZXXcN_HcV
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc1453 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004612_414030_66500DBE 
X-CRM114-Status: GOOD (  19.32  )
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

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning. This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: Sashiko suggested adding a check to skip dp83867_power_on if
CONFIG_REGULATOR was not enabled, to avoid unintentional delay due to
its code stub.
I have kept the Acked- and Reviewed-by tags since it's a small if check
requested by the AI review. I can drop them if required, please let me
know.
---
 drivers/net/phy/dp83867.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index b4b4931c6f8c..ed8b3089e8e0 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,45 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	bool supplies_enabled = false;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+		supplies_enabled = true;
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (supplies_enabled)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
 	int ret;
 
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
+
 	dp83867 = devm_kzalloc_obj(&phydev->mdio.dev, *dp83867);
 	if (!dp83867)
 		return -ENOMEM;

-- 
2.34.1


