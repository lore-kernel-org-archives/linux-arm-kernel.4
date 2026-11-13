Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09460A6F71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+sVIDVu;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ld4ElCrg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQx1wl/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=; b=W+sVIDVu+kdlJHK/ufLs+CfzMN
	TfQb5Dm+VGDrQd4ea7oYxN+kvAefEqiCCruJdv04R2ezUe/UqvqK6LfyvpsI8w1ZY62jtKNZU0B3a
	m4rEczBR4ZJQsoyorqDHwYjksT+FnlJAP8Qx0xSdj0W9DvDubKztlYllpi9/5Ir5z7Eb8TLWiJ5Cv
	QHLu86rOILQjiHsYLxhq4TbDeyVdyKF+9Tw1rWobVgSHOuvLUpwjVLK9guxp8hS+/6UjM60Nryjqg
	PzdnaGl5ThKZLXie3N4X64hMBrtH+29dLFrOLAt4YOsLhrMedsd9vthjoa8AYrNCXBufLetT6QumC
	793AhBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPu-0000000E1hN-1b0F;
	Fri, 13 Nov 2026 18:54:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPo-0000000E1bj-0O5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRS0d552521
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJ
	YDzUTyEA=; b=ld4ElCrgHBrdb1bK89sUY9Y0VWW1yeEnLrRGJh0xN03W1dlcvBd
	tJViTlVgW3oSS1XyQDJmFsss4tKNjC6hhy/IcDCDHOsV/9hOpEwvlaX4WDUYh7wV
	q8Aq+qMC41ViyWiJEvbNLOW1TBiNeHQnKxu9HKAzpYIO3C57TpfHdsnnpMkUr8WZ
	f2g5WfDOrzelbjUianOxb2mh2g1r3e0W6h4V6oGFtepWASZ/scemh3fpLKHP3Oa/
	6WZHWh1SRktSHBuORlNyz9rTZvuXdS12aPFUKfCul3gOlzUHoq0t8JtP5RyvnZpG
	GmILK/ps5VBd5Dp/vwblu0eKSs23ifdiqrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:54:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso293833685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596062; x=1795200862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=EQx1wl/kYGsGwtAHg6mups5OxcfISfwhtg/dHg2CtX8HQg4O9o+LLxi/gf9cKSX798
         2vBAayIw4VOn7SlX0e0ua4CJNA4E/xy5pFFP5upwdLpTydMZK2j1YAVOXdjFyP1bxS+n
         o2zyy1se5M8fGR4j0ibOUEncqbBKA5hC3ypXvAtCrtuvEguFchqg91AgDV9erScQM7nA
         fM9oD63XKCG51me0+AZ/j7moBzdQONlGthWn89F6e8tFSax1gqhdkq9eOpCygZw2ZqmD
         vGmkjUulh4ktxGsMNm/BJorZ8wrO4YoMgI2PgRR28v0Mu3iV9QNDsnIMTu8WRW3eQAlb
         99YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596062; x=1795200862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=sGFoQhY+Z1ss13AgSHi4nkeyu2O5IQ9LJbWNFU91uTPqGrpU6X0cvkwxEzus7ZrAyN
         2Y4ex/diMBD2QLudIFAAU5AGA4E5YBGXMf+JI1xrikR49vrQSmaiHRUIkIYaGPg5ZOov
         jBinmrCCvos0BSHiow9RGC7RFMjlqWZ241z6jDAaSHlwtomufm+D/zsL4fhVShSuCeJy
         kyKqpW+aYyyJt57gjsFoy/5oqecB/IYdCNbbs5r8PgvcqgSs9ttQmOUejMjAmyZhqNQf
         6HPq/vuPvhSOsXrmeNaP5SqvnIK1qYnEtYdlqGj7JMlTJm4atb92Ax/I0Ik662ZqfB32
         35Pg==
X-Forwarded-Encrypted: i=1; AL+hErEq4HZoSWuV86LF7yCqMUgd2BL8RLdqp+gej1b1F6B6OLT7BHGQuyIHflvjxdx2B+kUpJqWqg2o8ZpzNZsV7SGn@lists.infradead.org
X-Gm-Message-State: APuU4Z8tlEPyAW7cjNUe7rvuYaURNG4tdwHNtD726rLy0nTHvJCX3onB
	rpk7xPfGrC6N8lWidEcfoGf7qaP9XQmMrlEAlE91220SkTktzghzPsC5HyxZLlYyRLXZJX071yr
	V4Z2Zl/MkQ1zqdpnn6KEd94oAVYD0FXSIn0Z9Hp7AtBcEBqpssidCRrHf8dcib0ZC6JcChWIx86
	cHhg==
