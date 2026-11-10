Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD627606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l20mvkrL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gH/pCXsw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8sxpBsw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=l20mvkrLpsSPrB
	9Ajy/Ma+IGo94JcjNLLw9h876DJFVWOqjvzPJTav1vLbLSvkkPNnxbBi5vEwGs3WcrY766lqP4apZ
	t+YJPv3VJqjdjPCbkePJvaMFHHoXMi16qULtbXek+PvT4+lEP0fgAIRzlvtYJQJWKdMKXiJH59bkJ
	x3nfUVvSL+kKhcGg0fiDU5HDltAPkhixoE2BSDo0pApQ8VExvPp5e4Yd0WzT9kpyrGEs2TsMNiWNF
	fHH9sui5VuWubXzNWRQ3u59QdY+8f1IFBDAXdexLHb4ak0RbOy+JaKNAvfbM7/kKnsM5qVSdAT9h+
	+kkWQ3pAX6AH5sonK8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRx-00000002HGP-1Rcd;
	Tue, 10 Nov 2026 03:23:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRu-00000002HDE-0uF9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:23:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2IJ1322937
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=gH/pCXswSSJ3EuSh
	KQA7b3xmVoM3LnWBCO0vxhLXjren049L0iqemNc18vZnERv0nDAzk/c7vfuOTguD
	7qXtvMAotyfyVzUOM1mtvSsjI7FaUVUGfMP2IxvNdtdiJkZFCH3ljJkiJeD2g+CG
	4DPsidwZi8sY+l6/gEpO5ZKJlnNrnKM2DogtMtdzS7nKtMhAXnA+M6bwU9Jf2csF
	bmH/yjuxJyZ6G0tQfB5B+4DT3rtzUp5l693QmxdGtbBdudVa7DPfusELcFKNd2vt
	t9XSQMNkv7HYJ/svN5owesKOu+fevgq57XWteGgiBDU5nlWb2udEM8xDhy/nW57Y
	aSgDwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58bxfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:23:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so1411069a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280985; x=1794885785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=D8sxpBswzgpOpJOQn0K4m87hqp3XhLJUMZI3XATJ1zbkDQpcK4OBTgtRURCi4i8BAo
         hstzidXokE0AXMFb5otF5rFNorXO9YDbwk1eVjTsrR8BX3iEnRf86RjLjNZY2Z8T9c6I
         tFcP1fKIGNS0E87JR5pA91DvUBdG57ju2yv3uQup+addmGXYAz+rWEADcZHYFoE3TlfD
         Rrc67uJEqagQ0sjIxH93W/oezINdwcgXQ3DArTx95KIEc8nw4qFOnhh+G4ETXpPcUEoF
         DAudqNYDPE3NrDMgvgpFJXNf57gC1kGAwJTxyOlSe2pPmmrxQVc10fpiWmJTaiVV9ZE4
         Vb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280985; x=1794885785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=V295ukSGN91BE8Ck3BCY8kOQA2+fC41eQQWaZx8mutX4SOG+NLf6dnsELVZc/ks2An
         XZEspK1AKE6ctLAU0Q7urlaZ0mVwBUgwCEteTYPy5LiviRew4VYf/LGk/unsZcd16Lcn
         ZOqURS+rkTWvmgdTDidjqImHEY/Ib0bMkay3kDe3Pvn355jl5L93sqCiN6Y4f7zo5D/7
         eDaNSZOoca/BKwnx8dWDBZysDkMcNy7D+HyGRN2kyzTXsepeC/1Hycr7ywRAfCpX2t2D
         v8NACpubyhrIZVIAMUPX6qm8jMq8mCDb75yPhBEOqbO2x0D5DU7n6s6PIGoEikZ3Qs+t
         hJSg==
