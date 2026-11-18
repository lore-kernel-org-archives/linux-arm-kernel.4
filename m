Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06FE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OyZ1cTcp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GE2kV9sk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHrhP3m9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=; b=OyZ1cTcpcHUSnH
	jC8k/4YOWA0YRkunXG1DGlv2hDURfmQGnRSUxlfyZv/fIMphCJ8I1pGUVZ5MiTRiJ22D22/yEbeTS
	XzcntX4OT/p0P3yUcRSPlhkR3KeAr/vlbxqiAATMIJNb+J2WtJHnp8gYkJcSVGQkeFv4vRBgnm2XW
	fvYTaqTzpIwMTxQecYbp2XoDMcYDa1kmxylP2ags2hR5Jzlk3nVjOHkNeiU2OCkcB2WV5Ik//b9lY
	rV8hzbz8HpxAOEFCo670koP+RaJlQwEZ4wC9fTshD1DhyBzSmeBfA2d9+hsMVoMEul4HPyfLUdZ8f
	kYsdo0bpIDzaThQ8jtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZht-00000007xv2-0GZG;
	Wed, 18 Nov 2026 07:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhm-00000007xrf-2R2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:03:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwVX2602436
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=; b=GE2kV9sktILgqV/u
	yKQQ6p07TUF4ZSRnWz6/0M5WpeH2ASyMi/GS8ztVerMhIKS5FVcDY3BAATPJB1rz
	U3gS7V7yKJluTeHefDg5WsgN9+0VgzyOPCyGtryg2czw1lOu88Bu4nMMhrnvqwma
	KzQPDHUGtIPfnQ9gp9HVAkOPJtTyDOmYe1dxN75ByVHO1AnKuNkJiKW0+7Rv8nAm
	u08vO5WsjcvcKgM9vPRc57CB0wAJ5/ddMcedmDjvE1rGyBV4K3T9B2ZyzrHFjCeC
	i33pTAZ5HkHNZNEqHqlI5tWc3mqULklrx6YwQVFkNqY0W5UyGIrGelhZHhVhPB/B
	n31Mog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71qwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso5239175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985418; x=1795590218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=;
        b=YHrhP3m99KJ/yDD+ljRDKwUuz0XcL81TNjZGuKGPp539R2ikrWKJjDuUAWGQIP305U
         sh8/1jWJR8SSHa1Our6xSdXoifKOYua/5+koaN/w/iFqIQMJMTsNL6OhVoDavARTK/pv
         Oki+scGWYHa5kyWx7PlfgMZ+Qgn853JMF2SH7p1x1jtYDK3R95B4oiXEMu5NQM9XPff7
         v2yQ3crOuiR8Dw9dgOGLqSVE5N5Sm7Df2pFXm1oe9AP9K+DqGqy/rvScu+NR+3hPV1Aa
         FTSBoGk3U/7haNADnzVBQwrOTkDE3vfZSLyhcMsfsMIWgyK8aYZE+FJYtzimhKmM7uUS
         wtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985418; x=1795590218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItYAcLnrCi4Em8kMhYzCeJCN6tEEDgv3HS0HUOjhTUI=;
        b=Ox57cKIVW/SJU2wuVH8uxl+dbfx0dCeZIWkKsqvQhPMGran4qsW83IJoJBFGiDchqx
         vNCN+Bnq6AMlqH8qmbusUyF17aKsQhNmp8t0rjWXDqifAwUx+kxSzqF8RFKyJFd+YlSE
         IlXZSdcGswKT6RxGfDWINXfNTnglbI4ZxPbukWEaQLX5TykZgRHMIVP4YzjM8I2Vkz7x
         FvwZR3PfCIXmlHGBZgjg09kPPmrZ21IuoCoXv7sCBOsr/P26HsDz5kKvJfZOU/NyZpaP
         a86eGbTW29ZpRVVDieax7bd7fbd1nfFSxuCBJAkABIEGJRmbMWd0PPTfxWMNn7HuJvMP
         NzDg==
X-Forwarded-Encrypted: i=1; AL+hErFBSzaMPdEMW5+vd0/MMcg1nEUH0cu3I+KSmy79CTICgvd/GQtgygiBPu+9vxGtSdMzVY0aMVLGUKLZiplZtZIz@lists.infradead.org
X-Gm-Message-State: APuU4Z9fIZEn6PA/phvgvTuF2V1fXudsPtdl5JuuotYpkFNbpgz8bGFH
	eWXsQT46BkV5h+9jTnVrM4kXf8nXNLSnr0G2fRL5cDAgy5aajY3tEgak6UD4+zAPPx9iAKQBMuC
	s8BU/enlMtRSnDbawsajX4jmAtv9fnnvb02HKCy9szNcxNzIqno12+iicwXcVCxNig1EW65IEzW
	yv2A==