X-Gm-Gg: AYBFou33WGsZ/RAnWIulGay7pPQPuL9xEwEwo9zgNv/mkKZYKF4HJpdMKRk1H00HViY
	kDpu0GXjYViUdmyvifo7ZijU0uq40DDxkvVn6+viiJr4yzHfMXXZ9TeRZ//li2fcXo9Dx/zm8bS
	iF+XSGQsRGMPD28GlljXS48PzdEajCt4w2iR3R8wL69rzQR2ocih+Yb4iXxi3QFFUebzoCW1Z2T
	JZjHkP129+d+v+UzVRWF8PjSfKmPmRiTbn6IyGdqaD9tDppIYBmvFYIjnMrHl/dmWJeTmkWHw3l
	YoGqgzuXwndwmBQMHXrvuFCGWB/mBq3IQ8XHy51oOnFaiJCian0pr1Ez2kEsHBSDE66xtbwT5Cd
	RkB6c3a0fkwiAXuV5PhTHzDjDRiGYjIGniVZTiC5od6/e12+fYnYL7QgpSvixZw==
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584301485a.32.1794596062299;
        Fri, 13 Nov 2026 10:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584296285a.32.1794596061777;
        Fri, 13 Nov 2026 10:54:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm6433223f8f.42.2026.11.13.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Correct white-space style
Date: Fri, 13 Nov 2026 19:54:15 +0100
Message-ID: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18307; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iKBmoS6Lts9jzpkYWP5HI79d7lCKZGtVNYeu24QXbfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zWiN+SmeMj4z6T7lHHQabnZ/fC9Ynt8/olK
 1cd/eV0YiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc1gAKCRDBN2bmhouD
 1xmRD/0cJBeOKCQCMEg1r8dF3/paVx/k7n/15SVWjx/D/XdpNGLdHGfJQKwO+G+UuGQ+jcFN68S
 /5RBt/2Pigcb0Zdu6aj0zdRxnOE0qR5IOPBFBzPx5X6/b8YAapjlixVvB+PLXw737zn4hLNTSTh
 Wr/TTSC/GCpld/J1JZw7G9MuVZmqfBCBnDwGmXE1+U4E+JYE13fxnCR46MDhOR5SgvOUmK4I2mN
 KV4KyuBy5lJTlDpa1YhKCKAn7UnNq1yPQguCI9Ogjc7v1pKN3f5LNP8cSl9cwG87Wmv/BPiLRVq
 Dc5dDuOE7FxNaIY1idEuGw8znyKX81WypZ2FAb0NFHGUNC+DYvoMLcoQSCmSx9m1M7bxGkKPjaM
 zvncuYY1CaXmppt5BMTFYNQauPSTgNAdizCU7nQg3oJsMasLpRo9vT7fpqFKh06Lt2yfyi1G74d
 g3Z5+/5MPuCtdmCAJfYe45izfTYeCWtLsF8DYFHpJULHf9FaCWxLNb+LlRPjxdwne+GsDLWxtNI
 lHSorJqP6DmJt5gJGF16sj80mhqtUc2C9XHSbwz5MkLE9MdmyJ6cYlw/02CIzqgFkLEEG02jZMr
 VZdP6o4q34zbxJqe8ID0gD8sPk9rYoshmMOgEIRvOtx12PlvwjnvDrudS4wc9VfqhT55g1GXV63 rsUZaX1U2FdxCSA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cdf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dE7Qyx03IvCetochvIgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6Y_c_QKMFR7iUc5kwKIen7rfz4rqMSBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzVXqFTfSbyQ4
 V6s6Es4VqB9Cmvq7wguKq6Ue/5seNQkKNqLlWhYW6M74QqT0rH9F2US5Z8utxQUahtQLWRuPghC
 Oybbsu+6e72dv+k10VDpNd3kDXJl9ak9xV75BsCEWK4iJ4181DL4GYrTwf1AyBlXZsHzTgqa3vL
 /oVRyOMGVPpHwRWScRsWOzYMW2pZiq2h93ijWodkaVhV9MRdZE17kOdpJyqHO2pF2ObJpXehW30
 C7O9fwD6X+7VdKI9wKrQPGAgPGJYGM121oQo9WLecG5PmX7+fs2gwmiw5NVjAyWYYXZXHKX9eN1
 3wbitx34R18e+6m2h0qNhBNeGwcmNxZGoekCJm0HFeXrAtT5sGHp2dprv+i4szQkUKoh3iDRfDi
 lotsQEEFyrwFiIcfzyEM63YYrnjwUz5jXfIw8uNB4l8XnEldGKxI8gNT6JHoNRSwjLVkd0W0oiZ
 enRNXyjOTPIxsIKE5Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwsDbhC6aE/te
 3dPLqAWK6ZXKVxqV1Lh1PRV2RJB+qmUCKlzBgpwqYplo9mHMVrW8s2GGCZnpEKrT3Ek/7yY7lHe
 jNNwC8LUTjx7BEG6qVQ2HgDqghEQtb8=
