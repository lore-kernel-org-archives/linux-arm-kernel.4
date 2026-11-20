Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296260A260C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7O6qlms;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPNUGlA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O6nxLVkB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=U7O6qlmsXgULoo
	WS0ooDKOTMqLnIsrmnzphzMp+xLVwHdAbchuBVvPUr39xtXkViQezn9s7sGt4vE16TLuiRnx9Tbl+
	a/MIuHyPD2fcuBjucE8WuYWTfmUo+t9BmP8+oz6zowWI1Sdhw4cQjcLmeLJXtjta1/PQx1m6qVIcp
	zSy/n5le2QKwpwBhM1bHrhXngiH7rxDf2BRe2lU0tsFymKlvOLZ/bFSb27ZrLNJ88c9o6/FIozs+d
	ZKIn02JAawINamVmBiV3sVRGKsu+7WSRdWDmn8qyPcG+jwMYNGaKgNdW5HdNaxz3BDwyhmbN+Qjjy
	1+Tcsfjid8GDCQHjaWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIB-0000000DxVp-28Fw;
	Fri, 20 Nov 2026 03:28:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFI6-0000000DxUb-0RAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:27:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GL1o3980126
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=FZPNUGlA4M3xtVsu
	6U5V2pQpduxzWBcmrd/SF/dFjPPAh+Q7dg5p651ZF/D5VxsC2SL2P8m9O9UiFOR7
	FjfOsSX4hYSOTUe7U39W3+UL2uvaIIW7ea+gNxSsN6Zn+uud+45vnr7ovskRXu9C
	30efWNdcdbEUZgKSVe52cWEH1fmEOalT1+bKGeBeGP7InY8jLObagfcIHx37v/vx
	qC8bHa9U9DWXZu7GDPMdiG4ca0htAntjULKznDjGGrYXnid5bp3bGUbIxtmbD2pH
	JjAaGABR7fcpXpvZ2BABA+q4cuAgtBy6cb9WqMamQOW8UTEuN71nDM/kznh3TJ2C
	S8pndg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5smss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:27:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so498030a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145276; x=1795750076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=O6nxLVkB2WNHDp3D5GfuYOP3GpygDBEQuQdtfsYLQlh05Zqt+EOQryISfVYg2C+mNN
         26scuWYGa0BPWpI6ArP5IvYTi4zT7ASPdUGQ04kYMoImcWW4a3R7eNZJ025WLFK+inep
         M7vYSLJAUWGmiy3OfIL8X/CP3q7W+1pQsqUXXFZ4dU64j6983A4XmvKaR7Bpj+zGqJfv
         +1aBE5raHIZCC+TcsoncXUZ47KuokcT/GTP/3GfaT+nquq8Tplk70UWysiY3GxiUCmnU
         Np8iHCHCB5rquVcWZlL1sWBiLUkNE192CNhx9dLKQ9lvWjohGvweygRDusHM3MpWz7jv
         G61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145276; x=1795750076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=qQca1Nal4gnyfzlhiN71Ime1p60YXcsu+h+dN24kY1NQcz/1TfLnpL4vjdYX5Aj6qY
         TgpcV1KRXeH61GDIaYIbIByELRAV78K6RA76C+fFYtx9GXcXzGun+6hFJXHO3HJMNIcK
         kNSdG74LOExkyRfaU2C1F6e3lFIU9b14yRHDITBZ9dSxgr8JIG6ZJKTQNSH5U0waz9XD
         cjG3e3Y7wpRVCEgOqFrD6c4QzBeRQ0WAJxvcAkb/G9Tz7IBJbu6bIcyHWv4kDxZwUB3Y
         rSNvz7BMGGhBkidgXPzUU8WDVJinymTzEGIOxobfIzSuKM3BL6bmLA2IjtBZuRrW86Xm
         DZgg==
