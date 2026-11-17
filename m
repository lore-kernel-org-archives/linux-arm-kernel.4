Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F071606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BZ5g9YM7;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UR/7fBuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=; b=BZ5g9YM7x7nvvk
	g5+plZ383riUUz1XukVbkvZtYLdhPKOu/x8KQ7tndVWjMzGgwTbE3ZjBX0oc8g4qPTimaeCWW2AYg
	/+ODfMG5FoDHWzhYTpdfRUpVzJiZ8Sgg+2+1L+pS/Xha8a2mMZdYgb9VvGH7eWWl40BWACPZtWPU0
	f1ci+H4vwn5A8F7fCgOsSSgIEgqT7oVuWIaPLcM9db33nzkYfD3ZjSFfkzwf6IpT6MremgBpEQAJM
	+t10cdlicc0Y4vqonkty2tBpGSAttJRlUrSTexclzhC27ElfNuXvmx8TBEt4lijMPQ5NK80E376Wj
	p+MZ+7Swds6AKPcaLTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEq5-00000004wMN-0Ry7;
	Tue, 17 Nov 2026 08:46:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpz-00000004wI1-1Xcz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55mNX3350219
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=; b=PTeIORmfxb5eviGY
	z3VBVE5lWYUwUurjpxAvW/aDrAqS+NYE06SX37iEiOvSK9zoJCR1Odxwh7LqcHZF
	B3Dttx1axsU1BPhRXcYNJ4xt3j1ChYFhnzoK6V9yGEJDIYCawZ0HRSPBHjdarVvi
	2kAcCRbNxzg1861zDQ5Q42knEwSoxYAvIOsUVIjAxg843OI0r4v65RVLWofrKIFX
	eQcRgGxEASubP4AuQ63v/EH5adsuFvNx44AIRsCaBDME/nUU0WaKj/uxsizDDkHx
	7MHnlrfFpV9DkBeD1Ft/zymg2eZMZpgfOVPa646ZJTcDIP0boEbghbIfDXHNXh2p
	SqiZmw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0sh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso520928a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905205; x=1795510005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=UR/7fBuh2vdn1+ZEY9azCWBwgTlp4Tu9+nBuUA14ofTrcstRg77sSJYYyajSaOXqsL
         JBD1yhJy6iKZWguf9qhf/+BfuBBRn/IKRz10UyBUIVQXcGIQMX/KuTDyHbkSafPLUZRg
         BgHpejRNV3g+T0p1Z0BjDv5k+niNiqcYgtIVkocqfh+EK/bEfwvYo/wXQzOFrk1fa7vP
         kvJWkkgicXcWnvZeOEckNtwMRmP7Nf6o6N4d1hvHbfVJEGjc2HUvgmB8aeu4vO6nVQq6
         zAqxC9edQGcrgzUljbrH8i1pKG4Tprxo0i4GrH7IkwJ5rLxvJFbFsJevyugctT5tkVhR
         nvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905205; x=1795510005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=xCvhBubvN5fGwyJkVBJ9mXR4keOX07FOV5C3LwBtjZlTJNuy5wdp5nTaFLFVm1TLLt
         DjhtSyaqyBLTnTtEwLW7nDpam4s853du2gs5GndW0HTHbJuuEdhjiZTPxLXjEwDWAPZo
         eZLxJnCjJCkrj/UCT7GNF/MjQqFtBFApAZU0ShwomTDQ89zJttt60xo7LwfFdnlq0Ast
         sJm/iAU1oWWzR+3DgUIEbIQFfUkKes1jpmQahu6BDd7assV7PmeoDC71ZfhcGlfKu5kq
         vzf/6/elkf2PAX8Qy0duzOGCZTqVZzDYAnm+f67zPJwwJQq3S6ZydOu5l0fYyoLp7nKu
         4oRg==
X-Forwarded-Encrypted: i=1; AL+hErGZ3kwTGo+29BX0EOvUF14A9dGLiM5tP0SBnoOI7GH2y1jY/4uVmveYG8Wm36lEO7xmUbCZwSOFYwZc30YzOv47@lists.infradead.org
X-Gm-Message-State: APuU4Z+aYSnv0GNfPIohSU4PxtajMmrGHuWGI6Mv6TlozkRbAJFv+F1W
	lt/OdOJzkSRdY9gFh88jRl7o9TT0AjH5WQrr++5XfuDuUKURoab35eY9TvZX321aOlWtoIY/DH6
	pJlS932tTaEOMQBGRXG+o1pCV8loRGYIQhJr5xBplsVzTUQz5p+Q2McjjXJPZ4dLoholcpvX1eD
	kEAQ==
