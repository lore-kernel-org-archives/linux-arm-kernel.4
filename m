Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A23606A683
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OwkAa7VI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsMCfChj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gjVeUT0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=; b=OwkAa7VI2abj4rxDOAemro/XTl
	Mw2uhKoRzLRFIXjjzcl0DnddfDJlt3SGLA95H+at7SWlB0hw/ZdIv3I7TCiPiqdkSvCLajOf0rqiU
	K2UuXf7VcnfrgB306l4ly37Q+SUHvOWH0JOsQpKUBuggYkiyHBheSEP5G1mXPg/+obSW7pB75rtWA
	TtBgZSJobpxwsPsIuzEFvnGks7/oiYslnzhuXOY+YR8NMj8DMmv0wbdlPmI60b0kSio0wDcP+SySc
	jGH6lynnN63ZIGJP5IzkQTSBXFtWQb48K1sM8Ne60aj3ijPVCGZbEuoeyrnJjjtaD4piZWjiolyds
	a+MpNJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn0D-0000000650e-1i7O;
	Tue, 24 Nov 2026 09:39:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn0A-000000064yo-05iK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:39:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Uw1d901940
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqZD3QesazR9IJo/XZx5KP
	+fhEgHwQx1ARc5PMYbTgs=; b=nsMCfChj2qcb1+DYCuLPiQs78IoS7PnG0nQ2Yk
	8dfS/ZBZyKmYx016/oU/Bsx4sIMOqbMnplpU2fnF79xfbVdfkPoypyjlU6bNinko
	nO5HPPmOK3iN7lZ1DIPaK1YOva9KDS8lOPwFNskcV5jU8aHDjDfJDK1SBPvtSmSp
	cvRltUTvieoyJM+2WQp685k/9JplnzH5J6Cs+2iKKwphsmp9TV5yVBxdh+gFNIYg
	PaVaZTUVEV6s45Ttj6pX0QkKJ801ZrDuxM/xLmWBgcVInEsgA3Gg5aDMGcfcR2C2
	5Y8ONGtDOn/1EGawnOk78HKI1KMp/8wscowXHNc6FKY0PPLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sthrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:39:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso4644115b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513188; x=1796117988; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=;
        b=gjVeUT0LeMWm7Bjl0u/4vMgwGO0rTyBHcJBTs/n7bgJHIOPhWGlOQRQL/+mi5V36/Z
         2du1roxLoVM/QsTrZ66ZImdKqKKATr3RdqjpWt94ZNeX22lYpFcSN531bYs41PRsI2QA
         eEBXLigvakdm7EvyGfaHexGqLbliHBp+M1iS6Uqg6+pZ6BG1QhQP3eM2tQajhwcGPAA+
         miHR2taoZ/ld9ZuVQWqyb8sfA2GtfxN5ZIMYc6bFabmMR/yxK1iaiJgZT3J2hLAKu1Gx
         xbz+Mt89Nrxiyx7B9OdkMewO0rk1zSHo0WjsyJcwKWwoDpPAR9PNwqSnACvwQPKMsp+5
         2sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513188; x=1796117988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=;
        b=YUVLeauNxB8gku0TAhI/TPCNuRNyr4bqCQ1H0jae918NPHAIDnlrrJR5vEsgWxU8fR
         bbGjbG08tx+OqSpjMJ7LWh0D0GH4+WSauXO8VMU6ijsQ1uWMI3biWMEMwTEMY9ZDavz1
         bib/SK3eR94RIysu71VOCB35xxn3QaWhQK1K/t/92OhphYmI67SLOTc6bC6r9Yudp6x3
         u1lUNRmrtJW8iReQwvx4KMwHgzJrsbWUdus7fBeM1l2trd9nOa1iaWjrEbhxj1j4YXaK
         rr/tiYBu9he2QZheMGrmEI2Db6uDd9pOZ3h/C+wZDhTiezI2SBjP6o/fnHcBaEfOMhL4
         FJPw==
X-Forwarded-Encrypted: i=1; AL+hErGNuLrgpc2z461Vn3KYWPSiMpgUARDOQrwszxQ3rvkzh04jOgySB3iann+ClYM6jgk/KjLvRMgJLATuweV7W5Un@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZmffDlfEvi0quxlhcQ3gNRE9+pcYLTh4E6Jx/hq0N3fx1r237
	1vRMfTewgQK87R/gF3GpIwgJrc/gws7RKitJIVYWZ8SRBMa3/tYb/wwueCZCabJOqSqrErc+nJC
	nXAE8W5SyHJQJtifLZeZmoOCudRmkE48LcTazum10Y1IxELJQy7G3We/Py4m1/VevWFKbe98zD0
	bt7Q==
