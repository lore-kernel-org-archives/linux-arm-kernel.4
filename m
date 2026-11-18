Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A322606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwjHBIyx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFGPA2LA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMrMPeTJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=; b=VwjHBIyx6pIAcjxD3MJYZE//HN
	zEHGoo7otjDs0OWpnWNpQWBRmSK51w9DPYAAcYiuNGjhDu+7fh8xIrtz9Xvtr9n9wWCy97Nv4NOki
	kIzRxvS4aPK9IvRi9LGZMiqVifV5mHXcNRCHVpB/sxgvjDdUg7vzejKW7Y3BFIF2D9xplfZJYhbHd
	7GSbk6umUM/2lmlS56sE+bTt7W1S3mO3BKlZ2sus240QdPDkdJMUuWElEJgBrZCkQ4bMdQ5qiRSD8
	ZLXyc6IEJnSSEwiTQzrQdQy/Qq5p6vT0iN0bcx9nJxtuRPdrR3nwF5gUPznHsnCPsmlUOkYwRcutY
	dgf7EegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhg-00000007xqE-3eLP;
	Wed, 18 Nov 2026 07:03:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZhe-00000007xoX-0uOY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:03:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvAi4059958
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Km9Y9Uuj8+EaAkrKODrPzV
	usw9xboYcIN4R/c990Y94=; b=XFGPA2LAPRZr5dYsH81MiUMH3q6LZSCbgbEyY+
	5mYv2Z7YD9sZpeALY3TAEvNlrU77ZhX70uHPN67artl47KTWI71u2yC9hhiwW2kF
	mVzTU/Jf6sc5e+ze/KSdTR0vaTIPmOcHVHaX+28VWuxPK/foobj9+HwzydI+9W2u
	umPVBWO3If5l5mXOYcMXSgHrFHB9sJOuCIA3JfB1SZNdMOaDKlquJ6G6tKXwEsEi
	zMH7nf1nCWUrf4SY2thOWV2bSqtpPpXI0zQrJjOsB1X+nloGBmm9z9ql6t/9CGHr
	5gJyL23TfFIuPqLxM8ZInSVFZr3sXHo3LEn68AIFXFO6j1PA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchr02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:03:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda3affc2so4097245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 23:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985407; x=1795590207; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=;
        b=dMrMPeTJ7a2CWjmtaL+9/VlgOoQ2q1HrZAo158adC/hpPn2WIYguovIg6b7ADDOowA
         GBkZNW+sJhRIWDQxeE+W/qceTcy4HibFP8kXOuzsgLkYYzWSt/OTA3sS+GcO/ANdPU3q
         QRKb6t6Sfiszm72L+lNss0D+eOle+skibp+iU6NAVOl8TiMcbZRXfIh+oXmWUILCfDE6
         vTGer5a/tp/BY4FuQP1PdhPYB3yVXfIwfBCVm9II2o2zn7MEn925fwwvHl/0C+FrQltq
         G6A90Y9qm4y7iJ7iJZpdJkeJK4W0+9wjZnaJ/lTyTqVGo2ttUrJWmRJrnt+aFr7f5wf7
         rmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985407; x=1795590207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Km9Y9Uuj8+EaAkrKODrPzVusw9xboYcIN4R/c990Y94=;
        b=1nNDYX3gVpak+1pArdAGuBH5jSTKNnQuGwoGJPJQS8jXzixL+unfuVB8QY+29n2VvG
         EleRmk88sKNuxeYzem1XHmCcc4fqdZuJAdaoM2vY60GbI2raC1KfVcGk1RyoDrKaJ+64
         5INYkx8Ze2WpL7EmFBa7+U8DY6NEnavNHaMUm1CTfPSU2kYP1QHI9Yy8CbtTs4ONkiK+
         ttnS2WRSajMruGos2kRKm6IiGB7eCtcy7bWTrsvZau5LmysOhkzV9Y5Zl0weqacqEB4Z
         YLDLbOFBQ17n2/Uw53cFoO4PFD+eiFsSbG+qF4C7qbkrJVDzf9FRN9v9+5vNICRmZYlP
         ubWQ==
X-Forwarded-Encrypted: i=1; AL+hErEkAOAu4ICDrvZopoVT6VwOqISCpMa5XlAQGgPPQ9u8YhJR5ccTb+cp9ti3VzFIws93tLm2clGa4MWnPCMgAnvO@lists.infradead.org
X-Gm-Message-State: APuU4Z+PNzJD/7N3A2VbXDYfef5/tKdu3dWicKlK4h+7ckwL++qR/Pmb
	b9rTEJ3lWA5PgaRFUE+6dsiTdGkooeEa8ewNcOkCf7qnpfmdq9Qc2W/+X2nsYrnfS0SKfBbqAaq
	kQyk2q7ahbkTtrbtkcCeAT2kKi1HoNDInpRP9oTqgS9NnRYCf6fMgvLvTqDx0+HL3JFkU2VZ4Rx
	BOHg==
