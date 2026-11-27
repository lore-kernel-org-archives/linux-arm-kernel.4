Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PR6mL7T4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME+Apf+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hw06/uXY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=; b=PR6mL7T4A30Sye
	Lv3aBVSn+sMAIOYsiYfBFQSzxhFGcfyKW2J/2xIk3oNMM7tOYErLc5T2FNUlcTNXbfDujqMLBHZyh
	osuhz3Pz6V1v7AcCtBTgNRabSAl0sPNASFw9mzGVk4GAYJFw5TcXxyglOEs4+ZjMrQ9YEO3fIYzyP
	BBTvkmRtoMBA1pO8WAU76gEbSpSCEMKwpWEbAsxRvx1ZqFTGUGlMoPJ47gTaJrqN+M3F7FUkP6Gqh
	zs1/g9ajroA9OimaZvEGg17BplCfJJ+nFZrn38iAHRZN41fDyiZkVck3ks5+WM4uD49aUqPt1T2CI
	Hi/kQ6NhtCNHSsHIkzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxq-0000000GXJf-0HJH;
	Fri, 27 Nov 2026 14:30:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwf-0000000GVmq-0XQc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:29:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1aY92376602
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=; b=ME+Apf+1iDseekYi
	S2ctqAoafiXutknT0XGP7uQmd1KlUZVJ1rmuaJVQQPrwJthmQXyr/EAx3HHFD/2U
	FEak7mcGkXfnh8yVGkZyctvmkx8vFfT1g/ccFjKF/7FpF5m/ifKVTuLvohDOtEa2
	rmqHnpiPSxVpo5cs4mQYnZyORBlnJbVgEHv1kgou6HIeEQqzTA0A0JkprCr9Xy66
	ikHMAsBIVDN380V7gjCevd0PrF98TsEYKEQzRq6hLgWygPxLghc8nWp4KH56XSNY
	frId/WNzJZAE1tNTqZLw6pD9/dVH+xBVR/tr01BOlHwsNIZq72syGSY5d14OPJaX
	9vOKOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hueth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0717e54b0so57899575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789740; x=1796394540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=Hw06/uXYdnNnmZSg2+CHmwLdEtztABy55BKDvOgV/0tMl8UvG+ywk5PjujWsCf18Lb
         FHtGtZCStiKaqTZVkol7NSQ3iYE33vchaKLjJXcnnGRC7ZtH/7yd/TlY7MAp1edBw6Nc
         HKls/hzrGhOxOr7V2zcFfIE8YBjnYjg43FmeOZa8E0w9PCpy768iyodsxeD7LmuImZSC
         aAMj49mA6HCxxNA/cmeNyPYHmyiBngV7iaHxSVl9ItCLQqeVryxp5XMdk+5UHkVgJJ23
         adJWrzGuNVfsd3NTqbFv79BEolO9YbgidsVNsE0pVEB/POz6b3fJSe+S4cKFUIK2j+VM
         Eq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789740; x=1796394540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=K5ux/LCfH1VR4Lmez6kILAwFoBGuqwu7ucMZ3rxBh32T+bhAQ4xqq4zGamjJPtICN2
         RxIWrTbGHQ5FL5lkNhUdzdXK8LqyogZBzAsbmX25HRiSNWkvLutntiJsFFNoqb6ZkSLf
         ch6P8sh7z6wULEGZJy7Z1ijlg0avv5CSN1mi5jgQ+6UH8fR81iGAY2+A4swm4ARU6Nkl
         Z8MjOjOtzO6lSPVk2kUWKktVBDVvVFZDE79efgVF77rsye24hN8bZoxiZiX44jMwJ/NZ
         h23hBLrbVnzVDth7h61fNXfP9N5Jocmf3sdPcXCXyq9kJEW+TIKQzJy9D7BKWhcT8MlU
         UdMA==
