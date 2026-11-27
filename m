Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70726606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iuuqvqqH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Kc8l6btt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QO9LVXL8;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NR8s3jtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=; b=iuuqvqqHSGE0lq
	KdrOXF6T2VWOuAuvcPI5t9Dc+7ZIX2H1OXJrODdKOf2mHYQOuYhCVpdVbGCDnEwhV5KLo98JLVuFf
	NRX7TFa1gdkNTb2foqdcH5sEo8m+OUbYe9a1hHdiYNmbVjhImEvZYwwPWP/3/aoIKlqzsByXNgv6c
	xfalYiWhonEirSD8z+27Wl9f26MZOxxM7AxHvx0+cQTBwv7CDpiH/NnEkv0c4qeyjEuyIF9gZafOG
	y+epC4qhZHc1pEKBaBqbe841zgyckF+gZ3sB9De3nU+ThAdsZdqibPyoxk9/2f6lSYwmrL0XOPSUE
	VSCY7hItU+iq+AlrmMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrer-0000000FJQ6-2ATF;
	Fri, 27 Nov 2026 08:50:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreT-0000000FJDP-2kwv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 08:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=; b=Kc8l6bttMe3uEQgCQquKL6QJSC
	aWDPBzMrYtrCzrgVJUKSWkYbjbUxFlOG6a2kiq3trySsWAaxPHS1qBdGBEFDMLcvwvH3wYPFvGVLw
	lEe64Dqn4zmvdEjpG+oVMaNuOv0riOBMlzDPOKGzG2jKsNhVItsX821IiUnTsp4GL+UQxT2UCB3Rc
	y2hMLDwny83Lwlnn09OHhpdXAtHWCmTry8RVuE7LwX+wkYmk4r2ExSjg+CpGXX4hpaANTu3kNA9b8
	tghsXyn4lKeGBRf0p8D56YCXL+G3WcRVgTPyZ7+fLy4PcgXu5gmNG3nR04wA+oPV/g+zbMl1wYOkP
	wfB6TNyA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWreP-00000007TPl-22Ek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:49:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GeJh3983917
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=; b=QO9LVXL8lI2UO3KM
	S8vrRG+zfm7q7q+JngG0NUb3g5/s0LTM9G3AQb3amKtc+3v88nmHuTVB8Am6TkHr
	btFSmwFUGg8mrmCi2Gd9trnN4XuP3AVBCtDwqjyDUDmMAfivmFw6dEmCrSsRSMg6
	uxsW8GzspO/WRuR1iN9gunlXJyBL9mg4aMxK3/O7qBUbPZDIKdbCop5NKz4L+rpX
	wZ4zu43l8foYPbPUsJ93tnbEaHT8FI/UcqIUgNLGpaF4LmtT4Z32/+VLf3o+DQRq
	ga8PMs+qAAsa4Kh3kCbJEIuXDjAc68Vcr42bx+RQdnwqWMRCZHS9BZBahCESeSqd
	IXqTkw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:49:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdeb1f93b63so117008a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769387; x=1796374187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=NR8s3jtNPdI6t3P6VKS1XTP229edN+Qfse7gHLzKAoBKKgZd5BXnrlxZCYr1sGGJDY
         vah+11hZ8/v23wtm15uMwunYRhiaMuyTm6x+Etqdmx14ClccSlVaIwSoPj4v1Q3TwLN1
         foLybQsH1WOZD8oCR2HGoHekzhUvgfbnOzpo/M+BsMU8fITmp5J/ZJ3E49lpCQQNDpAk
         F9cKJq3jGHfgEe+DZvJ19/+0MZEPcVYWVB6y5UYDv36TvGRqQ4ZnpON6hMNyt7IKkK4H
         zpdygdK5j6eCOFVPaXAY2zm+8raQ2RpWUFSEPhQFf41u3rZhR+ZTj3gWGZL1ebgKmf8k
         gEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769387; x=1796374187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=K+Yy93dljAZachDz9J3RaEiUg03amouYCsJVbHFDW3DOh0wF/pPWjVa73vld1hNRE2
         PJSpgnMvqFhdFOs3cvzz+5AeudsGo00Fcc7F8UYRE/nugi/A8J4f4h4gTbXV8m9oa8ll
         5VZdpGtYHh9OP3Vl+jZrCnjC4E5njJouGyVQVFf++I4wX7TyqbvgGgV+G8KHxdNZ+gcO
         n2D0LtmBHuABIP9C8SDdkS7KeA3vwdu94AbsD/Kd4s9uAv5mmGEPyWw4XStCAl0Wji00
         xGOafsBDAne6BirbSXvHSl0q4vYnyRXpcFMMqvfWe1oQgDWLjst8/U5RSxAynUDyVAEU
         X6oQ==
X-Forwarded-Encrypted: i=1; AL+hErGr7SrZJghG7SroZ7e62A6OHqZREhAJOjsO7hC3BcFqbNCEYB085ZTch9Axz3dAj+ibTfLOA+FoSa1/9SR6xazC@lists.infradead.org
X-Gm-Message-State: APuU4Z8eTLFO4301xGXC08HHfceEloFOptms4tT7/JY5JOuWwOZ6KLvx
	MJytSoDv1uNvoxTFNP1m2apGxchNwDfS7VsIfCRejvyU/S7n7L5Mo2yS1cV78KMA/CyuadAceI6
	VVysduvFsVXNhaoP86Kth8uHKAkaT9VFupsg13/CAdAdOTqur6JKopLMlfvKNZERjHH7RKOjCcL
	2KMQ==