X-Gm-Gg: AYBFou0l7GoRi/H8ZBWjBVPC9Ico7W6SfoShxaP2+DssaKki/57BlXbPcT7rESV7aU+
	exRuCKNI1ioMPoSuKzEMZPRr+jpCAbUdueuzht8bebxSDGKFfamtam/RcXKR1Fl+GvTm+Awdmjh
	WSpZQ5nx1OW1BRxTFMufCoX0kq/IBpFQe4r1/13uhaVYHztNrDNUip0U1QZhE1w2mPc6AZZk0ki
	dqVA3mEQ3Ddqd1aZfbQCqj8w1XB6dAYQ1lfD0nXPbn2w0Q4RiOwvfJfjLGWuhbo0N8wXnfECQNf
	pFgeyhRoaTwJpVLsdssIRt3Cv+j45uguXI5gAptfeTpyNyOw47xx1f+uyvBFElfLFNmz0daJtiM
	ob8VUcYAy4m6eZ0m/iNfE93lFwJUmn3sUwv56a3stIwMM+40GTs/c475YxP/gQcPOGP6T85Q5FA
	G1GQ==
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539568637.24.1794905205221;
        Tue, 17 Nov 2026 00:46:45 -0800 (PST)
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539524637.24.1794905204643;
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:26 +0530
Subject: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1511;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=RpifxHIohWwcF3nhiLIn3gCgfBa+VybjsdQk7Cx2Trk=;
 b=LRDHro7v7JC89pC7fis0z3esT5dgan4Jacy+s0RcqgazDgOabVUBiBt+r1r07PWd7aQcMyYNo
 yu5IWG77AJ9AOFi6+o5QTuBYwU8+Jpd5ORfpMUbcU48Qf7jWKisFg7B
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc1476 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=pwD1iIOGdNV7nma60yEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Cu4jT4Q2Y6ETkxteVs86oRNstnljOO3Q
X-Proofpoint-ORIG-GUID: Cu4jT4Q2Y6ETkxteVs86oRNstnljOO3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXx02Lop2V/ET3
 GBunwk4iEbCyZuyleSxN9tSmAgXpm7jYsxIRtWsxxDKRBMxp8EFKJSYBuVny2vgfr2ZeagpQ1xQ
 VIFC910Gb//eCyVGDQSzIULU/N4Cx7/cdh1ryd68e0unNkjeHI4vsbrwj6JqfTO6FTPycejUfVe
 exS0oRumoGYvnzDzF6rJlOTwBC3Nkhcgc/SQrGfDk54Rr+w89LonGVE0vUoKUIQAPR/XNhlJ0ED
 Y1nzxCZ9XcatjuEQuW6L70z/zDxa/mnBhgyYdPZSp3yTfjcbRQWDRjLnA3vzoJSueZC442J05m2
 wLXd5npHd1JSnUqub/YnE9DEVqeELKQyGSjRGyMUh1AaYMPAjNQ7QowRV0ozAojUeI8O3Yr5or+
 1/qW4Jw+dtIyTRK7U0Gw3XUTw4bw4YvGMkVYFoPMMYTeveqZREKAOjrOGs432X5Bz7OFrbUG4lR
 3iPiyWVfx3cWr9k2rBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX0FvaEjnBCNss
 fZZJdqZ0yNeOxy8edoXVVi0WM2fLui+WvuhiEHG3hgPMg3sewSlmv5Q3/kdM1omlOxOhRvBqpPM
 g8mcV5jEqbMo9oYsEli+tRe+SIBSqs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004647_567775_D568618C 
X-CRM114-Status: GOOD (  18.02  )
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

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

The DLL locking is not affected by the current clock rate. This has
been confirmed with actual hardware testing as well as the fact that
the existing code performs the DLL lock first before changing the clock
rate when the link speed changes.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: add some details in the commit message to address concerns raised
by Sashiko.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 99ea7e0cfb00..192788e00dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	if (ret)
 		return ret;
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 

-- 
2.34.1


