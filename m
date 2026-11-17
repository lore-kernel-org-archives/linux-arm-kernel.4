Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D252606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BiK1rEqG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IGybIeSG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5BTWr6u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=; b=BiK1rEqGsFuktz
	gSymtN1iBps9pv+mwg5zcyuQ5XGtlXvJ1C4R9Z4efe0qT845US2llSxl9nq8tI2FfotPsQrukyx4I
	YR6t5rJb6X1bRmyV0gDEiEZoAIdsQohebFd7YqLdMp6b2VfvIu/QZ+XKFBWgCveztHWdjcsTL+mIY
	DqvtY2gcLpSY0lrSH/wiyKFDiwa/rpQrdzZI0igWJSbE0S+Hk+uA74JJfSNulcYj+vkTjjNBijbHw
	Flv6TpEhU3c2LdodhiLenzTc1SbEC7Io/8Ag6hxHrHxysui074iwHZgAcbGmQE+hJCd7BeJ3cRndi
	USJ4LTCRrVRfqpvE1M+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDhF-00000004mxS-0JDO;
	Tue, 17 Nov 2026 07:33:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDh8-00000004mtv-0XJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:33:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aFEL200048
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4AnKfy9vaO
	FdUcffAacVVa5fJOHRuc6CEJFDQor3xc=; b=IGybIeSGuNdUDznr+bDjSfEeDYS
	n7CL/CcIqLFlQ8wLIHzcXGoI+UQXAWNlUB/7ssH7dIUTlyQsV4M9nCtqIcFwkQbi
	OYHWGBxoztG3UKDRkJPHaEU4FaUdprMCZ/HhkWoz38t+FSSaAdumglb73PNo3XOz
	9xMK/pdE8WBzfyGkpIv0WWIrtLSSGOtidXK1sAiTpBx7ea15MLMEbVLzFQb6id9f
	KKFImQmMCQzS4DvqtMXaEhRDBaVriYFfEaWOUOtrGZ5FgcS1a6Ul4D4vwVSQ6wAP
	TZs/rEJfAKMIvTDA4GI50+YGKjlMSOsEwl1Z3HhbnvntYHiDVfMmCXghlzg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbk18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:33 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-86156035839so5564220a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900813; x=1795505613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=V5BTWr6uqrG3Bsrc9M6FvJuyWQN9GmCaK9jPqLYGqWNCaiSKxn2JBH1LV1lDkpmCqG
         1WfxIUcoAm1i36gfPkcWh8H5j0ni13iUxqoToP3YkDoecqkh5KOVlEVqhKj5j/45GOd5
         DGVg8UwSngmZDRGrzxnnzNwtzHhG8TYDhvq4ZTpcBQ7g+qNsT3/gWk+fIofrTlY7dfK6
         GhTkmnInzNgc6LU2bvkSB/Ko6DRAXZJ5cxPh+QqS/w/hIqJiVkmyJ7PAHcrNgt7rs8cm
         9Zi7Wfo5zU7IYWRzRkjxsRGNQhl4XSqnUrLsOvGY2EvnCcoJ7ZVNHheW63QqQvgvTuBq
         HmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900813; x=1795505613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=LGnokB14W+dySIPPTWEC47YQOaNwJI3Q2YANfmr5PAQ6Gtcqo/L7eetYJnnQ/NTXzb
         TOuAIYbWUEh1Ou7MjfkUKuhM7W3WmVtqXkrqxtdImkhtlQtjNqqIGrQEsyEnbn6VSsNp
         Qsw6AjuJGa/ThFXcq9LyrQUqA8rA59teFvRCNGoK84g2+KVYRalRcApVha2vxYAQ97iF
         4UehLcPd00YjWapE2jXAuASY/82piFEflR37Kl3lnhuh+YvZjvBBr2/fGLjvgmkE0cpx
         PFRSGBUpbeUssOXxwdzBlpQJGuD6hEZYuRphwK0HKwGGuxzrI6Ksw9lWMXpkb5SlqZAt
         x9Ww==
