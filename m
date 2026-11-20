Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUfu9my6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A0+km6eX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I///JBMg;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcr5X/7r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=vUfu9my6xbn1VI
	4O6A60goegRK9KwjGdOhSc3AY0Vwmd4Lg4wnBeINsEKmfKRoxirb76N/eKP51n6atSRrnhr7u91uM
	xfgvxlK2Kcu26K3lhjmzQVJZgEc2Gv5NnOhmCIoYhinRVH0/BbegYM5EN21KcMR1s0rESklR6n5iQ
	Z+U3flM3cUVu1KWg0irFHJHIgZt7i3yj/fbDBdiprG1UH7UZJx5IXPJNg4AnmxgptpXyu7olDwMaS
	LP8fPWblsDqMgPvXs+KcD2wdh33N//19gHP48B9CUIZPXdbjX3YoCKOqP969qqkHYwaLSi/u2d2Mh
	OzDKp/TV4clGNYLEPDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOvC-0000000F9qu-0Yi0;
	Fri, 20 Nov 2026 13:44:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOua-0000000F985-2CdB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 13:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=A0+km6eXa7SVEud9RihvKxRNgK
	J7pgzQHqg6TAmo1rqMMHPawMfXTvjWTmDkA3S9BB5MvwVs/vIy8kDocvqvs3m6q+A6CdERj3UpNt/
	j02vSmmmlBr+vuaEdaGqZwTF9EVEzr3iK57BxNa8r8mqt3euNtDfb+XExo9UmXb6YPbtk03szp3cg
	lLcUmkvvrxXyVViRDxx53+Juukg6ZIYuKKnoM+XbPEDWR+ldO944gXURqEqOXFPCv7ryY+iLpeUuk
	rUtwU2IubcJqOOBTjkB/aZSjpLxti2VYPUv9ZzO5bHY9gOzRaXzgcR16pCDO4zacklbdzWwLxCpjc
	/GJ4Hn7A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuW-00000000oe1-0Pw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk7eX3987240
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=I///JBMg66s+Ajzu
	47ybV+1oKz2uCczswJ2PLec6ejaV8ECbm7IfuYzpICw11jUAWMVRIzg+OsYe4ap/
	+Mtw8Rbx9r4eUs+2WCUN0vwcJj7F3LE/ywIgGOqi5wSvPw/szZMa6E1/Kb9TZ0vX
	5j1hh+1g/A89ebO+E4ZIMxEJgQoJmT2r3dh0TI1MaeubSi5v8KrieU/DNnyrKsR9
	wU6r/VIKXVMxw4H1Wq3hrw+DP4hTux8BPHdAE86pgVQ4DGEo7lLAhSsibmhhAJ6H
	olphCQt6frVIoaQZ+zG31UD0VzOYKY2Oh2RdOWvOGZzr8nZwJn6PiNtmLHgbOJ8Z
	M1vJpQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81q2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so713935eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182253; x=1795787053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=fcr5X/7rO0mKf0Ws6F/mi1c3i7bbohq42d6czdXrdmHR0FRvYq/0EFR0u9HTqoUUuZ
         9ylDxNOLVqHK6ryXbaygdxmN2fQgahIJAQi1lZE0rC840dcN701+KTQqa345nfiMkAAv
         WTSj0lRYXJXjCt7EQVeGHvmUMyOVe3DniVrgpLSU6gN0Too7pOf9Dy2htekxfNWhu8No
         oK921+s+4GNOFu9sQVeQ/tEJVCAKvteLlgQbpCvojk5s8w0n6D5b1mvrCsW860cwzkiL
         yY8yKLUYbkPNh4d8QfyQxwRa/ucpioCm37DkNo2qYInuZ0Hm9LowOX6nwid4Uar/H48O
         /yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182253; x=1795787053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=muX2AixvliQ04wUHwYt1EuYc0eVSdlaJru0QbL/qQQXRT9jBsRYElFw/B1V/F2GBc/
         JyAuik5EgrJxXb7qr+insVunFOl3ZzvTgB1Gs3J++obw4BcwKRnTMLMMJ/jrtkhHgcas
         LRHodByIUFjb3I1pWwFEXknZ0Lv+X5aErtzNcJ72bovs0ydNCiGvYlxpXQF0SwXE+1J4
         cA9eOqvvJ8bNOycZJWvSXpxj2HWDqk8h/1TcKgFTzlkvBMiSZHnVh33b0ACOtSaQAbjf
         82I+ynODOc2LfSZeHWVsiDXHeOvY8POCZPzqeSarBqQo/pfsarXnZcFIEJxN0hlJguNZ
         MG1w==
