Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26F606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xG6R2c9g;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Huk9xFUe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2KzcZSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=; b=xG6R2c9g0odnBW
	4+EFdzqLv1KLddBpEEND20JybjL/jiB4w+mut9vQSUwcL7StKUKqVvJBP/5sCRSX/N27Y0wGIQa0y
	gJ7myVaA3tx+LHal6xyQVGjcrpfsGqK+v4mMAuMBwT7rkahZ3rX77TGZ/s2b0ZncHmRvYnGM3q8+1
	ZzlmsmBkop9SxKrXy8w9IWd9tRqEly8yiolyiZ/2nUIRZBFATNue8ge4ETV71Ji2BcTcVk9gEB3Lr
	PBwqbY9tZlK5Hfu/yUjG6rfPY5Ki3uFDMFKbCkMMU+0q//FV/H4S59qF99SspThzZ82PZjyCtqIn7
	FEiCK1dj93m67jBRpYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOi9-00000006qiR-0K7u;
	Tue, 17 Nov 2026 19:19:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOi6-00000006qgL-0wx4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:19:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6mqc1494627
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=; b=Huk9xFUebDjdY4MV
	AGDgLAl4QGZqbpaQAIkzv/Aq09lqh4+ZpJYv8e8HcYk1Th1Fac5IBPUnqN7wWmyW
	sG2IRmDvbDMjFRKMwDJmdFjjZfGsGcG53OfpOrBD2Mm7m2RMulWatWK6cxMLCydv
	sQMOvtFHAc4vMVAaqtcvKQZO+RDkLgTpJCo64Fridy6UAD6Wbe4acVLp/zqayZt4
	LqsDDEfn5F0gqpUlmXkwTAVw3XJwz09mcsU6jE6apXsB9RYR3jDMZidMbHu75K+V
	jxg3VdhPe3BU+h4HNCuaexnl9J80sQ3YbO/fmBDNKWAed89UKBqMKyDxIQri6Rim
	o3WaPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd385d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso29270eec.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943156; x=1795547956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=Z2KzcZSzC1teiPaqsRp2sbNA0fL90ZnKt/TFDIv2XIlNFewKFzkSaCz1n5ieoMg4gk
         aHkg8us/rpu/wy0Qr2SEfHpp5suKBTpmmSspwpAJHmMXHO96AyynHs0CFd+8ypIIt23E
         FU49vzRbEeI4li7UkqL/dIL2W2M8f1sNLHZBVvES1NbZUj0VVL4E7HprgCv2+LWsinLW
         ORk0i+LykYx4AonbOy+d348XJMzWddQTatmxx7JnIxkexPSt/qr0IbyikKcIVDxsYdyo
         WAanrp6gs+TbaxzSUFsJnGrsaGVUFpmiyxP82LUgtYknedrrJkxkTH4Sa1knXA13D9lE
         AY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943156; x=1795547956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=kMuH7NDggqSar8dIWsvUo+Apb6KW9wVqym8oSvvg2MPVIvN1Oe5a8KDf+23aHBeCjr
         ojr2v+3ZnI7MJ1uRonYHw+o6Jdg7Iwel7AtnciMmDNdeKGMZ8MUYzavIL5tEVTuF8lOR
         tAuIUqWJdKei5TrMyjQHA7PwMj8tWUnwmyn+3fM1XEp3sVfVAdCoZiAp191gl9tY/l8L
         96DrHEHpJwYCLTOQ1hNfZ4RebUmXKXz67xGLpgJ3p8BSFkT0L+9gQDv929pl3YxkLv+x
         vnJEoHdM/5U8cQMz3TcyIAIYjffBvnVAd3ImF1eh9/Sb4KbnJyHi/sp8zE8tnrQpSdqP
         7xzg==
X-Forwarded-Encrypted: i=1; AL+hErEbHpE+EW4CW7GDmgNkI6etngweAix/kmPf72KY7z6gia1cDDfDH1c/6G43AmHsxw5S33tgi4xrQoUVHfqk0uRI@lists.infradead.org
X-Gm-Message-State: APuU4Z9lPFAQiYieIrm1ffviA+i9gnTggyr4wlJ1Vtk4xtiB3FI+RiGE
	KCVpUkPEMNkZKZo8x/x+HuLFpA4Un60pS2qGgVxU9myTzrP/40gcjAcI7W2SjiaB3i+RNImjud7
	bG78pIGlhO3MrP78mBdQAN3GICJfrs60hpFeuCl8IELK20bUG4aHkCUwwkpZ9fdEwOvPBf50NXq
	dFeA==
