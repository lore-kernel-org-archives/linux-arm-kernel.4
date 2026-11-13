Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E31606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fKbg9Ua5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hFdvGrtR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wt7SPvPW8b0kziVptjkxustWVqpjCQIxu8LBOybk5Ps=; b=fKbg9Ua5PivqHZQAS/CKXR23zl
	YCZlsWVe52nG7elV4HfomPaSHFskB8UsdHJJ1EI/r4sifp/S4VDI8lwNzIgDeWDg/y0Ino5pfOBD/
	6x1YXlWNGJ94ypKjzfa/Cw/8q1t3n2L3xtyKqMZLaCV/L01nyGI6P8bf4cCTKDUiw7QyZJz1pkBNa
	Wy8f41VVmUjDucfEJPYLGwUkgJXSrTQY1kgvZWuNnRujbUejPyibh7peQR2egP+JmxxncZI9mun9q
	YsIOW5Ml/QtuzcksEXNgu4ye7JpJXX1Jeik3GMURsSpjjYCq9dqh24j5l7ZHD1FiBus0DKNNKSct8
	dbM6V+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpRh-0000000CXRa-39SB;
	Fri, 13 Nov 2026 11:27:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpRc-0000000CXQt-01CB;
	Fri, 13 Nov 2026 11:27:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VJAD2515639;
	Fri, 13 Nov 2026 11:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wt7SPvPW8b0kziVptjkxus
	tWVqpjCQIxu8LBOybk5Ps=; b=hFdvGrtRjzpJxY4diVHNTp6ysc11u83szexSUb
	DS7Eqt/UTBOuNV0vAJYN3OXilXd1/07izXKsr0VmPR4zYnoqpHl43rTsmWZoXJd6
	xtRT4JW1IvoOOBt7CvbQkR9uNjZ5UqX+17HBCXvoGzH7sDJk3YswiYHADlHCPXyH
	VaImAi1NDsbmD9Q9T/CtWA6ZcVYDft1etdTqKmwiCcVxWcKgUkq6Co9iyZX4lM2Y
	XAeM4Bmo4Sej1e8nSWPCKm6eSbwo+TU534toN/rprGm6Y2UOWJku3EevtY69c4f3
	/ZvSDmndtxdRB/TfT+MROnP0y4y6YDz7vIZpuU7R0BfCc32g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbsc3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 11:27:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNSx290272;
	Fri, 13 Nov 2026 10:55:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ADAtMwm290252
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id C399EA6D; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: lemans-draco-evk: Add display panel
 overlays
Date: Fri, 13 Nov 2026 16:25:12 +0530
Message-Id: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHs9moC/22P226DMAyGXwXleq4wTQlB07T3mHqRg+mycmoMa
 FPVd1+AXvbG0m/Z32ffBVMMxKLO7iLSEjgMfQr4lgn3bfoLQfApiyIvSkTMwUfjBqDlCj7w2Jo
 /OBpfWCxL6SSJtDdGasLvxvw675ln+0NuWkHPiUi3OcmmfUx0xGw2WZ29b64cNbTUmZ6fyib0p
 oX9KAYbQ3+ZR1gQ0k3OWNKywVzJz4H5cJtN64auO6TysRpf8AuEdtLpKQeLSpwqgaRWldWy0mW
 Dr0HWMMHaCVOdeUmqUKejwpMV58fjH0URsm1OAQAA
X-Change-ID: 20261110-draco-evk-display-3ad2b1664c4e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=3092;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=3M0UkypA7DwC2Mbb+uqmLXjQSqj1+1ldsfW57S+JMbE=;
 b=dUDFkfAcdzDENhkvnzCSdccsAxwH/s7L2lBMwUgqUL6/aSHDvsRmMD/A0zkXM7XVc1RYpOZdv
 86LwQ0QSP7sAftMmaFSxLBLTMMsIAPF9om6rwY09VRTvq29oKDuHA2+
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6f431 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FsgQvhl3dctB2t-A26gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kd0FDYaX4bVF93OGg2b5DD24KA0IAO8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXxXh7o5lkBg3W
 VFdWg+jS9Dj+XJl7WXjCg6JfM6A9K3j50RBdQpHgCyWsHQrT/kaoGHHoKJ73ADtQYWDK1Du//w6
 0GmggBAKVIbHeHdKzmzKOjEuItfX+f+hEA1/o5iDnU7+42bbdXwzo4db8CN0N3jz2JWJ4x/7c+n
 lrGTvrPZD+URFsiq0osugMuzh3i3b4X/uPoEk6vlW9XNIeH8vXC22aNXmWS7neua2mdZpsjvhG7
 G3JcwxcIcsscnoTqvg8OyhG52F8gvccTiwIub17rZqMt72C1N135TVMeewXX8gpt/aeAClkTWY3
 GSDJ0nCbdQ5t5R7gQK04PjNFf4vuQqxVPWvhHJ/PABEyFJAEKAl9uLEb8E/FHpjmpyldRinfKqb
 ltpoMunRqeGFoYnJveiZ7EZwhRIrdD/TvKafY74eaIL3EdOVvikMpgSQlW98n9ojNucn86QeBQ7
 UfvwR7HLD/EpYOehL/w==
X-Proofpoint-ORIG-GUID: kd0FDYaX4bVF93OGg2b5DD24KA0IAO8R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX2PHRgChgq0rp
 Z5ZhQcqB8e96vSnc4ktcOs7rR1jSWedjRfSK6gKA3N3VAgy9K2fuGXCMpLoHXbixauUpk7pQrxA
 5OZnCJ1hxcWVyVqtbXjN3/MktQjW+vg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_032748_076722_602F6DE6 
X-CRM114-Status: GOOD (  11.44  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Qualcomm SA8775P/QCS9100 (LeMans) SoC card is mounted on the
Draco EVK carrier card. The DSI0 interface from the SoC card is
routed to either the 22-pin DSI connector on the carrier card named
JDISP1 DSI0 or to the DSI0_B2B connector, through a MUX which can
be selected by a hardware DIP switch. There are multiple daughter
cards designed that can be connected to this B2B connector.

The below B2B display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

The following overlay DTs are added for additional display
configurations:
  - lemans-draco-evk-dlc0697-dsi: DLC DLC0697 DSI panel with DLC
    daughter card
  - lemans-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector
  - lemans-draco-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector
  - lemans-draco-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel
    with LVDS daughter card

These overlays are applied on top of the lemans-draco-evk base DTB.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: lemans-draco-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (3):
      arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD HDMI bridge support
      arm64: dts: qcom: lemans-draco-evk: Add hdmi-dual-dsi overlay
      arm64: defconfig: Enable PCA9685 PWM controller

Vishnu Saini (3):
      arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697 DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-draco-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  20 ++++
 .../dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso     |  81 +++++++++++++
 .../dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso   |  38 ++++++
 .../qcom/lemans-draco-evk-lvds-auo,g133han01.dtso  | 131 +++++++++++++++++++++
 .../lemans-draco-evk-raspberrypi-dsi-7inch.dtso    |  98 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi |   5 +
 .../qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      | 119 +++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 587 insertions(+)
---
base-commit: d4e72753715bc741a78c4f7e8cf4f182f14f96c0
change-id: 20261110-draco-evk-display-3ad2b1664c4e
prerequisite-message-id: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
prerequisite-patch-id: 642840f2fbb8ad320deef8ce40c94d18cf3b9f70
prerequisite-patch-id: 5b6f00308e9659c1f43974c383aaf93a09e3cc15
prerequisite-patch-id: 00a00addce3621808e6596af67db464db21f8d61
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>


