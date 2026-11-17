Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96388606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4E/MdRcT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwjPPGUI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UIoR081R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=; b=4E/MdRcTtLzdFS
	VaL7GYVgck4uPu2jPg+fj200SH7cx3RNF1HhJQm1UwsdNbnyn6c3j1HDTWo1/2xg0lO4faz1Tujgl
	tXRLFbizb3hvgILDN+ayXnZn8xPb2YrXSGDuCHrVDZ+o+kG4Z7hfIpGli7dvVA9C12U9gP4mRnkL0
	To9BNsJ2TEpCjugDI07RR+5NmrIGGqsXRSvoycmVBuQnVNjL2ncCTrJEzJHC4CZ0AWKEt/3C9Mj+X
	pa2c3dk7brfmg2MxPQW53n44/L5OUWAEQNQS7Z/XrQPykXkEhZIphk8RBaMdCAbr54COblEe0ykOg
	JAK+GY+1DIJO/fF6bPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhe-00000004nCL-0hLH;
	Tue, 17 Nov 2026 07:34:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhW-00000004n7Y-2B0J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:34:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH440RJ1699107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1/fBRI3pieX
	AuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=; b=NwjPPGUIK/KNnFUG8i12jWoI4Cy
	wQDUBpY0kzWDXQAOKfqSUXfM40sQ+iJYmDVfpfAGKWbXDWHXprQpsY0NQMg/5sPP
	KGrYnmcCoqbebnvalgc+LWplle8cwV1fwkzSzClF6dEWs/JzoHBNqvPuuNTSvRfl
	ya5pz5P6CiGocOlLg8uzTHD9DJv23e3xCWv3uPGoFpYRMftm8QYPP5JKHKJ0wzxz
	21LWfZpVW7LjpRetHKkru5XcWgMGeu726/4AIXkQ3HcqyxHTjSxwvg7qlGVXFFcK
	dVdBMbWncQ+QYc9qFX4iPUwhf6PoJYxtGGG7N49EbmPEefEZgluWI7iK+wA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugnny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:57 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-862b952fb06so1473743a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900836; x=1795505636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=UIoR081R5/Iu3LJjdx69+iQ+pX7bMieMzo7VPp/SYtptrqz+CRjtExW/8qKkBx3Kg4
         LTeDcSiTBTXKpZtX4KaSIAnPJPeMvXnykYM4vJ9sr7liRfD3EM14CFPLOyUhDb01rbxB
         JeLj6m9vpfYYrReccfiAXFAndXW/PhEbU+GE9XsPBWiH3bQOe0ONJ6PhD847r+wlKycT
         NAL+8SQzS7jqyhQms1SPrwUXa5ezcXPIl5CLEv0bNGuai0ZZFwlVGePOoH/Qi1fnU9He
         IHqkeAiy6dSqCN0I4sHLozD2KJoJ+oZj1nXGtDqNmCN/0vEGGldfhcIwGcMD5HtSZgZy
         blLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900836; x=1795505636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=nR0MraiF/T3oto8Hpdnkcqu1ty4IXBVK0tLt2cjz+BAgvbe0fRumVUuZfa7sOg8pdS
         QYApHfbvWNcFQsyEhfzAmw6rDMNkX+dys4bX2dMCO6j1KPSuPxLx8WjgmjzmpWHz+/Cy
         IQaDNWAbYxSeAfrn2roIbScDdgYd1+CTU/Gnz5QQZXWIvuY7UnaOqRhquoLXaiLoyIln
         Ib7xU1UD4Bovd5xm7K5G3od0YbL/74MvOsS6ewxG9FR+cCHfNN+o/Y1+p+ZQQSKKZLu1
         YY1EUd8Rf2sfCGXrsDwapnVNFz8n0f0cMx8w+8nLeYQczI/MZ7MXpYzTBykuE+iilVHE
         SpQQ==
X-Forwarded-Encrypted: i=1; AL+hErGA1pfasy3+AlskJyHJpQRS0K1JcYwOOgRI1wY2suoy4hMIqc6aU7RF/cM7ywBfZABW7beTBE3DzsRaNs/aIi1H@lists.infradead.org
X-Gm-Message-State: APuU4Z+H8tLrefVH6I2nKOjcdU3XtwddZulwchULF4xFnXyZMXpYChZI
	s3tZACKCmuL+itmV2LdwTlvxVrHBmUSXxGa6OA3JGxuBY0K1unoga3b15IIWb+4EDF1irpXptqp
	YC/1DjWYyR9aGEMOrVkCun4OZYnpfp8RYljZvwXTnbzClnHGtj0IEUXlyOLzW3Kdk/qqGJ0APZb
	PDtg==
