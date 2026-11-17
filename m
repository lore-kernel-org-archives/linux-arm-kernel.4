Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBBF606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z795ypr/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkXSH2lU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y7iK7WUy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=; b=z795ypr/MvIwvB
	s6koEQOOne3Xsqgd2SnaAgz4trtAg1vKIJDUFuurAWo2JchAgY1EJLdX81JmDoXsOHPaIxzmQvL47
	91Dj6jt0cUiHUw5ZFhMaLfagywELYEAUTnkYJgF8E2XZT+iXVr24K0A93w+18L2Gwa6Z4QKhhd3AE
	3f7zqVfnjT+cAUIjgGehcMDa5clIdzm0QIEfN2k9UlztLbd+fh0L5yl5jWVyT6HD1EL8K6fRR3UFq
	5BoOrHe7HxFlVuC2QWNINGyMhVQOfb+Ctr05abMIvzz0/q7tqdzUx8Yko8tQ86ENlcSWS+2tbHO4Z
	JUM9fqEtJX1YSYJI5OKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOhz-00000006qdO-2liP;
	Tue, 17 Nov 2026 19:19:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOhx-00000006qc3-35bz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:19:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ726n1033322
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=; b=hkXSH2lUnTJOZgeo
	cw2HIU8tUsiI3jryBWqsAgMWzxIno/nxpSwM0W+PUou0vwlBNq2eik1MGWw+6D7u
	KfXYpcW2OmsHrTPlrrUA98z0/BzzRIjsDtyVBWVgYy3GKhsVSGqEuoEPW0Ug/WY/
	jKk3qiBuzqK8d5uznp+UvxlV5MEte8euEbmL3wiD9sigkUjeF3subD1RSotLkxTr
	pew1BMfDzEpY4si+fLOjC9mbpDFRvQ39mAZTS5Tqv6Dl2BWUpq0yxWxYqDg9oj21
	hxszz4pyS57oSXOLf7UW0LLYso55IBJGqy/BmP2OGI7Hdxd6QATtKZ8gCCgktBy3
	7dOW7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr3fnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:19:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso29217eec.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943147; x=1795547947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=;
        b=Y7iK7WUyZ3rSGnERbhoz0D7kDVpwjpvPVWXV4asrWhWoTORL97CghPx8k6zxyjgETz
         LkQQkLiJ4N9L7ztvft4BI92kv3ThosRB1HhE5gkh8z6FD6Qfwcy19R2RBOKYB5LiNTeT
         DwOPsYpUK31os6t1KiREUqFs094Yt1U/iKtU1In/35t5oFiPBqxvuMmsR2lRxoeHJukG
         cj9dbzD2Uqszqk8OpR7WvmnCMjsufkpITh7s/JeUiS9ayPkwcG5szjZqHf13DFonmZEQ
         aTMWKO/IOB+rg75+dt8KOy63Plk09H8GA7PHbrc3gcGRymcbIXnQ/edDbxdGTTjE/sW6
         mAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943147; x=1795547947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P64yP0RrCxgP9qn5wf8Xtpf3P+cqpGU4XTo5fll5/sk=;
        b=YjMRO7DJJUPmCG7kXr56bFZF3ZED7DCXtUfzSV0xleIcqK9tds6KmkezMcY7NHjuBp
         OqRAF0bbAgktfTl5QNKjSmJLGjq3rz5Uz6B14mmMt+H74eng/ShUEanQVY/rxazLyb5X
         fa6yqwPfCF7c/OlHKQwkkv4U93dPjMxROVEdAqrpagzEsojaMWk9MIkYSe3BxRnGrFH5
         G94EattGvXPGnW+bNNGIFgXHN24IQladfK+CdlxJsmX8TjauDMKw8XlDxPxBy+rAaTxQ
         7jE2v1kPHArnokkw/gJreLBOv5XYPuMlsG6LMEQ9nNDnC3LxULbGoWQu+qjrPQdq2mgX
         tTYQ==
