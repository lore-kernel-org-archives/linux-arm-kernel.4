Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF19360A6F44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tfhYkXpE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9tmph53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=tfhYkXpEghIpfM
	7HhpcqTftc+iK4f0M2QGjRiR555zxoeBCiNQLH8RgVL0e3Krja+KOOlsErCwcWRux+PzSUpVG+SX+
	MCWt5Q4AFXdEMyLdswJzCZ64ucLK3vNL8NO697tjF2Hul0e5Vmeo+Rp4F4RO4bXrD8g1ITLzRwBMT
	myZiSG3+XXmBA8yHrbqJsg3sg+yVz1jmOtUZ0/tem5rwYMovDzUex6Czh8agdGBxvkfYLHcBiS9w+
	aKqLnzvkJXfOp4PWrM4xQAl0GC6ZQUvZrweOMHNpp2TvvxttJdsKTp3qeJa/vjXvU0/MU+O3WULQK
	5qO3RS1FkxtcUzpjJYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRl-00000002H4T-2nKq;
	Tue, 10 Nov 2026 03:22:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRi-00000002H20-3sZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:22:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jCgh1854054
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=I+QEeTFkHUu2b3L/
	XqztB6ygtRDdY9jVOSV7rCmmyTOC4o3mcDxCBQ9kfoPSP1j4snMc4m6hxvtua+oq
	ClX0PiiHmBM+2ZieTtgrCFya124YJyi0mTbgc34JiEBXq2WBlGciSq2OBaFyLKpi
	Bms/WdsLQeAE2fzaLBQ7tyhGAr/qB3IqKNIO16WxLDPwH1SUHFjLVItLqs4O6N2u
	9Rp3KP7uZTkvORJgqvvtuP+JIZpWAMkMx8on5raH0kBdLVKULqsmqm7cj0M+w1lY
	k6tnEzpRf0fcnAXqkmBjbaYfSS12LcTXeQ1WobFueAaqnNq4hbNRJpi8DE1/cAIP
	zMERmQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mpwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso913472a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280973; x=1794885773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=j9tmph53zobPa/iwuPd5/X+FEWQ3PeX5pwFBJynC7ilTmS1J4z4T+p9dqH9ZXfRJ0F
         t/OE0qeNm3DRpCOxxPxvsUsqnmc7PpOEZJ6K/0V/JjUmF0K5CsKfBMkE2W25JpdUSroX
         Pud0Pj3pF1ZXfI4Q6gsyXSSQO6eA42rwanho7aSE69C/KrMX1XouJ1u8DXutvqv2PZ/L
         UNcotVEZcYKgEImnCvA/I4xguDqLwUb5i5hrEszpR56NnT8FKS4O0WnG5yJlAUnoXS3J
         8O+0/mjJASAqIi2GvQO2YFzaPG5uyMtopdXj8hR894f8yhM2Qnj29IkaaOVmL77JNroW
         +OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280973; x=1794885773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=Y3mTgreRi/qrjzbvf3Ol4bCfrSSudhiOd3nc+6CottNzEsYYkZKezatA8AUd0mxrTS
         lOFQEiyMcNpnbcrzHmgdklNnsd/y0NfEo7148dmpsBNY4R0WU94Xm5ZwdviHOQ+vbkAT
         eU8SC0yDgUKFuS7YcUzbn6vuo68+5xM9zMvcPuEpZ2dXK2cTtG+2898GF/QL4Hk6GTyB
         SPWXJFPZ0AWb3xzEKxKTDGLO6ejnHdo9cPHb2UeOjd2K0Wyj+vn4B4meF7f7MOOheXc6
         nQmVoVwzFm+DIsgzUJyCKmkl1JADGhpBKCjsUpvO1GGyeFIzpxWnKuMpA2nAQptn7iBW
         /EYw==
