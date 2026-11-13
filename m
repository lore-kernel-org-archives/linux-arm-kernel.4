Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41000606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lrjdH85U;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9nM5+IS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCjoSJT8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=; b=lrjdH85UXWnm6qX/NXC2YxT1BL
	F5JHrH4ChwrYInMv3Jsa7qsJWNQh4+EjN3dbsCf3XtJeEgw0u9dwlyucPAX0dWGmqHh8/HWf9qPXI
	DAVYQ6EA7EIko+QKDS9HqKWS8JjmaLoOJw5unYeC681MvpEYzPpNm1VpQBlR2TEVRiHaIQws1m9Be
	p2gxMeFFJkhxFedRxmd4wk04qCNCeVu5lXadF5rdksYp5o2bRqBAYIRjFWvpNZ9SXvSCACybr0dZD
	cQtE5yGHfhTNxmw+Gu23VlqWqbzaEq/xrAh/VTPY2F3b1SMftEVV5ZzOd9Kizu3yLCrh6nqmgO/vX
	KeoK9v8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOt-0000000E0va-32KE;
	Fri, 13 Nov 2026 18:53:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOk-0000000E0rL-3B6M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:53:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRJDh1725088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQs
	I3XESnAo=; b=I9nM5+ISNqJ+v7xR4xPn4lKqp+FdLYNKSvCrLgsn1d0OcenQ8mK
	VJG50aMPTY7Kqt2XsxQiv/pNXcCQS4Uomn5oOe4GB5KRwRBGQCsMXvl+csE1UFBm
	OsUr2g907A6KldtokdWkdKKrAhLdD5KPAj2YMvma4FszD9DRyoA3P5NMtwIpj7kO
	7rX1I257LOuBicMq/sXqunWqQ7oheOKb2VhpZgc1bbH1HpCYIhjQND0Y8R2jZgja
	yyEkO3BD0I+W33iDraik2L1AwSrCsum34vpxB5OAXmS24CewP4vc2Ite1UVZdTPB
	SzYsYz8toXsOK5iOpnnc3ccQDfj2bUkqQMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9q15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:53:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so412683985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595997; x=1795200797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=aCjoSJT8107dbmtUtZ6xE3cmquqNfp2yDLsAkUeHWOwgMa/pGrs5lOh6oNK8g8aocM
         6nWGbtEPPCtphUpIpcvNZ9cyXCxIHnqpwvpntrWBeWsQ3Ed/GR8bVIqUiiClCARrfS9/
         hU+Vi05x+56tJhbVU5U881lG+J9x+iF/UOPbjmdxWwJAco63N6nEJnMYW2skIHdd1pQ0
         EcXoJvqzwdNh1fxKzUPrQ2X3G4Qk1zVCua1BXmPwnp64MxAfJVdZt0sIRxeDe80COk3/
         qB50Q1xK/YEl4+dzVcNioiYdf7xr9pMYYxYBwNMg89TT3Qd8awtnDR92O7zs69T7Va6b
         qcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595997; x=1795200797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=SXH0ZfV5amJ0rOzFEJ4bxBu7lLXoegx6+V9qOJC1jd1oJzSZMj5LArrRFkD79xqlKM
         1reX/ZLo5xd3/AyIk980wiljTwyrEebcskuMM0OvS8shRjI108f/VRQtOnk51yhlaA/b
         0aEMSKA8DUik7U0mRNPhn2uLME1sfV9glHozcORiYTDWtCVyAKm4wYQ/sXf4R21/emdH
         mHSfmSYtY8WUEfPQJgAlOWMuICZpwIZJRQXIPW8EOqf1pIFRnh80vqnPU8wbkf8qCwS4
         iqgg/oi5hCEA+guEeF8THUSKnQQu8/RtteD2oWCcFzMRBhUkNenJk1dmnRHhHXTNLWod
         kdlg==
X-Forwarded-Encrypted: i=1; AL+hErExrJ5kutvdKZHDF7/kUreSlS4ux1aJzE3Ts86QNjyUj5o1xT7oX81Ye+vwWfvSk8sB3m6lbbtgidTUx/Xag5bp@lists.infradead.org
X-Gm-Message-State: APuU4Z9IsDO1Igxy09h2kPnGjAHFltICrp7YcsrrNMRKz1/HKEi58l5R
	I5Ms26cAlDFBvhGZ8uRo9/4EmigTvdnkrn1Nqwcm1jCfQ1bBcVQr2bdSVs0zsVQOqTgP2JvFWUr
	H7VIUhekd07tkXZIEz2K56YqokiDbUqb7GIoxRwxjwCfsEy8ZRtmLWBqwwqq02p2vB9TpyeQuaz
	l8lw==
