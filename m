Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34076606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RuXlCWaK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DgkpCPNC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8/ciRF7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=; b=RuXlCWaKqZL67Q
	lxIC3WsirvwRuvM/rxPhrZDZ6H++9Hjh5ABEXmbh2eJZIc5a9gXOxJWHSFTjmdpO7BAvPfqK80yB1
	DGvvtpgWnW4thFP4QM92hA1IZ9acu8vsuOvi91QXz9VM/1uegnp4zjHNvln7K6c3nPw2NOAg6FYvY
	GEMX6YV6awPHJ7AcE7ocRSder54dr1EFugJgQTfExRGR0XkLudgJ1JzfsjfL2KgEG7NunOr4hammu
	A7n6ae2QaSNYKeAfGXC4+xNhjFpr1nVIO2UHiB6fxuFCr3quA8P1pW3h4KasatcbiYh+kUP9x9xXE
	EW/nIswHFCygSuzkWs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhd-00000004nC1-3nFd;
	Tue, 17 Nov 2026 07:34:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhQ-00000004n3u-2b4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:33:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f0X22998611
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uh9/rQpnzRZ
	H9grYVCaP61T9t+zi/VROGrqzsiH9p6s=; b=DgkpCPNCdcWirO97Rv5pNEhvLqi
	CgtRA5K2Y7iXLqNSGYDsGI/+YSWbml4iPo56jLe783wCd1EMiLdyrJQmClTe051y
	MzVzF2NV6LJRjENO3wdz5/FAANrIPG740UzLJC6HcESXaNLbiNloCdP4OBIZruf+
	ZBrBQv3DmEhVz8D4HVv0OZI+tBGRQ80L8+k2IVHBhR3wYhZ9q95iaWKkbBfm7ZL6
	AobhrNtiZ1EBiegxn5876a7ThYf12lCbp+nfCd6lXmdj1YomcQjbEWcyzU55ASGF
	dAioYC9gg3m9pUIxuwAh8NVgrrob+xSRvnyCFsv0E+JgIz9FyEhd0uPZzvQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve06bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86287b38a31so4827051a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900831; x=1795505631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=;
        b=O8/ciRF7JyXaPF0HKasAxBIglLmcEFyl0emGH/egGqDAcqtR71CDJOPoIabvshiJdq
         03KdhqfcTx0LXeJge45E9Mma/RyhxAB00dSEMIYdG8zDfKvLfW8IIJs0C6ISzcq2xs6+
         x65c5GCsTC34hdzoyQZgVNe+os8jXhef7QCOy4skCBY2Lm8cT474HxWS1fGv9g+3VXEA
         bw0aMC0hrcGwWOb1jjv/iVte/m47CuDaFCBt8jywgK1eiQoU6bi5zT5HgjAJl/k5oMWw
         R3KQbtFVpCZZAZEyc4LjnR5MFCSbuCGjMM1yxy/Y9U/F/hMgB2uGxX3mPwX83j3ykzgB
         x5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900831; x=1795505631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uh9/rQpnzRZH9grYVCaP61T9t+zi/VROGrqzsiH9p6s=;
        b=mtEgWNghCLWBesndfUirorHXO5xLPEJ8Big3ifo1xiNhJkBFKyKfuIIbuhiyKYt1yE
         4PfCQI5/Lwe+/9E+XG4qK14KQ/o85hp754c/7FhW9SZ2UPyb1ETlradtKCxrc5p6j9xT
         57mtamaOprB2lLzLVcBSGwf0tSserLhM6fKVkdsEYfWcisW1IoRS28PD80pR7+27RNsp
         GKQiYerfOiWG3aA+ZLWNktnFnE/nXpWITMK+NaadNZS3Nc8h8ROhUXy2X++0H2foeFrd
         9Z3Wlyu0pnDEPHlko3whuVwjoVxzGXsciDpbmna34Id6Yu5NOYMnCLy44fy1CyXY8f5N
         JjVg==
X-Forwarded-Encrypted: i=1; AL+hErEwlLsW/tAQo/9ZFbq/285KqxrzuDOuzrhjudgWjZ9Le/84OLf6WDaVXVBixb1u5OPwf5BjF/hmptaPwhLCFkAc@lists.infradead.org
X-Gm-Message-State: APuU4Z+bLNmMZoUZru6N7nRQ3y8jxE7nNgbt5O0He2ZU/Kc0dGMiRsN7
	qmQskBU0Zp3W43aTy//4kiRY+ej8auQLcnfycFpVx1H4wvBpy8DWZOh87fJxIhSuMLG4wuwfReh
	pu4xRooGuEjr4BU6NISpQQN5IlaEd55fkwj+FCvplU2h8fJQUi4OHik4qy8UAraJsBe9xbKyvQG
	yhTA==
