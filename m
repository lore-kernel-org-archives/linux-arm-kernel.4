Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8726606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EWTloEC/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UG/3PIom;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C72wu/ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=; b=EWTloEC/HDtPUV
	1GT9Do1E7UVSEuxOdc1RrwIjHtWQWNYmYJ/iI5qaSjsX6W8u+UoYPIHTmAnLYi3aYVzPH8PaT8XB/
	7gxjwtU9Iy6fkd7+Tu++iRKsldWSoSxCYMFxnf9v1p8HjeLBqiPxWLEjcx8rIlUIOy4T4LmHgBulS
	1+90MUj+1kGdr8cs+sapuX2x5rRYMGW5WWgcfoY4qp4NXd+fcx3UJkh9KmeRkboEzL2NA0AwA+OEp
	n3hc7HwvhKN6DuEZ8LOqzsaWrriE/rLH+K/Om5FeMqLv49SPKG9zajQRDXnczbS7lZ5ewKRVVY4Qv
	/ACy9mqaErOlTG/5a/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIX-0000000DxhF-03I8;
	Fri, 20 Nov 2026 03:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIN-0000000Dxbi-1wbE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:28:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK2Fchf4127930
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=; b=UG/3PIomUZw1QgmQ
	2JypOl3atKYJo/HQ5/yN1Yr0Hgvlr9jfL7swNYMVoAwe1XANESLIx0Anl64Qw676
	U7E9jwiXqngu9GCuezfxVzelJvx3uMuCW8cixWk7gTOXYbCX01g0xqQhexI5vWmu
	96Y5yX363DTqhC255/aLx79cAG0UR6r6tx9pnKljyqqKPNkExhp9QsGsM/NVzAjv
	iyCiPl6/5kwmuAHZsDtHhBF3Ug2IFgE2qlByqSLmgq8t+kQAY6b1t225USZxiAZ5
	bCKKG14YYpEtQCVY4QghPdCCgA7zwVfCp0z4/gYDWni1hlKKftUCbF49inkj/WD6
	qU4cow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyhknt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde4c0c3965so794110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145293; x=1795750093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=;
        b=C72wu/lltSdT04qn2FmCsnt1tuGH5dccdsqmZiv6C9dEyv7/lfnfZYAnp9X2SRn//z
         cugGR6HNvu29TEcyC+P36SJvc+/xIsiN8F/2v0F7E04lOhhiVsDpTyG7Sg37gBznT8zF
         oB1sCCSNDR+nbbm4RIaer2s27IZpJlwjf350s07g9bPSGS7pg9CHz5dQqcxcju17qz1P
         xuxA4ML6CaUQsmMvJhPmaYOleXLob26VsA9d9QJ9DDHKON7hzb5T66Dms042CPitMpmx
         IYWIAwUG2nw3vH6RlirAGjlXcTgwzIarLxL7GI4eYOGoI/wwmc8f6YxDQ+eNa70+8oPX
         y7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145293; x=1795750093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDApSdN+8EuN85ag439ueqhb0yG1hIULhNUDMTTYO8Y=;
        b=SurSC27hoO3TqDoI/vmFiy5JfuulXzuIiH2kTcyl41NySkPF542s8MK7fN2FX0cgj2
         7QvpbjDKL8JmjPvcU51iBIIiMNFITxjVj6rtGdU9HYq3YDRc223iPlKdzBOWAu7busgc
         CW3Ab81C8OgwgziPAEBWJoqlD2pJdiSpA5mymj4Er4J4iW0zS3JyE2KPCUEX5+0ysyuc
         yvcj76CG+5+Odo1e2WyJTKF2Iwy0kO98P6XDbmxwqBbBwGtVVv3nLA0FyGiULfXUa82N
         U5EA+WIgihhKQEzBDYHlzAWgXjLxP0j9378+Y2ZhFz73C6Q2jysnZKymSIfMW6AweLik
         b3GQ==
X-Forwarded-Encrypted: i=1; AL+hErFTkyfNbtU6dJkfGZqKImijtXGPCt4a5iNObCS5IgEryZbplQCer4XKRFTSY4/TWqymaRjbPPbnlhN/Z75KcOQP@lists.infradead.org
X-Gm-Message-State: APuU4Z+0wF7WnrAV8Ji07M8OBUNfA/qDmQS2UnJIzMIJ1J+QS6j6MnzW
	JZd2xfHdk5zmszV5Qxayzd9LO9LVy9/FM44QpJCJpQI5934cZICPmV2pmdhYpppOnVbcjOmiixv
	3CMUVxVujw28SflVbgQyvk+8clRdZ4lofwPis7PnG/7Nkh2QdPAV15DJ3SJTxkuLHrLBHHyc52+
	8lvW5tVaolD938
