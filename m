Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LVk1iCKv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oJZPqLYq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHMBTSRE;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jr2T8Sgt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=; b=LVk1iCKvflIGVJ
	mriC2gQJfD+Zu5pE4M6hK7vP9XPUzdCs2ZeqN96E0SPG0f4on2sWf1gPS6FGD0YPkp4WkuR8qgh3e
	G64yEJeleJ+RENasHrZ9ZKWLi14ZVt1/d6SWqpU9T34buFcHpf+mkK0vMXI2UZQSElDIhEzgznCAi
	Z3YWDltRkmniq2CJAOSvW7b0rlPWLTB5y2lmqIlQDkbLzk45fwFW3XKpiMBoQxEwRMytM6hXFogJ5
	mI+IsWXw4eLwLcBFIuJ75+eaI6AHd5ckTUB4MJo3IERk/Nfpv0OURsNx9bmgkMSNgbf1JDdP62wV4
	CDpR9AR545+ksgejcQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy2U-0000000BK52-3CbH;
	Thu, 19 Nov 2026 09:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy23-0000000BJsE-1ZnE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Nov 2026 09:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=; b=oJZPqLYqGMUCLxLi+gVqzRWDJP
	BV+UJFfFUmHwjWY48foInhCtPDjv7oARDjGHGvnuEKua/kz2sh+raGTQijlb5/mZ00ci5mHWlt4Gc
	5n4Jp+LNH7Z41S7hoz5eZgPqeeyyEsoxHqTZpp/vAi5e8Gzei2y+aICAE7XnPXeswAfBHcP0bUeOn
	e/W7XrbBzkG4EJV2COIvBaqnh0T4YZl3+LIc1o+bbIo8lcMp2MXIe2/mRCiCwh6/Cfzf0XbUa5jzW
	gFV4yrH7fsgGioSv9nc2MnWK2MoW3HWKvhp+myNAgwF95VyBKEG2cWwiWNqm5Ec+vLsSXYBUB1/pK
	tHcYfcGA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1y-0000000H1ei-3qpM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:02:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZeWo3717923
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=; b=FHMBTSREr5mIO08y
	yQCkB9UucDuKOw7ofazDrvbyicvSwW4qnmm7x8TKXlpP0CX0h95+UjWhVt2lZIgw
	hPsrGjz0bBUXHYIsJ3DW/8dkj0Z80HdGQQr9QxQAvMfLZPLql+VL95anmr+L3Y0Z
	3G8lobjAlD6aY5bsC/Bk8J4c5dpUG4MUTOSocX+p5BZXyvrg4CFjf3kdIt4Dxccd
	QO0QYfgFqJ9KUE66m8+O9usOzzSNm2mulU6ZarKfzVLqu3cHdKdpdVzus/ie1z6O
	TKmalLkWDZ2h7i4Euy+hTGzARxNHINGfAjxtJhkY/VAJ++0Oka2eEDwhdfuIekWL
	y7hRZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rc8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:02:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so1652851a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078928; x=1795683728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=;
        b=Jr2T8SgttKHNtcLkOpsJCP8chZQ01gEpqMfhc6RBvvqYjpsYS+lOCtuxagyxMm83rC
         07oRxfP+eQFxX1apC60LTY0oqIKh8+NiqxCgzjrGSv7A4llwf2UUct5IEsinWzg+/JBH
         qx13mfdpplcLPpP29SQLdGfQMg7BKj6HsKcGL50SfJ1sV88SXBxC6TWT5O+CRBoPVxwR
         L/ub33S2RzKoyuG5Ik48q9+Ev74Iz09Uwq49j0ad5BYSgZ3OAZO5w80fDGtEkV/ZS9JQ
         jljWLZV9YoB+flRP+eTK6+QSWUep43irlpz3ahU9tKmLPTJvWNw2qSbpWb8GdXR4iS0y
         FAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078928; x=1795683728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=;
        b=zBU3GQj4eyJwkZM1OwZaQcJtF9pV5rnWM8vUrzLy/MO6OYKx7UuLXVm1VySwzfVFnt
         D3OKT5KnytNxTtLQ20gtVCEkBfJoEwjISjV7UjBIJmXcpSpYNaKLYz3Sotheyj3K4+Y2
         Mx+SMWlm/MAs8h+ZeAS+a829KSRz3HpucQ36+bf+EEyhQh3Pft0EuE+zKpnbM4y2xtYv
         M9WQbqTYGcqLeZSlRJlld+7GheoixS/oBz+/OZ8OJfXLwaVCxb5YSQmqZei39Or/IKLs
         ybYeDhpmObvKZkBxjo8OMFN7ZyXnY/xY5cqDHTyl46ivXHO27HZJc1efUdMuf8h9Tkf0
         Af7Q==
