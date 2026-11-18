Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB759606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i1niuxy+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7D9Lmcm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQU9g6ix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=; b=i1niuxy+hZDozn
	NJ3/3BV+WTfJFGVdGKhXWtW/CKaOEdc7Gicf/UQvGI+OCKYvJZxqcYvNY4oMOopHWWQlyXU24NLl6
	f6dTt4tgVBkmqQbnxdbnZ6uBmX9rD7IvnFUg4Z0KwCOlIQL1Lx7rPueYSTpgD47bPEuQM47TDhWid
	CHMX4FhFEso0i+apd9k5uya2xtaNOr+uBa5SpBpGk479r7InC9MJTGt2+86eUhYfFM3SMlIzitfJc
	ehifcokbh9z0w45UCg4IoTqekEAiki/f2REsIErUV5saCrAQDRHo58Xw6A7Mchux0sgCcD94oc0wt
	4x0apsXPifGuCsQtBQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZht-00000007xvU-0gIj;
	Wed, 18 Nov 2026 07:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhn-00000007xtF-48ex
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:03:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmfH3371245
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=; b=M7D9LmcmZYgWQPgw
	lzaGvDEMnSK8MyXRuenmvC+N1qSxD8Eblbm4eZUniXHJQdsyfRP1c+PkaIj/pcmh
	BqFOnpYdGpOJLIBUnwHHpeWwETdmasXF/b8dSFOklMkESssztq9107G45pjyAEN5
	a7tvbdTyMct/cckYFjdqkYet1AFVpSD/omTmESm5uGOebLBCpFQQbhxJ6zTUDNIc
	qnC2/p50wj99CGj/aM+8MLyDreBwzXvH0ik6SNyqEC9tQe2kTRwaLYPlXhWreCUO
	H74sQrXAdG03I4bXCX/Xgws0xHQCqSEeLZ5o82AAbygEpmIolPTaehwWoQcDlhaJ
	2O07Eg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8spkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so6348445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 23:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985423; x=1795590223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=eQU9g6ixW+nDArGlgqK3ceG1SYkNaWHGX/EchYKX6zQt0PQh7ypEWFJBpnbDFoJs5G
         07MjzSnElK5uUE341wBXA4hC/UfcTnvkdKposv0tMtPteXU8thejssG57PEf9Vr4HhXA
         E4cks8cZKMLcRoJ8x7hD0K3xCjfRBRpiQujX4zmKrXOAq8H8OCSHXsH00KaQZxDiJM9U
         gpDpgYVKdHF4cfjEfu08aiuXS+u9khUeE6o4JA/rHi1o5IotwlxBZwCO8dE8BthiGYQz
         etIDvReCuSIeGm/tE4C3EbVWBEQa4/FjWFS+Fhybcmzlo85J29dg5r6U7kwv72dVqbdB
         Lw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985423; x=1795590223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=f5Gqf3cKJTGI1tFoYLLc+B+rxU59D2VqsGK7cX44iVMmvrpo4qda1M0r076SyFstnr
         MEfoARXSXHGxeFnthGBE/adiQK/412oZ3Kp0uNIgzimPJpH2Zwy8G3SPoMF+BmN7Uog9
         tGS/OxRhZrYBpeLxFtW31DwY0V960bmrKvSHi5TpZRGtSmGYA8wEmFPYlo6MEZDlIZE3
         xrV6dfhy5xvtQ3As/6tKg6zSlGDoH2Gtrh7CONVadQOaQahyXLmgyMA4ITcOTPaJ+r1j
         4stzSpSF4OKouxEozSCZk5XnxnT2ewK0oIp4wCr5SksTVf4s9F5NwKOdO2LUDsiprjdL
         /MCg==
X-Forwarded-Encrypted: i=1; AL+hErE1kVWB0dKDTzfDvt/3q8cjl/tmqttJAdzm9qZW3kmh8UbUSygvwcG3JEciyABEEqKfrAQoLI1oSsFRJBD9sAhb@lists.infradead.org
X-Gm-Message-State: APuU4Z9sobsyePIchGLP13rCdXARzW/xeXcBsanc2aTvqRX0V94iAp4k
	tiKbCqx6kKS8fShWAp7aWM0qb2LIV5gIr00ekRkThOku09c8BJHR40d44EZGPCaGP2/0U9hlwJg
	7I/yQ/TLP83PTQyZnPK8I6yqO2AQcM8gG+CmVe8PfQSsuLrmH4hjcDvEQY+ThluBZyw3IXmXN1q
	rZ5g==
