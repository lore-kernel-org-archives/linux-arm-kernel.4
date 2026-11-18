Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F7606A886
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZih9zV2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/ZWmvr3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQXFmb2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=RZih9zV2Qo0CTy
	61S8rKHsDSTpc7pwMeAhTPmtyUFfGv7pzXGKsF4y4OMFf5L7GpYuO9NAN6ujjeNN6HxEZkrEo4qVy
	AWTM2JmYlLL3h/5P+iYhe4tHtHNwfOmjchvYjCVH1uyiXKBOgVKIsOu9Pgj/U1fMeU2ArnTu3scDQ
	H+iQWML/egdPPVZRlsURxww1YYhLhI4xFrcr2IUsqoTkPkgYFWJV+tY18RZwn3MOoMg8sy2JVlx7u
	81VpZI/84bxhXBJaEHFmiXU2KlWsY3AnBuHKCWXUInNi8PJa0S/xhE8cqF965SzGlqZT9dW5b9gjC
	u4184hjVLyjNEHon95EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadX-000000085Zt-2ug4;
	Wed, 18 Nov 2026 08:03:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadM-000000085Ta-2Ycg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:03:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0WD2453700
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=F/ZWmvr3gHLaB7aC
	7taq5Brrls522PG+6WBczD3ri0pnjtCBxnfk63qHq5myOEijLIuARX6fyO5Z87+9
	/XPVeoNYYElacKxCvEbyzVcYf/HylsIEQbsg2LkjK3zLyTI7imBlZjMNA0iz3p7X
	32aRkV7zwv2GSXYOriba94kpwbGiNNNEywxJoou9q0lCJlz8l38z7WPGVNJ+GJ2r
	PkUyHssenkV5KhuMpmZ5g9fcpVyifRe+F8iHqz2xpvP8kzX1OLSO+mszD/ApbkhU
	+3kWk4AZWtgqxXAgn/y0D/tBzVJYuTvuW+gc6CsTm+dhssVL+/v48tYM6Y2sZBDf
	ye4dKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99wjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso792463a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988990; x=1795593790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=LQXFmb2fOhUxvYjbsZX8zRrVwQ2CMbGTO5nfuZlpCY5G+m0lUrpKxzKEYRPorpX/sP
         g/+hwdKTDLcmWn5zQBWj2FXGlUptnMPq/f0Kj1DK4lxuVhiWEQKf3vIIk9SUOjCOL7tD
         TO5EMtrP8HDiQFDCaTHTs57yuRovGJU+cckGLLxT/lqzX6k24gXaQUVbsM+qJsQuyk+H
         Fe9DpIvIw38BnGy+IYBIHgmpKFdmOSU/ZNnvM+9wcIDCwBAaOz5k/xVIGZPxkAGOGHgX
         xho0/XSUEgl88tkRsR6w/BmaSJBbvbwzJBz+/pA3QB3ut6amjGxVdwxIGr4UXMfURiZu
         2/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988990; x=1795593790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=eAiLGucaOUclu2fev0oPM8qXckv0oEOy4wbjxWUoBiSlDDEM+E+FDIJzSNIfZbxIGE
         OXBmsB0AsZ+u/UBL8hpgAhT4W0LivDiNKs4+Q0WkTQ/TKa6Bc6X90Zl6uf3bonDqsXU0
         gQAocshLdqzN/5nJkgdsVryGV5SZkSUS5Czd/sLZT/8jxUzXDk8AGbaNrKVTMnjChVbK
         B1EH35TZiYEykm5ZQpdkGc4+ZkaGqAOMUnZHLsd5/xybo0zUxluN1GfcmJ1exLmysvi9
         yOtoNUtznLy4GnkBjZVTc44WtT3DMOO5i3JhP9ZztdizpGA7tnRR1eMmfGjHy0esW4u0
         3oNQ==
