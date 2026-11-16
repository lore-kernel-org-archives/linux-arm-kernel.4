Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZUWDMjIJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mCfh9+oO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJSyCS6Z;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d4YSXE8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=; b=ZUWDMjIJejhCmn
	PJiSG77bZHFrS3Jh0xdQhPodYdinJXEWTw0eahkn/Cz+b/Yzl4bfvI3tCa3w4n6CYHrJ1Hi2TSk4X
	uRLvWk8AUAjfXY86Kxapi+rAgsjqOhm+dL0xwZtJ4+u5GoBFfmdjY3Ext6ThtUdaPONpdeeLeBh14
	F6H7h5RyPN97i0BEfG5o69ZLGJB44oLHsqo1KSvi6F0xpJRZODsUYV9KLj/ghWyV5EWs/kWb91z04
	e/8r6eT6bqZ0fAecNv56yR84gRdImNRAd9JQCCEbg2hdfzUTx00R8QHH9+7Sok3I05n0SQFPNpvHo
	9kXzwGDnZOUn9MvdpLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrMB-00000001S3B-1vfm;
	Mon, 16 Nov 2026 07:42:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrM4-00000001Rx6-2Sb1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 07:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=; b=mCfh9+oOWb+FH0nnPeN9oTkbnG
	Voxp2M+VwsdkapnTrEW1e1EoM8wbbDCWeKenc0U6B8+kRF7iAhQve0p7MF0hfma0OGZW5vvF9eLJe
	Ar37J0T7wEvRS79lfsanlKgyd+jdz+fSnwjCrlbdF+IZAbxKD8tjiweWPDjft/ePzOwrfEbSMwkOK
	TkibXTAUIq6547Z86C0dWrbIBcP9XCYTmQd9o/p6Iq2NiFgrSSumwxW6YfsPs//OHPZN6Uas5H/yP
	9z0zre9nRcukUSzNQu2luj9veP7dRkBVxDdBUMGDRQGonPE/X9r2sNeT/OjRQnqhx2xarLU3qwUfk
	521gWwiQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLy-0000000DT79-1LL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:42:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7eoRJ1894911
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eWCyBzOYdSt
	cG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=; b=OJSyCS6ZIk1LAcZ6YXwzEbiOnWV
	lWgAZwllEtsVjacTfHpBO0ER+CA0GH1Srxg1uCy/QkKsBPtiVU5dhw/CofqigE0m
	KZ4N/Y5NrAUeh5whhZiU80cWr4jJgmZZ3aNVZwAZd4mpYUCAaFbg+bGRsajV8sSG
	T20+TWL51dWMcpgC+KvRRRaCsVyB6VIczZXeYgkiLa0hQjixKKKIX+ddt4ETB2FV
	DeHkZ+4nKzkZMIlPL70Po/I3VnhBQpBu09rVNmtP3elkAyTGhJMj+v1Yawm3RPuZ
	6kW2c4IZi5kJQrqRBiprWAtHwHzdMxEFO4E0Iid0JZOgDgljqoVcIqPWS0A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdwb0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:42:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so8607904eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814932; x=1795419732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=d4YSXE8wnDBVWR2u614uxjg8MK7YSp4fBmFmZCdF+I1k7JPyAEh/fS5/AlIy80h0Bi
         TNuqdDUYB5JeM79kmII1q10nxmy0EiieABK46qiMhsdtPPiYoHvFhtTovFc9J3/mgK0n
         fhombI/y3SJ26PobArCZ+KCe6A13FXdnnOWAdlHFuStd9BIlXbc5FXYEowBFG2hQqSAu
         2TxxUy0Ow47TfK+bcMfJ8zbm5DWKWoKGGoSj7hGYq75zzwoNBjIkSaB4JWpS7HLb/yGr
         t1YzWFxkWDRN/1EHC7pgFZtgAy/yJYiUSNAY2t2QE0P+1iiGlR8iaYK5VuTZq2Fc4fBS
         P55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814932; x=1795419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=RgUpi6smyNgNxtNkVTh7Ny6r3gNn++BXQtqH+/6jVYV1s0xWxmB4RT36wWD+VkpYHt
         bfv4KKJe+dgWTugOVMkmrvXTINa2gh+gV0TlQWzHnYVsgvkZh6CXz9YYcsur7VOK8vNT
         e3ju1S9uPuMC1Xop7aDrmL5V5vHeNNeCUbMXRm8FkglSUka0FvuXzM1VgMHQT59gOC6w
         bEfVLbKKWQ4ax9AKWkwg3huhcZ2s9+vkiEq0HLgRR1OmZZ/GDkC2u12+6U5rES+5YWAt
         WQM5y1diYAJ6XsHfZDb0c7WNNXwaAqj+G/H0TOr6rUyI9UYMEN8wWqp+sUSJP+KY0eqs
         oPGg==