X-Gm-Gg: AZFdTZfnUvaTEkPZnqY2GsL+Oo3L3p7238v19Tm1c/Z/3rkCcNrIG58tJps0E889SXo
	YM6C9QDwRnw0lrgzKUG9h/iMYlVgJBZ9xlwP/X8pDhjbF5uECP0cvgdSSyVYD/miYGXyt6kW9fs
	9kxO5I1pDT54Q3baxfkTj3y8Y8fIdf3ThIV34N+iVF07mXDYSsSua+AWp2m2OZfOEgjMX4AMJ5T
	/Sjdrstdlwr5O+LeJRD+HOYB5tmpGPZ7qW0sex1sAp7j/MSItuHzv6bxmx71bfIWoxoveG/kGbM
	6SJ1b9u1Bt89m9pQBZvV13WtbLmvgerDRHPXNfViMsuioJrwYBZ+AV+Goousiw5qYgQozcjSh22
	wxmU/YhEC3ck0z4Qke6XjkCIQ05gyhmuW7EjP/TdOyXL0OScHbiHUWpILOciMLcZ1IgT3TpRrM8
	9Q9HmSYBa9tkNTDw8+r4hi0WIjOrT8v8ANOnJX
X-Received: by 2002:a17:903:234c:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2eff72f5250mr16757255ad.12.1794985407371;
        Tue, 17 Nov 2026 23:03:27 -0800 (PST)
X-Received: by 2002:a17:903:234c:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2eff72f5250mr16756965ad.12.1794985406903;
        Tue, 17 Nov 2026 23:03:26 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:26 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/4] Fix the TraceNoC probe issue on QCOM platform
Date: Wed, 18 Nov 2026 15:01:42 +0800
Message-Id: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdN/WoC/x2MQQqAIBAAvyJ7bkGFIvpKdLBtq72orBFB+Pek4
 8DMvFBYhQtM5gXlW4qk2MB1BugM8WCUrTF46wfn3Ii7PHhpII6JMGtaGdd9tL6nsHkK0MKs3Kx
 /Oi+1fqstO3lkAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=2407;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ahtxJbI1lr8TLACqhW66ROVzs0e3zMIjCAu2G0FwFK0=;
 b=I3Wy2QAv79Dng3Jjkb0sRINNRgP+EBp+1h3676HV6iQkoQw/camvvIh6TSKfe51GCWHR94gvO
 xFgUvuv/FUfCOwuVAlThdssVsA6vV8K1vLq1fO6AlrJDds4IXSZEEh0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd4dc0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sihJ5F6HciqRnlEYqfEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HsUHnE-cxbivZA_PSgSyTgEezlCVY8ti
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0v9ZDpsmOvSv
 XyhaCGR4vLGj4XQTxmUDLxnYk+T62QShATJO+Y0mH+VvWX4Kr09RwI6cQS0eyX9wAseZ/f04QWF
 61shAGDdmNGvwSPNyQeERKiNpUkR1qU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX9g6OSYJn+MBR
 Vg7xHsDMoMlSMdcQAN+pIrf4czcPpLpjNqV10ukmQMYjoUYhqtu4FlxcLiw7nlU/TTlKtM373PI
 6PaAZWAK6Te9K3CgTI51zVy7SReO8WQ3qc9AojVtK2kIANgEkco9BT3/LX0LNAPAeHeTxGIjVHL
 /rmqBj4nopi5dcQ8VxR8iRiiGHtwI4vYFllVIk+XDt4Lb/WSO8RNEBzKJr4A7MRtIXTMS53fTsC
 rSkIB52s1KtZTPnV3gobVE2mUi1cSkh5lFFciu0FzN4i6zVZhry4Hjz4V3pEVolAv/IIBuCW18C
 yZqaBqI2oygEvHjmw+fHngXgMgNErjyK5b8C+1DBwlViFqiy1JV7sPcUWKSUzfXhXSxcCM7ybu2
 w8vgp2+8p6uhAz7PSKJDnYH06DvAYyRJgp9ckyce0Ante2ga2V/wev5Vvl/UacZh5EQXEd5PEeY
 /Ce+N0s/UP5hM5L6V1Q==
X-Proofpoint-ORIG-GUID: HsUHnE-cxbivZA_PSgSyTgEezlCVY8ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_230334_376353_D65E87AE 
X-CRM114-Status: GOOD (  19.71  )
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

The traceNoC (Trace Network-On-Chip) node on kaanapali, sm8750 and glymur
is described with the "qcom,coresight-tnoc", "arm,primecell" compatible,
so the device is created on the AMBA bus. To bind an AMBA device, the bus
reads the peripheral and component ID registers (PID/CID) at the top of
the device's register block and matches them against the primecell ID.
On these platforms the Component ID returned by the hardware is
0x00000000 instead of a valid AMBA Component ID, so the AMBA probe fails
and the traceNoC is left stuck in deferred probe indefinitely, leaving
its trace path unavailable.

This series fixes the issue in the simplest way: keep the existing
"arm,primecell" compatible and add the "arm,primecell-periphid" property
to the traceNoC nodes. The AMBA bus then uses the peripheral ID given in
the device tree instead of reading it from the device, which lets the
traceNoC probe on this hardware. No binding or driver change is needed.

History of this issue:

This is an alternative to the series that fixes the same problem by
moving the traceNoC onto the platform bus instead of AMBA.

Latest revision of that series:
https://lore.kernel.org/all/20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com/

That approach requires a binding change and a driver change in addition
to the DT changes. This series instead keeps the hardware described as an
AMBA device and works around the invalid Component ID with the existing
"arm,primecell-periphid" property, so only the device tree is touched.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (4):
      dt-bindings: arm: coresight-tnoc: Allow arm,primecell-periphid
      arm64: dts: qcom: kaanapali: add periphid for traceNoC
      arm64: dts: qcom: sm8750: add periphid for traceNoC
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi                           | 8 +++++---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi                           | 2 ++
 4 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