X-Gm-Gg: AYBFou0Qefdg1aIIQ8nvu4ViNF0xgpws2USIaYV9FZ3C3xL5I2ASTgRlCR1uBrfZOPh
	lbL0GgcrdSaXSPgNA5zDpJE/wrFCYEeyegHkRSEDU+NQUwAAIB+v2tC/uRmUEpN84L7lOmxox+3
	nlt7bm0bzxqb1AWf6WvHJb08b+j+rpzN9Gi0aiSVwMkEwdbwMFVqwDmSBcPANgsyRp025Q5B1ji
	3Y5nCnDFIP2XEQefY0JOWdIw+FUgmTRB0DYtwDWlHlwXe4ZEcYgOPnIt6q5tsZZXhLmjBCCzrsp
	+lA/RUajhxXya/Kt25gkn/0UkcWQ2E8RfcBe0n4nPrZ8mxTB0UzIiDYBU3te4ikHN2nA5STUfSC
	WZEtUkXuN9B07KwbTATCGLUI4qhzxkTYMQrlPOvGbMnKn4VTpXo9DnLx38flaL0kuonfkSCblW7
	3hH9QZ/EwoJpcawu5mAMi94zAdlRRMJ6HiGw==
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925766a34.28.1794900836381;
        Mon, 16 Nov 2026 23:33:56 -0800 (PST)
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925743a34.28.1794900835877;
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
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
Subject: [PATCH v19 7/8] qcom-tgu: Add timer/counter functionality for TGU
Date: Tue, 17 Nov 2026 15:33:04 +0800
Message-Id: <20261117073305.3854951-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXzpboXOOnvGsg
 INtwm+DJ/tN7eMmYCsIm1NT7WxOtjfgzPLDxNO5qAa40sfB4go7hFEh9B5g03PuGUSaOxakK9CL
 bIZKpMzUpFoGaFiTgW98H065vUVgAmSSOM/x8rmhFflxnUYLVMIqgY/ZNy6gcF8ijiC5MPq4NTF
 UMcASG3mChKlqYc/sRZpM6onQ6WgtX3M4ReaJRIUXQhpFA+fYQwbgFtVvP8l7FKgRLf+wzO3Vf/
 ngChT/OTPoE2roSyIkK7J5ggElAxgIDGyt7PAqXxTc1uXLWPglNVCLOF1lv8EbgkC6BZJARLcRc
 DDBUQeFVDQZscBGJydYy0P7q4l8etqOsbDKBdz8OZF1GDIyYJgfMnGinan93Qd7D09nTk8lKDUs
 HvHEH5kOzJdUg092p4Y1t6A/F/jKSWSc/kLRpBwfinODNci4/2m60t44EXCFXv8zkc/qEXO1rGe
 uxVDFKNj7626LSF7A3Q==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc0365 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=uUgUC8Xt-bfeVmmxO7MA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: ro63sYxne3TkTt_vXftYVDxAZ2eI6aU4
X-Proofpoint-GUID: ro63sYxne3TkTt_vXftYVDxAZ2eI6aU4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX7gc/PL/Z5qoE
 FcMEi4wvpyry0TT2zuM6EFqpVPxnFRqW0rrqH8HIII4XW51zThtbmVryPfvUbjFszNVQ4B0S/ow
 uDiG3ST6LMHyn4chml2+NVX7vuxPFBI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233402_055823_95D6C33B 
X-CRM114-Status: GOOD (  22.59  )
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
 drivers/hwtracing/qcom/tgu.h                  |  39 ++++++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c30b58166a0f..71187071cbc8 100644
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
index dc4e60380565..5045c0f344d0 100644
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
@@ -105,6 +109,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
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
@@ -150,6 +160,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -199,6 +217,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
@@ -249,6 +279,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_OFFSET(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = calculate_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_OFFSET(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = calculate_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -260,7 +314,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_prio_regs, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -308,6 +363,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
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
@@ -487,6 +557,38 @@ static const struct attribute_group tgu_common_grp = {
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
@@ -537,6 +639,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
index b51bc47637e5..b5bf9a301a6a 100644
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
 
@@ -56,6 +64,9 @@
 
 #define CONDITION_SELECT_BASE	0x0020
 
+#define TIMER_BASE		0x0000
+#define COUNTER_BASE		0x0008
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -71,6 +82,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -80,6 +93,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -93,6 +108,12 @@
 #define TGU_MAX_CONDITION_SELECT_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT)
 
+#define TGU_MAX_TIMER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_TIMER)
+
+#define TGU_MAX_COUNTER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_COUNTER)
+
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
@@ -106,6 +127,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -118,6 +141,12 @@ enum operation_index {
 #define CONDITION_SELECT_OFFSET(step, select) \
 	(STEP_OFFSET(step) + CONDITION_SELECT_BASE + REG_SIZE * (select))
 
+#define TIMER_OFFSET(step, timer) \
+	(STEP_OFFSET(step) + TIMER_BASE + REG_SIZE * (timer))
+
+#define COUNTER_OFFSET(step, counter) \
+	(STEP_OFFSET(step) + COUNTER_BASE + REG_SIZE * (counter))
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -140,10 +169,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -157,10 +192,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
 	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
 	unsigned int condition_select[TGU_MAX_CONDITION_SELECT_SIZE];
+	unsigned int timer[TGU_MAX_TIMER_SIZE];
+	unsigned int counter[TGU_MAX_COUNTER_SIZE];
 	int num_prio_regs;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


