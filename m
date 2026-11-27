Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnVVWgm7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PtfqwJEp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwnz0Gye;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fsrycbNI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=; b=HnVVWgm7dIpoqU
	4lDkpd8RjmzSwZMxdFUQVs43NPhHvXzyIPfdGw0YvFk++cKFRVZfMPD07Qcx1RRuo3HYYFMgjETe3
	grzQaONQp/EqUHulpP2jWTiTAFwHLSD+0dZTiB4SjJMY6YatRcxgdWwMxYJfHrRfSrSYKH+XMc8Dl
	pvJZTgxiuB6X5td4kQHmY91937OCTK5ta4r6TUnCo227GgG4Fq/wFvHPR27omgUkt1plGMjhoSIzu
	rePNSwYRxSW+z6jo/vcTerptiGQrrjPOZL7WTZc01Qj02OSPkDIv0/KNKgF++jQGuxK1/8CQBqwY3
	lUKFfL/JVDz86FEF74bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxo-0000000GXFJ-0eAF;
	Fri, 27 Nov 2026 14:30:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwa-0000000GViO-2BWA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=; b=PtfqwJEpgPY0Ou7pdqgo+IHnk9
	cnWedwKYAAqHMTuss6ni97fGWU04ROZeRdv4ItaCZODyeyy1tsGIpYhPqDgGaLFTJz/moxfiC3sHj
	NQjqlUpBlw99gsnAY67aHNRq8BXkbKhmnRbpvq6ccn+XyfRht4aQ6niMlhwr4/QAQa3dvI7ha27/J
	W+vilpj3PhA/BT6bv/voYSHhM71QJvT06nC1j/jEeT7dTNOHl53O7wQngibUUtIP+ZjC5kP+Yu7JO
	PKHH4mcqpenCYjvXZAhyI4Gh/+0zHjvXmOef1L2VhnkPVXTlCAUmAuEqVz2Jt4Scbm39mS1qW/F0l
	XuAcZHwQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwV-00000007oib-0WqD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:28:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GrK2376245
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=; b=pwnz0Gye62u9Xfkt
	E5sKVFoBG8xOnqk3DfCYPhRQk4zDZV1DF3dkkZIe8XsDV9KN5KF0aWR4F/19lbCH
	6CcvGsxjmtJnfIud2lTeCOiMewyRP/Nkpk2fNtJvzmTkSixI5UiRA7+LJSbLUIUz
	CFaRgCn55Bw+aHhI3zkXpzpg2d7/yueVreOFN++cfEUa9oznrtpHl1HbIUOzf5Qm
	zMLP1OQOFlTc2dKBpq+nrx5shsgOWfYpjyEGcK5SQvFS2PAbZowoK6q5gAJBVMwc
	pyqlr+I7Hsv5P8CalbOB1VsUiRLHiN7lHTLW7B/KSYtZzuE+F80B01spDJiA0M9A
	hgjWXg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hues2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so5540633a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789728; x=1796394528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=;
        b=fsrycbNId3U172C9B8Cvxd9wVsJj4J2RtpSVtEyF/gREFwZnmEjtL6Vk4bGZmtXqTR
         oP2fSx6HpLdvvr9cqj7P6wVjeeng92mteYY1O+5fOUxejiMI2sMROmmP4Pv7liI/54r+
         xXW3l9jKrbcGnWyf90TvxUvkYYXrYj5XWLxDWYWlYOoI2N+pfeQ/52fnfabDCdzAlWxH
         lGoF80mjqzr4ybW1CK4F/iWqJn38R1ot1MGpfkD632Lr54OeVHYOcJtPf49w0ogV4rbj
         w6TFn6AkqWARftmji44KmwTnZ0rPrTHBZ5sGMUUEbHoBrsd7rtSQMtR5q9drkcDwY0YJ
         J6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789728; x=1796394528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=;
        b=j3uAvo4IzgEHIDQYcgvmAcs3Lxvr1FmsvVWhH92HocJLfSUSvp1wFIGgg+RdbU15oW
         7QZ/bOhmpJWhVO7HKS7gDTJuWm9I9TQ+28wvXiu7xEmooDRkiGXK8vVeDrXFgmEJbXWR
         IqXeAzhsBxLBH8c7fRrVEpjzFER6yDJLfNpgpzBBKgIEpPFOys/CTAw5CWg1T9TNMSUd
         yqCZulIMPEKc9efNG7MJHDSOqw7h3Gf5DQJypp0+5S0BhEvipTcoEsSVfGL4m+ar9Liw
         ++jRH7uK/K2SmEGe3dDKwQj7FN52AF+tJv6J0B3+dXGu7bz3gg6preoGoQ2UaTy/3Lq6
         FTeA==
