Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AMnt3vt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP6l0n+q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M8TedkSD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=; b=4AMnt3vtxWAtgG
	QBwQ/fExBd3gqE5DpYAdfSLvDKB3gmv9iuVzU+fgtf4DsLJz1+qu6BLP9rNfJeCUk/+lx8n4A1dEe
	Yug8duqVS2DvOzulS2dWRWXkzZ8ICPo4pVDIVg6sfOrZ6v51bX/ySgKWqUExBjq1NWj/1m/3KQq+/
	JXQyOQfPlavTnrCIz+n8BRDQbIK86Y358nx6igpTeNfkRsOE/aOiIvVUlLzAJNWWvlVMhzjL/1dM4
	tr0G07ipmAsUj7rDenxk1cIx7aKp7/NlsnsObjs+Kr1CxZs42hsgdw8fafXj9Ht5YscFLm8N/f9xQ
	yRswMjsYCJ/uFuBqBEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhQ-00000004n4H-2oRQ;
	Tue, 17 Nov 2026 07:33:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhK-00000004n0u-3opC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:33:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aOKu3408351
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VKM0LeDW9uP
	ELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=; b=XP6l0n+qPnFAUX/8vjhKKFOpFQa
	G0irgByzs2/r6qnu0ZqaopZ0ILYol+4OnAhG/QoT/TVJqCZPM5LfaQyE7WDtBsKV
	DMbwKGziNAJh0qnrJYQDwaxrLazaXVCxeD/nR+FXYZHn24FYmQdqgwujBrTq+O8P
	rLya0zgJxz0bVefgo1ONNVdZrzhTiNF4p7m9f3nb+H25F0VkHWXodQjfjwR4p+xM
	ewNHTSlzAMEXxRlYQl3bUimMOsieottnfzwEXTPZajLxbyVxOHSB3Fnlxb3fhuUE
	zkeyO/+t0aS2LA2QZjJhLmJxpOc3IpDqgk0vPxTwQ46vk8FoGGiF8qgLvHQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09hthx42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862c4207de6so2694898a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900825; x=1795505625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=;
        b=M8TedkSDUSmHGNG2v5onkJMy9EnY8kOIBUJUjcsLhsJoBs+Qd29uCX4+WLEblOCLPq
         SGMny02GxO3Z/163rRguffLsqbIJig8HRFsRybUc1Qh+SeByUzQBdfjamqLO2bx1Tup7
         g8yyF2QWqGCMxb8JSbaymknrLfIyCmH6s8CgT3otXtSerosNhzhEw2MzeuO+svspvjHO
         F0FsA/MR6rdkQTYuXesvAZyRNasnKkfWPVFwulXB1o04t6n28HtkKiKnKEiZlu38IAsT
         tYudPvtc97MmWtkiqTQ6VjuPD5LnLMHLTMUc9lZ1ZqItIWRd4jGpL2WwRN82unRh2BML
         h2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900825; x=1795505625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=;
        b=w8wFPJ8/nZqf6QpHjB/ZgTUvuBmVtTjhRBcz9dXjjZpD9RzJbY9d6c5uvwSNx6RerD
         Fbn7+YYhPAvqyojogpepFTwtLbjxmj3Zwlzt1fHXkqW6XaJP+qCblfwsUy5j+j0Pr++x
         ayczVVesHJINgPq0b+boQWeFUypwNMHHheVK4LfgfnlO8MEgOqMKC9PrSndn6HJx/2ai
         mLVUFBnAvjXStVGemcbagBTxzd5DVC6jOedroQNJlIIDxivGJXCMGf+X8U56dhRs+lp2
         S7x1lR1pTrr8uYI8inW2EVuYnKPRcVwCVUHH2a6eHvb7qS88YlUVvJQpxy0DCI0dn7nR
         M4HQ==
X-Forwarded-Encrypted: i=1; AL+hErGu/arZLx/ucRtJvtgAlZygFj4OQv76Gpm49odlsAPfb4JZdB9my9b361Nh8taUU2ze7mZj67VSkI2XPyH0Q3tM@lists.infradead.org
X-Gm-Message-State: APuU4Z97Nv0D7k35blDa24RTatGNfvF9ClIBN0Ov7bpE66+iS+eAgDHT
	3qD3tEqqxszCv2n4SeytBkIb8gZcbsSAyY1YqiRJ6KsbVuYLdjTQ/6cHWKfdjiVsVyEXrqg9FFt
	WwzspTEvhmAjF6RdX2gu4NZ74mrzXVCvoTwCEJU9DwHEWr/CP2nih/C0a87bAupMRNyjA7Y55+I
	I7Cw==