X-Gm-Gg: AYBFou2GxtB+N9jW7J8lQg4jdHpbH6EuBkEkH4cneXC7w95iqpd7MeWxlRjRi7ASm7t
	cAmJnKeygYbp5YhJs8rR70hgk4ihrjyebJxzouayeDuVx1COTMvMjFMCW9ljTzZ+Ntm/5Gq8ZtL
	tvujoTJb52XxVP9o1lGSeO/04J9NYzJ8amR2T5+K5M638hNzYQV/yRqkyMlk2FJVEHSD5Vncdyf
	lRnYcpinO6aJYocD6YH6EG2XDyvDU0Hpo517EROiBbzPaABBnyTJ3AGWhu3VN2gu9f3dVVK5I8p
	Js3INEKlho/x9Jf66MDkFMg/mEiijkCR+YzduTynONoWHzpqN76kfRF7mfUjK4hwFKNlK1Z2kY8
	nu5DKA8A2fa2n8EAbu9earXOHGgBGFDTU/Kee5KWnNKU5RZV2iVKuqRgq8nRTn0nnI2MU273eTo
	hJtcXwNT07boGCVUQ9u3y2XpTUV3COHW7u+Q==
X-Received: by 2002:a05:6830:25c6:b0:862:bda5:b88b with SMTP id 46e09a7af769-862bda5c594mr6102180a34.21.1794900830897;
        Mon, 16 Nov 2026 23:33:50 -0800 (PST)
X-Received: by 2002:a05:6830:25c6:b0:862:bda5:b88b with SMTP id 46e09a7af769-862bda5c594mr6102143a34.21.1794900830360;
        Mon, 16 Nov 2026 23:33:50 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:49 -0800 (PST)
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
Subject: [PATCH v19 6/8] qcom-tgu: Add support to configure next action
Date: Tue, 17 Nov 2026 15:33:03 +0800
Message-Id: <20261117073305.3854951-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX9Oy6oJMdyG0T
 ud3OAM6co2RueRVSkVRKA02RR9fST/w8Cl0Qfgr3FY8Vn9zhc9+L0LSSEvE64V59DE6iq+0IvWd
 8UReo41iyscbncPi1nwcZcWCbNxnyJI=
X-Proofpoint-GUID: OP8BrfiIHxUO0L9cXzDJxan70wN-5KD8
X-Proofpoint-ORIG-GUID: OP8BrfiIHxUO0L9cXzDJxan70wN-5KD8
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc0360 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Kr544KC8-TckwPajLNgA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXz/J2PCPbUsBB
 d9HBfYs4fyEnZf4zZz7b/JUk9rHIt6Q7jbBC7MPIProTMu+iBLyAMbD6M+SSKQD3+iLlFWETx4J
 HEs5B5NB3B92JM7PAm6kxwZfUDG38lrDBtplM7dthCzGEEpR4TaV8Mkr8Y4F2zdE3zk70+NldgW
 b71vusWBQgJ25tu+n8iY4bl4PM1p5TI9s5lnTU0WifWB15jNCYg0lBmolUyJPyy0Bb6YbPyqGii
 qJZkVH5fLsei+W+ViReLX6d+sFVWOKle2iegCDhCyhS0xt+AVkRzIPHUGsK2emXqPGpTF/JzOX7
 lvvNsPRBZPD8kgDFui53O2gZIZJYCvaq7ZIRdMTZa4Dsy4U1V318VRsKt2m5Uo7nGk8bFY5iTEK
 o0OigLmorNsQy8v+wlaCa6dBPQSS51UOkQ9mGELBIUSaj8pVg3mswblGhB+kLtRnm86YLplUupw
 uhxklOP/99+/xiBr9Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233352_714949_F5367003 
X-CRM114-Status: GOOD (  27.47  )
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

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    | 16 +++
 drivers/hwtracing/qcom/tgu.c                  | 97 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 21 +++-
 3 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c7e6f13da83d..c30b58166a0f 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,19 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/default
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the default next action for a specific step of the
+		TGU. This is the last register of the condition select region
+		and is applied when none of the numbered select registers match.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5562b3d83ff9..dc4e60380565 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -23,6 +23,18 @@ struct tgu_attribute {
 	u8 reg_num;
 };
 