X-Gm-Gg: AZFdTZfpRLNk6pwqaPgkKcJgdACYdZae8KuRNvV60fGtEY5k9pbCiBhbvakq+K9q0DL
	3ItYgxDn2ABuWEPYo1rD8qqeIGf+4eUkgMxSuprXiMnsE6754yUSc6bJNis5zMU4/COjg+IzHho
	7fp9X2Y5NusLXNinzp9x8hDfVBGib8j+pJ6jYVfB+dDOaD8dE915GTsfX8Au/jHd9zQKzLfDdYT
	1v/SQri7fDTgLQu86mQ+oW8Mvtjl2FzIT0KoqizI4kMg1itq/pMKcXfsRFyKNxxB1aXRj+74qU/
	ubvBnKIAoCyCEtsaebM2U2QaYB6bL8f293AlmnThOSOdjE6Hon8vv9Q/6+vebWeVY33qudns5a1
	E4wN/LXcV/z1BnpwmWjtcAzSpNy+aeEV4KuYuSxEl44+LAoxJnRgBnsT76FA4FlXDbrE0Zi14tR
	HbKO7Qe9dK6ehmKDfYTqvjP/4/SBlND38++WWLLeDpWCrhaWSD+H7xMGkKNnI2hIzyWVUsdA2FW
	FDIvaaBdWH1lnc00HE8EDdt1FOcqw==
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369166355ad.0.1795769386807;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369165895ad.0.1795769386371;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:24 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-2-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3326;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=CzV2NA3Bg5CPsEbK0KJqhj/lR8zMyH4dHyWHv1oppsE=;
 b=DzAGilp1UoW6gYasb7Apa/INX2kErSd3QqawKYCFBfNn5AmPJg4oOISmgnCR+sJTNLpkXuA6H
 7VWQfOt99CdD5NyF85SjBo+VltbdntcZa/kUAvFEs2aeWuQIsRqRE92
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: h9_F4FI9v3t5DZNEA_zMijEM5pr8Ykjp
X-Proofpoint-ORIG-GUID: h9_F4FI9v3t5DZNEA_zMijEM5pr8Ykjp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/jrkCOwj84tU
 upGM09AJfymXFIjPGJ4WBTapV1V361IkDG9Vj5ubZMeKFKaT6vNzTRA6qVC0zrS39BOs1vmmp/C
 fMngAgQgqbvdqpvgfXRg8JC6ik+qx9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5rnkaJvdgiWh
 0n0KDwKbjvuDItY49PLCH096IkoLHqDLxqZ49HcxO09tTBUb2gvqmHmCoT0dQS9pGurbUHVnYJQ
 fAuN4mrvpnQZXxyqNSRRLFW6/X5sYw3+gROsDG0GQQErPvVKIRyrNrMSjzf5aHU3cpxqF7meM7w
 neuHHeo8ZiEPN7eE23204q9PJP9hH4blxTkBlDkpNAl4ay/txw/kIot0myIXmZ7ndytQnQDKv2t
 R9DiTC8RbCdivyh1kRnhac5fvqrZmGb5uNXedjb2uml5i92YCzowQU9Mq0JQxGB/9//VcE067QD
 KoTe6P3nSdyejhe+3Kipm+cdfGq1JyCBBCsdar9OqQcYFxj2wEMOpoRX65M0mbfeyB7Wz0Zo8lY
 LrV4+ODa9UNhkS9lEcv5bPURRkE5/Su3aBvem4ANkx+JKPWgzy41lmQ1niNhAXmQqavb6ZylfYv
 0mP95gelEk+8lTNmwDw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09442b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XfV8FL5vlgqiq40GVOYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_084949_742573_0B7A01E5 
X-CRM114-Status: GOOD (  17.66  )
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

Add a DT overlay for Qualcomm Eliza EVK to enable the DLC0697 panel on
the DSI0 B2B connector.

The overlay disables the default HDMI bridge path and connects DSI0 to the
DLC panel. It also describes the panel reset, TE and backlight GPIOs and
uses the display bias and VDDIO supplies provided by the base board.

The DLC0697 DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso      | 75 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..64c61aa9cd8c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
new file mode 100644
index 000000000000..a0a68d397663
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_dlc: backlight-dlc {
+		compatible = "gpio-backlight";
+		gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+		backlight = <&backlight_dlc>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+		vddi-supply = <&vreg_l8b>;
+		pinctrl-0 = <&dlc_panel_rst_n>, <&dlc_panel_te_pin>;
+		pinctrl-1 = <&dlc_panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in_dlc: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dlc>;
+};
+
+&tlmm {
+	dlc_panel_rst_n: dlc-panel-rst-n-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dlc_panel_rst_n_suspend: dlc-panel-rst-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	dlc_panel_te_pin: dlc-panel-te-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1


