Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78099606A888
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZFM1iY8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X3CLyaDf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxEN/dwv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=; b=GZFM1iY8eY78Ti
	CXYvK84Qn+g2J7fI8ytu4B+tRYehUlbLqMftu+/06mTXTF/nWepQMkuAH9+h3fGHg+5bkbEpt46lw
	5E9AE3OSpPIvQqX14yQGZJ7udyUxc0eky5EbHQL5wZBFhDEZcJjg2nzn9GuzfxhhvJBnlnF5noncJ
	Q+HBMkWMfnfsZDb5plw2zf3lc37zbAy1u4ru4+YIv6ey/F4Tiax8We2DKSQ0Gop91Oy9bpvCPQX13
	VqsACXAMswo++JZA0cOp5e62lZRa0L8yb1+VSA+N3UkanxqR1bTmVHLefSySB8lVQpqzkD3URFVm+
	qrWT6MngZtTWeKzLRJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOi-0000000BWg8-2ZPq;
	Fri, 13 Nov 2026 02:52:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOg-0000000BWf7-1GGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:52:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K1s64120215
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MU2+tmmCPa2
	6DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=; b=X3CLyaDfMtzkIwaFplQPGeVstFM
	Q5gGWmDtDwy4Cnz6EMbicmdiQepEeWHMsWJysf7SHQYnBKRvWOpeWtzEDFteIZYz
	0ZKV6ydaJs0ZIUkWVIDzifSy0WqpDhzEAulPCl5lrwPuaed22dnjzXoIcY7djyuf
	nzoSqCtTICnf6yTPeACHG5r/mLVl1xzeqR1yptt6ZiQ55CQrJE9dAlGvoahS8IV+
	/6P7M3qmO85Q3a8a6+CLW4u0QFx9NYoeFS1IpuMnR8iEnXo1B3Yrs6lZ6RlldRRy
	V106EwLq3ZYOFF+iKB/14+Uei7wFn6y4268s5vRLFt5NfX2grqbQ/ewrlRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so3089475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538333; x=1795143133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=;
        b=MxEN/dwvRcTogaPqWJw16FG1D4/mJ2wnhS7NFoiZu1g5SSFb1Fcn0ZBn0D6tNK53uC
         XoSn/opLKLzXdmhe7eH23fPTFRd5Jft4ZaDl1b2mU+9nMSWbBnxYoyxMH5wUEmL/28j3
         Y/mcE4oAsKZOEwNeggdqP9gpUpUSl7tl7Cb05OLP2dfwcFrrxOUbEcJPNlihIyvglkNo
         yb3MJGv3gNShAyAsoLf2G24ZGpvD3os6OhmpiF5INIWbLxaCzz54BAk6CAsTujxFYON8
         qsoB9xInsw0fc2wgUIzF4xevNLwRu3BlF3CqAlfZQX1DEeOweanVtqUa3q2c9BRXzuON
         jVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538333; x=1795143133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=;
        b=ZYfCoY+Uu+CdDjj7VmCDxumed1L8CBBdEU47dqBeC6WvaFA7HXdtpgYR1XqJ4GqoLe
         S1GGhEzFFEX7KqBBokDYcX7bGUwkqV4f3v/1YBcguMC6qw92TOh6rmGlyCYzmxWx/Yy1
         sDBvyP+4nZHk+QfP52/VeKbCvATaCTXMF+Dmaf7dw7zGlapoxTmZL0C6GSym9n4gy74P
         r0cgnYeFH6X3MmsfmsiozkpJP2dnvVNnuqwrSCrM22e+v43TrfCDHMG3nvdoMWFdh45C
         XkjL3UTVH1jDDddpyU9qOGRA1w0WUHkrLB4Q3HLf7wIRIJbbNtRsE+3/TEA1bvw20W0g
         DXkg==
X-Forwarded-Encrypted: i=1; AL+hErFQUdTBzhoyXcnrFusddQHqedOGERiZMStfmsvNK6slx2e7tXeQkNQue43AHac27ZhZIK4nLYLLT2vsv0ktePPk@lists.infradead.org
X-Gm-Message-State: APuU4Z9RlTpWV7E4k9e+02Tjkza+ALF1Hmt0yv5nn2Ho3nw93Vrc1T8l
	mrEdkS2xGO3v6y0Flrh11b13ZoN2haBYD16YouMmQbgI7OB81Dn0e/bdiVHdZXdwL56avqaRCLR
	bYtbcgUfNHYO1a3qLpEwYX78mZk864K5bnhBT5WC2TUpqUgqCe3wrgZZuH5r25N97xNRu9iwdAX
	qB9w==
X-Gm-Gg: AYBFou3n/mgpeSwFysahYY0wZogi0u3+a/d3LnmPlSfVpcckDeY4oC+Ykk1GsrAbs+U
	HbLI/O2TUXXDZl2w4ssJ24A6/y9Xs39nCYUuuHNhKr6hXvr6D2hwgg9gYv7adqqzcd0AX+YmF1V
	g10DHwFsHqrQKM/ztDff4p2Sz4mczRYbKVIsxLO6FAhLZUWzww+XJu6jF72ZinXh+IbLBLLCvzh
	ieJSoxFGNpsc7yqizmwionjmsrAuNNtrjL+A8MS8SFrrLu3M+Vi8tNP0Iqutqdg8QFiltOfLqqm
	Cbm/nmbK9de6NI6+1b/laHHD3ZNwwqb4UUOFZf2t2rLm4pUu54WhYN3bz5r1Eo0bGq3KDVa8nYv
	2Ll4W2DA80uLHbG584v5asZMnSqBHmE4MN/cYx/ltfb/y3TCEBw42CDTxJHrCcyABlBJecWXIpb
	oTp1SAq/k=
