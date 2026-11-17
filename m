Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DD0606A895
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hlb8xvM3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIQ1MY3j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=; b=Hlb8xvM3fV1pPR
	I9Vlkoav6kncLnespCk/UhWkRkMjSE5BgnJxk0vXID8fUr8ZCmqrWYhhWD+K0ArMlHXGVlSPxdmST
	Y0Qmpnn8oLSJ5kC1S23YU9FjTi74bmQzE2rpXviTEZoFmNdzS2qnlnkB6VfSp1x5XvSwltT8Cn54J
	Zv+ITp3qEQhfSUAoIPwxV/WH2DDkNr89xupJ6eLG2eAW7wlKoJpnm5wZn88wPc2ph3gRZH0nrvRyL
	SlCtDTYc5FjD0r/V8GgP+c1fTb/aiAXJbGm738lR7IRvlQlwToR0xwtdipKKA2Vpo8WINF/NwTmBB
	K0/ptZMhyG60O6EeXG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpk-00000004w92-37WD;
	Tue, 17 Nov 2026 08:46:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEph-00000004w7C-1q05
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8Qn7G3624354
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=; b=WXp8YkAfLNdBX102
	2b3V5vWFXZCOY1QzwlnF/dlNFGn9Le1yo2w7uog/MdPNGYyLa5yVO1vsOorCAu21
	U9DhTd5Isbqzba9iodGbWVYpsPvOhTyudhvNDdL5S030XsW3hWlEPrcHROOubwle
	qzNWy/Cj01rXlBF0mP9a0luAWjc1+9rz2fbdhx+Y2lVVYrDV6426qIX4nNhYzmlm
	IEZVoKxZEu48vXxDTP11ckc76eJi8ONs4n4vBDYDuo9j7V6aWVN8nIRHYs7VB4Ym
	0pKljB80K+DxUk7OKlUVeICnMZXxiXcgBn/5zgdZQ+neoF1rKtdgcf4ALPHJv8Ki
	ZQA1TA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejp9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2566457a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905188; x=1795509988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=aIQ1MY3jxsgvb1tZ0DQDJMVr3RdMUEsOPLcm/LoxqurKy4orL1dOGKTvTc9/lkuQPF
         QZosv/cGO526dHq5SURlqEkgLo3B45MN3CQN6tAW2DK4p7FsfahzgWG0LhoZNPFCxNZt
         9dGHpa+qKYxN4WogUDk9g3QC5OcsIpDXADx4vnCyjWOZ5Ys1fbXXn6Iovqq0vZNJtRK/
         /lPuqIW1TdyC9Ku9xaso/Hb9acwl0OBL0I3ENvdcwAsVs/wE1GNWnzcStENZTzqav0EA
         St1a2l2AqHmxa5r4F7yQFn7gkjpTZNUlMwF8lqjLJntsHMf/GptIaVlgYcYiT5GDZnCH
         pVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905188; x=1795509988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=G45LrZuqDcT29TDaX9t61VZOhmAAAXY3mvbZj8ZQONiWWLV02NrkJS5MFRFLu9Tafh
         HoMHIcApEm1QvVdMQ1zeMNg68u2o/d4yQPPX/fDecvDpm32NSPaNnK+4jwJONDFUw/y1
         TKkV57ukBqBhuBJRmxNDusUfIRCG4qSU7Db5XCS4whjejUQJDj8g+F9DzGD1iCDCavl3
         VfNGrLv1npQzphMFZPX3lhEdl78//oTWjwqqpWudQCxPEl/fLNGk/6BfRQxNXayDlKCm
         n/c4ByrjXTVhfr/e9ACdFdQnkQGALSGUpcmWqva98b+agVHeop+Rs8h2zeIrsCwSy9d7
         e0xw==
