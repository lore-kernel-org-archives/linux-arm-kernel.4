Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B961606A881
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3pkiOcf2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ilUDdpCz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B12LNKHa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=; b=3pkiOcf2rBXcYu
	hobR8tiD2zW7EsTbA8BJXQolqx8a3VyBwiTfHRHD5v7ZsSZJLAXAFNPU/Zet+zk7Fp/q9eHzWScVE
	g02Rr7BNj5kXpd4RRtxJBgWDesNWZXBxNfjHlg53rbITzUXS2imLGqd6zfwFShlfT+1F5X+hx6u0O
	BdT1i/1wAGVRlB0gCm7woXzTDq5t4MwQRQ1msO7aCxsc3WtY8BX2ozx5lKP9TD+++IfBPcghYFAU5
	dyhnr1mdIUr4AytlgZ4kpg+TBqpgvwrXgpi2Su5ROvO5KriMx0xcfiB8Ll2c6TvV7XLh64npAxTjw
	gUqFlWtTGMPLaeeGb+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLd-00000001Rat-196T;
	Mon, 16 Nov 2026 07:41:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLa-00000001RZT-2Rwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:41:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f3AB1633229
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iS+QGshyOOd
	LA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=; b=ilUDdpCzOxlTT9Ft9mSXlY/GYqg
	ks9LUdu1vqGtjW80jhJ3mjLtQCnde9vVDpyifHZ48TzZ1aJWhO0QwZuYedc6kh7o
	7gwjaAS/EYxDiQWIIP6/Sa+i69nrOmV7Pi6YJJXwHImLhxsG7ySIJfI+WA4FMmev
	ChP6ZEhzOBI8cKFMP5huuu5I/UoM9NC1pxfiTBS6gEZeTF3Vlo5EpOwhj63DQEok
	OyMk68UyyxPTCOvGmm7pAPtqYKBSfcvIptSysvbzRVTTEov3dbIUexRZuqQQTjvc
	OwDjpwkUaMn2nUQyFukfw61gg1DeGdUzthPyJXGaSnj/QqCAM/kn+QUNfbw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmanavb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5023664eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814908; x=1795419708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=;
        b=B12LNKHaA8B6sVY+h6WnqRa//lkltwDq70xItqdVcRM4ZJmIUblzSLN3fNxV1deWgT
         MplSD1K+gRkUzOsrxGcu3xpsVqAT8sR2KNYFEJVZPYgDPJPJk+a2BEsfYKgd2YH4iaJw
         w/u73R205MO4zf/uqSfr1u9/QcNEPIwCCOiiHkIDAHKfmUL/Nr1qZqSbiNvDzQTrc+UV
         pyTrJHpeqeh1zgmQyx2Kg+y2WElU2Lwu6bsvtf1qyIbWUMsrhkKNOw3muhv9DAD4RZyY
         qPWfRfdWCvlS3en1Nvuit0a26Njxa9xnksSgtQ1lC2HkCgUSkjyZMNuqADJAEBWyIq2k
         rjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814909; x=1795419709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=;
        b=xeXyXT60iPxE/U/Pet/ncrYHq2aUeO9yAKRrQlN+yDU2/gdeOGDvqqsXX4vpOLamnp
         pJ4aGi5uixrRjpntt9DKAU0Z0IVgyTqYmcBg33wZC1+7waFqKDXPpNVJWIqfxm0QQD1K
         59NFo3cYajhtPMzU+E6BOuess63m20fqO/KRFsoH5zDGNmU2W3M+shcoicjHA/x6ovSM
         XY4QKRF/QHYRrEAInF50DFjGSQXTJ1hGeFvRpY6SuOn/RWSiBgLKq/XSdk/1Esbf8PaY
         qfjQeJUz6f8iXVauECmg0So2Y/QiSA+BAyw/kFVSoj7iFfu/o9nhIhr18Pb5/s6Bx6RB
         vt/Q==
X-Forwarded-Encrypted: i=1; AL+hErH9M8Ic0E9EyeSq8vvYmv0fDQKNSSmYitz/R6YrAWDVBWkNHLDZ7JfsIw7wHOC9o3hGldBB2X3qSD/5pOVFm+wD@lists.infradead.org
X-Gm-Message-State: APuU4Z+BJSbBz3p6mZVCuwHDIHp7aATvZSTuHLtJSWtcHE/xhqYpl30E
	4jhsodgL2y97CnbVoX+Gv4MQH8+2/W/28HYkL+tUTVfMQIRiy82oyPCBegTeG+j7dPuxdefDB0n
	fvtSYNMviYqYUj8c1QOg9eXWzkpT0b/5aBrN8meeU2wVIynJKhS63voaOXmDK7EeyBlhafAVKS/
	BF8w==
