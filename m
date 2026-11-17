Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B21606A885
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxWOlNVy;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdz9P0Tk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=; b=kxWOlNVy5tE/Tg
	jBNMUBAxa9QdGCgxPx/X6CzrzY12BPH5XIHK1EgPJvPYQJ5OXMGY0WSUia6/cnGfhOggWQwLaenwf
	fccfzrd+FujmU2oikHGwJHSi0c36wQMhwG7h0FP5s/crHZFgNUYuVhnVkcCxAyS8As2aS+GURZWpn
	0cyx3YXtFeeXRraUaxKrbquUJiRFWigEgq1zJcSqdmkqVhcD8paGQg8MlRur+dezXM10L+tHR18SL
	L9l+AM38N+RY7YQkjpnSf+GZebBgJCLxTSU1HNVy96ds3t4BYdVqyqdxLIMh9+Tl7RPnMDNK6PK9q
	gVw2+E6hf44a/rUF0w0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOu-00000005zJQ-2F7i;
	Tue, 17 Nov 2026 13:39:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJOj-00000005zCy-0wgW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:39:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHDEKKi626764
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=paAaVYHLFrA
	+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=; b=nhXQjsl8FjZYXud61fLT6Mshb8U
	Z8t+fMsevFc/Tl1Opma/c7OXs0Q3HkS9p9g8RFSSu3Oe/pj4OqFU1hxNEIXE1V5w
	ZVtRWKo6EdEEdRyydPvpJn6XsG9xlwyb5a9k2lQXz2oC4ZAo2EyBlbG13Y5eiuTb
	MJIfWstq56H6cFSSHjpgDnaGduLPeIyetmBLB3HyLfWCCCHuSb4xziw0xPAFswtM
	Of/PzEWomB01n6ZoBiXMaEyMImBNsRzw4WEHRtADt90sRFiNioudBuGdDsf+2X+W
	5uxwUNGxu8TyM2S7D0sL5vNXxEofPT4MesjQ1h+6d763/zlMTWLEzSrV0BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms03gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495dd0f07eso812343185a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922736; x=1795527536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=gdz9P0Tkzklw384m4kvYBSWBNyhFbcHezeetcjNBWnY612fhUEuGXSh1NZjfv8Bqjz
         fNljRvOTzDE8ofQvIBcgkGStRIFEjwHtcN0SApk+c74WWKrQhMHmXAhocIO0lRdfKzQ9
         Z6pOfG2LjS5StMiDZ06t0CcHzobfJE8cC2U8AJVZEE7tDc5x/hmg2yzE3Q6b6AvxdLRk
         YpYLptlibtvMjstZhEjujKI94RRXwKocuZbd25XJdISaNz7UoUd0eyxuYJRvFy9Lgc6G
         Jcsb6xZgqugvxkW4bBDSaX5erzce1NyJWOZC6+2Eg85/D7Nb+QNgsjMmZsLnxb9JHDvx
         XNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922736; x=1795527536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=GSFMKNySf//o7qZdtETe3lQj3dONtKcG+yCy0oU7WGrK2tJq1RDydyASG7rw44LrhU
         wWBQ4uy/0JLqeITdrXm5O3whfKvzRbR3rBRZXcjcEaS7WwZPb8D0z89nqU7U/6Y+aQba
         tlEqDilurNYGggJzOCJhS60e/2jTPAgEA6Jl5lfw1XA3DEGuCC8D4dwRApMOlWmLvyQp
         lZph8C+QCZ2xzQeWTaey12tnrsnqbtW7r5beXRBq0EZqY8LyVhhhlcc1o2M9sng2dzBm
         DioSEgsyx5x0AlSRZwl3a6oHWFnfjLLX/1/39v3jC+Fuqiax7G6qiL9c7jDrZ+a9rxpj
         Jq4A==
X-Forwarded-Encrypted: i=1; AL+hErEihh8++ob4zAZ7SWUu7OK24iIutpY8ludLbw6mheLU1+mUEi1OznD2i5yCb7zsBFijx1wwIbkbRRBpF5ksxGaE@lists.infradead.org
X-Gm-Message-State: APuU4Z9xihteSRhm0VAOo7z7U90VhSgQWofDNZicd4aI7zfKqQj5/J1L
	7aXYVO1weZl0r8KkAHrRtyTyUGHxT+owwZnV+htuK4xFJSSFpmADjBVtOfkUVRUvXHzxSD1WtY3
	e1rMI6OyLZ3dFTEZ9xOUi5vhHiSVFMXbhk3/+a3fW7oRTYCZ9f3E2DXRrfZXXU7wK7ZnFPTj2Mb
	dJ4g==