X-Forwarded-Encrypted: i=1; AL+hErFNWYGiROfX/dLLu3/PYnctphwmu5VeSMWWQm38Fqut7cbpkrfEq/m8b/G4Wa2uKZaXXkGZC0lxTmuyKlvfPkZX@lists.infradead.org
X-Gm-Message-State: APuU4Z8ApwBcAfMla3Kx/fFu6Mig25O+iwHnWHTxvnF+22aKq5dFkBRK
	7UVpsBm2ieZWyZg0o0vgw0Qd3nfKKeYm1Wc0IVV5FNVQHTg9o5truukHRRH1jv2Ee92MBx0GAgK
	EHlLjbEEC3FBt0LWyfQOkpnILBCxrwdxY9BznLRSEetcnp+N903778hHkq7+AClUasX4+i1NGo7
	irjA==
X-Gm-Gg: AZFdTZejtUn/4q2c2ePiaRoZd15FMtHzVecGIrdv76+OQsXav1iFMICUKw94x16pu8K
	sUT3RAAcu1yVJfxaDs2Jc2EoM7uplr0KyPE2gq/g9gWJ/bpbdSQUMmcv2yJCmkmhm4lJH9LzUaQ
	vuumTzLeRHx5XwtpF4SUVUpii+HFfJlQ/GI1h/bzTmsXuh60QYYcmq1dgG0mSepyWKigw4J3QNm
	rxNipz+YlEAyiCj5OKVmBfodOuTq3wiLlX57U9q3OenWGqpOLZz1HfiyhN3qkSkKiD5bHOxC5cr
	Gfjr500c934LIWHwyHoEwfjoVldZXxAVBz1fjB2cS5vdFWm2bI+8RXbJb+8Vm2wd2d3+6q29UcS
	0Oq/aefjLnR9Fa7BA4Nr2P1PuMM6zVM3pb9kJLtJpXgtneBfM4xfa0LHS0hXTk+kzH/OJzh5P3Y
	O7L7Bp7dtgrQ==
X-Received: by 2002:a17:902:e80b:b0:2f0:943:118c with SMTP id d9443c01a7336-2f03f18fceamr239299415ad.25.1795789728345;
        Fri, 27 Nov 2026 06:28:48 -0800 (PST)
X-Received: by 2002:a17:902:e80b:b0:2f0:943:118c with SMTP id d9443c01a7336-2f03f18fceamr239298905ad.25.1795789727763;
        Fri, 27 Nov 2026 06:28:47 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:47 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:02 +0530
Subject: [PATCH v28 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-9-da05a33b08d8@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2135;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dSQwIim7V7/rULXlCKUdNr3qm3JfQWAAjzv2bwKQVlE=;
 b=H0ydfSAVrKfYH6W8G2CaDvfckptjvnYSi2jHXy/IdrzR/rOdsokmCe/1bwvzr4ps6qctiwHlh
 wGGivLVq7Z7A/KAWiHwqC5PNb7ZkliL5N4SpGRmFS2P/JUe8eq5ff2w
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7mgO/QzB+ISb
 tkkzhE1w1kOsyGeQbeyzSoSgzIgGS++0NbWYPuYdKnzrUleV6Ufo0GxzGDqGhCaTILlOn8XvM1O
 BR4YhAVK6cZcVaNiccyQicfzFt4XDjI=
X-Proofpoint-GUID: K9KyZKsTYki8hKusAeozQCJXuhTWMc1G
X-Proofpoint-ORIG-GUID: K9KyZKsTYki8hKusAeozQCJXuhTWMc1G
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0993a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX37atz6fTfaSY
 pXrHdjWtFb3rDUrC1p0FKh0WZBasNbYSEKnkzVj2ooeAT71PBO24UbMllPjdMXRf4U5Iqnqryd3
 b3JfNaVJcG4wEHkblfU/r2byrbjh1vhM0zyAJ8+eeo2TBbLXqeJiNq9zqW2pI5vU2HKjmM2YBKV
 m29A8EogmduJ4JZsJddh5ikp/XjuRCSIhae3G7kztffGIYinVB2r4DfEe8qrJn+wiQCUzFiQ2lC
 7v+w6O6+FiFQD5XOmWbXgq9ItOg+J8cu4ZEwial9U/ZFx6IRLxVxWTWyMVP/iNbqKojJ9+15Skm
 +yDMZDOOvOd+xJh56iU7IXZ4eFKGvNAaxJUVkdk3nM7qP52kbhj85r+7NlVvOc35wgzU3COatDX
 zM4aTGjLPUT/eUM8rMU1wjQ0dvy9zCw1/RKkye6RT+9O2971TJzVmlOSheAnkloJdjWEdwlLIUM
 cv0bit2GaJj7+IIB/+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142851_369884_285B4EDE 
X-CRM114-Status: GOOD (  17.42  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808d..074971d310eaf 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -711,6 +711,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf4..efb233458b3ae 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -655,7 +655,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472fc..abe21242d7104 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