X-Proofpoint-GUID: 6Y_c_QKMFR7iUc5kwKIen7rfz4rqMSBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105425_584106_A5C00FCB 
X-CRM114-Status: GOOD (  13.65  )
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

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket, spaces used for indentation) to fix
dt-style-check warnings like:

  t604x-j575-j773.dtsi:27: [mixed-indent-chars] too many space characters in indent (more than 7)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6022.dtsi          |  8 +-
 arch/arm64/boot/dts/apple/t6032.dtsi          |  2 +-
 arch/arm64/boot/dts/apple/t6041.dtsi          | 96 +++++++++----------
 .../arm64/boot/dts/apple/t604x-j575-j773.dtsi |  2 +-
 .../arm64/boot/dts/apple/t604x-j614-j616.dtsi |  2 +-
 arch/arm64/boot/dts/apple/t8140-j700.dts      |  2 +-
 arch/arm64/boot/dts/apple/t8140.dtsi          | 74 +++++++-------
 7 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index 0feda70568ee..56e3b3f0b6fd 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -79,7 +79,7 @@ cpu_e10: cpu@800 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -93,7 +93,7 @@ cpu_e11: cpu@801 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -107,7 +107,7 @@ cpu_e12: cpu@802 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -121,7 +121,7 @@ cpu_e13: cpu@803 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 2a3a1fed59df..6115ab8db5ef 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -415,7 +415,7 @@ &ps_afc_d2d_0 {
 	status = "okay";
 };
 