X-Forwarded-Encrypted: i=1; AL+hErHQ0M+JQ+ocQID5z/WNyDHdYJ7xH+9cOxiaMSpjJHEnDGhF5vy/OkGA+AQqIS/pu/Xsgf3cHnzKQRzMx+j19Rp2@lists.infradead.org
X-Gm-Message-State: APuU4Z/+zzE6VI6th8T7ZfmubN6b1p8Yn40Q5Sa5hvkCAeb96yfm1pL1
	5eaMGN2c5nQInlzGdMCoXbYyXEvtfxUT81KziOfn1b2Qw7dVb1xvFfdr1R5thLZs0PD9HW1jMOa
	nousLAiwtHHOYGSsScr5mab2jso8k4qQlz1Vis+xLf0/fn/IgbjT15AR2nvezu8V0SWeAw4x6rr
	m+QLivV6/oi5LY
X-Gm-Gg: AZFdTZdffHdhDzvxFnLGkv2Qd9IuK5G3p8KAAiAjsfxrn6dd3jxIy1yPncWEPBvlzya
	scvJi9CO+ibxBvBPTW9ESeyAXOB8sFus9LM3mAO7blKHV2qDZ/tNQ7H5cyOIusZfKt361cP0Fa3
	7UOB2+N35T2ABsCWsOhVpAwPbIVAO6m0bEwl0pr/3vHCEC8UFiMiJXP2Z5w18N89cFHKvg+Zo+U
	hEWZf+ax0ML3oKE0nPBs/1+7d0rnx0RSDBF1dF0NOf3r/uHr8D+P393WaxnveFX1LOv7i6LdAdI
	a2clZMDI0wNwWFcadh1XSSIrrRfRNpW7h7xCr9Riql+6keYNeElLZYmu+41CuERyeSW11OVU73+
	2gBLe+odabmziNj6voSD4nZ3RgnfNB/LES20//4JUVU1GYeR1sAGyN5mu2ofLJ+jPx/ymIVYBlK
	OO//BxTCjxzEwlxlqT7mGQlKEZaGMGtXuqet8=
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618879a91.8.1795145275915;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618844a91.8.1795145275396;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:27:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:20 +0800
Subject: [PATCH v24 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-1-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=yMoIrzWOQ50jvHYhBXJ2PfgxB+abUyuYXPJcO3UjEf0TltUydpQjypdtp1E6Rp+a5UAjxmw+3
 ZHCiX/UF8aSCBAxQWF8OWjTpAz1dllCRyrF3zMyXbon5HQ9f5R2d/je
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX0mX0jaKUMnoG
 88wpDtisvvmAFRLyM5KxUpUqCDRJT9AczZMtX2BkiLhQWxW70jp1ZNKQZAaPe7Za5hTbwwgl0Et
 RjYkJcO12LMpqpn3Y1IGzfAeoPGsX+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX0CqY4B1aedGZ
 Wy1cYB/Gektpn/XeqiCejlf7xuL7QFoqBgDNYXXBxrrJ/KeHJ8KizNVb5lWpxyEQbiL4n+SIYVc
 V6w0XS4rXvzGKHAlKYmLOlgeJPKJ3LugonBBUNkSQuwd9GiXgx7kzN6p5mdGJm+OhWfzL5TV/ye
 LTX7V3jOd2+bDrAHaaQK8apPqJVspHdkgu1gCB48UBO7RhG9NrsmLyjXF0TOqO+k/nnmI94bSvq
 f5BTRm4Uhd59wgeCQPxgpKbWop7tOXPcqFCkrAhEveXPzQuqBOWCcfUqz38JqjHwu6r0Wwuib99
 yaNn60sK5hBrADuyjF7YMnLFy7ehbsQEIqr0wCdCWZIHUITOixV+KOW3WsX1d2PHn7TPxTGSJa6
 6czXT6Np6sPptc8vY5dXjk5tZYXWSUgXrrQJz48VUW3SEEoMU/ngqQAHhEWVWjbJ0vmPBNNxCmw
 0/Ip/tj4/P7MGN0Ek+A==
X-Proofpoint-GUID: ek5aL8v3dLKwJI7yIbyIYdAS9Gy-coNY
X-Proofpoint-ORIG-GUID: ek5aL8v3dLKwJI7yIbyIYdAS9Gy-coNY
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6affbe3d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192758_309352_DB1E510F 
X-CRM114-Status: GOOD (  22.67  )
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


