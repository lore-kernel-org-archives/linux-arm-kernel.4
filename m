Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AB606A6A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVhkNyXS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SJwaVvdb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=; b=sVhkNyXSLdOxVLUluO5MjIeq6t
	S9A+H11tjAM+rkljuOzmXGjhLpOlMJ/Csmf0FwFFbxP//DO9puGx/15P5lsWc6+GI/T/rS95nFT/9
	+sxeuu2ua7fCUrRgmMCmRFcjMHNF+LVyUPZpmbXVleZYbRMtsavvkxFsKgs7tmtiomEERnIKp+zsx
	Tdgow+2KSbyy665uBgR7w2ZfZbIBx6MGGJf8RiVIKRbJHztygU9Pqcc/kki4q4LHbIjuJWMG0lgrA
	Uuq+hBXvgxYZsxgeRiLb8Gs8ACX/48iyggPh1/YML+0eR8Rfl+uq0ca896KbnRF8zrPUz78jAQrGb
	PGYC5L3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWK-00000009tx5-0j6N;
	Wed, 25 Nov 2026 12:54:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCWH-00000009twK-02I6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:54:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMmb2356511
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BJDioDDua+dUwIQK+UWlYG
	Atjamz3gG+eeXOxwGF//8=; b=MqZOZgwDVziczld/GfYZpMp44aNhRNosX47+2N
	il2GNfBe3yFidPC2ichCj1scg60Acm8dFkA31gItY12J+jBCjoTp8WW4XKL/UA9H
	bsxLwYIYFTuxq8q4yOi5bRJPzDdUae637pPbG+x7E7KwaWevV/5MVVmkOAEbVlXf
	wzLY5NNlbTA6URf8147zU26teWkR8cisVcZSHYl45n0hcrk/sD6/quO6TPrso6hT
	5mAUb+8oQhrUmTzYAtw0Z/REXaiWg6VV0fiu2SMMX0IXJn8ivw9EagVJGJuR7azF
	+06wd0Eo0NQO5K9g90cEaBL5s/vyNZlpjmLVHJDURNZBsq5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:54:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04046f427so7774875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611279; x=1796216079; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=SJwaVvdb8ER+KJyCmruh+Ji22lVaWDp6lXrXwAidiWoUPbWVvCugDtzx8EhvvqrbIJ
         jaFR9cEOYgNTL1CuwaOXz/OvtkVl3ceMcVudTcdZwQiGhzDRL1WxaKrM62OKvvfEM2pv
         x1y2ARSI6tVKeVHliUorKrFtOq0sLr8KnP1e7PetnDzysvYEFHbW8aPuW4gnm3Mevmu+
         105/2a4Mq9WSBp8BvXe1nszeSjQ+Wx2gYW6Dq2pMXjcJB7NLAephWwM8hDS06SOCHgUm
         FvD2tAV/ZIyRddk3c7645juz4w+UpaltAmCrjrvl0Ta9A1PqkRi/sZwKP+KBQuLgLK0/
         BJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611279; x=1796216079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=yBh4C+XoJX2mcqBGEUE8qGvonk2UqfO2/hnWRiQhxULWW69DNxbEls2p4fShWVhb4C
         MRs2i9YnbfGmJaS5WG30ZdslQ4KSN8R9pfZKw3viW3q+SR8wlTt7XhsCWWMldsm5HU3N
         X32RQrOQJy9hoz1RIT0P5OFlN+3WcsMZRQBZi7QP4SkP4k5V6sHZO2Sy1iRCYPQukeTy
         DQ6rtFp+IjcIdxyAWpLy0fgZujAnBcZv5BF/JwfD+UDjB++QT7gVLhobTIctkqVoGAOu
         qaQbJVhU/T370giunQo+vmQYP0kA8bYpO8KiTK5KqkxopxeRQjBrgYm/4eKRqqbWSezh
         bA0w==
X-Forwarded-Encrypted: i=1; AL+hErH5DvDXMtY3TzwL0u4lb8nGtV6st6NHn9joU5lCcgYojjbGdLj0YIsR4/bh7KUrPR/qFE+7Wm80JcgmGjo4NQuJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9/K4iGFWURFUyotpP8wRXwPjO2hMJT3db+ToUUHtUj4mRWBXDM
	6N63YADuA4SNLfTlOZ1oP3cVVkUPUq+l0xWgQmimDlozkXv0ny8X490564s1ncj5nmF9YHHDUJe
	RHDKWNqu0cYcrPJnpYz3aCZo7gGkWtzb5g7H7f3FInkrNVBUGOgeg5fQxCXzPnZE5S54WwJU/EL
	gN3w==
X-Gm-Gg: AZFdTZd4mExVCwDxLNkh+K43vAwbXEvvXQe2KK0vYBSo3iiKjic0RSh4WXJpSV4wR16
	u5DCgVfCd+UuuatHMadrjqS0oSXG0ce5dHDS2xnc9wVap6YeYBjdEwhdnhdC0XqiXkmQ7DCT70s
	loeYV2dVFtkhURJCbgKS6mLC0NmZXr58Rkw9AafebV/QrxfAXCVwtkE3TSwRp9ODduASAmL/GEr
	hw+LQgahFyBqJ4tKAWJWtiu6rq2pwHvPEB6og7iXXoTKQr+wB0T1WQhCSJyLEPyyhH2YjW3G75b
	CqTqKoZYPbagZudvHymAapOxF6KL+d8V3+9chlZ3AnS8d5quiCpcxYEZXvjRbQvZBXLo61icnFK
	b5aS55n78RDkqvQfiQCuXDKjiuRaDjab6Qj+OEyYpkho/Hx+sy6yZaiviEIBvQVFTFbR2fovcB1
	f7bgQHWhJ+9e7DwqAAOzfQeug3TdDGhGi7tXtImjaXeQknmuvoZRtPNYkCCkZvqv6kM7WHqgJW+
	vymC4rnDO1auNzG6yrDsirb+y0z
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972545ad.2.1795611278910;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972175ad.2.1795611278463;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: monaco-draco-evk: Add display
 interfaces and overlays
