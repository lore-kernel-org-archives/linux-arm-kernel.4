Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B5606D82B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lUFsFjXS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=abj9SImj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=; b=lUFsFjXSM3RyZ0
	oDB6FedCX170kD3S54zCqDxF/gd5GIIFokn63O+T1a3lIgFqRKlwfsYWNd45fJLwmXeDlmGVUrx0C
	rY3YSycVtBnoTOdst3lFbIzcypJvrQB6YiOsAfKSh2kxZymK6kJmyUBie74D3VbOtw4OzF3okDnmP
	Tafwlm2ZOmeBbXhR4x2dRLz3vQyshrX2YWFs+Ze+PBUMPFDIwK8R/dc+ehQ9+Li0V2qV99scMR51a
	/WXcefne/iwh2rsLV/ZbyenfYOYdsgSl9D6keG2jwmpvq27gh50dxtPkbNr5DEIzjVUVfUwP3XLHA
	VN5lkGQyFBdsKjYzqWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMIU-00000000Mdq-0l2q;
	Mon, 09 Nov 2026 10:08:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMIQ-00000000MaA-2nV1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:08:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vGAD4108047
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=; b=ppeEQm7rR7p7BPUY
	Kci1Awb2YtMG6qsDnCfqu96oRFwOLHYtJLPkvgpzGGfzZEUlTV57uHLKpJZuDuoN
	nuziQeeLPEGNJUcu5wVZ7Ak9UPkqcFjg+4wpgLM1iB5N27yVBhsuTgxs2nAohKvl
	7vuMoeQ+4Rl4YJ7VCSWIYenx5vzTcLsNTzhFbsalA872sgdGVqbq4QAFeXwAjWkD
	Y59JLLtaOH3YT8vfM7pNHK11/2dwmskRorfkisn15MO/TEFfS8V4vRVIubQh48aq
	M64iHku2DIagIPfFSqPTQKytP77EUo4iw/d9r9ntQaaSpbd64FGifcgJw2KrT7Ml
	BV7B2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx83x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:08:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eced5a4cb9so7407295ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218892; x=1794823692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=abj9SImjo56gvKXbRSRzNBykj2c4M1J/DCOyKEOk7QbqaIXXtT8LJCW16tNnsQBsIS
         2wYqQ1GMX0ex0mU/KFMKYd/6V/ACQ4q7Y/UKxtT3a7oO+mGwzBiTe7ZOOlzQjJCFAw1i
         Auy9/Nu2ALBXGxHn3WBY6DLvdrPZw87HHSxgFvNceuu7ZxsIDPNraKrYy9dGbk92czb3
         XiXBZ19UGzMz0azeAMvc2+IScwZqJMiY5t48NWYhCJEGP+1oIkhE5KGeobq5xzfBr4Nj
         Fh7XYF2RYUVYSO+COfK0vaCo4hgUzwx4ZSMTLyrchkjBtqpq3FSR+IFsjQk5MsRQpr8r
         vW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218892; x=1794823692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=I2USxsN4npqAeZ7CHwOeFLj6ifR4I2EVhneDiEDSl/7F/8Dsi2f7bTlhpOre2cqAok
         3ZKxa80LB94+ol6agqLgumeEHI+fqRM0Ao4sbkCJ1flN2aQmmnzgawr6VfH0DWxntwEd
         cCco0MgLjOdjjkflXoxFPYR24+OVmPvGZ9UobP13rchRNOOFSOKJnCzMIRtnzlqP5FsN
         EPoBoPOkLczp5bZ2zE6zuCqWi5ughgve3SzeuT/w7LMil+IRjQReUPB8rHtcQJjiWyhB
         C/ieX8nzssP6cqlQHdk18p0RIZfrx0Yw5FSuxqwnJeUwcbWDrqG9+yedRh1MiIvZCals
         WRow==
X-Forwarded-Encrypted: i=1; AL+hErFUrUlmjMusa6ruIdb3DyYlndTRVJFUSXR6PMVHxIFc4w6tTQyXvSY6ufUQ1IDC3r8pPSOtai8NWMjIk67l+y1s@lists.infradead.org
X-Gm-Message-State: APuU4Z9Z3gobRq0qqdDleT9EAy050t6HGAvpw72MVPpfqgUH8AJt8gSk
	MgCMUVu1VpJ3gYHm+bVT7XZ23CYvBksgG2lbEmyPQgWtGsw+YhwjXRro41xo4lrpk26LSHhocBR
	Ier2jgqH9PtUuc2m8lbCWYn1cvqeZIHcDt1509lhlMqd9P13dYqF5MDYSUZqe8hHvAMwJkgYXNC
	pimA==
