Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2F606B18F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yfPJxR9S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=h8E+iNev;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g141Idba;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2CkvSIa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=; b=yfPJxR9SBk5k2w
	7VoewYnhSAYrSUrNLiJd+M4XnIzaNz5cWKtgb4SsAG4jnehjYURtbpp3CQ0QfS1VjFoL05b9MN3uW
	kVFt2mlPMggk22LMMg9NvljJ4U5mxoIdOrydMuauugiet8kqejJGAtYl8UfYB8tKWQd4qf1j5fiHg
	0l4qN/VfQJgZVU5phhIVhj3pBwM6gZNhPH5+GcRIw9d6FWuWtmNBqzK5D2UnGj4XGE9lqtFKmNpMI
	PzJ/mv8VsCWoOTlUEKy0SBShyYXeE+Kb5679MrDz0pIh5LsUUTVed4gEcwaGj35Gb5QjZW/r0e597
	z8zBy0IqBDx2KLVSrSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxf-0000000GWzG-2jwk;
	Fri, 27 Nov 2026 14:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvt-0000000GV8O-003u
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=; b=h8E+iNev4N2Wd1UuBnTGdUu0V2
	2wQL9sQrzw3E2Zu10pExuxjZfSe30rakwx1QhGRWQHA/fQHVu/DEJNliAWtDPsj56JWzCopTu9RW6
	y3ljui0XdQzEAqZmdQWQUAvdpKoGYLaVutvpiwM7tBDlOTBseZAQJE0n85oHVd6bw9l3MpUCgGuZn
	rjbHd7ca7h1iaGa1xq7yF070QE9hpt3CiHDj0sBixHxKGk1I5Japc0uDaVbQBUL/vfqw8NsmuQAE1
	sSeCf1xc4ReM3LJBwt5JR3p+GO36GOemvh1gtoh0isklH6Iy06U1CAwucjr9uYX9Eu4rUa1cn5+w8
	F///teJA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvn-00000007oRE-08jN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:28:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Nl22471843
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=; b=g141Idbal/nOlXmq
	fPRFmVNGttuZC/wPSV9DDG/VfBRxXOEgJ/QZsrhGaR+aF7Tg26Tdco3Et6cjzRPl
	BPQXU9SjM4uNy+DFT7Emps34iu+8UEJG5FOx8Mhrl5kQpkWfiY8e8piSLzyKkDBo
	fj7WT0xXEx+IDaD54wnAXtFpfeuiQ8HekC5hRp1F6yURkCKoEy8zBp3+8fbE/MqT
	FPmn3NvCOq+OOFL3Oo2+B1X/U21xTT0Vm6Q7OjKfQjR8z9cO6JvHTMmwedpg8E1M
	uwT1rAaJqkZqEPMGhwIZk3MQBacd9fs6P1ayXO6pFpRV9SxpYA/TXXwJvos718tZ
	fj/Pgg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasuag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0578f1d51so84704365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789684; x=1796394484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=;
        b=c2CkvSIadoGRg2u9HQ0Y3swuzEwnTC5TVARl22SmgaUrkgN1xDWFk2x2NqZicyfwlD
         A1HkLYz+y12gt3AgxnHrq2McXMY9kCAHu7+RHJPAuf3FCluSqQ40GKZMh5vgJAFLBGCm
         p34TfaGh/B1IBWlDB6oQDsGTKzTaGLXUSJXbGrovYGh6rn3g8qZ63sKBofGGa3suAv69
         87x405OZzGdaFrdI5MgZ5JQ984FhevVDLLMz9WNn0+RGyvZ/1JKMS5hlAbPwB9ErP1w8
         5lYEX1AXmSKd8S/PcH+sUj7+tvbrjS67/MOfLka1iuuo33gGIPdZOqXs/FRhztODeWxX
         R/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789684; x=1796394484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0hG8Jb1Y6qF44AWIOht3HNn6wcbIKqvyMCN4L4fN1s=;
        b=JjERYtoqsSwkM6IJWpE/YorTOawY1t26f0QRIVzC/eNp5EwH9R705plBlgf6YwiF4M
         QGDvURO+td+otZcDdoeHwlHi9tZ34Q0svItg0USAPiXqaR19cudXnrZKJNNnAFyyLPDs
         qHasMSaKWtjzA4WxrYowrRxj/U61Th3JRcNrMY8vFKDmw4qStA0f8VdvsKpuKkb0tH6d
         Mp2vnByYdtyfJFjXYdKjc0luhPwb6KEVeDuc+KXaAKPhOEGeHU3biD400LUl1G30R7k2
         p2IDHVfi6pQxqJMiPsDkEI2itGSwhGSpQ1zkBVR8ZIQcQpUw10IaYwNvtJWFM7SCHJdZ
         uJQQ==
