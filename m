Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FB4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0oLc67j;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oesadp/a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdnmY+V2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=; b=e0oLc67jSSpWHp
	JhEhruGJ4FTIaJHtuSv0E4T/qUEMy5qVFaqnbLq++4SjbMqld/bieYP8Lvl+8QPv+IoHqu8FSeWzY
	72bj6PZ0hdxR6O5eugqCGfJWLyegEtUS+Fq2VGJ0vLSW/fszmwBk7PIAq08vLR2RsEF2sjofWqCC0
	eNt1feZYfcRjqDXuQ9UAElIJpiCFgTxbMOdt53dAYQOtsoh5IdpXOuFPhQwZoi9Dv5sfA4auM7TRl
	D3Prlvfi8Cgp1358IPA/cpGnV/SjtoQT3MjllCi4s3V5xDDA+3M9HdJeZ7MjUBYKcMbb3UwngLlU/
	1kuTuBvtKbmeO85qlwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOd-0000000BWdq-205r;
	Fri, 13 Nov 2026 02:52:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOa-0000000BWcb-2whV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:52:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K2Wk2179618
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rt+yswoVsdd
	FJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=; b=oesadp/aIgilEB2ORnD6RTq/FPY
	pS0VobryYoTvZHCM0jepLmf3NXT7PoaXDKoQ9bAbg5Snd9gUF5z/Il2VZJtyYtXH
	BkMXmAVJpSISsIXolrXHB+knTpD84I/0ny8+7tOkk+3tsqfgZNI4zkTxahESZ63p
	pjTXledm7yMsiUu5LXiCYdTavpNx9RTy+EyiTheDECqjmRL+7r5g8F2PaW83q3UK
	TtXkxPsPG6cdI7OMZc6nuxSXdVNTQbRvQ7mLWIm/Hou0yBHvYMTAOiXfrtJ6IVjK
	ibdp0BojXT6emcjpmc1wVqkrx9SULm5KS73IEaSN7AhQUTZ+B5pHvZizAnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yum9t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:52:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2803f863so4092585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538328; x=1795143128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=;
        b=GdnmY+V2rIs4aMn6cdMD8PJiHOFpIVC56fOT3iXKLFVCRuCA6/p5zQgVzuUYINDvEZ
         OIc49S/cRfAEvz+IU+kORdF6k4+T1Ob1H1F2DdEK8xr9Ix+p6bAx7vgvecg9CEf1fv4Z
         Xdn4tykB6+kKgiu2g2za/k28SShDa3gM5yNw7UcoYRWtVlMlMffZ22d1TTB27xWogJ62
         cR1NcuY3g3P1MA4vrgzkn8Fqa4JFnH33JOd3tSipfjFeILYzS86bBz73Ks68nw3eTGoU
         1Oy2S/SaIP0kDT5J+Uv5sOz+/QbKF+wJvX084TeXzyqaLsoqiif+87XAi9e107iafiRG
         btlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538328; x=1795143128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=;
        b=a0J2HjzbMf0dUWEyYEM4opby4UBLM/xiofNfbqLsNtijJFXa4AH9MTzdbIRXHQZq/R
         DJ/m99jbCl52LLxCd+o6EeYZI7x341/iFy0fs69kzzq04Wsk8CZjKbQgmd8HgZbDRZtC
         qIYQJt34FQg3vnJADwJbxkRRYRrpt3a/DKxtr4f9wiK7tyDaImzFZ6M2pN/G2Zs8/i2X
         kmHS9zGohkkQiDLeHunJM067k/g0oSibexETkactjMEi9lX0q0n8x7R7AavXyOEAG5p0
         3pPpUbg02y4t/0E+p0qsS8cUu4eGrmS8tqV76yVJn+Mau/XcqsNHaAW10zSKNPN3cyml
         49pQ==
X-Forwarded-Encrypted: i=1; AL+hErEVLQOabk3afVrI6ZGsgD6hW93Na2YWgeCkbDAmI0Uy5Iyvu8dH4ft84DVXqzbFrq6A+GjwYid+2kTHWUFt5sfH@lists.infradead.org
X-Gm-Message-State: APuU4Z+DwXxITQ9fpQRkLhvmphmacvf5DzpkLYwzFFgkwRasVXaSEL7q
	kSKywmsj1QQk7IyoOIZBRb2wD+F2IwT9rziCmlh3GB+RcGclmlx3YnlHZO51joSLMVJtR1WRAyA
	AEAhtbd+xNT+qFx0n99bcxzQu22ZNhp2e5khhaXjDXv1W30DMWyK/JyjtB3A/G1yWDoNscVRYVT
	hy8Q==
X-Gm-Gg: AYBFou0S6jbpLOKUa3RzMw4suRZr/lFud/CTD3ikGUj7d/Nh7Vqt6tGQjii1KAPV/sP
	lZRkRbdPTp/pGIqf6BpPRLghpysaiJrAEHGQMdHzkJlNW+cP5ft/yvoxS0u1KTodD/BRg/meYf1
	3TrML7WZMy9sKqlj/38yroYIoAkX7JyvXvaDV4iEOJXPH2OO4BRgveyeg8KjTDDPzLvB3W4uyE1
	8b5huSjguh4HKsFNbPDADxx7UeWId8vrjT+F7iudMfkpbPVroKaxQFZ9t3+cQx6X7KgktczG0N6
	lzJmFUJum/37ZuhdsN82wgUlKt+b89zCr61LfcNOvXdReMFmkjy1mYYWOk7DWIXSGv4souIot1i
	IMYXU7QuYZ9MkBefkOcTNX8iLPcqmlCrq7cmd4o01PZdk+3WNN6AX0AY1gLMGkl+K7r1YF1zepO
	uqblApV0c=