-&ps_afc_d2d_0_die1{
+&ps_afc_d2d_0_die1 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..319035493a77 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -323,7 +323,7 @@ soc {
 
 		pmgr_gfx: power-management@288e80000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x2 0x88e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -503,7 +503,7 @@ serial0: serial@429200000 {
 
 		pmgr: power-management@502280000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2280000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -521,15 +521,15 @@ aic: interrupt-controller@502400000 {
 			affinities {
 				e-core-pmu-affinity {
 					cpus = <&cpu_e0 &cpu_e1
-					        &cpu_e2 &cpu_e3>;
+						&cpu_e2 &cpu_e3>;
 					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
 					cpus = <&cpu_p00 &cpu_p01 &cpu_p02
-					        &cpu_p03 &cpu_p04 &cpu_p05
-					        &cpu_p10 &cpu_p11 &cpu_p12
-					        &cpu_p13 &cpu_p14 &cpu_p15>;
+						&cpu_p03 &cpu_p04 &cpu_p05
+						&cpu_p10 &cpu_p11 &cpu_p12
+						&cpu_p13 &cpu_p14 &cpu_p15>;
 					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
@@ -537,7 +537,7 @@ &cpu_p10 &cpu_p11 &cpu_p12
 
 		pmgr1: power-management@502800000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2800000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -545,7 +545,7 @@ pmgr1: power-management@502800000 {
 
 		pinctrl_nub: pinctrl@5081e4000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x081e4000 0x0 0x4000>;
 			power-domains = <&ps_nub_gpio>;
 
@@ -557,19 +557,19 @@ pinctrl_nub: pinctrl@5081e4000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 819 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <61>;
 		};
 
 		pmgr_mini: power-management@508300000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x8300000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -585,7 +585,7 @@ wdt: watchdog@50836c000 {
 
 		pinctrl_smc: pinctrl@50c824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x0c824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -596,19 +596,19 @@ pinctrl_smc: pinctrl@50c824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 985 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <24>;
 		};
 
 		pinctrl_aop: pinctrl@510824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x10824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -619,19 +619,19 @@ pinctrl_aop: pinctrl@510824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <85>;
 		};
 
 		pinctrl_ap: pinctrl@51c000000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x1c000000 0x0 0x100000>;
 			power-domains = <&ps_gpio>;
 
@@ -643,58 +643,58 @@ pinctrl_ap: pinctrl@51c000000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <200>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(56, 1)>,
-				         <APPLE_PINMUX(57, 1)>;
+					 <APPLE_PINMUX(57, 1)>;
 			};
 
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(58, 1)>,
-				         <APPLE_PINMUX(59, 1)>;
+					 <APPLE_PINMUX(59, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(60, 1)>,
-				         <APPLE_PINMUX(61, 1)>;
+					 <APPLE_PINMUX(61, 1)>;
 			};
 
 			i2c3_pins: i2c3-pins {
 				pinmux = <APPLE_PINMUX(62, 1)>,
-				         <APPLE_PINMUX(63, 1)>;
+					 <APPLE_PINMUX(63, 1)>;
 			};
 
 			i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(64, 1)>,
-				         <APPLE_PINMUX(65, 1)>;
+					 <APPLE_PINMUX(65, 1)>;
 			};
 
 			i2c5_pins: i2c5-pins {
 				pinmux = <APPLE_PINMUX(66, 1)>,
-				         <APPLE_PINMUX(67, 1)>;
+					 <APPLE_PINMUX(67, 1)>;
 			};
 
 			i2c6_pins: i2c6-pins {
 				pinmux = <APPLE_PINMUX(68, 1)>,
-				         <APPLE_PINMUX(69, 1)>;
+					 <APPLE_PINMUX(69, 1)>;
 			};
 
 			i2c7_pins: i2c7-pins {
 				pinmux = <APPLE_PINMUX(70, 1)>,
-				         <APPLE_PINMUX(71, 1)>;
+					 <APPLE_PINMUX(71, 1)>;
 			};
 
 			i2c8_pins: i2c8-pins {
 				pinmux = <APPLE_PINMUX(72, 1)>,
-				         <APPLE_PINMUX(73, 1)>;
+					 <APPLE_PINMUX(73, 1)>;
 			};
 		};
 	};
@@ -703,9 +703,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
index 57573550cfbb..85690720d213 100644
--- a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
@@ -24,7 +24,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
index a64797518eae..d8238b40d143 100644
--- a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8140-j700.dts b/arch/arm64/boot/dts/apple/t8140-j700.dts
index 15c21c9e3f2b..cdcd44e72bbb 100644
--- a/arch/arm64/boot/dts/apple/t8140-j700.dts
+++ b/arch/arm64/boot/dts/apple/t8140-j700.dts
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 3b4f7695552b..676f6a19f69a 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -152,7 +152,7 @@ soc: soc {
 
 		pmgr: power-management@300700000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -182,19 +182,19 @@ pinctrl_nub: pinctrl@3081f0000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <30>;
 		};
 
 		pmgr_mini: power-management@308280000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x8280000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -221,12 +221,12 @@ pinctrl_smc: pinctrl@30c820000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 572 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <6>;
 		};
@@ -243,12 +243,12 @@ pinctrl_aop: pinctrl@310824000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 380 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <57>;
 		};
@@ -265,12 +265,12 @@ pinctrl_mtp: pinctrl@314838000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1128 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <10>;
 		};
@@ -289,23 +289,23 @@ pinctrl_ap: pinctrl@31a000000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 263 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <216>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(171, 1)>,
-				         <APPLE_PINMUX(170, 1)>;
+					 <APPLE_PINMUX(170, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(165, 1)>,
-				         <APPLE_PINMUX(164, 1)>;
+					 <APPLE_PINMUX(164, 1)>;
 			};
 		};
 
@@ -357,9 +357,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.53.0