X-Forwarded-Encrypted: i=1; AL+hErG2+Ev4U97CF/Pa3Udzg/sul/q7OqPa4Mp0k2IFFraNuBJQPm8vSeZyYGb2lTJ78UjzFrayOACC2GdIGAoaLQVm@lists.infradead.org
X-Gm-Message-State: APuU4Z+emNURnYlXhgKMj0n+8SYWiiVD7+GvksDUaPUI6XTWHGlF5YGU
	8+vN9FDCYev4oGYtZv2KBCD3ulbq1CTKetEE7zEuy1Itz0GOqhDWcjvW3CQnDIBEAfSvAc5xAJz
	UUutS82Qu0ioju1EW5DczkYYacqaMKjmggw4yEYNU9MYEBx5mhhC2zptszGhRK11Z9qy4ObYDZn
	0l2A==
X-Gm-Gg: AYBFou1dqAJgagUvmVT6mKr1cxciKb2zTSpw05zonyU65g+bZckh6Y3POr+Cm5l3vFx
	SEq17iIuadJgeS3GSkn4q8O9gSbeTNBEDN/JyOjm7pPMV7PW1lTX0aOix99tN9AYiTdQyiNE75n
	gCcI7eLUTjDu0/fnPwLzxEqAx8saAjHPpws1VqimQv9zNO7VImaanu5uqbBGCMkjxL5kulBypOh
	MS0G+FJzsIntsLs0w1ubMNp5p5MqiJtq9tepUFGWnXzR2zXgLm/OMAsoTEQlP/GLQAO6vThEo+y
	RldUqZu2SnZRELgzsBooj2UnlQSmCUIZmTKbf+nYXBFQxh80RBFxjBbR2E7AV0Vz2oHy8ZcLJdQ
	pIORmKcvnRbtYOHOXdaytGw0iPSLdu4bTOZp1nYeCWBJBwaDDR4ak1UM93MvNU4d7Umyl/xvdCF
	7jQA==
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182581637.65.1794905188171;
        Tue, 17 Nov 2026 00:46:28 -0800 (PST)
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182547637.65.1794905187603;
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:24 +0530
Subject: [PATCH net-next v4 04/10] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-4-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1924;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=h8iKXwGfP4z+zw3C5X6I1w9ChDSEwoK8RxfNrBe96t8=;
 b=kQD6/F8/rCLDa03R5m7H9YJ6yMZIibUFFYNTVT4Zn796GNjmnhaMoEYXuxPnHy634R57WVUR/
 DSZdcFderHwDrShBS9akj317sJ08LUX1Z6LInvVrBAUvzLKN23VSJ0p
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+HWkBSWPrNfF
 leBJnCZQlQE7i3jO8b6MesjgbGA7wt+BgTaV9AeKrV3+GBe7dXboFoKd3EPjhXHeCUd5oLCuqhw
 MyaW8YxlYkxtCxpq8Ip5CzuW5d0hzS0=
X-Proofpoint-ORIG-GUID: mIrFuJB8bkhb8Wp87uq1RKPZ8vfzOMH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6TTjnXsiE6zm
 q7nZLXfWaM975k/Zd82jRm5QMTy1MxO57z+E76qD+bRJV6Ts0dTpwmCBo6Kki7Aa/behE9OhLQX
 TEgsE0FulsryjxvbGjMVx0clCGG/WAJu8wpcVpAogsR9SFziS7H3BKUipS7jdqsjM1yBiL10epC
 Im8l/rlsdt81E5Mk2Afqb1st/oF0SsiqranTeK4/63/q8lIWlftbmJeqChGD7a/c85WphnRFrDO
 C4xpdnQ0Et/QELPufgT8fAv34MLIgbvETPlQ+N3/KyhatUbf9xm0QUESbKPZuZjGUNxDfepvt6N
 zWr8jwAboyJsZ38gvA0gfYWfkYilSublQIIaXD94e2Ily5xqEUrVCy/YJyYf6PXREwc/SBOSiVu
 AkSAhIj4uzLQPlp4YLRAxIy8uPRagxcpN6/Wr7GJUec9KRxFk/ROlBcRELfnWCt9RQD0lwL/PGs
 prSPXwi2LvFJ36VH+Ag==
X-Proofpoint-GUID: mIrFuJB8bkhb8Wp87uq1RKPZ8vfzOMH_
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc1465 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004629_491468_BE001DD4 
X-CRM114-Status: GOOD (  16.16  )
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

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..f2428f0467bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -411,9 +411,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -424,11 +423,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -519,8 +513,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


