Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE960A261E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x+f3NAS/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQg3oT0a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NzhOiYV9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=; b=x+f3NAS/iVHK2asMbcPwU2x0Xe
	lyPXFm9c9tz1Y/dGUD2xKx+TgPkY+V/kN/TMU7SZAiWHQVE8o+H0sLIwj64FAzkim9pkP17HyNaEp
	YNNx98sUJLEr2xGJcO9ssFl6wQgERLo6Wbt0DAraPh/Z7LpNsjl6WvwvO7v8DSbedfU+xEp7Kfas/
	V7cTtqYq/r0ieTr8+3gLPJKSqxL2MGjVVcfSk5/NNLx/5Z68NGErZZ1DVr7pBh8eXk6XIRUdlOTdP
	g4FHXmTtMrpo72RAXMR0K8YpoKcheQ/1FykRcIbS6TV94OPoE1nie4cMIEFVUQPj8P5yZQ538dtXy
	8Kq+kI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYO-000000023pW-233G;
	Tue, 10 Nov 2026 01:21:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaYM-000000023p4-2kaa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:21:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0ivam1850064
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WsXub+WlSLzh9eajH+799I
	+X8NB1SZ3h94BczQMtqlE=; b=KQg3oT0a237529l/KSeXFiB/0ugmLHzFwHZ1Ju
	qVZLwMUPmpnOAAN9ueAb4MUiXrtCjGSsdXlR5giKsn827sKLl0WTOzcq411B4jgG
	phtu2rdlMgbejbw33+Mh0/xSnoyuSdj58qLnXdySjYjjbV7ecvdR0gjPZ/SPsX3k
	sBpnxS8kdaRFq8ApucDwHSe69JPMAj6m1QVEHPUd0vofgsMrpzv9Rh1JkmZ8kJWV
	OxbjoD6t/oGPVhmdYD2ncJRDP46Nhr+kwPslxjuAxx3T9p+NKJ5Pv7pMTTU593vt
	RLdBFaPO0htqHJuCUKFvgd2Z1FhZ+6qzj/LwCxJeGFajp5Pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5txmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:21:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb362d1f5eso14711485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273697; x=1794878497; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=;
        b=NzhOiYV9kcO69W1h/di77z75YphTcVoZi8ZlDpBNIWbkqsfy/z8L4ackQ/yxR3k2mG
         oEIWCFodPsaEmbw3Q+tewEzDzXdgtfhuW+TJTci5sMrtzEN9rajvJHXeXHqTnK6PUkHD
         0YNzIOkF2r5qftTT9BC0paaoU9C4kg3YuyrMNGNEdSswO3BZ6hvQxjD9WKGHV+gj1G9M
         32K7aQvxJmh6veiWu8s/X1Na+zjrCWNvRoFD3gxndhdW9b9yoogQHXcjdcIixnl6/+FP
         ru4C20I6Cn9aDx7ysflgYP5QF46BxKbYGyEboSBo/sArBeOxLZz7OkmGVlNdTidaKoLY
         3kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273697; x=1794878497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=;
        b=EPXIKhmSm9VPyvu03X1Yx1ZXkz9Zqroc4LxoLVweYG8gaiFk8prYcubq8FloXU+o0l
         sZSd3Ulk3UCwRQBNfli9QtUYaVF0Kdyt8TGH9qv6RxXpQgpshpQqOx2PL5whBANkbAwd
         4JMl8fRrL18RPE2JNqx+smywXl9B5F3IyiWweBa3HVvvdp894IABFo9CBmw0H8/Pzolf
         gxAe8SsAegt+d4amuzMw6f9BvRCkNcURFBtY8m7IK1+uXQeRJ3l7aT5AZx1QkAFVl8Uk
         oB3k1H+xQNuuheIWel/T3a+KgU/sua2LoBqgQLijYykWw+/OyHHcp0Jk1pgFjZFEOdKG
         Bjjg==
X-Forwarded-Encrypted: i=1; AL+hErEEwRPg3eTBgeEDBvCzqLoqbTgZpSf6bfQPRwdF21aEImTRQHCnSYwsuqv+rwZ1cbHheTDY2JrPX7vXqYNcclNB@lists.infradead.org
X-Gm-Message-State: APuU4Z+mzs5foyj3fir7izNBXWf+9YzqrrUlBMZdNyvDw/7SHYUJFJYU
	WSsLKun6DBxPx5ZSV3Y06SSyGYqMKTIAaeKdrCul1xKhgkO1Yz1L+9ETwtdkU3Xy2QIe72kujjs
	Bm0QXnluAXYvPWZ7t67FMC1qZI3JNuAlO6CXY9knFbtKx6C2FGEEo5LQEGRM3CQOZHggfo7oP49
	bxQQ==