X-Forwarded-Encrypted: i=1; AL+hErHn35OfdkthME8dsAN04SqmENhAP8rO9WCsm4wtSLB+VlT/oMEWQtw0OW0jIgnHCewWu4q6np6s6F8LPEV2M1rv@lists.infradead.org
X-Gm-Message-State: APuU4Z9EM+tn5BYBEk7Zgb5bJ5odimSTT7GLrXCp+cDw8MKL7MIIerzq
	GGo5IJzubdswdoB9BHNbhZoRhXm/sevrLzuOgNL28NxSO2LhmsUV30N5LCp8tnxo4hHqyzpxfTu
	eO3GSOv27rygGh9I2aLsD5ytclXnRyxrKQEGleLFDWqElYO+H8eOHWVTJINTS1vt9u6bWH4Lc5n
	K6Zhba6NxURNzE
X-Gm-Gg: AZFdTZcbkQgFqHgmJqqVH9DQks4NJQ/9xyl0iKZPFB7K5LBf/bSaSbcdDf+/7RDNvZO
	CdA3sGR+S10r2bbZXQEUZ+FnuE4mH3n0EVQwkvWZ1l+jI9xJsx8O2WAAqTm+Ach0fUzY8zb6aVh
	XfmrYs9KHp4dHF2MhxKaXoh209idkOE/yUt08/Gg83BosK1Tf8sYLA10C//soyCUaezcUom+3DL
	Obi2V3PKpztkwaR0QNtK4ny6Qcj6UMjhOFPDGVRz9lORu0KajXxIx67wcFjGx1jfvYzR4ogN3Fz
	WC/5erm7I2280y35xchjXzS4CYSsBweZX5E9ZIi+w6FROdSYedBCpQshqBN4WJGYTDCP4hzoqQ8
	1pPlBaIUmHzzg9GHew+eVW7ULp6h+nCpUJWtqVbTOuZaSfRI6TEfFZUVGkEdRm2Z/Ynuxi4FSLw
	BtbzKXBTVNPKGsPx2lLMi/KO39HP2/sI0hqdx9
X-Received: by 2002:a17:90b:1fcd:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b3d07d46c4mr4499493a91.45.1795078927796;
        Thu, 19 Nov 2026 01:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b3d07d46c4mr4499443a91.45.1795078927185;
        Thu, 19 Nov 2026 01:02:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:02:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:18 +0800
Subject: [PATCH RFC 5/6] dt-bindings: arm: qcom: add QDCP TMC ETR sink
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-5-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=4416;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jelgm6FkXlnlRRjcFxO5QXgSIFxo3R/qeZJuul5NPmU=;
 b=0KFbQ+RRcWK7I6gRJBRP5aZwm2CzM0bIde4M/8osVHP1eD3kVpIaqXjnI02wJDCJ/sUD2hnFJ
 34ql7byF+BcDB47Dh/BPtxQaDQ3l/n3zIQUjA/VlM0otvD7y/YO6xyW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: KVM6GZ-zHWMoJWT2gQqIspM6hLjeam5h
