Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E00606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZObL9W5J;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcOnRpJ2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH4zlOGi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=; b=ZObL9W5Jgycm5j
	2bq8Y64FlACGKSGWHyMRb0U2sPYPsfFvbtOXDobiZaACPVUZG1AM2f+IAY5qVGNTCcxo6N44UeJ7R
	nYqVEejVIbBjTxmi7PqQEPHx4sd5L6qLDgFXAgcgLlnrhdZu5cQgMYU3sFJF5J0WTJjL1DOokmqG8
	ASuOd0K9gAnkQptL82JljXqIIDQ87Mdii7jLLtT8yiAMO/L9ywC74HRZPyvNPzvbDKrujDkzi30nL
	q4PPco2NizpQHKIURGi9ePKdzeRVJzKR2pn0GC6cIJxhdq5Q9Y2A5cKj5Fq6+2noXslaUcOSKbvod
	IMb4mHFWmhSw2ACfQurg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNf-0000000BWJE-2aQe;
	Fri, 13 Nov 2026 02:51:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNc-0000000BWIU-49Ys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:51:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KKcT3273986
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M8iIF5AnyrV
	A2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=; b=gcOnRpJ2SsjkQj4+9M/GkCm0j47
	QSRbo5QJRZ6ixU00B9Y2FI2+5dTGvz0YIrhMvp5jbdYExtUF+ZFQp8fnHGHpkAA2
	X2Qaxg8Pjc8olRJYL2tRJY7ElA0jSb5eoZ34AalXVhKHZ68c0ve7B9gE4QzkWS66
	ihyALCchYBgqs2SLe5vpn7vEeNYLBa2qP/pJsQaw2IjqBsqY/W7Blx9svvowU6ln
	/1VbVer4sjesW6Ly7pP0cBZOqPDcDuRsEK9FIfZOUe7psJTdgk4xI1Smpykm79tw
	lq3gbLAbnFTgqevYZxENXDLlu3GY44VcE4yNVHfHfDg4104HkglI2jAizaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgd7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:51:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2edd25534afso4124515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538268; x=1795143068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=;
        b=cH4zlOGiptOR7kaTwt74LE90XOukhzPOpqg4bGcdqmr7Gx843Hz5Ns1MbZ8dE8bxkm
         NsgVFnnwGLOfPgVMO7yuZtObpuK5dL01jTxsLYF+09vkOV8QWF/WH9++ZNQ8BMiL67Uk
         bHAvoz6kkveaZBthBTzQGWEEMifslNBrr1lwm1y59khxoiZHQoSh8DGl1w43arPJ62+W
         Ilv+1eOLc2yqDcYwTxPRxM7Ow7mHURhfdwFLM+RgiygANSq8/cVgckOOPvc7O2Q5niax
         Xh1g7tOiv3mzVmgFzbRYwVUJW+6QJ7StQ4K14mWs3AXs+CUZx2lBb0hCzvt4N7liXsNh
         z/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538268; x=1795143068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8iIF5AnyrVA2ltJIjc+aoXA+D6kw/55nRgU/ArOM9g=;
        b=xenYKwBgeT7F6PkdWOVBIUi/WuSr0ywc434W6saq0A+zF8u92U4vmJryq9/yAxaDP4
         ENlAEBigmLY0fwxT6e9vV6IBRM85PKKAW5px4BI06homarn5H8Z07hOyHYGRTdIL8kYd
         Hg27Wdh/JvBUwHM3Ie7ZHMhQ0+74OH8AA0BoNMujjtdycBcxL0/cKjIupO2PZ9JLIcfz
         y9QwuKg+36y34772YtWWNDKegLcBD/qKk53KtMKAwfMAGweThdxAfr7RnXj21fAH7BHD
         qylmWQ16n8t0Mdm4yIaSRbbSiceoTCPfqYfaRR1UHW3GT/F0icF9snaIbdGhHZ051y+n
         T7KA==