X-Gm-Gg: AYBFou1zSmoYh1RrZrfx6bQ2cCesI7Ds+YzxMBGLlQ1Tg3pmIUjKUui5I1ygu3IzGad
	DzQ8lXDvzQXQIjj1UfDv6a1s788DpfztAOZlnTroZaFtgIH/7wXgCAGUW2R9i/A0YcQBb4LRAK6
	MjdD2yPWY1UzR7sTAcYa8iJ1UdXLXJZQDW/4+hA37exKEyp6H7FfpfPY110k3TGHSaW7NHvFLiz
	tQjPGhTNZ+vYVeidMzip1Z0tKHd0gA1iLSCaK0cTtvUQ7g4UKPScsvE2/GG1+QEBQIs+4liqhlS
	PWLVMl7R1bUbj38jySyqGcXqPG77AGaF13APMOKGeZgMJTZ1f5blKAs/JtoSnMAvdV50JS3L51E
	grjwvn8YcRUv56U8te2lY41lh2H0LtB7zjH+Txe7RqjtJWKirWXeINqgqPnB85QJPMr9lcVhtGO
	EnH0r3d0ilJdoPdsM/yJI9151CdF0p7Pdong==
X-Received: by 2002:a05:6830:3e05:b0:862:b4c2:d173 with SMTP id 46e09a7af769-862b4c2dd3fmr8067846a34.31.1794900825085;
        Mon, 16 Nov 2026 23:33:45 -0800 (PST)
X-Received: by 2002:a05:6830:3e05:b0:862:b4c2:d173 with SMTP id 46e09a7af769-862b4c2dd3fmr8067827a34.31.1794900824580;
        Mon, 16 Nov 2026 23:33:44 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:44 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v19 5/8] qcom-tgu: Add TGU decode support
Date: Tue, 17 Nov 2026 15:33:02 +0800
Message-Id: <20261117073305.3854951-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX+csWqzGz6KiW
 hpr/voufz/XDa6Cw3XH2dMO3nroqrmCzjIgrn47k/kTnyDtyZ48aBMpmY5QT2ilCYgzQ5fAmymb
 RCLylkZQ9XDc01MOzgrJaqXClaNHZrc=
X-Proofpoint-ORIG-GUID: d6YY-RDPLDiYUyxqwj_12D3CD8_fcLaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXzeQE53q8IZoe
 R0Wdf5ZhGLk1S8KldwWFBJKCEmhWsj3HRHn3EJ3HHtX7C9tXgneYmuYk7WziNyuFjhMKDtbJ1at
 dc/k30uJ6/YNU3a7sbR8gT9dwfjFAGcRDo9IkOWC4Y0F75HmUcT13IrtD7vaHqsV3LqwYSlP474
 qB4Q6XC3YHBOlrjREbYgjoMvbAAulxIfLt3SzfKxoc8hgZcxOEgS8LHXS/9VMxtmCWWw4AK8bTW
 9FzIITnR2c66mnIDyqNNNS6VdRi2xrBJhisuAhO4lO7xFaP29gZz7WRm9q8GmPgPDX6M3n6EKuG
 lU9/MzIWP9eyFGKk/IMV3a3R1AJx0SR95mj0t1nBJfrwSWGLkgKP9eANSRATe+yZ7VnDL2BxXVN
 WKIDq0YiL2HYvgTYmT/L0PYMIOwcFSXkki4FWrcgr7ucuyP1JthGnGtmi0DAFwjZcbEr+gulYdL
 g0cjYApOg272MULJiMg==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc035a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YABCWhCaaoNg3nrmXDQA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: d6YY-RDPLDiYUyxqwj_12D3CD8_fcLaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233346_972358_242337FD 
X-CRM114-Status: GOOD (  23.09  )
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

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 191 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  39 +++-
 3 files changed, 211 insertions(+), 26 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 3be0b912c937..c7e6f13da83d 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c876b98e43e2..5562b3d83ff9 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,8 @@
 
 struct tgu_attribute {
 	struct device_attribute attr;
+	enum operation_index operation_index;
 	u8 step_index;
-	u8 priority;
 	u8 reg_num;
 };
 
@@ -27,11 +27,26 @@ struct tgu_attribute {
  * drvdata->priority is a flat [priority][step][reg] array.
  */
 static int calculate_array_location(struct tgu_drvdata *drvdata,
-				    int step_index, int priority,
+				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return priority * (drvdata->num_step) * (drvdata->num_prio_regs) +
-		step_index * (drvdata->num_prio_regs) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_prio_regs) +
+			step_index * (drvdata->num_prio_regs) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	dev_err(drvdata->dev, "calculate array location - Fail\n");
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -43,8 +58,10 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	int index;
 
 	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
-					 tgu_attr->reg_num);
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
 
 	/*
 	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
@@ -53,7 +70,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	 */
 	guard(mutex)(&drvdata->lock);
 