X-Forwarded-Encrypted: i=1; AL+hErG2TSZFvD1eChFR2oVqAaLzTDmkqOM7ongOJbxzhiKQG/uQzFVCyKkoIZLC3A3XeNSCx0t8Qv0ljQitmIkquPBu@lists.infradead.org
X-Gm-Message-State: APuU4Z+vRzT/A15BI5lId71XAWpMaXfEEclAkV4+9LYwyri3rwIbu1OQ
	xStSF5p6pG4ZPnuMSX6aB/I4j0ZniplJCtRdBnwwJrWaj9eVtqkLhTR6VgwqdmRUcnn7LP6eejS
	QtSODgVGBjIeaXx2dkDpsYT3njzozFr81e2pguFMrNvKLHaDv03FBbs/A3L/usPDa0Dfmonykh0
	u+EQ==
X-Gm-Gg: AZFdTZfqWpZ8ZLwlz2yd2qT5guBddCFg6oIoZx2QAmMu9YQclE2P+N4I17CBYaHCfRX
	J+KRvGLshNy4br4cW/hJn37QDb9cstKjfivyE56cOYJlo2x2h4ItbDaxrJvgPqjBy+v2OvgAYz1
	CwMnQ2ClhnuVzsx+XZ1D6PieSN20L+PsKNhF2kpy/r0NeFu1oA2pmgeaXMbsQP+Z5luYnQ2h0oX
	lLcrsOLR6OnEDEqa0KXZ5N49CQafy6id78mM1wKw7ZXsD8YG1h13GJUHDQ3nWWs5iUmBC/wM52e
	seKKfgt8Cha4oO/kAMJi+33gwnVMM9qFMOTW3dvnbs5eirw/SIrvc/KYHpO7lOgarogJ0eOvaEk
	VZbwc/kW1mo2fApssphSbcSsoF2KxnlSkBuo3rLhbvGQQhPP9qR+Xydaf9tth8jOgf7rFLhoxnb
	FWVyS4
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520365eec.0.1794943147000;
        Tue, 17 Nov 2026 11:19:07 -0800 (PST)
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520311eec.0.1794943146404;
        Tue, 17 Nov 2026 11:19:06 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:06 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:22 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: monaco: add RAS error source
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-aest-devicetree-support-v4-3-936587251e8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=2183;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=rzIMy+dr2O5MmVR74ypVHrojU5YGoqey7SSKaB74tcU=;
 b=Cqehjv7sxt8HmB6BRMDrXCbGAdNFBY66C3nTKtWUTzfRwuHm3f0cD+YCdB0dJs76q/VA4mOuW
 7W+AFJKELTqAy8VkBh5ve3jTuZ1w0NyNMOsCc8C4vxQBn2t7Cnxf+lG
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afca8ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KdVUwichBgNWhWzcVTwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: -AKylSgIUWRUQoCQqjGKoVTN39YP-J4Z
X-Proofpoint-ORIG-GUID: -AKylSgIUWRUQoCQqjGKoVTN39YP-J4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXzjAj6ywe+EJR
 /V/8NE2TlnNlclFuYPxOZmtaSL0X7iSqlHCI1dNmiHQnIVIq0calcNFyA30o1kXQHlxeoPyRRju
 T9BH7YYBM/32Z3fHbiph9pIum41yhzKDY583sAh/mMs0+d89L53YOF+Iri6R/WpvUBgP61vTZ0P
 biUwzfK/fsI/0wfWS/tihumtKxC/AbZvMpputMAVkOro26jiAj8bTnBecjqNEA4qX7mUNkBuVEN
 tseg5WRR8D6sNSqTLhAE0+q6i69Ep5fqTA6Ro09jUM/8CKMyWuMV8vz0SDzDbtUlTN4fXMe8gmr
 WyVKm/OoJ69rvWm4wpHkuHTXU9+exRkq0cNC5QDwZwOJNykEkMhoSRn3hNCOVqBEfQMYM2lDuOW
 R0Kifk5B1qEr1NiMU6UU2Ij4jOiHfh8GoNWy0DrL7Z2J9teQlafyo1Z1GVxkQgi81kwolfizdmo
 BifkGM/ADOXJ9lDZgEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX4m9ul6YbRyDP
 c+E3oohkPKiHFle+OjcgB7utmknUWevhfQN59agreEIWhSJBDpJrOs0iK4peSp7w+lU+3Z219j3
 FznvKA8cLnPYcgXah+og98nHg1b4+fU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111909_944344_CD093C62 
X-CRM114-Status: GOOD (  14.88  )
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

The Monaco CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..ea60d6ade02c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -617,6 +617,37 @@ scm: scm {
 		};
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
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */

-- 
2.34.1