X-Forwarded-Encrypted: i=1; AL+hErEBqewLVg9691DG9DWZrPQNtRwq9QXaDhpa2EBOmQzLRaFMaA5jmZ36W7kScBIdzEKwnMURiMZ2KQHVGUSvPLTS@lists.infradead.org
X-Gm-Message-State: APuU4Z9Lj2vXK2PSa3fLNqhJi/4XDc66khQVDJcz8oc5xXFqq2HI8Ed9
	wCXRU12rP83n+xjRu3eBdKemn3+yx62YowR83Woq9x7bC6xWHMOdsHmFQjPGVGRSeVBpjgjqOsG
	f+b5jQ6DRgFbQiSHfnV6aOtWRPVl9pmCnCMmNuzMU3nWKMcJoMPIPR72cyyK0eMI8W28wwZiP0s
	sHzQ==
X-Gm-Gg: AZFdTZfpUovtGZPV4JobRKkno5shlEIVuIA2EHx4Sg0i2xBRk0KNt2+20SSbRl+3EE8
	M/60MCpUqum+ZfSzLFAEamwIM9U8lxFcGQWYfA/gKOQ2XBJw8EB0KJwzXQzzPGC0FhrDu4jU7rK
	apNxKe3Y8mi1l43fo5D6nZXY/MsW0Te8kMn6o57ROMq2XevqWZHILqO1PzUeilcCH2xx6wlEd9w
	5X380xImrmNx6yXRrtorN3V5Og8lxG3DyJ8FZwAatKt5gtMmpPOYsrdVi3lc3U3bRHFneLK1PmE
	EF6ZQR0G9ASs2MFqkS2IZQpYiudkbgisenk2+1N55H9nIPE8aYVTme6uQwz9XEul2DynTgGjxJ/
	g8nAHJO+ne33INXfcurOyQ13GYaS876KMh8mL4JFIeg2YWEkp2lbx4l2iqYvVEoDTQR54YVMR15
	2alzUJuMO0Qg==
X-Received: by 2002:a17:902:e802:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2f03f0fcd9bmr288955395ad.12.1795789683717;
        Fri, 27 Nov 2026 06:28:03 -0800 (PST)
X-Received: by 2002:a17:902:e802:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2f03f0fcd9bmr288954955ad.12.1795789683224;
        Fri, 27 Nov 2026 06:28:03 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:02 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:58 +0530
Subject: [PATCH v28 05/10] dt-bindings: arm: Document reboot mode magic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-5-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=3254;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fjrWd62tIrrsaXuNLgObFiqAcnuoh4Dw2HgLoYsQCzs=;
 b=cb74VuhVYBbjR6BWR1df34l5zUvgiu6ifNRzc0PSu+o4HLsQqBUxU8FruxVk698KLEKVzknY7
 GUmuuhKi9MCB2sh5AaQ4GsySw0wjAZ4Hdd69ZQkLoYoUOkqecHBzoBL
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: ri0VtklavlK597ji2pPJkqusrUN6FT-v
X-Proofpoint-GUID: ri0VtklavlK597ji2pPJkqusrUN6FT-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0NpJZbyNdgdu
 lqyIuHB4Q94Z6whXepc+jniYqq8IbqbObos/YoG5/0WwUm56xHWTQ7yiiD8HOFCysSRVs+vXXoy
 NxLWyfwM7wqCDImW5NSeJPkoha2cquXrwDBocf+mOxnOSxFC2q9GrZwGyVir5sB8QBBogbnCROf
 V8871e2s03e2nNMP7t9ec+1pyIBT9CilprVavfyiI61WH+QYkcXRm8wxTTQk4o46QHLIYQrcSaO
 tiFBoQdAgeFtaBXMzxSaQ767QImlCK4khXkCnqB1BjBjtysrHBoiRiKiaScP8cFiAEbzEAdMh6V
 SIfSiYQi3kPsdnuyHBSY0fcC3fKDSkzuwxmzMJQO8Irli5yZ3PNXOJrqMgaDzZ06AZINRGXtCc5
 fXGESS8ZirTawsiNjVm7kH5Kgpl85U0Xg3A5FLbVtxKL6Dtn4A3D94ibhvP5by2hwnbk/xftNpL
 XlZzG9N/jG5Mw2ttVqA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b099375 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nNck_ww7Xo9pDmBGQDoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX5ChbJfyLUu/n
 fiRb4Qi/TSN1F8UBJUcJn6IJIfQSROtkYLKwQNkfgKFDrfhwL+Odt1PngfR39lGIGThBpvgyH/Q
 HTInytb5ZQbuGETb+dMNcg74mCjWLmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142807_174383_051F74D0 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: -0.9 (/)
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

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81faa..82ae25e7a3386 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +170,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +302,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1