-	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -73,12 +103,30 @@ static ssize_t tgu_dataset_store(struct device *dev,
 
 	guard(mutex)(&tgu_drvdata->lock);
 	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
+					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -95,15 +143,32 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_prio_regs)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (!drvdata->num_prio_regs)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_prio_regs)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (!drvdata->num_condition_decode)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
-	int i, j, k, index;
+	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
 	for (i = 0; i < drvdata->num_step; i++) {
@@ -111,6 +176,8 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			for (k = 0; k < drvdata->num_prio_regs; k++) {
 				index = calculate_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->priority[index],
 					drvdata->base +
@@ -118,14 +185,28 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = calculate_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_prio_regs, num_step;
+	int num_sense_input, num_prio_regs, num_step, num_condition_decode;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -153,12 +234,28 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_step = TGU_MAX_STEPS;
 	}
 	drvdata->num_step = num_step;
+
+	num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+
+	if (num_condition_decode > TGU_MAX_CONDITION_DECODE) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition decode regs, clamping to %d\n",
+			num_condition_decode, TGU_MAX_CONDITION_DECODE);
+		num_condition_decode = TGU_MAX_CONDITION_DECODE;
+	}
+	drvdata->num_condition_decode = num_condition_decode;
 }
 
-static void tgu_enable(struct tgu_drvdata *drvdata)
+static int tgu_enable(struct tgu_drvdata *drvdata)
 {
-	tgu_write_all_hw_regs(drvdata);
+	int ret;
+
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (ret)
+		return ret;
+
 	drvdata->enabled = true;
+	return 0;
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -212,7 +309,11 @@ static ssize_t tgu_enable_store(struct device *dev,
 		if (ret)
 			return ret;
 
-		tgu_enable(drvdata);
+		ret = tgu_enable(drvdata);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
 	} else {
 		if (!drvdata->enabled)
 			return -EINVAL;
@@ -234,12 +335,13 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
-#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
-	(&((struct tgu_attribute[]){ {                                   \
-		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
-		step_index,                                              \
-		priority,                                                \
-		reg_num,                                                 \
+#define tgu_dataset_rw(name, step_idx, operation, reg_idx)                   \
+	(&((struct tgu_attribute[]){ {                                      \
+		.attr = __ATTR(name, 0644, tgu_dataset_show,                \
+				tgu_dataset_store),                         \
+		.operation_index = operation,                               \
+		.step_index = step_idx,                                    \
+		.reg_num = reg_idx,                                         \
 	} })[0].attr.attr)
 
 #define STEP_PRIORITY(step_index, reg_num, priority)              \
@@ -280,6 +382,24 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
+#define STEP_DECODE_LIST(step_index) \
+	{STEP_DECODE(step_index, 0), \
+	 STEP_DECODE(step_index, 1), \
+	 STEP_DECODE(step_index, 2), \
+	 STEP_DECODE(step_index, 3), \
+	 NULL                        \
+	}
+
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -314,6 +434,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -321,6 +449,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	int i, j, index;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -340,6 +469,18 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_dev_caps(drvdata);
 
+	/* Initialize all condition decode registers to NOT */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = calculate_array_location(drvdata, i,
+							  TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				return index;
+
+			drvdata->condition_decode[index] = TGU_CONDITION_DECODE_NOT;
+		}
+	}
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 4a443475c156..1dd99db09f39 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,7 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
-
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -51,6 +52,8 @@
 #define PRIORITY0_BASE		0x0034
 #define PRIORITY_SIZE		0x0060
 
+#define CONDITION_DECODE_BASE	0x0010
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -63,6 +66,7 @@
  *
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -70,6 +74,7 @@
 
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
+#define TGU_MAX_CONDITION_DECODE       4
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -77,10 +82,37 @@
 #define TGU_MAX_PRIORITY_REG_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_PRIORITY * TGU_MAX_PRIORITY_REGS)
 
+#define TGU_MAX_CONDITION_DECODE_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE)
+
+/*
+ * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
+ * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
+ * condition decode registers instead.
+ */
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
+};
+
 /* Calculate compare step addresses */
 #define PRIORITY_REG_OFFSET(step, priority, reg) \
 	(STEP_OFFSET(step) + PRIORITY_OFFSET(priority) + REG_SIZE * (reg))
 
+#define CONDITION_DECODE_OFFSET(step, decode) \
+	(STEP_OFFSET(step) + CONDITION_DECODE_BASE + REG_SIZE * (decode))
+
+/*
+ * Neutral ('NOT') value for the condition decode registers. This is the
+ * driver's default so that, before userspace programs a real decode, an
+ * enabled step does not spuriously match. Used both when seeding the shadow
+ * table at probe and when clearing it via reset_tgu.
+ */
+#define TGU_CONDITION_DECODE_NOT 0x1000000
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -90,8 +122,11 @@
  * @enabled: Flag indicating whether the TGU device is enabled
  * @priority: Per-step, per-priority-level, per-register values staged by
  *            sysfs writes and flushed to hardware by tgu_enable()
+ * @condition_decode: Per-step, per-register decode values staged by sysfs
+ *                     writes and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -103,8 +138,10 @@ struct tgu_drvdata {
 	struct mutex lock;
 	bool enabled;
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
+	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
 	int num_prio_regs;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1