X-Forwarded-Encrypted: i=1; AL+hErGqQ/e4CfpNhpj+BnyDVyEaYoK0gYMmstGtD///byCp65QvE+ePaiQBjuTvv59C0whv2zPDswcH+/t54kYL0fox@lists.infradead.org
X-Gm-Message-State: APuU4Z+KB4t3lABIybVW7RdfmhClBPzBn2+KNzc/3lorUwzpCPeJJkJO
	kc7Pd/c8HgGL7tu8IeST4OI+FpN3LF5UANv+OlyUpVeZlMQ3Cgl50NIdtSwz2RnpoiO2R3OJRph
	PzV/TBy8k2RczBXTf6n4F5ViLgSeDdgQxe3Jggl/7V4oETGM7G9tA8Eh6iY8kbwSuW1XAWw+2/j
	F2NA==
X-Gm-Gg: AYBFou04N6PH0HDWIRZYyoqfPooe+C013kQRO8SeKgE/HzL/AXibXgSoB34gvflXA2Y
	M3pe6iZwhEMTF19TGwJ6VnYbEJoqfuu13nnDIjuDPc83Ap48CtsjLf810OhaIcyOLHB61nTq5WX
	q1+K2rv1G6J8DFIORB+SnAjLsdgd14IWR2/5rCJMPKzxDituwJ5XsoRffmjU6boK6aBlBnwvs5l
	Ts/c6avHdXuCF7plCKL7athBDVbY7O4QdeFMEWOaIg+xLLPbTiZQ3D5+njt/eiVvRxiI6WWiUM2
	+vguvbfA4rGAnAxLZq642wwWPT1zWWbYxUNic4jBsbbA6jo8ZKwOWymNgzS5xP0DjyiUBGyRH0a
	iEtkbmPhz3HU9Ii6ipJ9H/z4B4mWy9WP6FE9m5Ki7KKDt7k9kPh5wHCm8D9GWBN/+RvP0rUapmH
	+Mxh6s/yz/GApgb3eUcgi3taX5PucFLYSpZcNb
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493514a91.61.1794280985135;
        Mon, 09 Nov 2026 19:23:05 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1493498a91.61.1794280984677;
        Mon, 09 Nov 2026 19:23:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:23:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:30 +0800
Subject: [PATCH v22 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-8-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=AMiBCcVxGxfSjuuyQmf1WPtk0fETzfBhVgaDOfLDfYDsgz+Dw9fHYx+UHgz5+Z8gvv0CsjGGt
 t6hZrFaPbTdCOSKabsn+yIYX+kMPuUhaAAxVzjIfw3rqbrmcJPjBdQW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX9rIZr7/l5ZsX
 MMJCr/lsZxCexEveWcbed4nYqeBZPVIm9AOJOidPrSGBUJTZsTGENJvbsmcvV69jVY2ftu2CyF+
 dMMnvqEI+7cyU2ytoVA4hnuMcZIQyxWuYjv+q3v5gjBP/0IKwwa9YoBBJfewrLhfQdVy4LUZqxo
 E5KLsb4jATx11GbH+JftWmTF7kk0gfxU5eZFOzK/x5o1NC2Sz8WWMThvQ/pRm8hLDNwF4/azBmd
 nqRUkmLAftbU17gTFWbq3AmrQq2LWqkvCq+oBnf94r8z2v3zEv6O5sSuqJz8lmoMq00wMHKLB9v
 BWWxbBiuQls+GkODDZPlUTy9gSz+HSIGQvvxY9ZI6H60o2ZiuOzznSPHksPEsAucUkBbPPwUEOc
 AoSb44qQxcutG8695ZyYgfsZYzxyPtTOy5XAOG2OfhCTleb31JzEyxRV6e0y6YGyr1TSgdOjJd0
 ATpna0xl1hRYZA4eOYw==
X-Proofpoint-ORIG-GUID: TEWHn8hyNWPw4jZ7LuV8AjCpCvJJi0l8
X-Proofpoint-GUID: TEWHn8hyNWPw4jZ7LuV8AjCpCvJJi0l8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0W2+Cc4P8UuQ
 86BHgITEBC/Bv1NeZicq6eB6OmxT1kYyOgSkyhc7P2AerN+8fj/hfWo+S6bC/DerOzuUhAiItI+
 UXDD8HDksBZPKFp0VwQVC9pyF+l+Mm4=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af28e19 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192306_280226_3170C7EE 
X-CRM114-Status: GOOD (  12.71  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