X-Gm-Gg: AZFdTZdojQTAAk1wnTnFyO+vbjEI9ko6/UxjFOzRJH3CiNP7HkPAZjKbyYnHZ9CHzio
	Z/TUmE+8nMUta+gukNZlkEN0wQQWCmIhGiCmiOtA8akoS7Ac+8v/8fHT4wat3GLeyy1Yi6lPpy1
	tALCOH3NBhHGg2XQTsjKLAQ1/MYSeS0ahgrlezk5Yl3HOec3mEiZsjBDzAq1IyRUuWsdNWzor20
	piGK9nghtJ09HH7re5MnTbUjjBKegRdk32CWN/KURA3ELsgVt2XF6j/F+CYwuQQGp+jpHKLMw0i
	TUJ3//N3hok1967lTYsTB1YLsudaPAHBOQnmu6QxNuO/Ynlay5v/+SWhN3E8wmZyAw9LNoGIkKA
	kPDxVm1ylnUt8yhkjIDJfp4cnOEd1hwyGK1ApnQ7jH4F4pER1XTWYjyQcD1EQBmCzebk5TmRvrU
	YBFyk6cUTEHyUYGf/G59zOIlRFH8hjBHsh2HmA
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18649875ad.57.1794985422719;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18649625ad.57.1794985422281;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:41 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:45 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1327;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kgQ1nupiTU7cGt0s1oNpt68ivh8BGxPL454N4D/a2j8=;
 b=MECHIIWyATcE6g80NzNvI7r1HOMEw61S0t5yum1KZifdukAn1WfInFoS1KuYRsIcmALEzyeoy
 oZVMbLnouF0CFNvN39+PTO+kD7BshxRVR6NE/9btCbih8wPdaKSeL+Q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4dcf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kLiTxru8Czh8OvV4UKwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: n9omY9xEFnhVk4YP8qfrdo0cII-rTvUw
X-Proofpoint-ORIG-GUID: n9omY9xEFnhVk4YP8qfrdo0cII-rTvUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxIvFhQUj2sq2
 euOrEnJyCLz2j8fsO3Qc2bBRLgCk+iK3djZOCu6WeuoYe0SCvCr1cctM4xWhBMdfJfEv5evy2hf
 bcoSiX0q8YdFXeOgkVly6tNcgaVYngmLerqfDViNorK0rJTeEIPpcYdBOkYtJQOjzITV8IpQIo8
 Q7MbuKvlpgeIpLDKfY0jz9Oke+zwT3VuglGPTi2Q/o0fbTc6E84eK/nW8t3NEU4YlVkrTZeY+1x
 R8vP9z85bsm1hjeMlZIFc+Su8AT02LZS1YGoxdRWPOKcJb+zA7YU6bRUQqTER794VyI9BsTgXy9
 RF+PDyqWsxivkeJDc5ZPV+dmGh8XTzoZYvau8B2ATvptCnJ7m4Dkdc/Ih9heX5gEe9WHIWysBXP
 A0GBrXTbDd7m3DN7tVKUiWSZgOBN5jDPLE8KLRGUIz6+4M7QTStSoUd7kr+pLOU7jeZfHSm6Eni
 xDFC193Q5uq/nuhs5Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX1qielgdE0GpQ
 +LjJRoGPoVyCT0MlxSTEOdNwf0JXZXW0IplN/4m90xuojjAaVa1yzL+QtHqLzpnbXT69VkInl83
 27mik3HZ4wZPQL9wMMe7XKcqxdqGtsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230344_044523_A4D9F9AC 
X-CRM114-Status: GOOD (  16.19  )
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

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb..a9507ec56b61 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5179,6 +5179,8 @@ tn@109ab000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
+			arm,primecell-periphid = <0x000f0c00>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