X-Gm-Gg: AYBFou31fmxdth1huEcTw2VYaCTCl0qkTU4UDBSpL8nYIhjvI9UpMx9Vcxd4620/TWG
	pc69v1cFDAkns61CsGRZSQEpzh478hmKwWq4c6+Up0csT9HYhadX7yR8juqyk83yTFonq7khxUj
	8uNqwu5tqWYHhvpTBPLfjptQuD4vNgiX6z5nC2H0HuhRn2nQzcDQ6wG6dcCxxpNa9LXTVpp7Vjx
	YrqB7cexmDzR5DB8QDh14Vj2CfBfa7MMnosmcKUC4Mj1148/MDJzm+WgW8R0JQiFLX2XVK4H39L
	rj0o/TXjgl4f4PwsAsa6yJ77w/hE4AWw4WdMd281CohnfsyGAQKwuZp1uPL+/N8uwxmXqGekcF+
	zqtnAXsg3wBpncibiS7reUxABk+OHTKPMwXNHaq+bZcCh3ZoDnHpcry55HqT+Fg==
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579500385a.17.1794595996931;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579494885a.17.1794595996364;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7369881f8f.45.2026.11.13.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
Date: Fri, 13 Nov 2026 19:53:12 +0100
Message-ID: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=li5zaRLbjcgdl53eNiBCGywQR7ZOj81A+LBTsS7dipg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yXeHEGZqRT6/RVGrwwPfQidox76rH+LTSJp
 7nYEKNA3gmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdclwAKCRDBN2bmhouD
 17r5D/0d40vumkoOXhkSDodf9sh1qigBkr/vyOW5jnYQZmdDU92dDDMuDxKoqEQnsdJmCHkTubI
 ixM4r0eunLEaDcfq2ke9GUdKE10iii0T0R/BWNkO2YCJKEvXo37YTD9xBkjnONSdzB18rowoSoq
 mlxP/N3Lp96xX9DMGcdLAl/C9HAnrYjGbXt4O4NxEZI1769sBMWT1k97/1zZy42FEedaIxsTxpJ
 puFFCtfhQ2mh1r1C6Fwy5u6BOvoaVO2het2gOqJHiGWuK15yhOAl+GThjLPdMgJPh+7ViFJg2Q0
 BTJtHm3b0al+LHPOUsCWaZBTpO+3XjFqClpl89rFyPVhN276sUF3Gh+yBjmGUHIxCsX+/wCCzrQ
 oMhICNCLxOuo2BUZvPNj3GeQTkhCftafV0s1ny/NLWfe5M8fLA2YNIbWDzbe6dq/gJV9IBxQxb2
 d+eDBV9fJtZ04ix+gcVq+X4V9NjF16M8sxIoDWHJIvLv9rFjWSjdDe2PUQKMKXuQwy9GDpl4RXI
 p4sMpjjN9Twyop3VdnwOn265Rlq3+aBrg+Z0OQc6wvZVVld3DVnBmuPQUgx3FKBuZGI+gmHvGA2
 rRE/R7qV4IYZ1aouUSHPCxoGMf0Pa5KykdMXRxvE3Q+P7wry6C95zFVa689zPV31WUKqLI/H2Sq TXH3KsVXke0FtVw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af75c9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JQ9b2t5kTtvAtS6z_5gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ss_VZvMM2ZhLdVTkNZq7E34TVj5ZnpfS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3fpkwY3DymRY
 gQWrTs7/U/Yx2ijKsD21K5Xt1W9cDdnaPC6TVbG2uRcwlsHkVcV5aQRp5RBDQGEjXxeRsNvcK5U
 itaDMJJr4Xowf1sOS4L3nf0wvJN3t+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6O1S+gXHC5yW
 VnOWbx78mQ14gUWeQjqWYh2sHSqLFwAM31MoKKy+VL6UbwUP1Q/D6lVWu3fJEFvGvVIxIbYFr+Z
 MkEmHd0b8QgJSnhs7lZmD4S6quizYhEjf8p7wNQeO7oq20Xanh25sQAEV6q+WFjhb0iP1aYs/Ac
 zKucRIbCzU+//dKWGS4//j2oTlv7ymcDp8HXfIb3QByKN72EeZCs5DMRx+Ygqwr2+qwPqk/ji58
 UoWalBmcRaridLYl4JlAjn/5gLaxl0PQMsespXm4vHC572qFhXsHg+erk7iEFeSQlgDhaYF8kOD
 H6Ue2VbzNrOP94B66qrPoj8h6mrpiEROsXCK1GzRrVnoxtV459EHl67uDZVhhc6g99/Y3xaafCX
 ImbMDvYs6Kix8ktI273e4hw6Ru3SauHHCNFCM8e/TeijfIncyOFqmXE+CkFBVfoSgEncvKvJJLp
 Ni6w6UVAYTHWH7vPlqQ==
X-Proofpoint-ORIG-GUID: Ss_VZvMM2ZhLdVTkNZq7E34TVj5ZnpfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105319_178703_AECF0B51 
X-CRM114-Status: GOOD (  13.87  )
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

Correct minor style issue around white-space: double space before '='.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 62585397b01d..4ac849329ea1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -913,7 +913,7 @@ connector {
 			label = "USB-C";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
-			try-power-role  = "sink";
+			try-power-role = "sink";
 
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
 				     PDO_FIXED(9000, 2000, PDO_FIXED_USB_COMM)>;
-- 
2.53.0


