Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9B606A898
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPpKB3dF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/rnF6/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gF7JhIWr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=; b=xPpKB3dFED30rZ
	V+aKWsXccDvvb58jZKcLI5OlRJmtb+aGF/DOlLxbJ++PMrwWP/RU6EkEIV9Wneg+cWQbC1i1OAXJO
	3T9rczPwwY9mXehDnLyTLNEo4b0GKvxFMGp9kMfb2XAf7bznuxPe+xUZvGU9PiPTQK+Keycad+O1l
	bBcbyNtbenTrZjsor68brkcH7xNR1aLTEBQTMTsq4Xhv4IcQENI+BQtWF1yb8qNg1sS1YUsHW/Vmc
	Eeha/aYPipmeAl9FI1ghnS/6dBPvu6FRNE8DRW3MrzSXTqG+Ifenn3JrS9d/8ZMWovUU4uH3cO7R3
	AyHiRGTax+/qPbUKEDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpJ-00000004vvM-3yew;
	Tue, 17 Nov 2026 08:46:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpH-00000004vul-2wHX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXgM1801438
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=; b=Q/rnF6/QYmoq0Fp3
	l5EArxNdwZ/4pyRKzw3wdqxLwoeL3EIwtX758TA2dtLtcZldx1uZXIgn/uI8Uhg3
	iZEbWY8o6ybfVTr20hDbMZjGJf3JViCf0Q0nvD73gkTNPJhhFp/xnGVD0mKuAGJp
	x1z7Z70d/mMr2NlZDy+HNwJ3nsEaDa2oXrN4jOqwqcmCwyR1iPop5e915Bct9ZWh
	EX6QPoF+OdiKzQ/kshG99O/qnGfgAbBKglE6CUR1hqB3drmDeBH/CS62dI6u8mMX
	CYclj77C5qr5YFA23iNwl3vBOxq8pjVdCHydpOgmFQWK1+eSh/A2CRDt3RrSA4Hr
	H4Bl4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3xfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5807883b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905162; x=1795509962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=gF7JhIWrjCMNAbJm4/JbgyRJCvoK0XerC7/SiylStbMIM+eQWfu2AWinlKl6roUo42
         pg7u5brLWjUs332JmGr/OQqaisBNo1uVmmS56xjEdgcVuUZGkEdtz+JQTQucsfqY3Cyz
         jF+Avy4TcLEXDGzi0D2/5ZyDjEm70LcmUSynjCyYdjbXeYdfC0kqhfzlYZCb8Kb8VH8g
         a6G5KJOM/7jBJtlEJZ9kFR5zO3GK4dfkSEQd8Nm9JwE0ebnO4QqefMy1tHS7OW9WYEYN
         IBTNZ0+DjtJMd3QcnxpicQdPP4bMYb3KGcK1xj7JwetIld8H/XX54ZU2zJNUVMI6RCpy
         9NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905162; x=1795509962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=BS5tBiIdhsb1cjFV1oplTGgxSm3k6eTHBDfU7wMbehUN7CUDUIluzmrm7dMY2Zg7Xd
         cnjYvnuZgmpI9sc3cvxsk1RBWwaJmdZR3GoE8NiprR/8LuL+5VJiZDpzAwZHD5zhT1r+
         utKBZ2MyVeiqhw7NbDOjXKu3xGwmnJ3s7LWVeHSGpoDdgy4/t6v5w06Co8JcX42ojsF8
         iqYDbP3ObMs9KSdzac8gIMXlZ46Etxwx28/9tQouRBeuRnNCYr7ObQNJLmYxGF31qmch
         Ht//HCp6j/BGl1rMk8uMIIMPMYXGd/2mS2i9bPHE6BjGSTi1YaMyI1hBNP0YhHE9osLP
         /JaA==