+/*
+ * The last register of the 'condition select' region is the next-action
+ * ('default') register. Its position depends on the runtime value of
+ * num_condition_select, so it is exposed as a dedicated statically named
+ * "default" attribute carrying a sentinel reg number, rather than renaming
+ * a shared static attribute at runtime.
+ *
+ * Must fit in struct tgu_attribute.reg_num (u8) while staying outside every
+ * legitimate reg_num range (0..23 across priority/decode/select).
+ */
+#define TGU_SELECT_DEFAULT_REG 0xff
+
 /*
  * drvdata->priority is a flat [priority][step][reg] array.
  */
@@ -41,6 +53,16 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The 'default' register is the last one in the select region;
+		 * it is exposed with a sentinel reg number, translated here to
+		 * its actual position.
+		 */
+		if (reg_index == TGU_SELECT_DEFAULT_REG)
+			reg_index = drvdata->num_condition_select - 1;
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -80,6 +102,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_select[index]);
 	default:
 		break;
 	}
@@ -121,6 +146,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -159,6 +188,17 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The next-action ('default') register is exposed as its own
+		 * statically named attribute and is always present. The numbered
+		 * data registers occupy the positions before it.
+		 */
+		if (tgu_attr->reg_num == TGU_SELECT_DEFAULT_REG)
+			return attr->mode;
+		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -197,6 +237,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_OFFSET(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = calculate_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_select[index],
+				drvdata->base + CONDITION_SELECT_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -206,7 +258,8 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_prio_regs, num_step, num_condition_decode;
+	int num_sense_input, num_prio_regs, num_step;
+	int num_condition_decode, num_condition_select;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -244,6 +297,17 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_decode = TGU_MAX_CONDITION_DECODE;
 	}
 	drvdata->num_condition_decode = num_condition_decode;
+
+	/* The select region has an additional 'default' register. */
+	num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
+
+	if (num_condition_select > TGU_MAX_CONDITION_SELECT) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition select regs, clamping to %d\n",
+			num_condition_select, TGU_MAX_CONDITION_SELECT);
+		num_condition_select = TGU_MAX_CONDITION_SELECT;
+	}
+	drvdata->num_condition_select = num_condition_select;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -400,6 +464,29 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
+#define STEP_SELECT_DEFAULT(step_index) \
+	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
+			TGU_SELECT_DEFAULT_REG)
+
+#define STEP_SELECT_LIST(step_index) \
+	{STEP_SELECT(step_index, 0), \
+	 STEP_SELECT(step_index, 1), \
+	 STEP_SELECT(step_index, 2), \
+	 STEP_SELECT(step_index, 3), \
+	 STEP_SELECT_DEFAULT(step_index), \
+	 NULL                             \
+	}
+
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -442,6 +529,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 1dd99db09f39..b51bc47637e5 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -54,6 +54,8 @@
 
 #define CONDITION_DECODE_BASE	0x0010
 
+#define CONDITION_SELECT_BASE	0x0020
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -67,6 +69,8 @@
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
+ *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
+ *                            (the last one being the 'default' next-action)
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -75,6 +79,7 @@
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
+#define TGU_MAX_CONDITION_SELECT       5
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -85,10 +90,14 @@
 #define TGU_MAX_CONDITION_DECODE_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE)
 
+#define TGU_MAX_CONDITION_SELECT_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT)
+
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
- * condition decode registers instead.
+ * condition decode registers, and TGU_CONDITION_SELECT selects the
+ * condition select registers.
  */
 enum operation_index {
 	TGU_PRIORITY0,
@@ -96,6 +105,7 @@ enum operation_index {
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Calculate compare step addresses */
@@ -105,6 +115,9 @@ enum operation_index {
 #define CONDITION_DECODE_OFFSET(step, decode) \
 	(STEP_OFFSET(step) + CONDITION_DECODE_BASE + REG_SIZE * (decode))
 
+#define CONDITION_SELECT_OFFSET(step, select) \
+	(STEP_OFFSET(step) + CONDITION_SELECT_BASE + REG_SIZE * (select))
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -124,9 +137,13 @@ enum operation_index {
  *            sysfs writes and flushed to hardware by tgu_enable()
  * @condition_decode: Per-step, per-register decode values staged by sysfs
  *                     writes and flushed to hardware by tgu_enable()
+ * @condition_select: Per-step, per-register select values (including the
+ *                     trailing 'default' next-action register) staged by
+ *                     sysfs writes and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -139,9 +156,11 @@ struct tgu_drvdata {
 	bool enabled;
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
 	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
+	unsigned int condition_select[TGU_MAX_CONDITION_SELECT_SIZE];
 	int num_prio_regs;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