X-Gm-Gg: AZFdTZfCApvHO1pcCx/1YGxURjZLXbDoshtqYwE9qvWRAcgMexn+MXJx8Usf0ZEgU5s
	R5msOIpm/ZATkkxDnbCXP9qay3Z2S42BooLz2tR/TpHIDCdNdn4Z3OAhAnRx9+lq7oPRtYX0a6y
	v3ePvyKq/Q5Cq3FIWJu2WhC8D9bU9iFZk+4LXYKHcgdQLGwtyooeExMdhY+Jjmr2/bs1zske4VH
	a/5Mu1M/kom1Y8mtVvoN//i4TxgqyZysGl3FlyrbESIEuSorvO8/B1hMejNBY8kMF1SFWDoAELa
	MAGUXkdRS5cOmXBLOZrqUkkeVOUZZI0CKbxZ4t6EBfprhG0tH9mL8jYJJ8An+znYgp23EWt3H4H
	5EuUgjISFwTMyu1x5mss1Q+ivlI2vYJcfIWMP9Z1gFYsb7KAYok87yv4RJR4HGlF2xqSv1F4WMJ
	2IIxuJ
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520889eec.0.1794943155905;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520847eec.0.1794943155328;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:14 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:23 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: lemans: add RAS error source
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-aest-devicetree-support-v4-4-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=2243;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=lj45TGHwbnjuGkDzwGb1X9FEcZNqbixnfjHqygsd4dg=;
 b=7FCcTwHtClMg34SlkE4yxFQGBNZNjZaS4Sr3qAjCKSk3fc3GeAl+WbJHh/ic7SmtjkDigfzLI
 q3URg/Ggd9CALGXtCRj+32tr55RWkyf9o3VIqCaSRyYA4rdC7cA0S6C
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afca8b5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mXUMc8l5Aljk2L-ovw4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX5tPPAVoqyAHM
 n0eUel1JwkbEXBxDY2HMCRs1GNS1g+5DPTLTotx3Ej/Smzi3m7PvKx55LB3E5XBgtHgzFShdbHw
 iiFg8MYiN5AzNiAbPNV4Yvkrns9GymI=
X-Proofpoint-GUID: SZv1d2hB8eujB1gkDLdz-B6La7n6e0TR
X-Proofpoint-ORIG-GUID: SZv1d2hB8eujB1gkDLdz-B6La7n6e0TR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX2Oj4B1gAwdqw
 A38hkl5nLGpIn+uuuTHWxwkXqkKYhsGPqG76RXjStgLZuDB4dVF5jOYe6ME0acr2Vw2zHdlbse0
 NlRG/IiZThexHWlpeM7Z97//YGF7cyrcZrgeNZNIc/505N4rSLKBqEvn+GTZgXr+lrsq6e+1Wp1
 q4PnRb5MqY5AKOVgqIDLmZhuLa+8jXdCQq/LSqLKS5xxMwe8Cz3kHZQLIftni9Azg+4Fi1NihRH
 UOt2A+zpFQJfSwZJlnZXpKXWeuKwePHzf0es+OepERG8+q/AKxwqclpRVz5GCKTLErAgU6nSwdA
 /ubePW0WVToxY4G5We92R1EqiclGKBjLH4jlul4kIzizkrdeiuGvsZQgPd2O5c1q82iaIqfa3Wv
 4qveFupCvpDWacUb/idnalyWBlfWpKYH8wkwzfzEdEWVYEThZKU4m4Yj1W8CGknIyxp75FbvEp8
 mYl6ayNI5tjujrNml2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111918_392068_1F8DDF5C 
X-CRM114-Status: GOOD (  14.40  )
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

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Lemans CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..530057faf0a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,37 @@ clk_virt: interconnect-clk-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>,
+				<&l2_4>, <&l2_5>, <&l2_6>, <&l2_7>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	mc_virt: interconnect-mc-virt {
 		compatible = "qcom,sa8775p-mc-virt";
 		#interconnect-cells = <2>;

-- 
2.34.1