X-Forwarded-Encrypted: i=1; AL+hErHqPyC5HsSoMA2VmGdgaapMIBx5C+VTfOWRJr3Pv7rCbBEVs9YpPKzUTHSURXsxMdlMjtw0zoneCI05IujOowXo@lists.infradead.org
X-Gm-Message-State: APuU4Z9AL97f/otM4yloVo/IT237vzc2wh12+ksifPCbbb6rka2izF6i
	i2MF39AHacGxQ+r71tEZAo5M09kk+3VAWNjUQwNyk9RMlaCRLQSRr7hmw+XCnTPMb3+mWUhXF5e
	ajv69mwfKfEhSlPBv8twPfdFEjkiYYeQm+WJJmO3qwyRxINmEgB0LjIozmGU8+Ld0y3e3wvz4Yk
	6Aqw==
X-Gm-Gg: AYBFou3llYqlrzZRD+Wli28Lfnk/ujmOZLg7OCTQ/olLp+b2wSt5Vesfdd7LJ6+Uukc
	8aVtUhJgTu4FbiB8mmtn9ceqq02ekJdFCmQrluOh5eI4+FG9F35sAfuQwgxMaArP8jbFIL5E9XF
	aXYZ40nzM0k+rqOwmqzAupl05JEo5xRJ5f/Y9OYm0Lsa+zs60caDqEtzlcrE4IY9DxeTdb0Ikmx
	Nk7QeDf/+wQqQ3YtR9i8VfFFykQDSQwjGymzjn3OXTvnq0NwtT82VRXcppEXZFY6ZF+b3M1lw4c
	eVyJUIMxv0CDUyzk7tx7v24GfbWlyXflL83mv604K1ameQ+aFqAyH77gZ9eCVpnxnZgdjcFYzX8
	lFnTHqlRvGYwwL1+WVA7tB7gpnQP1rkHSIxz+y7zdnLWRFrub27qqwxcHQxoftiex0kmUNyLirM
	31Yw==
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500692637.9.1794905162442;
        Tue, 17 Nov 2026 00:46:02 -0800 (PST)
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500655637.9.1794905161882;
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:21 +0530
Subject: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add supply
 properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2011;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mjS6fhMb+ocKCpwPGoezcQxON+tek+N3jqUG0k3PUBM=;
 b=UsajLsR4goRt9vLB8c8weWLqISCqGRYgLriF+2Qva5JGkNQYR1Xf/cnWnH9z5/FOM8VStJqU4
 Q2P+2dmPjHaDuPD/KD+Wqbv3dmD1+74n+G6rHFACeaFivzupgQ24HDK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: Wjf1Zw-OSouYGRIkvFpqlpP7VKSoTOxg
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc144b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Wjf1Zw-OSouYGRIkvFpqlpP7VKSoTOxg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX/iRbWbHTZ0aZ
 Ycm3MiUgz06iAIK5Y6OlFMg4B0Fv7JVV3Sjs84PFPB+rE7BM61RiIyRFsubXXQA+DUNFt+2VKOF
 7XyZNYBB5eAjcQ+BAmflN3hgD6IjoMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2ByIJ4Cu858S
 iJqX3OAGaZeVVN5C00VFnsUFO3zuEMCmY8Vtqa3sJtZ8+lx/o7UcymnkhRzpxb3nbR9WfWbN3pe
 IlNIxz9B12hHZScxN5hRNF5xeWChX04lQMhIv+kHjJpq9/yVpxdmvLe3CQ3R7IMWQaWHU5ZcjOB
 KnHHTKUMfqvqE29rQ/KWz2x3kge3TbYCKovjkPGEzIhkIy/dBZJfFi0PBnS8M5aFbA2LWjuPD3U
 ImHUQGtLMTltF5GT9Bm11K8Y+Gyd7ChfsqKy13rPs+jpuGtxatKLzOO8pqXADnRcLMmIMoUMNnd
 5JblZL7R0E72OmhRanDYzt2WkWNHMz730wVq5XuoAOeaIEHsX4aZTXvDOOkvR4q149BCTfboK6V
 wDrUO5W1jUiadGYEDGVhDMVXOvzHv7r1NnPTfOtPtR0cLWbj66RIdBWB/esDtVSPJaiL3en24J6
 baYX4Op+EyYYAYlPLmA==
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
X-CRM114-CacheID: sfid-20261117_004603_779247_11364B4D 
X-CRM114-Status: GOOD (  14.86  )
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

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: This patch was accidentally dropped in v3. It has been re-added
as-is from v2.
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe..e78f08ded3d0 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1