X-Forwarded-Encrypted: i=1; AL+hErHaBaICo4nHu7c1JFMP4g95qL2qLWL2Y7p3Cj/7Jy8ORRsnM2p6bmmQerO9AEITQdO+yXLPwsByyhbfja6OftAE@lists.infradead.org
X-Gm-Message-State: APuU4Z/bJQMdxG4/dlEMLcZew5HoCXSYyzw688aozZ7CK/QXxiTCbEx3
	9dYQxXK74Ew8TsC8rUsknO2JNuyEbEKevbOoRCQZdQer5CIpr/Q1nClhCzkOOhgzHcAssqyg14l
	t9h3JWDHRWEWkJ2J0qz4tXu7kaEGM/XzG78kDxMfppPpQgx30c6wlLuEEnZvOCARqFwoxCwu9FC
	viIg==
X-Gm-Gg: AZFdTZdBG9KT55upQFcZRmNEcYsAkG1I8pn4Wo6gyc0SZiqUjlHmZROUwWHTl3Rzgtl
	dwwg5l1DictKiU3enOOvmZGjccadC+EQv2Q4HGwcfaAd4vDFZEzCXqw/swT70m2QPJ5i8VrnWv3
	CzblfqCXxPrqZgmPH0B25zNJLq2fhITXxKT6evO8I9lCJFjjk+HOi+NUlwJ8HkrejCfxSyLcWZb
	SdxdNkODfWESt+rYN5xfSWJb1G+jUnLL+6qpf1oz0YPqJOu2sUCMl5JaUh/1fhcP2luZctiLY1G
	geTm17I8VLb18rJrpKL/7Grw197PFA73LCAgrtLLCpQMJSKo2GaEb1HVHQ5aZkO9lN8SbY6VtsJ
	cqxhT0CW8f7mWgGAzPZxY9Eac27KXFWs7X1ywxwWuTAKdtLs/zlnRJVy37vZk8FutYmkAVtyrJq
	VHMpQbNPKz89D6l390pbVkSguhz+IboFH2zJ/i
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112408a91.51.1794988990408;
        Wed, 18 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112376a91.51.1794988989891;
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:25 +0800
Subject: [PATCH v23 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-4-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kOuLu8kjSDywN8FMrbAJZo7tMeThc9NJkXQ4XuLTGHWV4dUYOTk8r3WOkWc/BDLS7Mkb1lkQv
 jZExQ9Tf66VBq/jdoW9DQNg9+tY1FPahJTztA6bzr3YMcUoozC7pI9a
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXwuMg77e5DLOb
 NzdRueQhXXmlgVN61A6AerCzXEhptlQ3IKe+i7bHWzeXg54Eo/+q1FGVAU3NCTdz68C0aNlyy+n
 H/x+luvMGjw85DpgPG0a5WVyeb5EjUM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5bbf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXxfiRJxhgJofg
 k9o5mt4VGkZkgkO1d/2i4d9rY7y66QvrwdrK2GyehTZHXayEsomV9GIA7R+tBe+kAKpASyjBUv2
 DNcOYTUO4bF3PsPmgrGiDqmHOwN7B4k+xv5RKdSm1yC1JkK32BD4IZzdVhsBiMHgsSfaecyohNi
 Yi9afI0x//0jkwZI6mo7kS5spkyUcp3BaGwYUXKnZesHX9B2N30DVtzEjYAXZLMYHDyKVbE/i+S
 sWaP3tAOmi+gnhKlPmwlJLTXedRiiq9NV7eSG9zrcOkRKzug1NOMyP5MJEbqmOeJyR1UpbDcvdJ
 91DsExWj463XtkG8Gi1zOOeJ87215lpvAnAbiQIVovII/+u37D+55cTbB89NxBxjIMebRSEiVJg
 yi6ShUCuBaN8MVdDKBg2m447Y/AaHnZ9qwpjP7QYH+bkwqv8Qy64mRcXYyfujBg9qR8DgMkFwsi
 YSzt/hb7hy7o+Wz1+Ig==
X-Proofpoint-ORIG-GUID: ShW8zfHIbl1ZfGXzlc6oJtSb8gqcwRtJ
X-Proofpoint-GUID: ShW8zfHIbl1ZfGXzlc6oJtSb8gqcwRtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000312_782756_60245E06 
X-CRM114-Status: GOOD (  17.76  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


