Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E0606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQysKWjE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUsSYriY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h+VE5dhi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=VQysKWjEeAa7iG
	PlxYZZHlig0pcVO8ktOF+uBAC9L8TM6m92HYjpjxemDFeKIr6U4F0Fx3OT9UlJDsfGGFStS5BmWQ9
	1byzvZX1MAULGZquKN9pTObNjNNCpI0sAns1doN+yRFFk9VZDEM/X2m13Vv5F1K64U9mqtiLm9xjv
	Cirxu674r7r8FjkQI+o3lErIJrRa3VCmCjng7iegjZbgOy0wLIYku0mOx8e15h4rHb3YnyBYUq2kk
	efaJumbHGspohkLii0z9/NpSfF+nJsoGWy6X5tWagBIXTLQzFrzCuum7l3Efql57bsysGrYmqaF28
	H2+3HJTBCCY0MOYlXuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadD-000000085OZ-0SMz;
	Wed, 18 Nov 2026 08:03:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTad5-000000085LK-4Aem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:02:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VwnB4059979
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=fUsSYriYxUBhe2ok
	LUURC3k8cJqJcNOs2tP+TO5gfMabqNHoNa4ji290GF7xjVo02WiMbAsms68mrMcO
	pfVNMPjcgzXFU4kzTivDN15V+0F9ZG4RarW+ExSShMS/Z4FadHdu78FJRdV12U1I
	vtKaGBoKGAFMhEscbguyVzNB0VHe9MkRF750M1aWiEGDv5DfhBoXJMCnL+dSGLWQ
	8YMkg1z6xc8mefOkLCqmij8NgMIh/z7ZYTxrzzLo88nDtlq5/pzfq6jNw82oEC6J
	eoovRuRZruiabIBr3mLKMHAnrt/x1J60j18c3eFeo5gaDDT9YMDMJi1/E4z40hlP
	Oq4b+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchy85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:02:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so710081a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988974; x=1795593774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=h+VE5dhiI0T3kjLlLJWvzKnBWpgNcbk29vgNnVShacMyA0ujm/EA3uRWADn1fXlDPV
         ubhvy9ymYCQGPOIMDFsAPeZn3Hmvq6jZgSjKEUtrqjOs8T0yRcJrxNIvO6ffXuIl9ZmP
         yI/qlUZbOG0MolJr+FdY9lANEOUyGuguHEayvFb4Ps6UhMceDLSQkpxqijYLdhrcI7XW
         GO8BLpw0t90/eyScuy8muKFl/SdY7Z5FpWPZ+Yk5y7Ll4AQq2GSIqvEYe2XfemJb3kRS
         8gkOYs6wvI6iva8RTG6ks21DUXYY8MDaJdGCG0EPA+NkzetRP47eQe7RopJ6AXwG26BR
         4h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988974; x=1795593774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=Q3qYwhggW7L+6DAswM98x4Lzv7D1DRN+aoyNrWHSNG/hqpMZ0NBPKT3Ab5xowaAp1M
         WG/s6QNi6iBhTdw0aYloZWcFOYPZfEzB/1+Dy/uO1Q10RUrp2bUSpt+Ju0Vmmcopw4ev
         XG3QYL5Qk71TYkW/sg+lviFqzf9yifharDLVPh/tp3ZpQ6J6fvlJ5OHEf5RKCOqWdyMm
         E1kLGKI+SZFsG+MhZMIptYIppYOpXHxH1eNaKlJWc7UC0Cj/jXY+bPjMrLJeoSx+vEjo
         g/iaKFOoiijUsqvYURheHXaSfpYinoocVnakH3VafsAq/52+NXUoDZ8sjEPj9AVf4P7F
         vjCQ==
