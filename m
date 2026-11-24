Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219F606A699
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tb4FJ8bN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMYUaReo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OD4jNmRe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=Tb4FJ8bNOvBgfM
	qqG22idTTaQOzHcERis1laZnyylAD3q4GMaN2ikPkLX0PBlczzqU+FyP4CcLUSFoFoClhH/eqPyVA
	XsL4AnBO0AHZIzlgsYUFE7fliJ1sMBS6WPAkNOhpemRRUxBOJpALUtBWk9qTamzRKZyULaHdA1Yk6
	wL1ayYdVyIe5XuwGrXlS+H0Fu9Wv77HIH99CTJEVLG0APrctoptHRay/SFDFLOEQBM3zRcDWhk+8L
	nlrPEE6BzjQh1E95DHh7QDefgvBjHKgT8Rr4yf78D41aI8g+AteWgRHq0QLNUm75rBethX8CuGoVa
	jXnEXT0uyJfuy8WpxhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn0K-0000000654P-2vCb;
	Tue, 24 Nov 2026 09:40:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn0F-00000006518-0wYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:39:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8EuCj016816
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=HMYUaReo9cdZsNzQ
	8OrBLsYkEaprF00RnHQT/qGHqk1Y0sXVayAF1b0FtB03b86LLvWTT7lVDfrIdOrC
	Qe3MIeHOcXrJLBB+57fG06NFGcueSGxKbORt60ydfBSsvufEdrskcbAf944zMKO3
	GsxGEmaeAqdWNbyzXDM4Mzago6HZBrwf/aA3giSZTWOtgEE8UnRbA+AareCfdgu6
	LoLs1rksnBipB/Ov7kH1XutWtJDg/jW1q7eS9OMC23a9rrQOqociLztFtHuQll2Z
	nPvAiQyo+TzFq36gcrb+gznpoBw/T2HR+IT41Y4ED4v+HhHz3lHQRmtPaunPKQMV
	+OOVwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nu3fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:39:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89f84753b43so3224015b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513193; x=1796117993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=OD4jNmReAVvxnONAp01HH7pSg0zx8mnWQAy2pOb6KjqQ+kYKkapzgeQsDdlTnRbMxo
         br+u3FEKwuzzyyOVoi988vjVM5poM2fxrTO8c5QgS42+8byo3hSjmWw1hmsg8G7EptpW
         3RX6Tfj7Ag6H/oWjWQ1S6SgYM7OMffFS3KLThmDvy8QKgwXLGVOhbTCrODkkFrPoJ1en
         6xD1y8M+HaYfA6oyrw6OVFA094UnyzFiRVMTxhpOgrJCTMb41tIZL3dbjAor1Y6Aef2z
         GTA2k4BkUG+d5zt1yyBn5+gZsoi9f+/F4fOieMTzxQVR1cTsLHaeVfVAc6ueGrRiIF1s
         EgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513193; x=1796117993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=ino2mrdi5HeHDCY3fL/Sexud4kMtB6hgJQe+GdgJ+QjHlFOkWTfK/ascrUUlYyzerj
         dhptOsgWAuOu4GmOAFfmKVxchwbdmoCGrKXNsCP+DfwJPRd3+bN6wdHehEu6Cs+kyShQ
         i22R/u+m9zRMprDaV5CgGL4QK+H8yLtpYAofsbx7OxjxvJyRhJC8CqN68beZnXy5zU+4
         0cc8YUP3yXR77I4OVU/HLNg8bzN1uLQ/9Ku1p2H6t3Optcbf2LHuNNsrGJS7AxIm2A1y
         DerJSzrbiRiyttnmwpf8dOelbL1STRCyZOJGtEARbB8DjQfmv6BF/MuENWrgOG3vagIR
         RVQQ==