X-Forwarded-Encrypted: i=1; AL+hErGU9Z02AM0FNvKWxS76nRit+XagKtpwSSFaJO+KXwe3dRu/79L7aB7YAZtJD3G3/BiPi4urqcSyQdY59D5UUnHt@lists.infradead.org
X-Gm-Message-State: APuU4Z+Eipw5kYP519hu0tCwZxV+ioZveE3vpzNHdAWQVXhfIv3/+qtl
	q+rv9y2/rvh2e/qvfowIP0eK4kH+L/IEeQ5lRa8OW/wTnPf9l1tK559Ip6Z5vbGmyoGc6IgTrMA
	/lFRbV6ckwkmTRUc5+Dc1uFIAiCnG0v8/jpfHoJZFKaZVo3q1SOoyXgX8s/2CFfGxrs3D1Cao3i
	vjIw==
X-Gm-Gg: AYBFou0/MA0PBSRUXEs4qli/OQaJqpOpVvmswL/Lr6Ru0V+tTj6pXSYHEs6twkM3lTi
	2NSFU7+1GjGH1j1ibEoWs0BlbpwMBJ3Sj1X89pHN3fJmLWoCdjBiBzUl7kM9+EucDML4ocgcX/X
	C56OdYOR2a46S2qJyvgXF+t5+GQCT9Se2dr2qrLGFxUdDpQE/iD+ekgYRfRDHfw0d57u+yJb2M1
	HRK8StIQSdW+pgQRvDh/QxHsesk+tePN8z2cJyyh4FvGettBgJToZi8rIUzpalvAYB81OsBfecn
	S8KSMY2XEfFU4PI0+HptM6QzDEOoqdGbpz5qnf/7qzI6DjjQ73cqzbLLO4c3E/1R8jF1Dh8QW6o
	uLEhgUdPOFLlVkxD7CFcWRJRo9YL5YU8aw6/BEFPC+AMe78T/VOGnEWmz6L93+GFSsWNKxiAulz
	p+RS7rueA=
X-Received: by 2002:a17:903:230b:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2ee0dee40a0mr10290155ad.35.1794538267513;
        Thu, 12 Nov 2026 18:51:07 -0800 (PST)
X-Received: by 2002:a17:903:230b:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2ee0dee40a0mr10289865ad.35.1794538266918;
        Thu, 12 Nov 2026 18:51:06 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:06 -0800 (PST)
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
Subject: [PATCH v17 05/10] qcom-tgu: Add signal priority support
Date: Fri, 13 Nov 2026 10:49:30 +0800
Message-Id: <20261113024935.3173715-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yRH1DOMOd3FBCLRQJbKhqAZG_WuK285k
X-Proofpoint-ORIG-GUID: yRH1DOMOd3FBCLRQJbKhqAZG_WuK285k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX1NGNk1NGwmjd
 4/gXzAuEwyTobbyydNabJDyQO0SMtDAEA3zalw7OtU1jUbxbLEfvh1k9ANZwI20I32i99+glymz
 TYzaXTFfIIgiKPTgREDfXP8aJ2yGl1ZuZjoGHmg2udB5vcGx2QiYO9XylPyRKLPgxkPnqiQ/O1B
 nAMxgpa2gzPm8BuHhO4xJNZKFIAFCGeIxExJmQqkVIvuisGu3MgrK1TKOhSTcz/oIDpo9AGQw9B
 rc2MyzTvM+ieQo0RHxDfLx3exd96BilRcXWXOZo1zEiE4RNrznISBLyfzqhyftuosbruMxPtpgp
 LKs0BChiggsIUlvRkm5MqlOJt2qXzI56Czy2fObWH2Ld73yyf2Fuu5CjXWceQDoLkod/rdI00rG
 vaIcHL2C8RKX749Q2FfvveQZd0i8gUEzft0KVsC8/nzWO8dvTxCIVM8dX/Hi6LbbM3jEaz07lrh
 YX3+F67cX4OFgglmYBw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af67b1c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1rXoQJKsMvXEZDCkVBMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX/P8rIssYLir0
 9gyyo8wkOGWXttBV2ywTQvCQyUOWhMfNssw+OxdJdcK3ueZkkmQwbHchkiD0pihHFcbUYX/dJeE
 gLkyJQdV9DFoF60w3VJcUH1jYA1corc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185109_054028_B01D26BE 
X-CRM114-Status: GOOD (  21.84  )
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
index 66b12ffc2892..09370481758c 100644
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
index ac1ae8bb0ec4..c00e95e68214 100644
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


