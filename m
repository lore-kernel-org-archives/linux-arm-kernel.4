Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159360A260C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMhiesbw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGf7umLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhYcqCFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=lMhiesbwFn9yAj
	bv3nSpKkoXr1qSVKUoqTYNuClQUeSPHx6KAS+B+WzQ9azkvSdiobrVRRMsFhcOcEQS+AnzLrtlTK1
	feZUoQ99m9ANjcyanQ6OfTIw6bh9xtCQrx7XCsFyxrBgaKEXeKuIeMstlVfSnIDoSXp+BVWXNmuhm
	QkPPuSJM4myFRxO10fwVcgzJ8u6N2pwMCo4Mg3tzo1BVgKW60QZJaG01VOVGa5/yv9XHpRyTYsgxP
	mzJsynFycCSoM5fMWuQlX9Qb/AveCSz8PJ1i/TMV/4ih5XdcHepunEmNwmAlgwkERGuVvxU1Kh5V+
	QpFdmTgz+UvOQ8tPNVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRT-00000002Grw-0X15;
	Tue, 10 Nov 2026 03:22:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRQ-00000002Gqe-3g3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:22:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jVtB1514410
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=BGf7umLfDX1gvYY8
	4UikIzfngNvIaEW4IscmvZDYto+0cq75SSqp6rvnM6GWEJKQmtyX5L1xtKBRL+hB
	Xs2ZFol9WLGrdG9XZYS78ZhQT940fqlcjQW5sbArITyOWEABL+j7s/GT+R5Axkmp
	Nr96sjF72Dg6aTgKR3V07ujW7Q7zTZy63/9IxsWtfpbpcoSNiqGePLlHmnPsWKFc
	pm4TuuaN6kUv7XG/oRoIRLAV1wVVsIWZUIHLe9YXPVSPVUhYIcBgVT4AFgkTbFY1
	I+U7RIIMKuF4MGTNbyaL0RxMNweaG98vqkrxkcaONsOGUZgJNySeV/+2vfw924oc
	QYR05Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkbay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1008519a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280955; x=1794885755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=IhYcqCFRSuqRcv2W1Q0wNZnnDeScybZwOjgiPWpseVAZhPk7CSQo0D2t4e1qJHRBvi
         xl7EOWdiDiKm/ieqzg1RNoE02IrhM1ru1mZJLxNtqo1i3femnTQXr2rpPSAmnJz6k0iX
         P6rxC1fDoki579OMUdkKPoh0YRF9e6B1o0GRNeiQJN6GJl8gZw000z1aPvbDWZ1Sy4/K
         /VM+MlsJtQ7/xjx79JxFDYH0sz+u/tUU08bAZ2onK88Hwl3i3A60lk3+FeI1pgS4vNzL
         no37jTgWAyWK0/kx7cPI/HRsRBdOi+UGGAQjRWzviXBF901hRAYTUKRFjqHakxY0SvGB
         m0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280955; x=1794885755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=xQaWUQd4GaMn/R6uyXfUt5dzWDFJE3Dvl0da/rABYPJFwieJwiutmkG9EZzI0dhI5j
         ed8o/Zt2faBAV+MG1dM0beJDfiQsrwbAABfYrr4doxweFgPvzt53J2uaIYQURf+w7gOx
         FPnFzbtmWumV823xu+WUOAW/r957eHN2nhGA7k4siquJOfYpiswGqHVpq6UNk0OMwDv7
         wD53QgEHl9iJ74TK86mQeEahOTWcWmLvf/zFyTR9QaVB1r3QAUMoFkW/5jrr6MK2Aa/U
         TzWIHxYnrc1P5C/N4onwHGWEp4UydiSyHTKwECSYaKWU3dkdn+Zxqgx907K+CAGz1Szd
         ai0A==
X-Forwarded-Encrypted: i=1; AL+hErHmC6746Xiki/UwOD2E7apcIV3pSEWG9iGzWY7FMaS28OiwnrLrCzHiTOp+ocDqGUl5ls3o/0ytHf1yKTJOffrt@lists.infradead.org
X-Gm-Message-State: APuU4Z8GJFHy7pULyhX8Y/mL/N114su4qNGuOtPb7HdChQfY6t069FFJ
	3nKsNHMTefoFlXb6gQaPZTq+qJfkhQ3nEpKKCYzrtU6i2D5c+BLgbpxxCIFosM1ofgmEsJ9dFs3
	Hv5FXkmSA/eSldOlMQ4CKqMgu7ag9f1wXRhh2GMzcFSVv1qir6MqC9ZQv+Vj2RLzfb0bqz6+3mJ
	nXMQ==