X-Gm-Gg: AYBFou2jDlbvI5P3SJI/0xf79I+qCYkNgG9+Bg008zgg9wKC4ZSLIG6ZZBxUg6XGK0h
	XWtoiy46kjNAMlqybFGRp3uYdYuYZyY9cYPf4qM8mMOqx2ubtjbmu80KfpFTnBaaOd1n1EfV/Pu
	BSYmtqAbyKyxjf6KXsX0hC04woTaxcq9jzC0uzLl14Lnv+a1H4V3cyhZ6PNEw2Jm+RsQ1vSj5Ty
	aIlz/XmzL5dTH2+rbIzotodS6qPBBSCPYk4VoGjnNjXvHpmSWy9N9ifmseSy8Kobn9HmD2v3UOj
	DjBCDyD4hpOhYELDhBS5iYJ0+3VfoLqk1D7jIjR6axu3vFwxEcHXe5J/vosVuC8yr7v2IyqNUAf
	RD4A/Uk0+m27asfT+taYEjzBtmxR5AkdCWRqQ7GVp4IdKdMa+SwXHGSEuXZJhtlno1AHjcwbLSa
	944ya6/7GdimT1s2163Wuj2eXJSh43
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185592a91.11.1794218892361;
        Mon, 09 Nov 2026 02:08:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185541a91.11.1794218891857;
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:39 +0800
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord: Add MPAM MSC nodes for the
 L2 caches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218820; l=3176;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ZaVhC2MFnbu/kTiLZ4O2AmrSppiPduQJFEif++uRdyk=;
 b=u/FERFaskIqPAl5lMELjNtPiriNj3T5fZ59uO++4QSA9Qs5HQiSwNeAUgh2JrMcmT6/6c/Rgg
 YM83twlxNzsAGhVgsRFiHTCDFOBHKzfQ5hgK+cLg1j86Sd6luy6L9KF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: B9x6juM5345sYeyYl2EPLV8f4fWSd1La
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5qQdu8/2249g
 evRqa5mWJP+Sy1Griyxg3BazQmEKonfvARa+L26/l3UragjCNqvIvtee1P7pjtHLgjhT92xzDsq
 83pc/BplTryfjQbYbT8XKvq/QRdTeUhTUha2PD8S08C9kjRbiGHgsEsK9mmG5AhUXpSLrB34O1L
 8ohCYxzEs2qHUlOAR9mCxPUE2XphcGkMnjQJRhQlPa/A3mCZdQnqxOl3yCKxr0zK9nv9eAoiVOu
 qv9lTBC3BRNaft14hj9MRccbD4E0oRU/1nwiHlRPzwe5VhCq9X5bnY09Ig7zVUDzbaCa97sqGqj
 yi2bU6hZp7ck8wtxbDVN/7LXSP7aiG/R7e6+72KmrT7EtZR81sV5CA4lUK+WkFl3bVVlRhzXBkt
 uSW1co0eMvFbCGr5bcPFSlLJvDh5d0cGHqnnWdRf3M71+n/D/GEuKp2RVRP9LCNrzJi4Tyz/29B
 YSfDM9dioBTWgv+gHXw==
X-Proofpoint-ORIG-GUID: B9x6juM5345sYeyYl2EPLV8f4fWSd1La
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5q9gULxVhX5X
 EhJAZYfgAE6/z6kYdLqODRXvU8Apo+CcStmf/v9IfibFdH3v8pDr73nOSLAxnx0ddW68VanWXcJ
 EFKK6S3Nm98GwuLB6M845yJerwpxFD8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19b8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SOWVPGG40zWAznzFnVgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020814_846080_0369F175 
X-CRM114-Status: GOOD (  14.99  )
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

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node rather than
under their CPU nodes, to allow the MSC register region to be mapped:
CPU nodes do not provide an MMIO address space, so an MSC nested under
a CPU-parented cache node cannot be mapped.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 72 ++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..285c6a3e5cb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -23,12 +23,6 @@ cpu0: cpu@0 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -95,12 +89,6 @@ cpu6: cpu@10000 {
 			enable-method = "psci";
 			next-level-cache = <&l2_10000>;
 			#cooling-cells = <2>;
-
-			l2_10000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -167,12 +155,6 @@ cpu12: cpu@20000 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_20000>;
 			#cooling-cells = <2>;
-
-			l2_20000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu13: cpu@20100 {
@@ -907,6 +889,60 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_10000: cache@1a870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_20000: cache@1b870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1b870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1b870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.34.1