X-Forwarded-Encrypted: i=1; AL+hErF3CXUqCH0vVWOOWyzTheuV2iE7hMTrFueZfpDcpvzguJ9uWdKnnJ5R+MtHpclORifKc6Vf8ovDg0oubtNu0oSj@lists.infradead.org
X-Gm-Message-State: APuU4Z+oul7aUg9/SW5Bl95yeNrTMQViwXAyfT7i76ib0qwfAspgE+PD
	VNiECEx5xfdapo3Fi5d+WpRnpiTABX15lKOP7VqpjCsRc/Ey/10Igb2/e1ZiSc2wCHcukyTDvLa
	kQbtcKAEgP+PMIleSJ+/7qlDjUcodLtIUPyQeWnmq3MjVpWcRKRSiEqkkjQmmBa26Mqfyci4qzG
	atwA==
X-Gm-Gg: AZFdTZdvrJVyqLdB1tVbjpu4gmBrQ+J50wSt3X6xXKbhiJfRlPfTgDZdAEPsysxOhIY
	Ry1+OLOkvUuBCO5B7cQ4/5ycMiTG+Wy4iXE6ejT6UX2znt9EhQ8TPS7bqS/pisSyVz17rgy9EN0
	AT3GYUxG2I00nWGJOBpJnFi1RocrU/Eqi/dhu06XBSpUClei8/MOW2ZaigM5dY2BYl3mITx8FJs
	sYc9fus00uwwp4fTUjHGYXPYPLcrHV1eo1fY1RncLhmHVicuMmdzBQctvZcNH1YI2lLQCm+WL/8
	1ONXmZkEB9lDEACrgbeUTPJgIL8BKQ7FYfLx7KccNwS/scq6M7KUGdXmdGxQOUD+mt1YtsW3Gpg
	Ax7F1znU4k4f1IaQ2pWFgKqB4MqNfKUM6bD9TPkbMl7ycRGnASyX2wFBopi8i9mTqvnP1pZtr1m
	GUeJ+uD+Qmv0JJ9hXrJEUopGtGMBlv1mKbaC7T
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646121b3a.13.1795513193000;
        Tue, 24 Nov 2026 01:39:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646104b3a.13.1795513192553;
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:39:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-1-e1679ce78547@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=dRfjGqSHxhnzHgi1TZAY+OQfBCVEQy/3fQ65U7StJefXhciFR6Q1k190xbBweZUZY7HtVMVSQ
 Vt/7STI3v/WC6m6XfNvjS993SOWQr2GhDNk8fLGfrYPi7KgIF//XOp4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXx7XRmlYdr+UW
 t2HGiu+k2c1u8iS94EA9e+4MqCHDFCzUKHpMqYQDaZQR/nVTQkjU0wEw9KvXk7lMtz/jW7LoMZ6
 NMRWfJVtGItX/oKBg44BU5HHrcME4ZEw4HeLXJHxztInbPIiT+tlXd3G+0Q4V6tx6Vd5+YECNqF
 jc/yyvgYirXRhA1fhUkQiPACL3n2yy46di/OQ0aVPKor7DIhkzy7gDY4bKIEhYD1XXvewhjV8Dk
 nH+BFXCjxNmFX7e60AswioItKbfX+OZ1/3PUVwbNJ/ZihTWozmhwPSPfJof29Y/B4RvqdaejgH3
 bfDCuPUDZML0158z4jE1rYZW2bpBWD9va8V6y92sL6w2vPmtHZIyFV9AqCsV7S2tdvbitLPLlUJ
 CP3EfGUivl3dhySCZ2qYTVyHgJ9cml/YG9yhigZ3JPg3CrID7HYAMrmntXzpdpNN6FuRGoaz9Bi
 8EboSr76QKC/hfST1qQ==
X-Proofpoint-GUID: SAgu9VO5z6NnNV91oqbDDk9O8DZ34LjH
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b055b69 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SAgu9VO5z6NnNV91oqbDDk9O8DZ34LjH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX7LnHXAj/q7fn
 4F5oe1G0pPTfUDi3ddG1s/YS+jJ7xtui7wT7izLzv9DeKq9vm6BDAvFGo4Oo6JxwbXq2C2HarBu
 7JThVZCXu54DVPTnSVFu5zJrnKCQxQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_013956_490105_D0C1207C 
X-CRM114-Status: GOOD (  12.94  )
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

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1