X-Gm-Gg: AYBFou0oYY1cZgKWjD048f6MV+8oBs9Q30l9klBz0FhSrW1y4qhXL4z43lk52k2UsGO
	jPMv/y/icxvjOeisjrwSS8k5CLrRUFR7HZkAdMKazL5J9dDfHBMsfIh1fv2lFfRqivJePwjNDzo
	h8DtDrXWO3SBCVWfIGrhd7PYqCICC2v5FjCOe0HUoYCCidgsaiFtEL8s/kZbD7pBdsJ1HnqYYQS
	VuPOiNmlB76bV9sWk1dIS4p3/dBhv6T7nDMi5ijPlT67iPsadTuRuU1XXVC/dArGOXY3QoeWuKU
	YCJ4dVdkM2/MlUvjcmGWOXGSo4MhmtcRfe8qMXUEyxD57zdmLEKWviW3aIzjThNRlQ/8Ks+kAZ1
	jlfOSq2Hip/klVv+RV1n+MlNgIDLEtxPvIgIoac5qocFsWK4VDN8E4N0y1zPWhA==
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121290385a.1.1794922735622;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121285785a.1.1794922735149;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:44 +0100
Message-ID: <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JeiN87X/rish5mj+l3Crpb2AauVxvJ/WY/Ci16QM4HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjjEkg6Na1/foI5YSMp5p9UhUDig2YlQw9xp
 vUEnFRSVwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4wAKCRDBN2bmhouD
 15rXD/9MxJ30eyPs75n8xdTYAn7I3NcEN5UEhdv+I0gAg80tgBOUr+MQi83c66n9apvVaONT043
 emhah3MuQ5A4QyA5LX/NnGbU9bvH2aNkw56RbHtIHeN1rTz3jopykskPSGJ8G/xMhxI/aWljQ+V
 j9Ib3ZMcGqaSgvaIoHDj3ITViJypxbWzk9sX81qucr+OD/7uSJahsmOcbCFBrEcx2FZDSSxgX7U
 iRiB+OqYKRSIRx9Hg0Hf8CKz552A0Dxt3GUio9njPEMAbgxPLpndiL8LbNVJyTSVc2UVpbUtOxm
 SUg9Q8e1ndUkjhEu4eDp4+aoc5ZyQOfvoMbzjGdnwEBdAwEGv1sY6LPA3AP0KU0Qu8sVyVYWRNO
 wG497ztclVJSENcQSZ6aK30B5o1hJm48lGynDAoF9/WiYka8XISkrYervUU0kXrFUV3nMpJfoBU
 RSp5aFppqdP1FxTM3YJ3vuH+4MeK3Z+e/q6g6wWGqUIS2c1nt9QmVOeJuDDjnO+QnEsq9jJMCNj
 Q5DlAQmcX/aip5onLVyiWznY77Blei8124tCLQqn6EPKuouuruS3knrCO0jwn1AOLW5PE4/VHVt
 XFaDJ+V+G2ophCoRtJY7uu//+/GvEXOTawW/5ZwcKWG+wpRUXlPJJSlWVCGFIDEKyOxJxoU9ySY IIkFguXhdIIJhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX7Rf+AM3cur6/
 msvh8BywgxmbVTkyWGods4YXMevbFjD3tAwZB9IyJowdfudtv3pQzRGGgiuHN4mMr8wqqfsR+fw
 PQMD7WBB25ipsNEshcUvwy+KTaNWMRU=
X-Proofpoint-ORIG-GUID: j7x19g8tpKZaSX1hhtEbX07eaHc-4shH
X-Proofpoint-GUID: j7x19g8tpKZaSX1hhtEbX07eaHc-4shH
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc58f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=uBP-owwiYe2Lw3drMN4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX7YPuypVWvvRx
 JRPMeWE6G+vyZeOjXhfmMH9z4ZoknuJ479ZTwlEcuG5RkbDUUlUVACuQ37OeknBUYOHBO1u69Pz
 3ZT1Whut0wX18Tl+WIiAXPtr+JfDTzp+bs/sy14XoyKmeEADNQ3mvkB8bWyQdScgT/K+tm2q2Wx
 S7HpDL1D8R4yGZb5qjV2oh+eyR46sfJ3gBKAhL0kGCEMrAeEMir55UTlcL9S0eaSPsi2088JVES
 +WSvRhKSwMkN+dKklkO9xW066VkaDscOr2fe5wseST9QgSNfERppmEVxz2j2ByhrbV/TP/8qK3i
 QTez9/fWovYOljQ5JvXAb+51uxRmLRh7m5duGHQpLQmZEgks3BFzzlo62refIzIX/l+6yz8Tdyb
 /e2hyHmxsPjiVR5V0THcTctsWYBrf0X8ZzVdSsy5hOxl00o4CbNVAp+VWg/4ClLkMNGB6fzK/Ho
 v3Cx5NHskQzDvintpGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053857_269633_9671AD69 
X-CRM114-Status: GOOD (  13.98  )
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

The vpu-core aliases were never approved by Devicetree maintainers,
because they were never documented as actual ABI.  Drop them, because no
new custom aliases are allowed for years now.

Important: this will break users of this undocumented ABI, so these
should be updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 9f9b34153ad5..f9d1c166bfcc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -29,9 +29,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
-		vpu-core2 = &vpu_core2;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 7c4a50e0ec9e..82f640efc74e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -50,8 +50,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
 	};
 
 	cpus {
-- 
2.53.0