X-Gm-Gg: AYBFou1OfzuZpIboTvaiSFJqi26vJVOIG1b5+sIjomQGoL1wQ9m9E/R7Y6XyllDdKfE
	Vv3XuPis/8ekpmC0UhtziburmpyVBQdj93XvVEA6zdLr7TaK7sAeA5nLeV0LN3kC+hVKn5jVyug
	gQTRrX8OkbqKlPxYR/gwZtOQTCHm/Ro7WRL43aEprYwGV1BrgDaEuSpuWuEQympXtVGpp/nDS+l
	6QbWa+zWMUSAKrqpmfgTI5l9R7QEUOqsq0d1T8YBSKS2Wuofzw92JFbyEe0i+d4ZmluiMHXS1Kk
	o3/GY2aB9pCBKDvhaDxzYmjHSjgwdkjFMg2pKKzoaIwqw8vsLVu6YYhnJqmC9t3W/Agt0kmJzO4
	NNnumR+1E507xVZk0sLaKZqBWYnVSmzF4FgykR6vFcrtb6aCc3Ya/tCgGPGhBId1Ed/Au5Ep3c9
	zYR/wqTBR0mBHsqC1pefeMOMn3rs5Z4/Yjhw==
X-Received: by 2002:a05:693c:2585:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-37963371df1mr8737959eec.4.1794814908244;
        Sun, 15 Nov 2026 23:41:48 -0800 (PST)
X-Received: by 2002:a05:693c:2585:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-37963371df1mr8737938eec.4.1794814907595;
        Sun, 15 Nov 2026 23:41:47 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:47 -0800 (PST)
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
Subject: [PATCH v18 4/8] qcom-tgu: Add signal priority support
Date: Mon, 16 Nov 2026 15:41:14 +0800
Message-Id: <20261116074118.822731-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8nV9nROiN3nPRdVF4BbLDmdmzBiNMRqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXxBaHARuiqClA
 XqFcz6PZa9YH2e7Nry2r6Xk2rNKv7aLYQRCGn4eb2GpmUy4DLx8oczmfdxzgPWzkFbzxGlosV/r
 MnuP+xInKCrdJ49l8mpfLvmWdtZ/RJ0ZGd4jRnBUUbbT1e2TSzuceG+uKBTJgaEflaG6G9xisEG
 TCD6qIgV6NeMNsGAoupuXoh5Onr/g5dHHuqVhevJMSLef5DGKA8mkrxUetdBA0B+TbAeODRjRnx
 BhwB8jvXvaEMqx13l4VzdP9NJUP8Vfn53YSYJMYQiKhenIA5InoXyw0p6rCS+CRE4Jd1l/IkDtc
 LhU3pMOC+WuSt2lw7hhcbi0cThVObpfQNzr7wK+XaWbdZSD4O29uxQP6EfGx9At7YCJcnlENx+Q
 W0h/hqOZhd073fPz2bhO3u3nWqSdsPUkEldrHoNw1sgfm5QvnwBoohr8YLba38igW7pJABZ1z31
 5MNBqyg/YR/nPBE7RLg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afab3bd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1rXoQJKsMvXEZDCkVBMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 8nV9nROiN3nPRdVF4BbLDmdmzBiNMRqM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX6BXdC6o+MC0M
 JXjHiMG9Yel4AR9VOciZEUsJHNwUO5hXDkY5aUX8f+AsHc+rBpURREAutM3MuxN6SOVDyroTzTS
 ZJRL72PH+0C3stxe8dhv36Mpp4/o3dM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_234150_746108_26F64A26 
X-CRM114-Status: GOOD (  21.25  )
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

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  68 ++++++
 3 files changed, 286 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 798a0e51e27a..3be0b912c937 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5bae46db4f8c..917d506cddf9 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -16,14 +16,145 @@
 
 #include "tgu.h"
 