X-Forwarded-Encrypted: i=1; AL+hErE6+oFEqM9A78+R5L5+ol39a6PPsDoMejECbE94MtqDc4PjMUfhNrxPVPNQ1tCmB6NxXHy7vsQUnICtTMM3n+oK@lists.infradead.org
X-Gm-Message-State: APuU4Z/Uac5lD9UjzUosNqm55laLK5mfBViwamSuqWGU1LFO2Vs2QbEa
	SpZVZFvtOyBaQngyVkeLz3vu96LxV6yjnsuwjHyLnIYqfInLIFFQenfkFeNgUiOuvmg3U4lLkMD
	+s7lLjh4UzM3ZQHgJh+AyXeQrp50FsScOgegGsW5kziTLU4t/ymAVvELbdxuhCTVv/K2WA0GmDG
	hgKQ==
X-Gm-Gg: AYBFou102LgL9u9pSjlTBfuxEuQWB/HzvfgUC+PoQyRh+N8SOjOImOCxa9R3XHP+Q9n
	M2O7v+aoGGjM/NN+zU4P/z+0kiCMChbPT9lBSoRhZgUTjMjcRhGGF8FimoTfqr4fVlrHz6Unbnt
	dknEEaNzCGBR0qHGb4r76G/vcgOZkMQShp1Vi56b5sPT9YHpNM8e3wuztKKzR/qahXG+8Zqa41c
	omZy4t6AoLzi6YA7EaxJfhetC/KSB3Moblg62dMv04o1GPq0+hoUbqKWQo/nFZZfI/14ABayEvj
	F0pTodR/VO2tJpQuarFAff7wMe6d+6NcBr1i8J1cSDEOM4szlQHocRDG8niQYxE60oWMZSJTnCZ
	d3duniMaoXu1D/4lFxCrShvFiM/PsmJxWbeUYdukMD8WgB/DQgG76KW5EysBqZgHSs4vZFwn2zf
	jtd7uLSuF6kuAb4lBVZLqHWwWtm5bm1LFVtPkw
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076859a91.37.1794280972867;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076826a91.37.1794280972176;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:51 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:28 +0800
Subject: [PATCH v22 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-6-05d48c0eb110@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=6NrGk5dSyASv83dfsrXoNPAOKI1RAL53ItKIhUIrOtoC04rY/iqbY+indNvj+wTaEWXWZve9q
 sra5huRI48JBKgouEhBBxXTQQA9P31OmGFhsDfq5bXuM/0c3Xl3Hb8T
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af28e0d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX1GBIvO6tJvZp
 0gQRaffBU0IyUONahSxj4k2QcU4pJsHODg3UVdnWvFnggRzlhHyVk6HAty3nZsRqEoQWyb3uY3C
 YZQazL9XFD8bB+Hl/DpVV7cy8gUrN0uqztcRvkR2pmANwUpRjO6XxSRnQ/bhJmzUOeHyLKiCGGF
 luZR1UEhTrJRCW1BQ2jg8KTbO8x5GrLDANkduwOl84hqPwLvcgdaXFhVbct5LCu597J7P+jyEW5
 51TkQ2w1+3SyxbkR9UwlbtZusfm+/bbdE4/IhFBRN4w9mMefL+MfeuFYR4417/cUSn5c8XIxztK
 5IfWcZyQwvPEWIjZsYff8aWam3AsbUMSLr3I4E0EoHDfY+2A3DPaWaGEea45zIMC/k7er8dUlu8
 WH7v+BTzn2RYDbyZmkjk9XL6J66Zap9i7f0+MxRMnDoruFDZA9b5CuqrRgD32OoWiNfoY46Mwbv
 QouFhPkcdB23RHqdpKQ==
X-Proofpoint-GUID: CymfuLB2sfGXI1--z1QfjMOSAjOoIuRH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX6QNiC7ioGbt3
 HIwIsQ+NRyp6Gqllwv5VuDA4fbyFSzrhSFkvtAKzGLaEbIPt5PdpCnXXoRm0S/kCySKmGxXE7UL
 QIUmcWh2qWD/DY2lvUiChJ1mr6evyNI=
X-Proofpoint-ORIG-GUID: CymfuLB2sfGXI1--z1QfjMOSAjOoIuRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192255_090749_04622435 
X-CRM114-Status: GOOD (  14.74  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


