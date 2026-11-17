Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A977606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a/mFjRnl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuPxAYH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLPlIXyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=; b=a/mFjRnlJxvYjF
	w/XwutKYqkDH9y8moWc2eBbfN/yaJeGi/iUelio3Fe5fqxtb6GE4sb+fPkKEtBv7ly8zjJPk0rSeP
	1T1aPN4OHX90pOaGlGTcc/jslWiYKCm2JuXlJKgnFtL7lQ9KDGaVRZ9cJDnUNJI4mH/XJOXG4X5X1
	hGvWv429EOi7d/k1lFeyZdii6FMcK1lkghbCpOfnT8rarjqBXRMMqUaeQhiN/kKaN8ssDrNFY1IN+
	1AC52Bv5l/K+6Y75Iz6wPVYY9P3DIsBgOBOSPubh3AaXrvwLTwL6mU3bWx216VNil/QeuPNgDZrmj
	jFRt4cW35Z7m4RfcyB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDht-00000004nPh-0WqW;
	Tue, 17 Nov 2026 07:34:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhb-00000004n9h-0vOV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:34:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aAil3624120
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1U6sGJ1wof
	OSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=; b=LuPxAYH5NJgQOpppiP1xJ6eD+Ha
	uGKcXWmiEqWBP9HMl77Z1m06AOijLxs+hlTG0FcEhaq6e//0IhtaKJ6pmTXgmKIJ
	NdCsB9XDnKQzv2hsycnW/4F5MMdl0OmVIeQiuivYIPCqRubnt729mpNx/xNgBP5e
	7R3whG3gXooQwLBJSsLnTPLtj9Yi3lB3lDcL3M4HZ1zdIniqthkT2a65ISO5qdCo
	XM6wMpEUhFSecf3WeQHnbSHzLgQ5eVvrPYwGIp94YYQAJdjUEd7mxEG4MKwPne8U
	YmNeT0k+d05DzZKQMjRShpAW6kBOxGk2v9ghw/ynIiGmHw09CJP/xsmIsEA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejd04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:34:02 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6e1fc036608so2158524eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900842; x=1795505642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=DLPlIXyihCnBEjRS99ckRzGv6NCq2Zq4HPWGR6mrMke3oKMSJeQUlrEogaeu2M5kTu
         5xTpPGwzgbsfS0Mupt9Lt5bb9bXbIzJxY4oH+SASWiD7Tz4Gl6igJt+bdBa3VXo0pWUm
         aVEtw6ZxuCUGPbefstQHdU6bl7EP6QqUzgdxcTSN5K4cZY1QsHmpcqrJT+J+klxS6i//
         o/TsrXuM33GNUDTai7qAmcr7KVHHwPhYKEgi6RkVsBCyzBzEiX7VUf8lclFGeb2Ym/A1
         lVFPFq7v90W/Bguj4oI5idVOc/o7CKnPQMP95llz/eNhlTfsJ4QJxunYercqSBAlwbwm
         odOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900842; x=1795505642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=m1KrX8xq56nDJY5udinOHG+FvvzRveCwGeT1UnysjhDbj+PP87qrEfdPkDZLFwsXnY
         b7QK25zo9IsxH5OKD1ihQOmqjRDzgAIRC4IPlEDUS7c3JTncNRC6ivSGFmmB+TDTBnvc
         MsjVqwvGJxgyELWo9KKsf4qsF9Jn86NiVl246HAErRRFwVu6rRc/dGwJUwzDViH7caXE
         63p2dnQwDZQBjRuXxfACO9AQprah9Z6x5+OAh6TJkb/+16r6T391XdFBA4nhTiy2IAne
         9ut2Hrd9dHZ3u+mAfJCB4pm1Igz7xXc4TTC/8VG1JTXSW3lh8xp8uTsqB5jzIzoEFULb
         ZHRg==