X-Gm-Gg: AZFdTZd3aCjiR1YC8ThVIXXLzqAlgIdQYgISYCYyzHqh4By9wiou1lfdjoamF5ZeV6c
	gSPI17k5BT9poJ5LTfmAlQp21Z6JVkgetZmHIPP1VTRSxtnALJBjwzpXk0ckBVptDpLt3KNl1vD
	Z9EyQ112CBDFpe6uEApqSzLpdVKYAU8qj8Nx1fmALYs7sSDrqmZae8ijxBf5o6BkZ9ZBp9iz0Hj
	huJBx0dXcJ8+p2gVIEOmX8VdZ9xcVzctCPbpZLNQT+5mPNsgIHmfxWVYhnuEH4RoQaTIfOfjyAC
	BDIIbqKk8vy0v2zf8UU0Jr6UVUkVnCwD7BZ78csq4BFjrKMsgYx0AdQtQHo4fbvqHTpAzwrp+1J
	1EIY+O6dODRQB17t7Cp9Ql13WLV9g4U9n3wn0Hu9arO8hVDve4a8m8/S/lsZ0qcNUpd+YMQmBej
	R4I++bB8enMrkVKExJqmzKAGV/EtKjE5Ghhjbe
X-Received: by 2002:a17:903:1545:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eff72ea39bmr15578585ad.12.1794985417617;
        Tue, 17 Nov 2026 23:03:37 -0800 (PST)
X-Received: by 2002:a17:903:1545:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eff72ea39bmr15578155ad.12.1794985417086;
        Tue, 17 Nov 2026 23:03:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:44 +0800
Subject: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for traceNoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1345;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SPYJT+cxDONIBxHbI25D8ax8ngmkcDCnRoFIbVNvYOo=;
 b=7UpR6pOYX7zmF/tEi4RMp2q5H1zEA9ofVZJzGYf5rN0yw5YaBM3IRKiYBxTMzhhXCtGGvygg9
 wco6hsFf2C6DoYNkikTGU/AQbQB2zokEswMiMFRF4ORl3re8o0CeVuE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 6MmlKn_59QSXB4b2ubl-gS3lip5jLVw0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX9gFsRMWf0wEd
 cHY4tYTpJ2rngTL2OBcnlM+W1bOjohyaUlo7FQv4JAJ3VL9FdjiTaQ3sX1oWfTj+qg9yTxpyq10
 /F+btml44Rl8crlt6Z9Dvjpvy+IVcn7l4muDk8Ojoe9qG8GmK4oLrDxUax35AzlPfZxJGBHgsBR
 ae95/y9/MaOy7YqnagAWIXD6OOLTeIeC90hBNhxkwQ5XW2Gkk06F6oy0QKNheMjGchOZ5oKFfwy
 dFPedXzrOoyfPiI4TJZ7tmTOeP38tiiBc6xOHT6Kteb5QfkadyZ5AV9OUw08n+6CBVCkGclm/sy
 qxJIr3dkeUFLMnsMgY3b6w+nrv9qEm4ai+uuvDZggC5it63eQNoMMdHdEt3H/ZjbJn5cCFhJUas
 uR1SeorilNLG8sg/uh7Yl7DDBby5XFxpcVJfL7V6hVn7uyVju4cEvES2a1dXWtuOZ69w9+3Ux3O
 KpTf1dusULk+mYKXIAw==
X-Proofpoint-ORIG-GUID: 6MmlKn_59QSXB4b2ubl-gS3lip5jLVw0
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4dca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXyPKj4mrJpYFy
 B5HuJHam7jmYtvwRQQ71JmGwODVpzdJiDYuwt+8Q2TtleHRknFOwVZNPYJE3Sf7eF8VrjbRqD2G
 le4orolg6jLklgZkNBdw4N+vkI4D6WQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230342_644995_A203EE0E 
X-CRM114-Status: GOOD (  16.37  )
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

The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The Component ID returned by the hardware is 0x00000000
instead of a valid AMBA Component ID, so the AMBA probe fails and the
device is left stuck in deferred probe indefinitely.

Add the "arm,primecell-periphid" property so the AMBA bus uses the
specified peripheral ID instead of reading it from the device, which
allows the traceNoC to probe on this hardware.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..8afa9fd253af 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5438,6 +5438,8 @@ tn@111b8000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
+			arm,primecell-periphid = <0x000f0c00>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