+struct tgu_attribute {
+	struct device_attribute attr;
+	u8 step_index;
+	u8 priority;
+	u8 reg_num;
+};
+
+/*
+ * drvdata->priority is a flat [priority][step][reg] array.
+ */
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int priority,
+				    int reg_index)
+{
+	return priority * (drvdata->num_step) * (drvdata->num_reg) +
+		step_index * (drvdata->num_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	/*
+	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
+	 * and write the same priority array, so the value is not observed
+	 * while being updated concurrently.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->priority[index] = val;
+
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+
+	if (tgu_attr->step_index >= drvdata->num_step)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->reg_num >= drvdata->num_reg)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	CS_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	CS_LOCK(drvdata->base);
 }
 
+static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input, num_reg, num_step;
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_reg++;
+
+	if (num_reg > TGU_MAX_PRIORITY_REGS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d priority regs, clamping to %d\n",
+			num_reg, TGU_MAX_PRIORITY_REGS);
+		num_reg = TGU_MAX_PRIORITY_REGS;
+	}
+	drvdata->num_reg = num_reg;
+
+	num_step = TGU_DEVID_STEPS(devid);
+
+	if (num_step > TGU_MAX_STEPS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d steps, clamping to %d\n",
+			num_step, TGU_MAX_STEPS);
+		num_step = TGU_MAX_STEPS;
+	}
+	drvdata->num_step = num_step;
+}
+
 static void tgu_enable(struct tgu_drvdata *drvdata)
 {
 	tgu_write_all_hw_regs(drvdata);
@@ -103,8 +234,86 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
+#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		priority,                                                \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)              \
+	tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority) \
+	{STEP_PRIORITY(step_index, 0, priority), \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),	 \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 STEP_PRIORITY(step_index, 18, priority), \
+	 STEP_PRIORITY(step_index, 19, priority), \
+	 STEP_PRIORITY(step_index, 20, priority), \
+	 STEP_PRIORITY(step_index, 21, priority), \
+	 STEP_PRIORITY(step_index, 22, priority), \
+	 STEP_PRIORITY(step_index, 23, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	tgu_set_dev_caps(drvdata);
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c6426b4e3617..d769379b8421 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -6,9 +6,70 @@
 #ifndef _QCOM_TGU_H
 #define _QCOM_TGU_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* Register addresses */
 #define TGU_CONTROL		0x0000
 
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+
+#define TGU_BITS_PER_SIGNAL	4
+#define LENGTH_REGISTER		32
+
+/*
+ * TGU configuration space                                 Per-step register layout.
+ * (one step occupies STEP_SIZE bytes)                     Offsets below are relative to
+ *                                                         the start of that step's block.
+ * x-------------------------x                             x-----------------x
+ * |   coresight management  |                             |     reserved    |
+ * |        registers        |                             |-----------------| +0x1F4
+ * |                         |                       --->  |   priority[3]   |
+ * |-------------------------|                       |     |-----------------| +0x194
+ * |         step[7]         |                       |     |   priority[2]   |
+ * |-------------------------| step[0] + 7*STEP_SIZE |     |-----------------| +0x134
+ * |           ...           |                       |     |   priority[1]   |
+ * |-------------------------| step[0] + 1*STEP_SIZE |     |-----------------| +0xD4
+ * |         step[0]         |-----------------------|     |   priority[0]   |
+ * |-------------------------| step[0] (base+0x40)         |-----------------| +0x74
+ * |    Control and status   |                             | condition select|
+ * |          space          |                             |-----------------| +0x60
+ * x-------------------------x base                        | condition decode|
+ *                                                         |-----------------| +0x50
+ *                                                         |  Timer/Counter  |
+ *                                                         x-----------------x +0x40
+ */
+#define STEP_SIZE		0x1D8
+#define PRIORITY0_OFFSET	0x0074
+#define PRIORITY_STRIDE		0x0060
+#define REG_SIZE		0x4
+
+/*
+ * Upper bounds on the DEVID-derived per-region counts, used to clamp
+ * whatever the hardware reports so writes never fall outside the
+ * ioremap()'d window or spill into an adjacent region.
+ *
+ *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
+ *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *
+ * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
+ * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
+ */
+
+#define TGU_MAX_STEPS                  8
+#define TGU_MAX_PRIORITY_REGS          24
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY                   4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
+	 REG_SIZE * reg + STEP_SIZE * step)
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -16,6 +77,10 @@
  * @lock: Mutex serialising enable/disable and the associated PM runtime
  *        reference counting against concurrent sysfs access
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @priority: Per-step, per-priority-level, per-register values staged by
+ *            sysfs writes and flushed to hardware by tgu_enable()
+ * @num_reg: Number of priority registers implemented per priority level
+ * @num_step: Number of steps implemented
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -26,6 +91,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	struct mutex lock;
 	bool enabled;
+	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1


