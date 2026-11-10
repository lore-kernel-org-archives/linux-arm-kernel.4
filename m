Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9C60A3817
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3UC+aFNT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR2PXnDk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eauhlJgv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=; b=3UC+aFNT2LrZtX
	LpiyqfG0wHFQjW5fW5jD1h//XKVueHCPpZ2rA0g02Zs4WnDhLUqgrbMHNQy6wqqlgRRGmFoGR8y9D
	yQniPc0qMnXl3oCIq7d7O+KL3/7RjvNFjNgXO4iZNvu1eU7fXwDcYyLgpHVmUXRUPnIKhIB1kAzc1
	NWxEW5LHBo8NS3yVAzRm62X7orYfKSRDXR7IDEsmFoXq/ff6AkCoGiN+tuumJl/eTF1aQm9bMUt6g
	YKvOqpIhC8AY1LaSq2EPaONHHl7qbAtgidn1bm9wJ39hv6hhjOtc2sBl1Pusie48bAKshnaDfievG
	q4sdhbq91x3zq9q3E9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYc-000000023th-2t7g;
	Tue, 10 Nov 2026 01:21:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYa-000000023rR-1ADI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:21:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jCOZ2482137
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=; b=nR2PXnDkTtl/fkgk
	ldb3TKFAyJFYSbZ6keGakKCWRYC+zljRNMyZMiuFDJyMet+y08OHDzS+tu7gunPu
	qZr3DxBT+L5ip6UY+xM/gPle4Ab9GHOI1KFlXW2XpiWAElDgIyBoykHeM22c3pUV
	e7ucc3xXZUj0dNKYKQ+XfVsj4Kue9/FKWdYyAZ1fGcSrltf0gG1xGJWkvzr7ZbGz
	vm+md8oKOPe6rQGgMLA8G7N4+Z9+H0ypOmln9UWcvfbhwbOdgqhWFxGFfSpSpkWG
	bKMnbpGC2fRkaavju+zI9p/Dq6tvVhGJdt939c7J5iashjn+CZsd/Cm4QuS/z3YL
	GhGW1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx828np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea381ce04fso24099765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273710; x=1794878510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=;
        b=eauhlJgvKq65ZiljEEO4KH7XxdSDQtmQ2a0IHG9VtW/bBRMBiV4wotJBsdvO9+YXXa
         9s7D94STzGBg2HuqlDZuap1N9gE42DMG1wQ/dpCVRvDb40WDN1CjHUX2rTnCLI4A5HhV
         l8z7AccB/ksgJaNvSGP1IIY3OWS+woPxiJj0pDKDOyCuoVRTMUTzGst2XlxgZBWn4kxT
         7ijcCfmUazp6XU1hKl0yHCgkaB7v2fT1lfmLNLqwptGxlRktFz5Hwt86JbKh9nbCGRwR
         5sRSqqllxe2LjMJefeBqY7gDS7AJ6TBIcvJao5vPyy6bV/8fERvgEAidvomobwnJL3L9
         1MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273710; x=1794878510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pZOfrwc9BxZ4qThTQHCc0NnWQpNbbFr2NtADn6ur68=;
        b=KZDRmBStTtbqqIV3QfQDOAFXRuTtpN25Xig3BhI2szL518/J9/MTy8gBfqjoqgDFq7
         oULs0gOC9m6ULh45juiGZsf5aYL8c/nNXyWb08LmeY4tW7dxOi/TAepAlN70EYSlsj6A
         yj2DLoMxgYRK9lDRej87+ZZVDDrQ6yWpmdriOTDrrtl8GAPZGKKO0s3qnCFTqzf03bwS
         6IA+IdcLBEqekYd/yyOEaOf9YDQwxuMouwHUKgl58Ix9F6oPQ0UNaeYLbjkFPBAmn/xB
         N7P4yphIf/yAXa0jVuRX3mWRxYwGkmXgBUlkLaJdBxRD1fev0uvkDJCartrJbfVuB2q5
         AR1w==
X-Forwarded-Encrypted: i=1; AL+hErEEui64TNmRjyRhQb5/pqtggWoz/h3CG75D1ziF6Z1cO6mGp+4ALxwp0H1LOcuJcGjblwc4Q5LUE/m8Q6ytEtoG@lists.infradead.org
X-Gm-Message-State: APuU4Z+vm0dIzeuWhK//EMrwiFvcrONxS5YSZ5x4ZtWT4uqRZPiquWxu
	4+H1RSE1KTCfLzjj4SyFawanZDHFpKtm+PhyvnjwENkaY07+cxb/GvvAPW/vf+o0uRY3LJhhx1n
	0D1QmEgTWWuUmdo0GhsQol4Cm2CuZNqzCUZHfO5Lxv2y9aaUtGJpYmy7emvvv65jBIf+e/X2hUW
	7wwPQsxltjBqwZ
