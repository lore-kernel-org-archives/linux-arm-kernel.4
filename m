Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxZDan+D;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAvuoFEx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfPXfPlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=; b=WxZDan+DslD/s5uoQ2ucSI2/Fb
	Xt03N5rAjuUSKZ0yknjDPBZdBDVhAqqfUn7r6wrqgjtgXYDCXwXsgsguT8KfE60kMK0T0yyCH+jok
	VGDRflJXrGzMhBsjHhDnaj5oYK3O9UN4IGrLmgzh18bh40/KWLio/I+F4wbz3roEDI33VyvPDgp4u
	lg4Kz7KImKGGnJDSzf0KWHqRN9Atuutj1xJCMwFzR9U7BjBNKZ6Oo+XVH/pDV971WuvAirXMe+z+o
	5GeB3/iz2nH4oNQcyy/GpMjTJegctsBwpM4omd4nS1ZdVQ9QTpcLtvRPyxqunf0H4AOoNjABvmE45
	3xzHbrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnsZ-00000006Exs-0rjm;
	Tue, 24 Nov 2026 10:36:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnsP-00000006EvF-0xD3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:35:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8gL1X3851153
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JX2/SMoV7CGstyBTRaz7Nu
	WaIewG3wQxjXWL82vlo1o=; b=MAvuoFExTcMl671fRb/MStE2z57S8cVHT89bHR
	Mvt1r1C+i5hM5F55J4PLNpo0wWCGumwGM/UA43XabE0e/0dg6S7SHdTstIZsvnYh
	oXnS28KYv9//XyN3Glij6uhQbEoaeyLEFc5DztX+2gyYgz42xL/SmX0h5jfToi/3
	a/+vHhsfRe9Qdv6oDrILXAseA6YNPNLyoPrq8ID+8VY+MklqF1x/ipCFQVd8IFel
	xpF6yggCgqkHh3Z4dXumB0V9inU2ZD9pM2Q0KgqLteNEfOYZRdzzEgSfA4Z2BDcw
	JEkdexgQeRQ3GTTLhtpeepDew4OqUpICllEW5idGaKSYTuHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb28mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:35:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso2137118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516551; x=1796121351; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=;
        b=VfPXfPlq52UkWl/YUf/QpcdmxeOb1v6cWYCum7eOX3Eez1m1kTrtACKuaD64ZxjuVG
         TeltUPXARAY84EbxEgfe+R0m3o9vH05ifMjIdk7/Ru1PAqx1rZ7UYktDyIGc53p2fknF
         tbieK4zUWjdGeMydIZTfvGaKsTAUKHqLJNgpDP+bf9MGsmaS+qd6e4T73gj76Xx+7e2b
         F1Bkl1xhSHyLA5edTe7kpv9UPY+2gElRPWyrttUOJg1kZIfJB6fS98UmXmwu6j1PSUPX
         Mj9VhN0dhcVRSRlAXkwSwqbfypEbbS43FIJYdFKq04qCnSxbmEmb6HqRWYPNvoG6QuJ/
         fwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516551; x=1796121351;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JX2/SMoV7CGstyBTRaz7NuWaIewG3wQxjXWL82vlo1o=;
        b=g4/TIYfyRREtFkocY8GEtUFGUgAb1DmOu6U2ZD1ceYwTUvtetCaQd+Ma3CQoA7YiM7
         eiZXdFFb7EKUuapgtPeYNozl+4+GXdd+w0S2IlnXAJbgJFeOzgcnFGW/pe1ch+6GnQi+
         +X+y20DcGZlBuOFQj+ViuXRg//bnCyBa+BQC9ykaZRSfo3WewI+C2SHcB5GQzWGE4RTj
         ALYd0P3sJYMy6qTLoYYEEf6bQN89+/d/COqvXhDBUYzD4UW4hEXRfuWay08dmo7ETSeG
         S0wTq4X9WGQSaJ9ZB4JSHbY555yk6CO+i4AIYVnCfeQ1vuAACHcWBos4W7sg6UnbaWlw
         ytIA==
X-Forwarded-Encrypted: i=1; AL+hErHtHSPK4DsxV7uau8h6aP/fuLu2UJFkGysLn5XNNypZXWwhT6uBt1q7gqJNkwgeubtJUljQo+PEdTqdrb9Tqlgo@lists.infradead.org
X-Gm-Message-State: APuU4Z/xaJgTm1LKuc7m0dRNoJ5XUawqvSdb1Xug4GUrZNq4lzY4BKo1
	pMyHwb4Vckh+b+Dtpax1KZtTTtHmKv0P6UYdyTqqG33RDKTCKoAtXe36Ow8zAut3hg3yRkFPl6I
	HHdYXTOUbRDLuTLowhogE7isT0Ns32K2m42Zuu3OxWO4ivOxaPq6/D6QJsnNP1zPkL9OmXUbhPN
	Ny1Q==