X-Forwarded-Encrypted: i=1; AL+hErEqS7bY23mq+bt0XZ1JQZqKnGuq2KXKQav4ksjHVlzWK45LJdemOaIYAZU0P0hDWdRtw1mO5/MgrfkYSUVrDrgF@lists.infradead.org
X-Gm-Message-State: APuU4Z9+2Ew76ggEmh71c0Og6DXm8sXNOgd3OFy0H9jxEh1VECA9kZWo
	GlyH2ieHKR5QqctcCgepWB6ZIyOjaCIMqBcDkMe5xoiRO3v4LbDDV6oZ44wMkePI5/Xr0t+nVRY
	N60QfhWFHjWPxGGjl56Ntc6W0LfZJsF8dX3WRX6YSN5f5DFaZYKMZHn24/Hl+hr9HZ2roUpkiYf
	lYeA==
X-Gm-Gg: AYBFou1Zgg6S1Um42SO2flDOL5V/WZAXkTNxH3G6jG3eenPMSoJjR9Yfy1EoxKYJRAr
	zQCn8IEVzvZ1XKiB9qIPK5NOA6eQyPLqS3kmAvHv7xNb9AO2cr8ZQLZJo36MxJiQx6Uc0FVYjTp
	4KRSmCztKdjd93C4REUExTSkZl3KVBvFRgacMIWWkZB/63+6xI9p1D+IVdYxt6vT1BzFHlj7nvN
	5a7j8o6Z0yU6b1TNWOK4afXqRzCK3a+HFmaH+eDfZrfedN8zHvMCN2BGDoCNP/2tBfSrmFoSDQC
	9juX4UdcZOe6WZDl/qbR+Dkh5mugadX7OntoQcKj5yRRwZcUBJNYwdw9MgjvxDoVXhSQAbd1KrJ
	PaTOCgKu/gCGfwiDlvgscgLZtJKNjMVKA4CB1BxmyuWRlZ8VocCmI2YLLF3wzh1HgTDhBSaA36l
	lbTrg4Cv3mygXBx7JJ/DQXoDKBEnlCXqUjig==
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689150eec.10.1794814931376;
        Sun, 15 Nov 2026 23:42:11 -0800 (PST)
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689124eec.10.1794814930711;
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
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
Subject: [PATCH v18 8/8] qcom-tgu: Add reset node to initialize
Date: Mon, 16 Nov 2026 15:41:18 +0800
Message-Id: <20261116074118.822731-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afab3d4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXyWi2JmhOdySP
 1hrX0W5U6W05+ia0M55o4qMqm/uSwliXosOWmjTzzzKfBBIX9TGZvQibc6vN8ZMg5mZsi9Gyc2s
 1m5R3I5mj0rHE3mLhxYk0/I+MQNB5zg=
X-Proofpoint-ORIG-GUID: 0xf9Iap2aVulIgvTgF_2YW5CyoimZrP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX3JgS5pw56rZv
 IML/9nPWrpm6FXij0gtiCkqmJPKTd6BSxCS+8Kc5WNcDTUXRNP39FeClynw8MNNUL36078I9YwN
 FuZkOhteociJmyzndxL+XteY7DaUiLh6i/BJVQ1EVUqFrEdRLqP8ZdFnNLDy2Kmspp7b/hGcoLK
 xAj4CQILkoJNKSjslwUlt1xpfjNvClqrBVkfR40lIaOK8WohAIJdeAJP6c0kgEEqqdfgkxrmmSG
 oLgIg8UI8ayjJ4H5CoJC4xlVJEx025joYnjp4jPMLJeZxBRlUH5jxd3Q3LDc5g8jUegkPIHoOOb
 wssyyxtJl6/z+TRTS0H0+LjoT+DkyI/Jdgc3yGs/MsrRavotnqlC0GjvS41mmFfRldB8Zcz9xrQ
 +oRbbsA2undBdriVTmPtxFlHs4dACEFQsjKgzN6KS0u+6HTMTUcPYAPmfzh8VGRipi9595Mk01P
 tHy6FFA+icEXuG0tNCg==
X-Proofpoint-GUID: 0xf9Iap2aVulIgvTgF_2YW5CyoimZrP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_074215_225145_150B4EB3 
X-CRM114-Status: GOOD (  24.42  )
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

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 85 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 71187071cbc8..b3a2fb9cba6e 100644
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
index aa7eaed0e738..6f76d4f83cc3 100644
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
@@ -470,8 +482,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
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
 	&dev_attr_enable.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