X-Gm-Gg: AYBFou20juGE0FoFuMBTjTYiR+oZHQlcCF1PTn4NTs8a7wFvlu2z4QIzhOOiE1sMYSv
	cveRdNxa3tWQOkBqpSwD1CRzef3L0jitRc4zi7mLgk1xoIquVvCh9C5I5jNDltjs4TMm3yBDKcR
	IxeNLOj73ACZR+RzEcW8QhplYH85BtRM2l8bQxp2K24QuCLvx+DzuR39jO4/LUaHBA0DAxDd8pf
	YOwdpW2Mu3pZKBtbPrWTxAFSuEceQLCslYrPLDXZcjTeJH28qAeu0ZkKqflu36U7rJmShdkJxgK
	hPkKGbjdihi1vPYONkvJd/VkIH2fcZ2RjKJ0wfbVFzctRygeJacNVMAn0zJsrbho1StDv1zm7qC
	nhZY1n4ZALSMYEjOTj8/UiQTkkXlMVNgbvKCpf2fPIY47Lzoqumd7sglQYZeAoTPKByRc13z591
	nRll38G+UncDhxh2ulY1m0XLegGKh4/ycDR7E=
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr8671845ad.49.1794273697092;
        Mon, 09 Nov 2026 17:21:37 -0800 (PST)
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr8671685ad.49.1794273696555;
        Mon, 09 Nov 2026 17:21:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 10 Nov 2026 09:21:13 +0800
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpx8moC/x2MSQqAMAwAvyI5G7Dign5FPNQaNZdWEhVB/LvB4
 8DMPKAkTAp99oDQxcopGrR5BmHzcSXk2RjKomyccwUufOMhPhDGFHCXNJmiehJSW4faN1W3zB1
 YvwuZ/L+H8X0/JnUaSGsAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=5633;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6v++39XOGbbFAzkRVgS0Vg42OeSuvf8hqOA834NOJaA=;
 b=8KzmvVv32p/bODyI1wHWJH2fgG9qri841UmrOE9Lj28HLl/jU2M/Oo9wuLlpu0XO2YRbLQGk4
 GwKTCFBKKSVB2amfcLn0CMUtI44xdBbOTcRbvldF2M9VCrVhL2aQiGB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX1CCv0OJCKo8y
 KAZ1nJDnFdhDlapQDvOY2wvUueZdgMFYzEz4e45JChG6nvzXr/VWG4wVP4oLGJI0A7ZV08oAhn9
 B0dYf8ejbbyRtiFBapi/9B/ky2gz0mk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX070q2wkrPUm2
 8dVbs61hWfQrZFdxjoc6n93H1lAFMJfgVCrPOoDgMu8xqwfxO+3ezKTG19SzH7mIzara0aetLeU
 OYltq34KwNZi/WhotRn+xxjUoBeBufeKQTHw8r20IGwdVz8hynwwQTzQ76NRKvWljNuY5XYvqA+
 axCaKfoD9PscF9qxVvHMewKH78q7kLqIvtOU9KtzDmam0o6ZDXgQqFMsxKCK4IQdKbZtedYVEhh
 /jENbdPYzI32OMmjZ1x+GLDv9W9FSyqx1kHVRnb7PYe20k0lUKY488ud4yzX4PBIyXOKfvURySf
 bdJ7PO+tYDYKhdwauBJ/S6Y9Rtx+QhCbv711iUqvv799dzwx1Jpg1ps/qnfu1i4DGHLxifRn4vu
 MtsOZCdS9U0sz2uyFwZpDKTZEjvEBba+t6RUPaCT5Ybh236NZEuLRUq/S+p5/3OOiawgVGxx/Jq
 gHFS4ube7QyQGUI+i0w==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af271a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=DBu9zyGB671Pxo6hLEAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: KEDTpZBL_WdUpws5NXu8r8bWUO5b9vxO
X-Proofpoint-GUID: KEDTpZBL_WdUpws5NXu8r8bWUO5b9vxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172138_711732_12458422 
X-CRM114-Status: GOOD (  25.49  )
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

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
into a standalone platform compatible. Without "arm,primecell" the device
is created on the platform bus and probes through the platform driver by
compatible string, bypassing the AMBA peripheral-ID read while remaining a
fully functional Aggregator TNOC that allocates a system trace ID (ATID).

The series is organized as: binding first, then the driver support for the
platform-bus compatible, followed by the per-platform DT fixes that switch
the affected nodes over to it.

- Patch 1 (dt-bindings) drops "arm,primecell" and makes
"qcom,coresight-tnoc" a single standalone compatible, and updates the
example node accordingly.
- Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
"qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
no longer wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
fixing the probe failure on those platforms.
- Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
"qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v7:
- rebased on next-20261109 
- collect reviewed-by tags.
- Link to v6: https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/

Changes in v6:
- update commit message for all commits to focus on describe the
  hardware itself and the hardware issue we are facing on.
- Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com

Changes in v5:
- Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
  "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
  standalone platform compatible.
- Update the binding, driver match table, and per-platform DT nodes to the
  standalone "qcom,coresight-tnoc" compatible accordingly.
- Rewrite the commit messages to describe dropping "arm,primecell" and
  binding on the platform bus.
- Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com

Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
 5 files changed, 27 insertions(+), 36 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-fix-trace-noc-probe-issue-e75c5a649fd9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