X-Forwarded-Encrypted: i=1; AL+hErHXr4QkoKdCQFsboJM3Vh9DksbElZV6Asx/cEBIPqExPbVodiQXlVy4Kx2ZbFGdc7mkehQkhRW1w18S4AbDM+dX@lists.infradead.org
X-Gm-Message-State: APuU4Z98+s61txSJOIuZI8sHz0cZjLEUeZL3hrMEwD3dWBm8sywUK0Na
	OUx6cnipw2Zaf4Lc0xLzfseoKAMxqwxhfNyc5773H9NJ4H2aYySQb7/0WVjBKlfm7LYFTLQbytA
	YLyMfdWW993etkcj2NO5fT7H9Budju0ZUdrPekUMmDbgQbo2QQ9QeRCj88KziGSqhFRjU0Jrwfb
	PMsg==
X-Gm-Gg: AZFdTZfq1RDIK6D9x+10xn1SLBx8tC6e7NaYlOdu9fBvl+lTIogfG9U09hy4puoIHvO
	dIqdIJt8Zmf9wRZ1S7JogpF6p3hnG5jfkb2gyYcXAVJLhg0xrTU68fTyaobGs4UHPcUDErX/LUj
	ubG+8jJQw10ISj4HjP0zjYAUlNcPF69uhY622DuOP+NGbm/k5zzANBzVwSD6lZW1LR9OJ1qUUXq
	Pf3k8n97AshJxeUBn540tsermoMDkiCMck9RpgisWgLsHv5uLg2C+0qYv/0qJnfsDSpt29e4Fdg
	el6bt2+BhVd7wgLZ8US5f6HHziSUpQPaOY/f510HCBTApYLSah03wnm7T7gPcAa/PKHRoPM4SkX
	4jVMZ2wtSqdOrg/LdXOHTs23+wBNGSN0bBB2AqPd4k4PmpeOrBmpQFkYiP/xBaRufjamIbYbN21
	GgNMCDKCeCYg==
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099655ad.10.1795789739770;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099025ad.10.1795789739086;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:58 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:03 +0530
Subject: [PATCH v28 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-10-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=1615;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ph2cyJOL6BXy/8+AP/FfiYNzz31fptD13LLAgSe1knk=;
 b=qrajNkTQVVFubVOWFdztpP2X8o7fcbr5Vd3UeRaqzrLhe8BmaG+Qreuv+VZAsHl0Dz+TAF7tr
 9rg+2IbNBJ5CVgDghP8uA/pFRF3CHYIwUs+QDhWRnh8bgx0XzIsnGCZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX2R52M/rg2IVi
 j97EMKw7JIqC5G1OGxMaK0Uta0R+cHdxs9+/ncLY/il4Dt/90L82iQcJJ79B7FQOihnJ0dJ0c1y
 +OtROhI9XtniDX9wtz7Si1PPuOhae+Q=
X-Proofpoint-GUID: 6m-Zg9g8NoOlavF_wiFwViGl0yrfRnna
X-Proofpoint-ORIG-GUID: 6m-Zg9g8NoOlavF_wiFwViGl0yrfRnna
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0993ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX1PRUioxL3QvC
 3uqldUFZ3ZZEpW4OeuaN0qiUHs+1qoxiHtiQv8z8RgLvlCLbsqFED1m6jR3bslNv8UtM5wWNQap
 DxoxgKS6ZSCX1h88mqR+6FWB3pLoY+FCXu4XT/9HVYkDjomwQi38e+8daeiZ+WLmhqbKTylxOo6
 U9FeP3nAk0pLW/lvLeOEMceTDZmhODAc2p/Zg0k+14YjdMhMhCm2DMK1yTHrkSTeBb494yubPF4
 ar30LouFE25GxZwHTikU2lMsevbTVk6PueTfM7jKPPUHQx9vH72DjkQdnmI0Cprttq/pxviLQu5
 8Avwry5jeQGksG043m00s1EA28y4XZWRBnAGcP5Sio/VUGyEHXdKmTV3WKbMsLktsTwMM4VFTsB
 iDGMsBjidJHQfaQez+p16IBpj9xc5f6PrghqRq4nxsvlv5ftL5qJ5PPJdm1i88BH//waV2uaJbJ
 msS/QBUvmGS9w/1RBLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_062901_192771_75DCC6BC 
X-CRM114-Status: GOOD (  16.92  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324b..30e4cb642473d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e..937e1d557d41a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -582,7 +582,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