X-Received: by 2002:a17:902:c94e:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ee0dad0617mr11244205ad.27.1794538333017;
        Thu, 12 Nov 2026 18:52:13 -0800 (PST)
X-Received: by 2002:a17:902:c94e:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ee0dad0617mr11244075ad.27.1794538332498;
        Thu, 12 Nov 2026 18:52:12 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:12 -0800 (PST)
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
Subject: [PATCH v17 10/10] qcom-tgu: Add reset node to initialize
Date: Fri, 13 Nov 2026 10:49:35 +0800
Message-Id: <20261113024935.3173715-11-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67b5d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4TBQH73t01Gs
 /Vhd3658wBZHnSgNbyc6Y4e7jM+z5ggQfLQqYqoFPN2mqMEZY9VAVyPTknvrd0nxJILilYXn/cS
 c5Ii1BMUOD30xCOryLxslOefKNX9Yh54x04zkvizvcIU0dJECq1otC2pO7PtuOa7studdHW5lSx
 ixJ88a94tlFL9lvFp+EkT3LlbYzkwl8mYdSfazpY+z1K7LZia+T/5rVe4FTlgx6v1dPmEOSsP2t
 WsmI6KMZe1WzswgUfXXcrw5d7Zk96t/cDBYFPBgO2iOLaHfnep+a/5mQmt3ZKDfs0d0lZfK7Lwh
 xaljPZAu+EQ4a5NRwsZlHKhohs85TDto7ZemF8Vvid2k7y0y36hgEX/5A3e2LrUNN2xVlaFdBb2
 Eirl53Dfm1PnXRyj2gDnwgdtcZhq4jOazDb29r9w4JoKb+78R0PP1LtWDE3LViADguhRUMy2bHk
 Ptd0z44LEB3Bj4rgXUw==
X-Proofpoint-ORIG-GUID: wcmRvjoCH75W7r8rPs7-L43bQdOs71Kw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX8SwYvRYYVF+r
 tsn8brlV7uiYRulpdu0Bc2lLWcl16UVw1zg6w/h9NAyapoCA7yQ6OI9W5Wiwrr/xkT8/tFykq8b
 hpMGPwZNlKIyPxfYCddW7CI72dQPlV8=
X-Proofpoint-GUID: wcmRvjoCH75W7r8rPs7-L43bQdOs71Kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185214_351289_3CB00476 
X-CRM114-Status: GOOD (  23.85  )
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

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 85 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index e0ea5419188e..c0f10678e4df 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -51,3 +51,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 1cb131a3c521..2386c71ab8d1 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -251,6 +251,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
+
+	/*
+	 * Quiesce the detection engine before mutating any comparison input.
+	 * This function is also reached from reset_tgu_store() while the TGU is
+	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
+	 * timer/counter registers register-by-register on a live engine could
+	 * feed a transient, half-updated match into CTI/interrupt consumers.
+	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
+	 * program-then-enable ordering for every caller.
+	 */
+	writel(0, drvdata->base + TGU_CONTROL);
+
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
@@ -470,8 +482,81 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_reg)
+#define TGU_CONDITION_DECODE_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_decode)
+#define TGU_CONDITION_SELECT_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_select)
+#define TGU_TIMER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_timer)
+#define TGU_COUNTER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_counter)
+
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long value;
+	int i, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole sequence so it cannot race with
+	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
+	 * hardware access stay consistent. No PM reference is taken or dropped
+	 * here - the shadow tables are plain memory, and the hardware is only
+	 * touched when the device is already resumed via the enable reference.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	memset(drvdata->priority, 0,
+	       TGU_PRIORITY_COUNT(drvdata) * sizeof(*drvdata->priority));
+
+	/*
+	 * Every decode register is about to be overwritten with the neutral
+	 * 'NOT' value below, so there is nothing for a prior memset to zero;
+	 * calculate_array_location()'s step/reg indices for TGU_CONDITION_DECODE
+	 * densely cover the whole 0..TGU_CONDITION_DECODE_COUNT(drvdata)-1 range
+	 * with no gaps, so a flat loop over that range reaches every decode
+	 * register.
+	 */
+	for (i = 0; i < TGU_CONDITION_DECODE_COUNT(drvdata); i++)
+		drvdata->condition_decode[i] = TGU_CONDITION_DECODE_NOT;
+
+	memset(drvdata->condition_select, 0,
+	       TGU_CONDITION_SELECT_COUNT(drvdata) *
+		       sizeof(*drvdata->condition_select));
+
+	memset(drvdata->timer, 0,
+	       TGU_TIMER_COUNT(drvdata) * sizeof(*drvdata->timer));
+
+	memset(drvdata->counter, 0,
+	       TGU_COUNTER_COUNT(drvdata) * sizeof(*drvdata->counter));
+
+	/* If the TGU is running, apply the cleared configuration immediately. */
+	if (drvdata->enabled) {
+		ret = tgu_write_all_hw_regs(drvdata);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