X-Forwarded-Encrypted: i=1; AL+hErH5JtuDXjjE5zLJGG7Q2o3CPDGITZ83YkK3lYdR5xWUQ2d99aeOqxTEoBdIXxWInnvVGvHRyMQmyXRCzRw22uVK@lists.infradead.org
X-Gm-Message-State: APuU4Z8j0Sfqt8p67yop6JFu3isLef97RPVbE8Ne7p2BL+oNZN6iKmA5
	iF8LyxwTIwX0zQWHPXlI6Yihq5ToDG/vhDDERRhSJ2otR1CnrWu00nm737iEngSSKlCYk9xgtk2
	NgHRuld0HbLTeI14B8iaH7DiW4n98w9TtEEqCLnjpjHPiv5Pb8JXVAutKZtgQuh8gAc8/AKP8tr
	TrRg==
X-Gm-Gg: AZFdTZdXvEZNxIGy5WcStRu+fuD1ceXTrIvHkNdkqBcN9h9ycOjZytUpzGR+0O3RnJo
	Cd/ilX6/42y74nSBCiEJMaqmh/MoCPbrDsAe5HHjyTUxxw+sH/k/4yKe0ncvei9xQq0nBaqW7yr
	/jDTQ/QJ37U2+5D6nLvtIsiPXvZs+yHEnnzS/iwL6PQ8dxifgNs4m8GcLo6s4pKNPaCvS37qymW
	KtEQAul7cAXTMleZVbRHvoWlG3mKi5f144KGvSbS3+LLaDs30K8oJ/nQiIf5+sesehVrUrHrAAl
	H/DkksqktzTvN0UPnWVlhIxJzBAcLvANYe8TcZozRcep1ylCxtD/8F92BiBjC55JoQI97DwpjgS
	V/asIxY7iur1Ef2cELJsfmZpMs0qSW23q3vQIqmDR2h/f+KJaMCiDrDo6qN0cW8DOByqDi21wuP
	rq98090VNPXaxcb18yvcF2sruJyLIDk6cDI2NZ
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524834a91.20.1794988973730;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524802a91.20.1794988973176;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:22 +0800
Subject: [PATCH v23 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-1-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=xita3mZAUpFh5kamyEmNix6Ry1Q4ZUfdHYGcvVo5ikI/KmNGgWqCgVp6rcFIMiHmcpu91b2vy
 5ycxre/cwQMBzLD84GCg1z2XugbfBA5scLIMdVDdssV1DuLe0zKXG2k
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5bae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: pYDIA2VAirtKsOQxa5L2QtVXOHTDsRJv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX3Zf8ZAtlb98q
 ZmNjeR1ewse9Szep4LiykszKmmm+3jfDQV9iKLCSxNs2w9iGMSQdZ1I5bQCJRXmnYl0SQiX63Y4
 KFMq8YwCL8OjpO1vPfba+nllpdoUhNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXzfmH8jV30rfd
 gfiIY1/v1zeNIPIojfHONj+BnBdI3u+sC2kFmG5OZTZ5V7N7nrv7aqi7QTyqCNFYghVdkX+HElS
 5l01V5PyOZndbOtKxi4QmtYVlPStmz7LGpUT4bDrCn4xmXlJc9huVYvENhylNNhEXtR3ktqCMsq
 qmSLHVW5+GA4iMT0UHrGLpcZHi9uXtuiFlFpZZFEav/ha4hyzi1UAX4iurqpmrOo11OJDD6On8j
 BCPZMngXLAoECOA771hosfNjHIpI678c8ES7FA9p66fnB18ltkP7gbUZQylCZOsJp2lS/BBJ2IT
 dIC0VJvwBjh9imiRqz3QAYhPTZ836essjTKZQRnT7NuChnGCVXQSAVGKAAYGbHc7eWZCyE/lJoc
 rMfR9UHhaPwq5bQ4dnkEAArBDHrYAqNNmk8TOkSIgVTzXgRs0/Xb8nMwhwfDMvhdCc1VCZWjvw4
 2Gbni9n5hvQ5luRiC/Q==
X-Proofpoint-ORIG-GUID: pYDIA2VAirtKsOQxa5L2QtVXOHTDsRJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000256_163854_BA53233B 
X-CRM114-Status: GOOD (  22.57  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


