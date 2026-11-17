Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FCA606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4MBOfQN/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD67Bjpp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI0UYK3A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=; b=4MBOfQN/n1TlTw/VT+u9LqNF+z
	pdbtJQTNCFpaTNCkj+mVNnmREGaDs57Q9eTgpYSTCPDMSRISc5tMaj1y2ygab4IaPbsmnF9+Idmdq
	Z5YykglooY8+HVfeoYiq5xy2jpy4mn2n4Xz+O/eXNKrtUyZvH1yQpZwVCgH4mN+GYowSu/eN0wCAv
	/s5i+WVnpMcfj88nxxL4xMv9+URUm1iJzTlPO8clrL6w3W7EaHXbl6cbWCYh8/uh+C3xxOXunWMBB
	fDTDFeem4/QLChJgVDZwDDShv9bILYSyL3tslKeePY0dfs8ifZ+hucd2B2nO4vbI6IpbDSCQ+DZOv
	B2vGLu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpD-00000004vsX-3YAR;
	Tue, 17 Nov 2026 08:45:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEp9-00000004vrW-2O02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:45:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8jCfG1800820
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A6pdC35Th33dCRVfmfQIEP
	xZrmhsEjdcOjU50FNkALA=; b=eD67BjppWIgyG1YJe5RiUzc7gZht597ihqsjb3
	FlveHaXzG9kBtZS8LUjjb4kOSbw9nn4E0aQCOO16UfnwTAopmJl6oI+w6cF9jcPe
	W1c1BeiNLtRApO3TlDyrFM5wWmnjsdblZUNacJI1QrL9HJqkWbuR5eCJLgJfyE0U
	n0R9QFuZeZGPwKKDTCyfoETUzZmX+XpbWN4zRi10CBZRVi9yQXUXq2SR0lKdnIu7
	0CR6m6AquQEavnpMmm0ZQSLKbFWmkG+CjlH5vTkCQiwDh0FkzJAZ42G43aWXWQeu
	t+f8WMEkof2QOn9dzObkdinvHXZ+iKVdR9cKf6Z8oQ4Vh0xw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3xet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:45:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddc4bde4b1so2101413a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905154; x=1795509954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=;
        b=LI0UYK3AV5CK78dJrQfy9tcw+EahrCzpM0/dPRcT4El7G50TbPjQw+nagTTT5iqeCL
         AS4iDYAQghhzkFIh/Bw8pQxzdEsGtIQQMOC6C3JqiC/8Gy3njIuITCHvlO6mx+FuaMED
         x8kdXezeyD6JNt2KlOaSyiL0TpygpUM0a4RGbSk+OwHb3w+PvSaahGH8Yk6BSqe5lWKX
         grrqXLWRe5EeCbWDapQ+hWZkXj7C72nGZZguj3zuCWhd59qom9kgmpIQo+70j9dHrP3a
         6eqzrULLzPGEZfTWoZiuADXaZmiZS33RJJjwXmCn6oq/DTQGUSiPyUu4uVh4xvTA/qqK
         6Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905154; x=1795509954;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=;
        b=2WtOksw2PGmt+hOwX+Wl/GokN+yyDPlw1wNO07nrpqNVdv7u1xf/NNSN90DYb6mZYG
         BKKD+DZ1AQsJOiaPb3gJwlYFUax3nRDW50ZjXeYMJTVUF5rbP1zVQFORRXwv+Tetgx3v
         OjrwQCTzQnbfcNae1u8Ox9Opab+XA7dZx8hqK/9w2cDN135qVmmAIkqMwfxP1e9Bi61L
         gNlNl3yZh8hgRu1gxwXwbvhWC686h4BDIlEYIwXxJ9pIqFpkifGwC72irm9ph0B3pYPc
         LKFIZcnMaSCSXmYdzYcnkcrBNe7BjrJUxCX+FHIm3Y0HN2CKAbq9S2F7SRYZLP+j+A9N
         96XA==
X-Forwarded-Encrypted: i=1; AL+hErEEEqM8Li8TB1ZomgoTG5EtPyGkX2rTUpF6mL0e2bW2FQ1nFGx7RwF5yKn1oNHCc8gMKzBsXN8c7CuJUeKDS25S@lists.infradead.org
X-Gm-Message-State: APuU4Z+33Psnt2evKbzH6bY1tb5PCHjz+ylFe2GGqkbeSWclFvYzobeT
	F8G4up+KeE0x+7J/HOS4yZP7tdG/FE1m90AJYrl+3DCLVmlh7eqeRwdGblJQ7qlPsR5pZT7/URU
	9KLsNiVktSpi9v5BORqCnpKtwlblZQYYQwle0wJQ8avshRTCBt1FdVweK5MxxGeiheS/sjhjOpr
	TXBQ==