X-Proofpoint-ORIG-GUID: KVM6GZ-zHWMoJWT2gQqIspM6hLjeam5h
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afebb10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=v8kvHvLVYYS7D221HvgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXwFNzivEvDy/d
 BOPYMKRiyTK5iUfVuYf1Q415oGiarAES3ICldTzWXbaCg/31WT8NM17VaQHjCd2fXS5qM2LmY0s
 ct+v4Z6+AMQ3OmZhX6cegdbBBZThqAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX5ygkLmeTqAri
 Juo/uZHv8kgVBXYOaqwF2t7J0hBCfpAn4D4n2BI/TJtwjoWm+wjo5f9vC6gykJfg/FEvwHUE/aI
 /P0igMIy9v51skfTVK5dTW2xkd3FseluFhtxz6lSnm2owpvR8tLW5nfvOoaoPt8aeEqIXy2NSsc
 ZNn1Fh3GizENIvgnQziwZAezIC1S/VTniw+YQjBtsK6HFboKouEEj96pUN0lJ72NAzs3UptyX4L
 IUzlg+g2aNS4PkbGCn3YJtWoZTWvXO7lRRQMPMyQB4rsI7gV8S2H73c+UVOSpwbiMCGCvNfV2x6
 dweYDDHRohsSF1b/4mdM/QY1rX1Ykq37dAAhskoalkuabgN5RX4EhWdBvzrN74zc8lyESJ94G8b
 407o79k4n/2LFs/NnUi73FifkT/8D2GvNrq2WOj3JPf/1/XKhuL9MR7tO27JTTYA/kLStqNhaYY
 Rk5OslnESUDwPXd81tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090211_828258_C5633C44 
X-CRM114-Status: GOOD (  20.67  )
X-Spam-Score: -0.9 (/)
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

Document the Qualcomm QDCP-backed CoreSight TMC-ETR sink, a Trace
Memory Controller (TMC) configured as an Embedded Trace Router (ETR).

Linux owns the ETR trace buffer allocation and sysfs lifetime as usual;
only the TMC control registers are owned by Qualcomm Embedded
Co-Processor (QECP) firmware. The qcom,qdcp phandle identifies the
Qualcomm Debug Control Protocol (QDCP) firmware provider used for
buffer handoff and TMC enable/disable, and qcom,qdcp-tmc-id identifies
this TMC instance in QDCP transactions.

Firmware also controls the block's clocks and power, so the binding has
no clocks or power-domains properties. The input port must have an
endpoint so the sink can be connected to a trace source.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tmc-qdcp.yaml      | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml
new file mode 100644
index 000000000000..03a9dc18f13b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tmc-qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDCP-backed CoreSight TMC-ETR sink
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  On Qualcomm platforms where a Trace Memory Controller configured as an
+  Embedded Trace Router (TMC-ETR) is owned by QECP firmware, the AP cannot
+  map or program the TMC control registers directly. This binding describes
+  such a firmware-owned TMC-ETR sink.
+
+  Linux still allocates and owns the ETR trace buffer using the normal
+  CoreSight sysfs buffer lifetime. The allocated buffer address and size are
+  handed off to QECP firmware over the Qualcomm Debug Control Protocol
+  (QDCP), referenced through the "qcom,qdcp" phandle, which enables and
+  disables the firmware-owned TMC and synchronizes read/write pointers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,coresight-tmc-qdcp
+  required:
+    - compatible
+
+properties:
+  compatible:
+    const: qcom,coresight-tmc-qdcp
+
+  qcom,qdcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the specific "connection-N" child node of the QDCP
+      provider (see qcom,qdcp.yaml) that owns this TMC-ETR's control
+      registers and services the firmware buffer handoff and enable/disable
+      transactions. This must reference the connection child node
+      directly, not the top-level QDCP provider node itself.
+
+  qcom,qdcp-tmc-id:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      QECP firmware identifier for this TMC-ETR, used to address it in QDCP
+      transactions.
+
+  arm,scatter-gather:
+    type: boolean
+    description:
+      Indicates that the TMC-ETR can safely use the SG mode on this system.
+
+  arm,max-burst-size:
+    description:
+      The maximum burst size initiated by TMC on the AXI master interface.
+      The burst size can be in the range [0..15], the setting supports one
+      data transfer per burst up to a maximum of 16 data transfers per burst.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Input connection from the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+        required:
+          - endpoint
+
+    required:
+      - port
+
+required:
+  - compatible
+  - qcom,qdcp
+  - qcom,qdcp-tmc-id
+  - in-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    etr_qdcp: etr-qdcp {
+        compatible = "qcom,coresight-tmc-qdcp";
+
+        qcom,qdcp = <&qdcp_coresight>;
+        qcom,qdcp-tmc-id = /bits/ 64 <0>;
+
+        in-ports {
+            port {
+                etr_qdcp_in_stm: endpoint {
+                    remote-endpoint = <&stm_out_etr_qdcp>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


