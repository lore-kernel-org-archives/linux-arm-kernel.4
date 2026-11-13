Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940D606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IBYu1lLU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPNcGjWi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=; b=IBYu1lLUUkNm3s
	z3qSEO95HxXaQzKloWBnFjh4A5gAEUbful9OtbzsCfZVd/aE+ZRQqX2atxU3B6DxC7GA5SiVooGZm
	Rk8QTpFQ2Nben41g4hhlE5G7O3NQOEIFc8JpqcSxFzZsRmKWdWK/molK8k9GQc7hWxnCh4T0LTCrc
	9V/TAkHJULvTGyG83vDip9UoE+32jJH0Jijbv/TOMKD2aalRZVDdJJJjSImJ8jRPwKXMY7dpkYHGK
	zCsZJHzvH6+erVR6t7djW04KW1tmmqYM6VrW3pxiOjI49m2WAYdpSQ8Q84goXmqB6XOrUhfZEkuU/
	T2ZO6dLF+kMxdNSjrbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNa-0000000BWH0-20p3;
	Fri, 13 Nov 2026 02:51:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNW-0000000BWFk-1xqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:51:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KGu82179923
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KAm4KdCobwm
	m9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=; b=TRm8Iud5RorwuCOokFLouWVyGe3
	Ejs+Jnao3FEeMq/+YD3a7koXGzo7gI15ccwJDb9zzJYZCqWBEdgZJpDIQhrj45tK
	qfrsakbsc95Q7VxRdk+5brGdS/nCTta+FPpd+t6//L/rFTsL96U/A2+wQY5+DdCg
	PR47ghjCkso5U7xQJCz6rVisqqvQMaO6UnEhE57511zAvsCfv09P0rciTjSauNIw
	VRaGkQZN8SMWql4lV1Z+PIzgDLLLr7WSyyT4U1FkuMxgNtgSxwebxXJKcIwxq6Gm
	ma04+sdvrNWNt3RdhoqQXjWaQkeGkYOVS0+ptiYokmNXkCNYjSmZ4BJcvVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yum9qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:51:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee04c49451so8013125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538261; x=1795143061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=aPNcGjWiT1TJspj9s/7/JjJS+haa1LPMrdx4iUxydADs5m+xbH4NQenIzqDnDN+lED
         VcGDlgmS9g3BAbL05hvEMIPr/sgs4VTs+8qFqpEcSevSLBS1uqXiihMQgufU02ikJz6n
         rPsdKoIOlqXNm2uyfrtL9l1s+I9fZ8vsmugVIGMFJy2VFIVHWBUNnuG5xGDhfWfUEcYl
         urYtXbf2wH1RtPb4aS6M6DrxenCcvk1rcbC8GkNEguNW1QLLszYm7PgQ6XiL5tjVp5z7
         0SqyiXd8QTUlBF4qNCvi3k3UTWcCgCNxNdn6wNWO1gfTrCMZZa6X288cGuoDFE03mjTd
         0aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538261; x=1795143061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=Le5+qWzyWm1yVONeMYKBT3d9ni6Fr5ZvGGjQVH5G0Aquuye5104HmmP/KJlpblQdSM
         mdy/WvDBZHbXVr+fnEde5YD/xcnDrXNltj5120SCbACoAFJFb/8WAAZn0UXqgmcIFTP1
         5plLRY9cEzS6wXtM4ruiKxLUqsrgTE6QX57GNgG8027Q74zhAXFKi0XBT1fdyxpXVTS6
         PNJQOiI5tDbUy9nXYr6rrLzKfdk7TKJ6/iBJM7QMi3SQhV2W8oNn42PrMbdPprNJOBAE
         yjba9voiDKAXarc3c4FlLB3xyIndbV+aVerI0eiG/NSw8yz0FnsTtMVdq3UFfTFn7rTS
         Cizw==
X-Forwarded-Encrypted: i=1; AL+hErHrQfiNxc/8tP34dswUh180R/kQGiVWCGGzzevYknAzOSlPOwrGWmHcCfjPmqos7nDP2H4/jmBmpYG7oI/NM9qZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+JZXMwnaqjxbrFqnWCr7ytXeNAJUKuHVoUQxAzs78cR2JdG3ET
	a5eAXotI2UZoYGmuDqK2LxkkfoXBGA821Gr/TL/Pz9rOwfcZfHzWmbOlDJ2t1IEgKzn/Nq3m6Zp
	Pmf9O3sxVUF1njeDbIv7LwQ6gfyizUUdMitE+tMybazp7KDwH8+WC2mPzwmlL1Oucf6ecKl5JdF
	KIHw==
