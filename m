Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q6e4f9AN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Znk8sWI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWNieZNJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=q6e4f9ANeExfUx
	SuGJ6GZpWtjAWr+sBLm6eds8tA7Sw2p4EhgvL09D0bz4k8lGKGoVbH2zywbRqKh+5XxWdR2v6y06N
	kOsBzMLZW0LtMQV1H41ctzVRiSAAqGkbyCnPoL9xdjdY1dnrEsNaTWsKOdXkXhD6WgihV6d7+lYp6
	d/ieHkyLcbK6weblYbdqy9w0jGP7F3nd/b8sZngsfSctpZuDvxx0BOXrftBOnx982Jxs5cCcqRUIx
	ow6BVJN9W9GB2VbFg9jKb7nkCAyj+If8Y3rpaICbA3NwlZYR3cmB9Dn/SvkDhVE+zjP+6CXeIGq/d
	vUj27vU17dSwopK6U1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV6-0000000Ej3b-1xCq;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTX-0000000Eica-3mI2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjt071168916
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=Znk8sWI/Dw/wTngZ
	niNrsQsD7OA3RaAn7WIYdaEwsJv+qgi60YoGMTHMJnAAJyDcSIn7L1oquNF5ObtO
	DXt8BKUE7MRQKhVukiMOxKocV3dYhEaRFMhpfPl23d8JQ2eRe+Eaf6bDTfL/v2HT
	4c7hrHGbH9WXAm2r3urJ7wrhnYJYOOrfpLEfVdr02H+09ebcROjlGBxLI2DCMjVi
	4cFcZINqIMLLC1I1DDILX9K6LsrsoDsY50Qsmcf+MILF0lgUuIa12lkW8Ojd1mbD
	19243BK777MlIdjNJzLRWqL7u+/muGXsVa36TNudyE32aGu/K9hTlykz/PiLicZs
	RTzLPA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5ucyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so823483eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172894; x=1795777694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=kWNieZNJbAM6WMbVj8Spw4PVkRG4WCsiUlHcA6pSMbKOok++gM9uI3vdxJtPYRHTus
         o6V7VX648+lZboljNjZi1rLOVTS44+rRU6MguARdoOJRyCM5KhuvP49dnXD8WvJGv9dz
         iL5lD6PPLzzyC5EZAt2qCkeD6mME0cZsPfWbIbcjBEH1He9qqVicANDNtl875jv+IgCG
         0h9iqAOnB0oBknxyE8XfWHoXYLhA5wRaJa+oVuGVTVS9WB9/GJFlaz7jKJnrsCUYwnCN
         gHXsBGZhppl91urrKyfW3Ml76rh+vHyb366abwTBSLii45nPKdblt8LHs62TTeyQ4cQ7
         k8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172894; x=1795777694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=HMj8oiDUvHRJWTSUlZcaCQDrd1Frf3E6ivFuz+v5e0lEeuCzZeercn/bj6RNp7XheI
         kFeFIF4rERPDqD+8/xWGD5YsnonliMkrUDc1O5uq5UzWi5/v8r0TVIQngLnF+TFGoFqt
         /lZl8dGNEbtgIG4Jvh5PuE5TGqkYHW+eNYQUAC8lGfAnGF2QFKE6XYHvu+MTMkWblEux
         YStlcxSNTrRo/vZRLTv0EcFEcqnqSiuMfol6O6x5aa6UHo/yyJ9FdCVLmYT1KDilItl7
         Hb+PLZZEi8/4VfgM7p3m8kcvtLaxF3sGxf0QW+flRfwNeQFWdQ04D+4O8hmwCgqeJ/xw
         lYHw==
X-Gm-Message-State: APuU4Z+PCrOXjAy06rw3hHY6H/XTQNal5Q+K1LrB4YT9hbOGOMF8niwI
	9RAXcchDNFkPK56X6l6j+DaqlAlJjI5sySiJxk/PriTaMoD7qdm790XbMndgOUsLctuqQPIqNq1
	XCQD7OWXQG840VNiGrBj3s49In9LfnGJ4tnXI/c71W1YCjW1THRhIPTP6LfuyH9g0MC4gKzd6oB
	cReQ==
X-Gm-Gg: AZFdTZetdOTN1wTdRldoopLQzHUA5XrMRG4uQYFF70Lz474YElGoWlbNF01LLNguPMq
	lYgefnFFxjdwLoBuaFgiYhmfgTmqbzkjQV1YVhgQTjvYRkbJDho4z5mcYkNH3VROoOecQ0OCJdw
	z5rjoDMXsReW8EFRHQepxB+MAWoGD8GBnmoJ8zIPY46sDw/9P3CSyrn/eql06uOSi3dZkSqCfc4
	4v0P6RlZvZzZScEf9WSNmFUqbIIBP13hj6r0vUsteecDkauH9h1rxp1J2+66l9bYyaEn+kEDaBM
	aJ7ixKdH+XLQYeih/dYGirhxuA4rHGFpqKE3LCwZvEEkgDJejEQ8xgwyB6sdttt9mDuzxGVN1XM
	qETu4vaggCQY0J5nwxmdlJvYVd+gonXjgvBqoiGQHMTTC+VtWAiy1zaVV2cffCIFayNzaEyTZsX
	qAE4Cn
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852859eec.0.1795172893403;
        Fri, 20 Nov 2026 03:08:13 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852806eec.0.1795172892688;
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:57 +0530
Subject: [PATCH v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-16-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=3u5aWyWWqvX72lbjGg4IOeHiJFq52q50gfyaLIyAg+4JVQf3SFaLJL0WxkzSJ3PimsuLOiRnL
 cT0t8ho6a2oCiyszc8in30bpVfEtvHfZ6d2fNZiaDAJIgqRMW0zW3a3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2C++fIste2iv
 nCZ0y4vvLpVIbwqtZPwQvzWVLoZxKQsDuaxcVmn06Y6SOCVK+IFM4D/0iLEI+nyJWyMB5k6nj+E
 zhZ1Z9Z3fKzia+HGoW7IVyQuv9qwDk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5xbEBR3ooXie
 sUtuW9j2n/TpCKi7Fh9XsxUhDihhl1jrPBrdlxWMW+3jsYC545ioO/1fL61ZcEUDNwzyQhQvyqL
 pJYj6zaVnkgSzyAUOTYFPqoe4TFgE5aegjnC4uqO7g7KPNB9qby4LTo3AqziP1UF6idNbiB+dhE
 9mzJ3DM7rCmCBuJL4HlcGrgO7v1rv+ML4TfQlhKe8lGgMBTg5ePntaHyIgzVF5VFZ38YO2FwMpo
 35FpapzKkCLFZrV4XnSLrdeI7oxs4tA8tV+sEYUYdCqb58cykTX07KG0L9qH7XbfCPF5Cl08Awm
 yfohzcLh1fCkTu6tFzeWYhXoh8L9R+3l8OnTvW1eIT6OgJtrrNHg9esNsrL5hmFUhMzFYvPs0DW
 96g0yPv4tcComAVsrfAZhQi0HsDGZYdse/9jmitsaZalvGnsUiReRHofZAxd/pyUuLC+jhmfD2L
 0xekqt69IV6gfiCGSzg==
X-Proofpoint-GUID: mL0o0Ipr2jK-xRvnH47wL9mMlmzrgY45
X-Proofpoint-ORIG-GUID: mL0o0Ipr2jK-xRvnH47wL9mMlmzrgY45
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002a1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030817_291359_795CAEA0 
X-CRM114-Status: GOOD (  12.45  )
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

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1