X-Gm-Gg: AYBFou1pn6TjH0ROhYAZDPRImNU29lh2UHTA2OlapWtm8CtxhRzwg603PI04Ze5o81H
	sv5lzrajCI6Ksh4yZmfkUCx5dkaT9RDSgGRBmu4ghj/Km509bm+aJSyTH/MufaPUDpLH3I8izvy
	sAxSNOHVSzkj7ZkeeS8Ay8bmeSZAY6ap3h00ejuX4O4IqwWYsAJv8F2mq1TtYOYJEUXsFv1u64Z
	GoFIqM6eG4f77wxnVBXupqaTLnioq3bxE/FvoCcaqbbDOIRebRq67pMQwzoryIfY2vDpH8VDxHc
	jHfU9cnr3oxVKUh9RzwLh3psKMHcafeb+wNzN2fMmMpahbWvXwj3a5QLqa7Edbrn/nqDKKjANrL
	VaWIFTYSmCMs014+9dde5UK/f15KZobLF4D6FPQwqHzh1koJtOwxYtn1xH632y0LT42L/oXJJme
	ph7w==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10335164637.26.1794905153896;
        Tue, 17 Nov 2026 00:45:53 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10335143637.26.1794905153312;
        Tue, 17 Nov 2026 00:45:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:45:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v4 00/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Date: Tue, 17 Nov 2026 14:15:20 +0530
Message-Id: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAU/GoC/23NQQ7CIBAF0KsY1tJQKLR15T2MMbQdhWhBAUlN0
 7uLxIVJ3Uzy82fezMiD0+DRbjMjB1F7bU0K1XaDeiXNBbAeUkaUUEFawrBX+urkCYICZyBgCXU
 HwKEhFaB0dXdw1lMWD+izYGAK6JgapX2w7pVfxTL3X7VaqbHEBEtOasHbVhDG99b74vGUt96OY
 5FGJiP9ZZo1QxPTdcBY0w5EcPqHWZblDSbxwQIGAQAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=6868;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=7TpJOavRGewnNemNBQ57hic/9O2QRq+vTMnnYYXy8eM=;
 b=RfA2sASEs8xpYrFLwoQcuuPJhqXZDFQkC/PbaIje71xl1STw+4Axt40DjssPJxfugzILBwQ1M
 S6rkIJ+BWKkBoNOcCSqsy4A8k88UtbqPGK7LE5SFiDva9PWoH5o0lXC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: qKFkCaOW8E-TQLrrg4bmWqQB5DgwVRzs
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1442 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=3FMM8ssWo7dxxMFcYGwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: qKFkCaOW8E-TQLrrg4bmWqQB5DgwVRzs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX5XePO1ZZRZ5O
 p8mC+nZT7A+BQI7M9nDbx2pECtMvR9+CguhRCXQYm9X2YmRky3J5rk7YCxBMzDFM+gnLizdPoVp
 /D3AdZlxlQoo+CkpY2trquO9JDwXodg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2Zg084iHDYUr
 UP13HYQ3IK7FasSijmIZ64INlYGpKijKEAar+14smj443dbSJhyzZnUYBim/F4h59r7OAwV77BT
 s+eosv6AfmDqrn/8QrQPSPdmoscE5HjXtvobZDPEdHCL6mj4O5Ge1AXlAzfStTQMSOGxUoiVgiZ
 G1RF4ByZ/gfMBAimDBwk9gVilkzlwxDHzyWlRG+6//MP8iyNQt9dHDnd0SKujbDbLh7NYX+t0Ep
 stY87VezoKdQFFCyN/ek778sezXxm4higvufqe63rrFzQvEVtGBtFS5mpF3cCUDkxa54ii8LcuJ
 MRP/wrf17/XO62W1fwBCDH4GPpFlSgi6YcqdhwvCKH3K8vrErm+JrIoYbREUe1YvamnFAd1fnFF
 ZLlw05yJoTyhXqig9NmmDJSLJ4KFRc25eSRJCSFHpCStpYWciA2LYv1DTteBfVgBKeiZ9HHBZtY
 tEVY/zDk6FAT57suSFA==
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
X-CRM114-CacheID: sfid-20261117_004555_633934_012ECE3D 
X-CRM114-Status: GOOD (  27.10  )
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