X-Forwarded-Encrypted: i=1; AL+hErF8ybnLNTOkNdwryEIgT8RAFa3Szc44PCEBAI9q52C0SzikXiMTNcaiTL7ERcMFhV7NZj9Pq9RRRn091Bhin4Ev@lists.infradead.org
X-Gm-Message-State: APuU4Z/rDvzadJ7lXAt4KuR8gjK6ROb4Pu+9NK3nv5AhDYgTEmGt7ytM
	yKQMxkSyZPgThMT5wJ5PvBhmDzhddGp53lX99+arZIM70yw+OOR9Am3voHD7K4GPZ+0Qggw1fsY
	N0hnm+Z/HHHJUPMYEWcJwtCEPjNLRpVD5o6cqKMUb1uTfrHfb0zY2IU0bvBQRkIcfgYWDDwfM6L
	9mwQ==
X-Gm-Gg: AYBFou1aSG0y6JNEUQBKITvID+wI4T0FEBtQR62sTnlad7fa8BSk5kvsKukSimeFRQj
	7VD/YAh6t0mF+sHUSqq7aGWpARu4OkRJ1H41+/vdnd89pYAEGvyv1rHLsxVBw1v2gwC845M4it0
	PCYNL6YD1XIQcp/cDWpqs7PFjcxkFouLSarg7Q03GhKLcyxTniazGmGx/gZF9OFtPBv/9dVLoiC
	VN8E4Eomm5XQbDdU2ZqlvBTI2r1xwkawdziOWS25ib9cYp2LEtHOvKJeRoXv5I4Q7qu+n7VwKCl
	a32vz2Cv2RYpwGn0g+rX1I4qFrX5aJV4dI7d5VXVA1Z2r9TjLCCp9V3dEISbDPKvmWLAz6y0AXg
	/G7IBD7CdGqwW9+hJaewKph3zfu0DjWvRXXqK9+Mzco+vWZn+t0Jcuh4RAIljY3yqeYQaz8Hbd9
	tnvNtqgUxi1JuFOPCBTE7Ek4HXJ2XXk7Pf2Q==
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468375eaf.20.1794900841795;
        Mon, 16 Nov 2026 23:34:01 -0800 (PST)
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468362eaf.20.1794900841323;
        Mon, 16 Nov 2026 23:34:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:34:00 -0800 (PST)
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
Subject: [PATCH v19 8/8] qcom-tgu: Add reset node to initialize
Date: Tue, 17 Nov 2026 15:33:05 +0800
Message-Id: <20261117073305.3854951-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwSo2X1hPnNiX
 5QjmbBaZMJ/IMEHGQsaCeHeiiTD4i9lXJlOtXPDlTpmgyTKVSu5JWkHKWob6N8pI09iKXg6Pbhz
 AeWhe2SpSZ2aonnGGaUNNoZelL5wcB8=
X-Proofpoint-ORIG-GUID: 2MDSxUTIvvotIcZ00IubTqucF4wAxvyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX/TOYdbR9zi72
 CQ/Npxa7uAjwoJHf5KH6t3YFsy21MIT86xodYgCEVBlOMnoD3AqZwd6LI95Xdu+8Oap7thhJIAO
 r/NdvEL11D84tQBAs3Tof+kxRvsqm7UjuGQSZSwt5zknBkrmj49pTFBRRbqd2YpD3N1c+Ajby6C
 Kfld8kGma+5QFQHpxk0MXhFy58G4/HSemlRkACICIl1vWl4pF4A53wIJpXz+c+NP6VZf/08a70O
 dokHiu7ZXwpHx0zQsVALL2SGjK3gxY4t1uEuN39OIM4P0LrWuwFQrGi/GfrbZwOKjY+omFj5Ax1
 ruASXahpw2QpNl0eFSINkVlQ5wdxzAb6LZL8DPRDKWfGuMw0eWHMrXQpDsv1RXW0h/o2U/8ddkQ
 QWEIdykegfgewi79VnY7YX2WEL+9UqaxNIgmhdy7Jw7Usku2S3lWvUWdYOaTXgZYzTU2RmpD1UZ
 z2Y40ml+Aa9MCIbqQew==
X-Proofpoint-GUID: 2MDSxUTIvvotIcZ00IubTqucF4wAxvyo
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc036a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233403_275084_B619FA23 
X-CRM114-Status: GOOD (  23.42  )
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
index 5045c0f344d0..dc8572628f57 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -241,6 +241,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
 		for (j = 0; j < TGU_MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_prio_regs; k++) {
@@ -460,8 +472,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(TGU_MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_prio_regs)
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