X-Forwarded-Encrypted: i=1; AL+hErHDQsNiQB8/eN4PGfF9/swYGPU0iLwqR0WzQ5QURmWchNTBrTCnVZBjQ11DUBa/Y01bd504eYEvelFZbWohe7ck@lists.infradead.org
X-Gm-Message-State: APuU4Z8MWBNQawmat4h8RRTpYBemj8YuhPuEN2Bp02YEFsz3LcLxvbWZ
	FsMkTIfQ+1MoHDtF+Tdwobrl2kHQWUOa5vnbk/jM9O56xsYCizUBAxUQFnzm1zor08wckjKZVaQ
	mbQIj7UVoXbIjfr72Tt96mYe0vseCabx1xyxN1OHeqE1xcHX+ok1oiCkGAh+KvKbSJVVihyNKuv
	DnOQ==
X-Gm-Gg: AYBFou2EPJpdo4ok1SfUHm3usuKYswpMus3DWTBjig4pj1434HlXUjJKDjYDQeB3T6I
	MIV1nzy6CypD9/fN8KB6LRqfjcvU8okNn4KvUY2PdMGkxC2XtcQ8BPDkwORGL+UpgAWQOqwZTNU
	hATILcIEUfu4dYo5uU5TWUM2Yh3SWkAN7DNRhAdTqfuJDg26USYpTXJKEGxI0n1GhgYl/tdGmc/
	x4dIwQ1sesVGINWjKgNBtCcJrTpMFS9sKvUZ6Yosl7DhVviJxUF8HL9y7ik95+FN7ufXp3okqGY
	cRr6EWUtVJVkJPwWwGGTOmz4R1ugNPdZnYN1vjNKnoK56TE+Vd0l1+grbZcka4lGFyWiVzuBzfQ
	UXHKaoaftswtxjOAEzqL833uHnzt/9/CdKJfMpzdhLq7VFBkUHCjc507mcSy5ldzZwV5BPM7xX4
	Fm+zDJoI3oVdheXSPs1Zt97Yo+fujVKiEzRg==
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815752a34.5.1794900812722;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815734a34.5.1794900812245;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:31 -0800 (PST)
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
Subject: [PATCH v19 3/8] qcom-tgu: Add TGU driver
Date: Tue, 17 Nov 2026 15:33:00 +0800
Message-Id: <20261117073305.3854951-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX8bMEfHZtzEcD
 ZkgwWZjS7uFSoyF8xGgaqsPY9GD+Cc5qfKthd4rdgCnBaUT214PiR1r1t5D6E4Y2ycZLP7easjv
 wNUNlC4aWNh/6X4MGbkecO8BwwkKi7N/LtCIDbdzk+oK2JSuFiWRgE57fh7EnURxgFC3dwJNImq
 F6VPlvIZ5lR4ZDDhj41484YusVfLTATBynBCml4S9Ks0BufG8/M92kvApfr6gBbIClFFb4jE8sL
 hn6iC8t11LhspkUBbdNYHhjco0pAfVWkoeu8fgjWBFXSZouC/YzFIOATJ/OKqH+cyRTZLOjSyje
 Zy0Ob0pMVhda9PWupZeK1lMQvZ8Wyi9czH/H1meOvsTSyKo/0kihFvDC23NqPN9YN/E+T3VQ5df
 YlYc/6v/mIEuGwjVN3hB+WcQbou54aEzTT7XHMjNJIoChm/EEJLdKK4nyJu68whVctyq7VCEkuj
 bwIxxUkbEzYwLH3vAyQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc034d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=Rd-eziGjFw8r9s-5bI8A:9
 a=EyFUmsFV_t8cxB2kMr4A:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: CO2DIGwxe4de8lOnsdXAAxCVZISkk187
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX/nvqY4iYLHS0
 UqH3FelvLBY/6IJHKtBVi1fuv9V7dZv978EcSyJ2czNSFp8c29nQ6ewF58FGfPlr31iSyLe9lMg
 Gee9bSUTzDmjd5lvOSDFs0Uf2ymjh34=
X-Proofpoint-GUID: CO2DIGwxe4de8lOnsdXAAxCVZISkk187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233334_883237_D27126FF 
X-CRM114-Status: GOOD (  30.09  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  31 +++
 8 files changed, 270 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..798a0e51e27a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..d7598cdb09f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23270,6 +23270,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARE TRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..f37edcf34e0d 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-$(CONFIG_QCOM_TGU)		+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..5bae46db4f8c
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t tgu_enable_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* tgu_enable_store - Enable or disable the Trigger Generation Unit (TGU). */
+static ssize_t tgu_enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in tgu_enable_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..c6426b4e3617
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1