Date: Wed, 25 Nov 2026 18:24:24 +0530
Message-Id: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDaBmsC/3WO0W7DIAxFfyXieVQBElOiadp/TFVlwGxISWghj
 TZV/feRto/by5WPJR/fKyuUIxU2NFeWaY0lprmCeGmY+8L5k3j0lZlsJQghOz6lGV06+lhOI/4
 c47wE3jtyxu89BUWsXp4yhfh9t34cHpzpfKny5bFkFgtxl6YpLkMDvjVKIRnfAegOgRAU7jUZM
 mg7ApCgW2c29USl4L3V0Lw+S6lnKe7zlqvkLVdEykql+yDgPZWyO19w3B7uarz9bxoXUwfHV81
 XYapIBEvSattLIf4QHW63X4p/oWZEAQAA
X-Change-ID: 20261124-monaco_display_intf-5cec9d8def3e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=2959;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UntkIqu5gtOG78Y3H+5C9JxD3OMVpiptaackWjar/4c=;
 b=0nAeV7G8mBlu622PkRUYOCkewMlIp3G4sknwMpUynLAeukdjnR2qA5sethiRIAgUNDoO65VXo
 WYhoL4RQxd/CxRoyuGdzkQKGrtjnvlw4abGNtj0vict7xJykKLWik2H
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: r6K5T4xNYP4azeRWXH8Lh6Uf5KXbyhFt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX9j4vNyoMJrDG
 icgLAWdJYU/uuwU6oD6Fg/ujHwjq146HM9i85UWYLIGmOTBQlYWkn4Bo/RVIkxXMrb2gbE/Xt4I
 PWneXThVIUuci9eL66AV4n1Rq3g0DhA=
X-Proofpoint-GUID: r6K5T4xNYP4azeRWXH8Lh6Uf5KXbyhFt
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da8f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p_bOUqcuj8HARrLJNMsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX2dW5thMeUQko
 hqCuAVYyLyLWrMi42GyPcZu2jKsG0yiMdgjC/0StzFoTWX9T40T7MhIZ3tYAr62cVJiGu3UQSFn
 LcKzxhhIw5C11iSXXqtYpLQW9Blzwjf4MdPTXNm4DTasSLDN+xULu1FNFfJlZwF/tLaEzJw2jIS
 hFWHxbGFjYjIP+P69yDenEIy9Zih4PdcKciwx6rQ0A8DcuOFIediXVt5/PB4y1NTa42XNFWyqP8
 rvz+PLZ+/olqShgC/0YBhmkwI9INC4OY906Z1+DO76RczXfrYpurzwXIXbmENdxkkjsQZafCGZ3
 c2XIi/v08YLtlBFsUm4e6trehqSzDX0qsXTZ0JbNo1Y3gbvmu68nnjG1/561Buakh9ddR3pw80t
 exZiN++kr+hVsF+ntMk5VoKlJ0gKK9dJQ/nTAt246nFr7wIEKivOQJeF5ajzP9rMJrfwxPBMaWY
 sx3bTN0++fLF6qvFc8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045441_053597_C7763A57 
X-CRM114-Status: GOOD (  13.08  )
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

The Qualcomm QCS8300 (Monaco) SoC card is mounted on the Draco EVK
carrier card. The DSI0 interface of the SoC is routed to an I2C muxed
display connector, to which multiple display daughter cards and panels
can be connected. All of them share DSI0.

The below display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the Lontium LT9611UXD bridge

The following overlay DTs are added for additional display
configurations:
  - monaco-draco-evk-dlc0697-dsi: DLC0697 DSI panel based on the
    ILI7807S controller
  - monaco-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7" DSI panel
    with Goodix GT911 touch
  - monaco-draco-evk-waveshare-dsi-8inch: Waveshare 8" DSI panel with
    Goodix GT9271 touch
  - monaco-draco-evk-lvds-auo,g133han01: AUO G133HAN01 dual-channel
    LVDS panel behind a TI SN65DSI84 DSI-to-LVDS bridge

These overlays are applied on top of the Monaco Draco EVK base DTB and
disable the HDMI bridge and connector, as DSI0 can drive only one of
them at a time.

Dependencies:

- Monaco Draco EVK board support, which adds the base DTB:
  https://lore.kernel.org/all/20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com/
- Lontium LT9611C(EX/UXD) bridge binding and driver:
  https://lore.kernel.org/all/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com/

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (5):
      arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI output
      arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi 7" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO G133HAN01 panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  13 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     |  79 +++++++++++
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    |  97 ++++++++++++++
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      | 114 ++++++++++++++++
 6 files changed, 544 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261124-monaco_display_intf-5cec9d8def3e
prerequisite-message-id: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
prerequisite-patch-id: 6e31934c1ab65ae2ab7a9e7f0a3ce1cf2e4df9bf
prerequisite-patch-id: f3d2572189774e17ef016652733bb7a33375c0d8
prerequisite-patch-id: a1ffa461060aec6d03247fab5d6c1422aa851e11
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