This series incorporates feedback from the RFC and adds the dt-bindings
and driver changes required to enable Gigabit Ethernet support on the
Qualcomm Shikra SoC. DTS changes will be sent out separately.

The series has grown from the RFC and can be broadly divided into three
areas: PHY power supply management, proper support for RGMII ID mode in
the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
required for NOC access.

1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
power supply. Patches 1 and 2 add supply management to the DP83867
driver so the PHY driver holds the regulator vote at probe. These
changes are largely inspired by similar work done for the QCA8081 PHY:
https://lore.kernel.org/netdev/20261015143849.483339-1-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, the new
flow to use phy managed delays is protected by a platform specific
boolean to ensure that it affects only tested hardware. Legacy boards
will remain unaffected. Some other optimizations are carried forward
(initial link clock to SPEED_10, common structure for custom
dwmac4_addrs).

3. NOC clock voting (patch 8) now uses dev_pm_opp_set_opp() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2 and power-domains.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes in v4:
 - Re-added the bindings patch for DP83867 PHY regulators which was
   accidentally dropped in v3.
 - Skip dp83867_power_on() if CONFIG_REGULATOR is disabled to avoid
   unintentional delay due to its code stub: Sashiko.
 - Moved operating-points description to the top-level of ethqos
   bindings: Krzysztof.
 - Added power-domains as a required property for Shikra due to its OPP
   dependency: Sashiko.
 - Protect the phy-managed delay sequence with a platform specific
   boolean to avoid impact on legacy hardware: Andrew.
 - Dropped "net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes"
   since only Shikra and QCS615 are going to use the RGMII-ID mode.
 - Added additional details to some commit messages to clarify Sashiko
   queries.
 - Since QCS615/Talos was also tested, a new patch adds its platform
   descriptor with phy_managed_delays set to true.
 - Link to v3: https://lore.kernel.org/netdev/20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com/

Changes in v3:
 - Remove #ifdef CONFIG_OF from the dp83867_power_on() function. This is
   a result of the recent discussion regarding similar handling in the
   qca808x driver:
   https://lore.kernel.org/netdev/atCSWZQAyqvz62_K@aspen.lan/
 - Clean up the -ENODEV handling in dp83867_power_on() and use a boolean
   to identify if supplies are provided -- Lorenzo.
 - Patch 7's commit message now says set_clk_tx_rate instead of
   fix_mac_speed -- Sashiko.
 - Add a new patch to abstract away the common dwma4_addrs for different
   versions of ethqos rather than duplicating them -- Lorenzo.
 - Use OPP table to set both the required clock rates and power state,
   update ethqos bindings accordingly to specify how the clock rates are
   described in DTS -- Konrad, Lorenzo.
 - Link to v2: https://lore.kernel.org/r/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com

Changes in v2:
  - Collected Maxime's Reviewed-by tags.
  - Updated Patch 9's commit message to explain the double enable vote
    on the "stmmaceth" clock. Open to discussion on how best to handle
    this.
  - Wrapped regulator vote for dp83867 inside an #ifdef CONFIG_OF check
    to avoid adding an unnecessary 200 ms delay on systems where
    devm_regulator_get_enable_optional() would return 0. The change now
    mirrors the QCA8081 patch -- Sashiko.
  - Fixed ethqos_set_clk_tx_rate() to double the rate for all PHY modes
    other than RGMII-ID -- Sashiko.
  - Moved warning about the use of non RGMII-ID mode to probe instead
    of fix_mac_speed to avoid spamming during each link up event --
    Sashiko.
  - Fixed error unwind drops OPP before stopping link_clk -- Sashiko.
  - Fixed OPP vote set in probe not cleaned up on error -- Sashiko.
  - Link to v1: https://lore.kernel.org/netdev/20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com/#t

Changes since RFC:
  - Two new patches add supply management for the DP83867, replacing
    the gpio-hog approach for PHY power -- Konrad, Andrew.
  - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
    operating-points-v2 for Shikra -- Konrad.
  - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
    Andrew, Maxime.
  - Updated binding document for qcom,ethqos and snps,dwmac.
  - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
    "pcie-tile-axi-noc" as the only additional clock-names.
  - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
    probe.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (10):
      dt-bindings: net: ti,dp83867: add supply properties
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: share common GMAC4 address table
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      net: stmmac: qcom-ethqos: add QCS615 EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  54 +++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/ti,dp83867.yaml        |  14 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 286 ++++++++++++++++-----
 drivers/net/phy/dp83867.c                          |  35 +++
 6 files changed, 327 insertions(+), 65 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
--  
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