X-Gm-Gg: AZFdTZfy1e0XlAFjvBPkLFRRIBynSUV2iMJar78XrLNdEfdyTL/2v0gc1JSJMlY1sXs
	Tqw5GrOg3hOV/6BQCFANMBekFa4lTbLOYvIq9vhg5aze1hgN0D2bJmYW0YV069R3UDKRPD8RstN
	t/tUyT+2JmtOEvnQYfEQlX76+KCT7Z3FXi8pWVwhs+CYGqA0tSa6WLRtOtQDl5Ar/fT2TFjC3LZ
	PjEj2xkKY8U+q2WGoT43mavIE6TTYLXXUEMxnKtkQs+tZtSntGv8swaDPO8ZVl1D9Yns1ISSfDI
	gK872xVz38W4QnwJMr0GEkYuMM2GOfU72FRNGO4mKh2K53e1bBkOYtxqR4UarnLKW4mzfDthOI9
	nLGje8SoXKRFHc0CO+A+NiIhK85sIBHoM8vrDMsW4oluzaJHJufSWeoX+ukInAyar0+3nHc1aQT
	HA65R32bU/zW3qp1PACDdBQ9e/sDvHT+CK0c7Z
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr12491411a91.16.1795516550768;
        Tue, 24 Nov 2026 02:35:50 -0800 (PST)
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr12491399a91.16.1795516550317;
        Tue, 24 Nov 2026 02:35:50 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:35:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add coresight nodes for the QCOM Eliza SoC
Date: Tue, 24 Nov 2026 18:35:30 +0800
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRoBWsC/4WPzY7CMAyEX6XKeY2SUEjpad9jxcFNXBoJEkhCx
 Y/67rgUieNeLI2tmc/zFJmSpyza6ikSjT77GFjon0rYAcOBwDvWQku9lTupAZ0DGxNlfxgKhOg
 oQx8T0NE/EOoatXRmLdE0gjPOiXp/e+f/7Red6HJlTFmWXwpDmaGUaoAtUBJaCtHCOcWOoOsbq
 TcWnbbYjmrO7jATv3I6+dJWgW4FlgAtxYwafC4x3d/N2DCzPvf6nxKjAgmktmZnyTSb2vzGnFe
 XKx5n2oqH2E/T9AIs4FP+PAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=1479;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=yrh3sL/QUEYo03QCJzG/nErshFwj89d3SRtuzzGr/dk=;
 b=/p3Yubc0pnVhgBpawj2oSxA8/3gluheRkdoxzs2DmdoqgS0b0Y5cIVIgJSllmDMAwIhKr2fv6
 1QTj23HrgWYCYKsu/iQymgpbPu/Br4ojoJBDyUxQA481/x6USnl7RBF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b056887 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pitd1UQUPAqnyXy6cy8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: D__qPGiCR0-JkBqSOnKhIPR9jtezV4Oe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX4jisSa9372ct
 w0aPnRFk8iUIWUZaJ6bvbC2RUVtaVyzgGsK6o9OZanj1sfRMc5hoHWWLuyjnovw2RRWr80bh9IY
 jwCxi4r7M9r5UWvLZQM5+XxSSHN+yH0=
X-Proofpoint-GUID: D__qPGiCR0-JkBqSOnKhIPR9jtezV4Oe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX22mx0g4g35Ax
 1EYmFffStFVbaHxSv1xTpjKULxNt7r90OQxWYEVUtm7dAWwkCvQjVca8ZniZDZOnI17TQib+NfX
 54ZnEwGgbyhj5brbgu+vFAsMgAvin5uId6dmquBr1kXxqrSpmKSWqw54QQck08l5YQv5EisL4SQ
 XvuHWgRZ6B3CFpYoYARsjy8mJCO1dJFoeu0AsUFVWvIkiqOgVPS78BFc+kUb/3SphUxhRtZvsny
 +UxkZN1DKn6HLDAaaawFWAc6DQlaw8wzAlkw09Epg9pG0J+HxMctv0JJD5C2R548HJf1Pq5kabV
 R6ExWO5ql1j2UpctAT+3q31bBGTXc5SUAKSKu6uq90G2FME6ZQi442yWDPhO5Vp1yMoe3mEKIeZ
 9Hc5PWjICvnac3hITb/BqqlIyAksydSBroLM+n8ECfBRi67cBIMqnYBfCmJWPj2DURn9FtIgJJr
 GEiwqrFisBggP78AN7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023553_395968_8B74E0EA 
X-CRM114-Status: GOOD (  12.04  )
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
Changes in v2:
- add qcom,cmb-element-bits property for modem static tpdm devices
- drop port2 of the wpss_replicator device as the dt-binding only allows
  port0 and port1.
- Link to v1: https://lore.kernel.org/r/20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
      arm64: dts: qcom: eliza: Add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2137 ++++++++++++++++++++
 2 files changed, 2138 insertions(+)
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