X-Gm-Gg: AYBFou1SEpvo9EiopdJMzywzh0HnOtYf7Y0JJaueWqvGkHuuXC/H+5V+uHI3hgG5e+m
	EiZ9KDfHpfxQxLxUSsFNtf3sGQKIotUhZiQF5Hgwv6wK0cIqRtzY/HQUVQxEWH2A5gtgiPxraLY
	tJ0FBrr6BcbpQYaGof+EViF7rUKTiYtxr2eLFHR96U5mosJvQKZqbSrgZYP7UBa4UZfwRRBztXe
	YHT7/nOdCFgRO3teYiE+8HB3a4MpOWvMu0r7MBIUqfxATsnAKqGngwmRqDAcaKVfi3O9YaaHqXY
	Sjr+8VgqrSw61f3EC0yee7voUkFl1kgegOBEasienmHKctyZFQlNg79Ck7JgawEflEocit8u9VT
	F63FDAruuVyhURdMwSoF7Ck4tjyYsOoP/pV3YjKuxRftZUNWfFbQztR4usfwdS4fhKpiE5a2nie
	bVihh2Hc//l3L73Rd3p39f2P0WUAmMZuoqF6Za
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr1678928a91.3.1794280954726;
        Mon, 09 Nov 2026 19:22:34 -0800 (PST)
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr1678896a91.3.1794280954213;
        Mon, 09 Nov 2026 19:22:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:25 +0800
Subject: [PATCH v22 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-3-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=4507;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PnAggtb/hoPMxGkHLkimiPJx33tOJTrsVEFsbWRzHrM=;
 b=JIb7FK1pdxcETJyjYy9JDzKhg+bVjOk0IPKk9PdAH6GPa86JV8TL9t6s8wFBQEYFTKW15ILCg
 EwDaYsCPCo0Cdm+Fj5leDHj10x9k8YPvtH6blD0Xp6jJ8VePXwDRXUQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX+KUjY4RiooAT
 ZEfOKfDokgH8veGRQl0Mmtzr2zbLRqHeUc5f7tFkHBseRrChWQIRIv3467JkE6jdyhWVbpDXpU1
 vLIOsCFJNJcBIgH2sap5e+Ips3sx2Vs=
X-Proofpoint-GUID: Eta-jmFNY_QL36ZG4kzC8bQ0qhmyIS31
X-Proofpoint-ORIG-GUID: Eta-jmFNY_QL36ZG4kzC8bQ0qhmyIS31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX122SUo0fSSx0
 ltCirdyLOrtiVDE5Himh05WIeF29w8myvTCJ00953N4ZX2U44iJXt+yk+js3fEwitF9yqUiiwzN
 qgO58O0Sidrf7gQoVtooPX9Vfikl3RoZQ436P2DAlE1L2xfZ4q+yJt31d5HDDdMdl7ZyaQj/bxu
 sj+h8CnqUJQtXj3nQMh4Hb6HuL2Y0TRSqy7KR52hyBqIAUugYXJ+KBMN08RDTwXbnDqvohqIVk/
 5yWNn57YdjPIV8nvrG2V7h9U/ilxcroFEsBfYeYy9MBXhvU7JHVMa1w0WAPykP0YxfBSLLm7n8J
 c2ZOeUmECAdIqRWPqB+2/y0X/P/3kDQPNM7pmGmQpwG+F+n4U867EjBoErTh2URqb1XSwwdp1If
 /TsG48TmyZtC3zjL9Lvhh1AeZermN11qZRvDivJ3vn64xIMHQ/YW7wa9GuhpLTRlOzj60GXWvqR
 oC8wUqM/dZPDAju9EfA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af28dfb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192237_042844_D9D72CB6 
X-CRM114-Status: GOOD (  25.92  )
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

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e9213f456834..5032f5598e15 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->is_free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1