X-Gm-Gg: AYBFou3uZE/3uPOyCiy49B1pEFZ80yatJB7BJnuxdRyt9II+tDTPEazpigqfGsCOANq
	U7aB9NHD2mkvgt+hBaw7Tc12L9kUIvPvcMoHFVMV/RfwHm+igpy9CnEBjT4tYC00mwjexZMF71D
	mxotVDfEogOTSI5bRMOAL3Sn6hXCuWDTGFfhc9CesYbHdsUuWaX/2TGil6/kHXPXtcxOrlTnci1
	WoYRO2cf/YzIfAS0W77m+cCRQvev2vgYe8haaQ0wTL5w/C1PAGR0PyNSi9GGKdm3aUC6YeANkjA
	Y5eU6rB9hkMaDfA+5lk3smfz+WcNfJ2dYUez+C+j4bYvuMfL7I/Hli5mmNi0bNSuqnQ+0W/PAQz
	nngY6JPKafllJZdNIdlTaRDxpxAKP75eXzxYbNdZKtr6FIa8m4djsjQmIDGlx5RfuRUPrZAdimT
	jiOp0Crjr/miJr8Z0i09Qzb0rHSMXPFuItAQg=
X-Received: by 2002:a17:903:1b08:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2edb715ddcdmr8656535ad.11.1794273710211;
        Mon, 09 Nov 2026 17:21:50 -0800 (PST)
X-Received: by 2002:a17:903:1b08:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2edb715ddcdmr8656155ad.11.1794273709521;
        Mon, 09 Nov 2026 17:21:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:15 +0800
Subject: [PATCH v7 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-2-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=5166;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0b0Jv8aa52rorusffBISB+VPX9cDckKQWTS0EKGHQCo=;
 b=tWjeepAF2OCDUzNXp6rjNTfT8NOudqM57oirueTdbhxpatFUA9Qbs96uA48P3unZzYjXyhaVO
 FHlvzCE0b8ZA+nTqRrbS6e0DmtRFbL/Y3xJCsEnezojvz4HoDhmX2Zt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af271af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=AgGNJJ2qDC0_l3B12uQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: cOYLMRO6Iptz44LNCKEpEfy7xsbzN_hD
X-Proofpoint-ORIG-GUID: cOYLMRO6Iptz44LNCKEpEfy7xsbzN_hD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXwBzirv1NKrkQ
 OEG/ED4vOPV2hW9/NoD+skcw+Hk8vklTd4qhR6FKp/hG8/g8LreNRNxyO/Ck8OaWLlFk0rhGcBS
 RgVGrmoGjaU/dyxLx6pFaKO4LwMQyc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2WpEyEZox/2M
 pimmLWic/eJbdb+7Q/6+2JsGGo5VKwaXWvUtG0BInilT9vA7fVIr4ROq8dbFY1qogUrhJ3Nz9DU
 SVBaiT30IkqD+GX2/IyhCGnkvNvjoEtRZakF2kE2wezF4naroB11NWAh1n3XbVzD261k5hzt1aJ
 OW5RmOZrbhAGniwp1xfJ0hQdXJK/9ZwVc8RctZsBs/8lLTtMlMmBAIR/UYmdwurTR0c4JKFDRYz
 s0056nLCNMFaTqbMX7yJxkvKstQ8wcYWIOdbAbiIYt8FeKtXNu2N62xent1YrMKaoHmdMB5YZ3T
 6w01GZ5L0+FM6gbDnxP8fi811+8VJYyt3CZXcoWCQbhJzNBm5sjHzO68sX1aRtI0OBRry2/ATht
 837sdbey+qLNlYJJ2+5yaZbW88zYfCdyoP/KNx3w267D/WEK5JX9VvSBVTWCLQB1XSEyx3Ktlo+
 5DBBWWkclMZijoFOY4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172152_441985_50FC6EAC 
X-CRM114-Status: GOOD (  22.71  )
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

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. The AMBA bus reads the
peripheral and component ID registers to identify and probe the device.
Although the Aggregator TNOC exposes the CID registers, the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the AMBA match fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device is
matched by its compatible string and no component-ID probing is performed.
Add "qcom,coresight-tnoc" to the platform driver's match table, and rename
the platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. Update the platform driver name to "coresight-tnoc"
accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
allocation for every platform-bus device. With the Aggregator TNOC now on
the platform bus, that check would wrongly disable its ATID, even though
the Aggregator TNOC owns the ATID that tags the whole aggregation path.
The Interconnect TNOC aggregates trace within its subsystem but carries no
ATID of its own, because the downstream Aggregator TNOC already owns the
ATID for the path. So base the check on the "qcom,coresight-itnoc"
compatible and let every other form allocate a trace ID.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index a0ab99df5db1..4b46ce995862 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev))
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc"))
 		return 0;
 
 	atid = coresight_trace_id_get_system_id();
@@ -276,7 +276,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -293,7 +293,7 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
@@ -307,10 +307,12 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -319,7 +321,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -327,35 +329,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