X-Gm-Gg: AZFdTZelXpzufl9avBR13GiWB8FD3uFDr6TmYWuC0EtZlNuwht0SmcWrc1f5a4AhAyI
	f1dJjPdPKDLRQDda5+J0uHiec5y+lzTu4J6ZclKqaTRLTRoPFO3s4I+j8Kmu03l3CW7pFY7q9OA
	2PChkar4pujeCBnzjVP+tBrm1raLF0g6JqE6Z7joT831fNLOOVF3iJcBxUl4STHwI7SGnRhbITR
	954WEsAFgVMXQAYopb78Wjz3kbU1CdGMbUSG2oiwWR0Y/ne7Ow6TP/FA9k2Rsh2zHcmIw0zWBqZ
	7ezokXLIbjwR5OTRcQLrrPmao7Sbujq5d6QqNvn8lwut+XxY9YhIZPX4vBr3v386gFxkSWFRFcA
	k+773ohjFqxit9XSQdlXCWlntX2tk5YOBJxW84bY1XkMEVuhk3hTwV7zGnvjLyCxhq1g0JnVjye
	WuGeAfYu8XsolEkng+yCUxQzLA08bNt7VeGdk=
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr948660a91.12.1795145293291;
        Thu, 19 Nov 2026 19:28:13 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr948630a91.12.1795145292735;
        Thu, 19 Nov 2026 19:28:12 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:12 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:23 +0800
Subject: [PATCH v24 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-4-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=5211;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OTMRf1Pn9VMGIYfnW832odQvxF2czWGgfodoonCNvOA=;
 b=2Re5y/pCaap/4td2K8GIq6+cuCrhkc1nJLmJJxE90D7M/vcaA44yt9NQRzmUK3eTjH6OF2IDe
 /5nkD1Z1OHJCtNUNNAjJzdpFVsjB3Wy5acvcebYjBPEftuvUWWHfba5
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX6fT0QHEkEuBH
 1R2+yeL0sFUxQ5SrHttnO9aEXvuFFjvO8W6JaPH4ZpeEG2PersIaEfUMn+IIyh3pEso+Tu0qhvh
 urWKIaylX3obkrkXtktlqMxDT3BtYkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXxtzaLg0vE7SZ
 QvmfJMAvfZo0V/EPkSe/fxOIRsbj7rXVK7QduqWf+wZEh3PNFt8KhS+MCBE8KQox3kLm+VVhB6H
 niXgKGWjlhCOea9xhFHtgTC1dGOLOFl6owgEZ+CvjOsI2NG1iLJk8fS29+uuxKx6+QpV7ogPFAt
 BCNeuF5n+/f0WcDPScsn5YACh7rGTBylor4UVay3p/tL+WfqgxX5cacr1+/CyYR0DkvYoFG4poG
 yC2DUQFvOffy1lWKgaTU6UeAglUVrDdOQY1LBOTmsE6RJJAaTiZGYi0OEs+d+TPlqtpWLilH/5I
 zXFNsGZbETeAP3HtkV5BfiN3T/zlOGxaTY4OI0j6rbN+eyTdibfy+14edV4mk2YX+4ns7N9XVi/
 yKOyij/CP/IXO48YQVIf3tJtakA/TAnocMRqOfMYoruhDAQfrtk7j2iRgUxy5qbQwmmjvYqOKLW
 f4CODmeig3g2PLeBr8Q==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6affbe4e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: TmIpCzwIulw1LbOKYmb_4OoAW4JcLf6C
X-Proofpoint-GUID: TmIpCzwIulw1LbOKYmb_4OoAW4JcLf6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192815_633229_745628CD 
X-CRM114-Status: GOOD (  16.98  )
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
index 917f88ccc00c..e94bd74e7c08 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -264,6 +264,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @etr_buf_nodes: Array of the nodes of @etr_buf_list, allocated at once.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -296,6 +297,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node	*etr_buf_nodes;
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