X-Gm-Gg: AYBFou1WWj3hhbKX+NtZqg1VX1PriN/KAOPzRkb22sKhzidBzG7wr6LdAPV9gWr0tyQ
	2Ws0/AgXNRWXIF88BjLBi17S08b5d4uamF38UmeSblQ9XRCDs9yYLi0vKAplnv52Ji2hXQoJzxP
	Y8SvcQRCsA0QAmWvh1q7AEH2zzxxe8ETQW8jkIXn/hCwbyN6VPtdXnkA3zS/63gmZ2uZk0dUUSi
	TUA5LgqbSglZX32Zq4TPYkEI1fpunEjbTGP/nxk6TGB5uSnXk3dcTaC4pLknmtKx64W1hJKhHJ1
	OzqrhgmhgyhnWfdkMAJ3aCkZK5vhLxXpkxZcE10qOZIflLtkoGbmiKYI6/MnhTy5w/bx8Vqj8mS
	WtrhK8Wny5mtxLGxoJ/o1qPO//1eb6+WjCHaqIS0+bJKJovlxx6dey9GVG6UfWPwMpBQpGCI3Kg
	/onb51i/E=
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376815ad.29.1794538261333;
        Thu, 12 Nov 2026 18:51:01 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376575ad.29.1794538260904;
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 04/10] coresight: Move CORESIGHT_DEVID to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:29 +0800
Message-Id: <20261113024935.3173715-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mu_Pt0UXOVw868zMsvD9MSAMoArau3tL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX3TRxBULcK//F
 sm3IpyZDP1YM6zPmgVVyXHpoIVrWkdBmWdv6moeZfEgwY2HPFJqP3VztFSOwLHlE8dfD8/zf59w
 v1s/LxzHKokXWIAxM2IGOh7x9A8kSiY=
X-Proofpoint-ORIG-GUID: Mu_Pt0UXOVw868zMsvD9MSAMoArau3tL
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af67b16 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=cS2XUTlU7a9WQml4CrUA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX0DcQg5tmmBlU
 d2gsFAto9sd6fU1UbuaaRFGEU0zPsZhFPnB1yXrTkTdAmDMEjWTxhoAq2IqwO0xhiBRpUjNl6fR
 psFD7qVXaOnLTaUFLcmYT2n8q4ja6q+sUzStQxZftro2xTLeFjYO6SZr9sbBHxTarfd7Mocyikt
 TZVYhEcpgT3y8v3PxqiteYGPEFiUvJqsTnHXwPodFcJKJt7W7/JxgLIgKP1sYF5CgCaOAmlh1sx
 sGc/VeGbUE0IImjeqznz251r6S4uGndEIm18M76a0NGxaW5a7P8qWW/hoN0DmX9Grb+c/jh2zPu
 eUqBJtKYnCEVRJ7av7HEw3mrka83/7/549qonbWz0ks1j31w+GXGvTMkxmg3aXW/V/Zv1EwJbn/
 B1gwAl7PHiw7lF9HKpkudgzciFDgZU+upXgZQ94AfhQHy2fjaz28d5dQVcrCUiP5yLGUs/Cg6R+
 MVQTZlPaufSaOxorueg==
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
X-CRM114-CacheID: sfid-20261112_185103_444431_203E7AC5 
X-CRM114-Status: GOOD (  15.42  )
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

CORESIGHT_DEVID lives at a fixed, architecturally-defined offset
(0xfc8) within the generic CoreSight management register block, which
is also present on non-CoreSight-labelled components that follow the
same convention (e.g. the Qualcomm TGU). Keeping it private to
coresight-priv.h forces such drivers to redefine the same constant
under a different name instead of reusing it, as already done for
CORESIGHT_LAR/CS_LOCK/CS_UNLOCK.

Move CORESIGHT_DEVID into the public include/linux/coresight.h so it
can be shared outside of drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 1 -
 include/linux/coresight.h                    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 0d3f6229b282..a28b89d43291 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -26,7 +26,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
 
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 0168f6abffaf..5286b3606581 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -36,6 +36,7 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_DEVID		0xfc8
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1