X-Gm-Gg: AZFdTZdhsKBSy5k4lRHSYbtCHrXp5btK+EIKVJ2Wyue30HJz4Nas3o449aDDuoT7zcV
	QbDoh2iiIoi40aTdZxAlNWeWmamlX0Tcn7tZPDqgandfod0CithXTbaWDha1NSyBkEXd5+x62oB
	QSOWpcz8Yu/Pao6egL1qOBnhdNykNCASOWAQ8uph7FOsh4HdxIyreTSetd6kECEXC45M0OPDdg5
	KPvjiu+q9280AEs0Uae+35/gVT7XUyLSUakz/5FqGCxtASYpzkKvRtf1cEPlb0exGa0dAuka0ZA
	vDVVsHyLg5Hlyq32DQ3gTH69lgN5KD25uDKE7ApfhNFU1smvqpztKNHNhjHAlDo3kSbIXPClkY2
	rW9kgK9JO/8ag7HINf5JGqBAHYyec7WrC37hV5uliEyUKHkt2WqC//FJVjqqIFmQJ1hSjUPJei/
	/xBHccPbWBzwddvwUn5meQYoJVJr6rWU9/CsFo
X-Received: by 2002:a05:6a00:2345:b0:8ac:2c22:4b79 with SMTP id d2e1a72fcca58-8c87b4f42femr13584619b3a.18.1795513187939;
        Tue, 24 Nov 2026 01:39:47 -0800 (PST)
X-Received: by 2002:a05:6a00:2345:b0:8ac:2c22:4b79 with SMTP id d2e1a72fcca58-8c87b4f42femr13584590b3a.18.1795513187416;
        Tue, 24 Nov 2026 01:39:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:46 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add coresight nodes for the QCOM Eliza SoC
Date: Tue, 24 Nov 2026 17:39:29 +0800
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFNbBWsC/0WOQQ6DIBBFr0JYdxKgtlqu0rgYYVSSCi1QY2q8e
 7Euunw/mfdm5Ymio8Q1W3mk2SUXfAF5YtyM6AcCZwtzJdRV3IQCtBZMiJTcMGbwwVKCPkSgh/s
 gVBUqYeuzwLrhxfGM1Lvl57+3B0d6vUsmH+O/otnekFI2UE4gRzTkg4FnDB1B1zdCXQxaZVDPc
 nd3mKi8Mk0ua+ZpyXAIlODttn0BXtVZC9oAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=1179;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bWSvNuLq4UwhcNgU3WU8q46KvqQfdKWiClSimIaHvk4=;
 b=j8yfTjmD0mZ21nyFnkalgTIlZ4Cbn8RzXjtWKFtgZkwiTU96mRtX5OSIFM7FiEzhh1zP4T71T
 VcdJTqD8IcKCH+qo66PfSUYPkbuamRSO8Kj/drGHUCfsOeAAqH8BM4l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: WjtpmbMnSbqLpcoasNS6BOgrjOQvmNwO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX0somD6WuaecS
 QLZ+umDerGMZJYayqNVEPZ2ZIAe4P2gTqDC9QRDGhG/oQ9b2HVaS1HEVCN+wCjICOYfUJumIh9m
 +FHuMub6N7WXISetTdpNgF7Zn5x5mbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXyMfoqiDkhhUr
 oUZIuRK3QkGxmdV/vXZHRuU7Vd4kBw6nvo9ky5g7FoWcNUjFnXytD0kAFbxJyM7lIm3xXEFTvD7
 VOfni53NWyeP2/wJnD3VAvNZNo0onH1Fv25HPVnRSxvsbUtz0zVjGkGRkCgrhABf7GIcmk91Zjj
 l4l8gPMHGE6+Sl/DAzq93xHJkjGTS4vHNUYMH4exUai98xYS0nrAOhXadBA9TLwbOKimPV3JyEs
 GhoaqhUD4jeOxyv5FTN8kJCrlV+8/+TIsYaTQBc3D8uy83XAZYgHvstd095NV2J67Hm4spABQDB
 i7J3NYvlMZ7p+eJqNZMcA5G+u6T4djABZZEtYumx6LzCBi5B5rLJATEK9fWcnjGp/9u4ZPvHDEe
 6gXQ6Ocxoji3MF1nWj4UkRr50IAjAD4jFUMoBixBd2GGQ10stpRxWYtXH+oP7j14psGHvQo3A27
 XNm/JcXtbp8tUhgTEVA==
X-Proofpoint-ORIG-GUID: WjtpmbMnSbqLpcoasNS6BOgrjOQvmNwO
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b055b64 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pitd1UQUPAqnyXy6cy8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_013950_094536_C091AD5A 
X-CRM114-Status: GOOD (  10.24  )
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

Add DT nodes to enable
ETE/TPDM/TPDA/CTI/Funnel/STM/Replicator/ETF/ETR/dummy_source/dummy_sink/CTCU
devices on QCOM Eliza Soc.

dt-binding dependency for fixing the probe issue of the TraceNoC device.
https://lore.kernel.org/all/20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
      arm64: dts: qcom: eliza: Add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2177 ++++++++++++++++++++
 2 files changed, 2178 insertions(+)
---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20260902-add-coresight-nodes-for-eliza-44a20d730a78
prerequisite-change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca:v1
prerequisite-patch-id: 1a8b6c3c6cbeffe85cf7e9ba18047b9e7f93a059
prerequisite-patch-id: 3e735b506605c095cd5145cbbf6d05e52865b923
prerequisite-patch-id: 54676cd3a27d629eae2579b3f806765d2d2f4596
prerequisite-patch-id: 90f74c034275c8673d6c5b44692297a4899e4bfb

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