X-Received: by 2002:a17:903:3c64:b0:2ec:ff7f:6f1 with SMTP id d9443c01a7336-2ee0da7bf4dmr11494515ad.11.1794538327450;
        Thu, 12 Nov 2026 18:52:07 -0800 (PST)
X-Received: by 2002:a17:903:3c64:b0:2ec:ff7f:6f1 with SMTP id d9443c01a7336-2ee0da7bf4dmr11494245ad.11.1794538326918;
        Thu, 12 Nov 2026 18:52:06 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:06 -0800 (PST)
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
Subject: [PATCH v17 09/10] qcom-tgu: Add timer/counter functionality for TGU
Date: Fri, 13 Nov 2026 10:49:34 +0800
Message-Id: <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5GURrIZTap554F50iZvJlQj0gkX7hzF7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX7Gh8yIxgn+P0
 UQC1O2EwRELIC2j7r7qGOdw+EVmE3JVEUil9/v5XN0Efzywj60+N8ADXErvL0H7H7uSFiBdor+u
 UjnBuxuWzg/CZBcJIj7zR4XtAJON7f0=
X-Proofpoint-ORIG-GUID: 5GURrIZTap554F50iZvJlQj0gkX7hzF7
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af67b58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dL9TNO4Ss2-3uZuT038A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX2GMQZF1/boDN
 1w2bgE5LPNrvj3J92lGYSA0SIdNDZ57G81q2HedV0t5loGnGdA/9xLoAgp4DHcpZ0C9/dGeNxn6
 Y5I+gBO/NeN5EJ+kzvRvxG23Ys+ASCqwavAz8vRQj9/vQRhKKSi47vVePQt9ZCpr+0vEq4BbVxl
 sQ52Xw/wuRJcYQ7N79mxcr0znUbZnG8OC/tfYSFdYvZehmZ/ZwxVHgnczTDLlgO9N0XMs8KxgE9
 TXBSjN23yz179qpjpI/LVUZydAevXni8YXs+1SwVRlnOwNdyODkaIMyKBAnALw43vkUgn05o5PO
 V5dTQNfEye/bqJAMHFplJX93GMWTo50V4svQr+kYa311S+0uERgxfTpWj7xzBHG5GEgpJDitYFY
 zdVea5j71O+9bjgutSJ9uLDJ03qS6EhyBzgHCrOFHNV/1cGoLwvUX/FlyjspZDuRsADICVVNLyv
 GbqYwBb2rsR86qfZhNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185208_767942_653F1A03 
X-CRM114-Status: GOOD (  22.56  )
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

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  32 +++++
 3 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index f487881b7def..e0ea5419188e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -37,3 +37,17 @@ Description:
 		(RW) Set/Get the default next action for a specific step of the
 		TGU. This is the last register of the condition select region
 		and is applied when none of the numbered select registers match.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 6e66752a7b8d..1cb131a3c521 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -63,6 +63,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 			reg_index = drvdata->num_condition_select - 1;
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -115,6 +119,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->counter[index]);
 	default:
 		break;
 	}
@@ -160,6 +170,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -209,6 +227,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -259,6 +289,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -270,7 +324,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_reg, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -318,6 +373,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_select = TGU_MAX_CONDITION_SELECT;
 	}
 	drvdata->num_condition_select = num_condition_select;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -496,6 +566,38 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_select" \
 	})
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_TIMER_LIST(step_index) \
+	{STEP_TIMER(step_index, 0), \
+	 STEP_TIMER(step_index, 1), \
+	 NULL                       \
+	}
+
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
+#define STEP_COUNTER_LIST(step_index) \
+	{STEP_COUNTER(step_index, 0), \
+	 STEP_COUNTER(step_index, 1), \
+	 NULL                         \
+	}
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -546,6 +648,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 27eb1f81effa..3b103a399815 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -18,6 +18,14 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 12), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -47,6 +55,8 @@
 #define PRIORITY0_OFFSET	0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
 #define CONDITION_SELECT_OFFSET	0x0060
+#define TIMER_START_OFFSET	0x0040
+#define COUNTER_START_OFFSET	0x0048
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -60,6 +70,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -69,6 +81,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
@@ -86,6 +100,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -99,6 +115,12 @@ enum operation_index {
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_SIZE * select + STEP_SIZE * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_SIZE * timer + STEP_SIZE * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_SIZE * counter + STEP_SIZE * step)
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -121,10 +143,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -138,10 +166,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
 	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
 	unsigned int condition_select[TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT];
+	unsigned int timer[TGU_MAX_STEPS * TGU_MAX_TIMER];
+	unsigned int counter[TGU_MAX_STEPS * TGU_MAX_COUNTER];
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