X-Gm-Message-State: APuU4Z+axp/sIbp6qXj21HRDOpzEKOc4gcYOs7bXCvxKtsNzC+O58vPJ
	5PbWc9KtEzv4m5C8B6kFMuF/UiMUhSDxfn0P/BHx579Fn5gkmZqDkc3amQ24dj+DZvkx/Zrv3E9
	dUqVRLMnG5UPzkWfU1V4P3tXygSrK3HbdsrIEhDIimyUXuesfrhbt8h+mw6e8RXLk8YrdQF4Y5v
	ZtGg==
X-Gm-Gg: AZFdTZf/a9HL3MTwRzewyPwzXFstbHvqgSZ7mhFXlfhdEGvOZTTGjIlTX4PS2T6VhpR
	bLabG2c9eNw05hqR+wkbcloIPNxm7ZawTomslX8rEPScfSMPES+ARswUWb3llFFpH7hgFVd4sBC
	7g/2hTFk/Y5+8YC9HuN6HA8WKBtJKUp1KSC5QC5vGDfIEBXFuqAAUhHQhyq7lGX6PooWPy9MiEj
	0tiV/C/fITDF/EUkKo84C6+qTQFwQ3pOqUwA/H9Uk1bifVTh2U10/d+wPSbolqg/Frtxx7bE2mO
	HP9259iuiDg4A3JCr15l+AIzUzXX19hHcuzoWqoggTOmvWos91IOsT5J0hDPiuunHmsU7228U7f
	3zMYo5bomzfXZy4S5ZuSMVH+Tj0KB93cmqtj+L7s7ecVXmMXxz9PXFH5xTUa8LsSUFfadcAF8H+
	o2ppg=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222102eec.7.1795182253083;
        Fri, 20 Nov 2026 05:44:13 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222061eec.7.1795182252290;
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:51 +0530
Subject: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=ZflA6r7UtGdDB/8yQ07sE7yzSHaKi/dsLit6bYC44nb5Pebakn6aH+wZQKxLjgIoCtcFXVcpe
 bgFuB6VkQYvAFuouqHVo9+JC5mPuCRTT9JJdyxC+SQjThL3oBPuBpig
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6CvQlQPBer9i
 YyytPhAThCMJsXlqbazEjxqFBx0ZLb1J8Rn6tOIG3RrcTJT3TC9Hk/sctz2baCNmRO2/Hxjc7cC
 mXZLa1JLiiCFD47EIt6s6Gv9O2d66Au6/2E/K9LYuGPQxyE8sRMgDhsWnwuvVu/m2erxdCEwwgg
 kmGMKy5WOZP2q7RqtcISpX4RTZj3mvWqRwXUCzVXM6BERiwV35r4NjXEYI/jq1QkuViof0cylJv
 lZRHyHm/c4SggZMUJ34h/sgFu7oMaGcoXkYCk4JNgHb+gduiZt54Ho5Yb23nWVWQgAAGHC6tc6Y
 7SHBK/I0vt/TEDNw6WHh+eBdueWiFhcYy3414F8CRSTcG7xuOnjYRAsUA4WrfrjYmmPQ8Io5ln/
 gsSTxmmZV3YGTmzb6DnkqwoKTemBctWJdp+69vI/UKhn3STa4a3A19y00WHtVrwTvxwj6dJdhmv
 3KIlpMozADTiZuzP4ew==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004ead cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: dGK4w7nTOTo5qpoG9GEgPa8rSB--hMXG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3EpMwGIZOvXc
 WYhIoCzyE8xTpfpq8JFMzePij1M/FQYiO1PS0PO4t9Z6AiMhkGk7OADqX8dleER5gOJMfGrVX/a
 ofo2Wg3hYF4w5n7WXvQ7iXyKXSpaPbg=
X-Proofpoint-GUID: dGK4w7nTOTo5qpoG9GEgPa8rSB--hMXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_134417_179134_946D18D3 
X-CRM114-Status: GOOD (  13.12  )
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

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1


